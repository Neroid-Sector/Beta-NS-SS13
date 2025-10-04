/datum/combat_ai/

	var/mob/living/owner
	var/loop_terminator = 0

	var/movement_time = 3 // This is tied to the movement proc and animation, essentially the time it takes the AI to take a full step.
	var/mob_heartbeat = 5 // In most cases, this should be sinced to movement_time, however just in case: When the Ai is not moving or otherwise making decisions, it waits this ammount between loops.

	var/armor = 0 // Armor reduces incoming damage to a minimum of 1. It can also shatter and otherwise be removed, which is a one way deal.
	var/poise = 3 // Poise drains with parries and at double the ammount of incoming damage.
	var/health = 5 // This is the one that kills the mob :P

	var/turf/anchor_turf
	var/mob/living/target_player

	/*Attack Cadence Format is: number for animation time, letter for attack type, optional number as the so called "attack factor" which does different things for different attacks.
	Attack types:
	n - Normal;
	a - AOE - hits around, factor 1 also applies knockback;
	c - Cone - hits 3 grids in front based on dir, supports diagonals too, factor 1 also applies knockback; Wind up to animation times will always be at least 3 (so total animation time of anyhting less than 4 will be normalized to at least 4), though any unblockable attacks should come with a gratious indiator anyway.
	p - Power - special animation, hits harder, knockbacks
	t - Thrust - Moves mob forward, knocking hit mobs out of the way. Stops at walls and obstacles. Factor decides distance of thrust, but keep in mind that anything over 2 will take the mob out of attack range and potentially break their chain, so should be used in indnivdual cadences or at the end of one
	f - Fast - omits windup. Good for combos. Parriable, and ideally should only appear after another indicated attack, but also viable for small rapidly attacking mobs that are meant to be one shot etc. Factor 1 should be used in last fast hits of a fast hit combo in cadences that have further attacks (so it resets the warning icon flashing properly)
	g - Grab - If hits players immobilizes them and plays a "grab animation" depending on number subtype which includes multiple hits. Can be interrupted by incoming damage from another player controlled via the grab_durability var, sucessful interrupt breaks poise
	*/
	var/list/attack_cadence = list(list("5n"))
	var/skip_warning = 0
	var/attacking_flag = 0
	var/attack_hit_time = 5 // Attack time animation.
	var/attack_delay = 10 //This is a pause AFTER all the attacks in a single cadence, ie extra time between attack decisons. Individual attack loops are decided by cadence
	var/grab_durability = 1 // Ammount of damage that needs to be dealt for the mob to break its grab
	var/in_grab = 0

	var/return_override
	var/attack_distance = 10 // range to mobs with clients that get locked at targets as long as they are visible. 7 is screen length for ref.
	var/return_distance = 20 // Ammount from anchor turf the NPC "protects", meaning they will disengage and return to their anchor when their target is this ammoutn away from it.
	var/list/turf_block = list()

	var/last_sound_played = 0

/datum/combat_ai/New(mob/owner_mob)
	. = ..()
	if(!owner_mob) return
	owner = owner_mob
	anchor_turf = get_turf(owner)
	health = GLOB.pve_npc_hp
	poise = GLOB.pve_npc_poise
	owner.melee_damage_lower = GLOB.pve_npc_attack_lower
	owner.melee_damage_upper = GLOB.pve_npc_attack_upper
	attack_distance = GLOB.pve_npc_attack_distance
	return_distance = GLOB.pve_npc_return_distance
	movement_time = GLOB.pve_npc_movement_time
	attack_cadence = list(list("[GLOB.pve_npc_attack_cadence]"))
	INVOKE_ASYNC(src,PROC_REF(ai_loop))

/datum/combat_ai/Destroy(force, ...)
	loop_terminator = 1
	owner = null
	anchor_turf = null
	target_player = null
	turf_block = list()
	. = ..()

/datum/combat_ai/proc/combat_stun()
	loop_terminator = 1
	in_grab = 0
	sleep(25)
	if(health > 0) INVOKE_ASYNC(src, PROC_REF(damage_animation),owner,"poise_restore")
	sleep(5)
	if(health > 0)
		loop_terminator = 0
		grab_durability = initial(grab_durability)
		poise = initial(poise)
		INVOKE_ASYNC(src, PROC_REF(ai_loop))

/datum/combat_ai/proc/attack_animation(mob/attacking_mob,turf/target,type,anim_time,factor) // I strongly recommend this is async invoked, just saying :P
	if(!type || !anim_time) return
	//icons refs
	var/overlay_icon = 'icons/effects/combat.dmi'
	var/overlay_icon_state
	//Universal refs
	var/mob/animated_mob = attacking_mob
	var/starting_x = animated_mob.pixel_x
	var/starting_y = animated_mob.pixel_y
	var/turf/current_turf = get_turf(animated_mob)
	//timers
	var/wind_up = anim_time - attack_hit_time
	if(wind_up < 1) wind_up = 1
	var/attack = attack_hit_time
	//blinking/indicator values
	var/color_value = animated_mob.color
	var/blink_value = color_value
	var/matrix/M = new()
	var/matrix/N = new()
	var/matrix/O = new()
	var/fade_in
	var/fade_out
	if(wind_up < 5)
		fade_in = 1
		fade_out = 1
	else
		fade_in = 3
		fade_out = 3 // This should likely be made more dynamic later, which is why those are pulled out here.
	var/flash = (anim_time - fade_in - fade_out)
	if(flash < 1) flash = 1


	M.Scale(0.01)
	N.Scale(0.7)
	O.Scale(2)
	var/obj/indicator = new()
	if(skip_warning == 0)
		indicator.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA
		indicator.alpha = 0
		indicator.layer = ABOVE_MOB_LAYER
		indicator.pixel_y = 10
		switch(type) // Attack Indicator/blining values segment. Actual animations trigger later
			if("n")
				blink_value = "#ffd0be"
			if("a")
				overlay_icon_state = "circle"
				blink_value = "#ff8800"
				color_value = "#ffd595"
			if("c")
				overlay_icon_state = "cone"
				blink_value = "#ff8800"
				color_value = "#ffd595"
			if("p")
				overlay_icon_state = "cross"
				blink_value = "#ff1c1c"
				color_value = "#ff8181"
			if("g")
				overlay_icon_state = "cross"
				blink_value = "#8f0c54"
				color_value = "#cf398c"
			if("t")
				overlay_icon_state = "arrow"
				blink_value = "#d15106"
				color_value = "#ff9a5f"
			if("f")
				overlay_icon_state = "triangle"
				blink_value = "#1e5a0c"
				color_value = "#2fca00"
				skip_warning = 1
		indicator.dir = get_dir(current_turf,target)
		indicator.overlays += icon(icon = overlay_icon,icon_state = overlay_icon_state, dir = indicator.dir)
		indicator.color = color_value
		indicator.transform = M
		animated_mob.vis_contents += indicator
		animate(indicator,time = fade_in,alpha = 255, transform = N, pixel_y = 20)
		var/current_tick = 0
		while(current_tick < flash)
			var/color_to_change
			if(indicator.color == blink_value)
				color_to_change = color_value
			else
				color_to_change = blink_value
			animate(time = 1, color = color_to_change)
			current_tick += 1
		animate(time = fade_out, alpha = 0, transform = O)

	switch(type) // Attack animations go here
		if("n") // Normal attack - mob pulls back, then pushes forward. Strike counted at apex of pushing animation.
			var/pull_x = animated_mob.pixel_x
			var/pull_y = animated_mob.pixel_y
			var/push_x = 0
			var/push_y = 0
			switch(get_dir(current_turf,target))
				if(NORTH)
					animated_mob.dir = NORTH
					pull_y -= 16
					push_y = 16
				if(NORTHEAST)
					animated_mob.dir = EAST
					pull_y -= 8
					push_y = 8
					pull_x -= 8
					push_x = 8
				if(EAST)
					animated_mob.dir = EAST
					pull_x -= 16
					push_x = 16
				if(SOUTHEAST)
					animated_mob.dir = EAST
					pull_x -= 8
					push_x = 8
					pull_y += 8
					push_y = -8
				if(SOUTH)
					animated_mob.dir = SOUTH
					pull_y += 16
					push_y = -16
				if(SOUTHWEST)
					animated_mob.dir = WEST
					pull_y += 8
					push_y = -8
					pull_x += 8
					push_x = -8
				if(WEST)
					animated_mob.dir = WEST
					pull_x += 16
					push_x = -16
				if(NORTHWEST)
					animated_mob.dir = WEST
					pull_x += 8
					push_x = -8
					pull_y -= 8
					push_y = 8
			animate(animated_mob,time = wind_up, pixel_x = pull_x, pixel_y = pull_y)
			animate(time = attack, pixel_x = push_x, pixel_y = push_y)

		if("a") // AoE attack - mob shakes slightly, then shakes more as the attack is about to be unleashed.
			var/current_frame = 0
			while(current_frame < wind_up)
				animate(animated_mob, time = 1, pixel_x = rand(-3,3), pixel_y = rand(-3,3))
				sleep(1)
				current_frame += 1
			current_frame = 0
			while(current_frame < attack)
				animate(animated_mob, time = 1, pixel_x = rand(-6,6), pixel_y = rand(-6,6))
				sleep(1)
				current_frame += 1

		if("c") // Cone AoE, this will normalize wind up to 3 if trigerred with less. Acts similar to normal attack, but does a little loop depending on orientation of attack
			if(wind_up < 3) wind_up = 3 // This is a somewhat hacky way of making sure the animation does not skip, but this assumes that the end user knows to respect minimum timers. *coughs*
			var/cone_wind_up = floor(wind_up / 3)
			var/cone_attack = (anim_time - (3 * cone_wind_up)) // This is to ensure that all of the input time gets processed as an animation, since this is cruical to damage processing etc
			var/start_x = 0
			var/start_y = 0
			var/mid_x = 0
			var/mid_y = 0
			var/fin_x = 0
			var/fin_y = 0
			var/push_x = 0
			var/push_y = 0
			switch(get_dir(current_turf,target))
				if(NORTH)
					animated_mob.dir = NORTH
					start_x = 6
					start_y = -10
					mid_x = 0
					mid_y = -16
					fin_x = -6
					fin_y = -10
					push_y = 16
				if(SOUTH)
					animated_mob.dir = SOUTH
					start_x = 6
					start_y = 10
					mid_x = 0
					mid_y = 16
					fin_x = -6
					fin_y = 10
					push_y = -16
				if(EAST)
					attacking_mob.dir = EAST
					start_x = -10
					start_y = 6
					mid_x = -16
					mid_y = 0
					fin_x = -10
					fin_y = -6
					push_x = 16
				if(WEST)
					animated_mob.dir = WEST
					start_x = 10
					start_y = 6
					mid_x = 16
					mid_y = 0
					fin_x = 10
					fin_y = -6
					push_x = -16
				if(NORTHEAST)
					animated_mob.dir = EAST
					start_x = -12
					start_y = 0
					mid_x = -12
					mid_y = -12
					fin_x =  0
					fin_y = -12
					push_x = 8
					push_y = 8
				if(NORTHWEST)
					animated_mob.dir = WEST
					start_x = 12
					start_y = 0
					mid_x = 12
					mid_y = -12
					fin_x =  0
					fin_y = -12
					push_x = -8
					push_y = 8
				if(SOUTHEAST)
					animated_mob.dir = EAST
					start_x = -12
					start_y = 0
					mid_x = -12
					mid_y = 12
					fin_x =  0
					fin_y = 12
					push_x = 8
					push_y = -8
				if(SOUTHWEST)
					animated_mob.dir = WEST
					start_x = -12
					start_y = 0
					mid_x = -12
					mid_y = 12
					fin_x =  0
					fin_y = 12
					push_x = -8
					push_y = -8
			animate(animated_mob, time = cone_wind_up, pixel_x = start_x, pixel_y = start_y)
			animate(time = cone_wind_up, pixel_x = mid_x, pixel_y = mid_y)
			animate(time = cone_wind_up, pixel_x = fin_x, pixel_y = fin_y)
			animate(time = cone_attack, pixel_x = push_x, pixel_y = push_y)

		if("p") // power attacks and grabs are essentially the same mechanic - in most cases you need to move out of the way or you get hurt, so they share a warning animation. This can be individualized later obviously
			var/push_x = 0
			var/push_y = 0
			switch(get_dir(current_turf,target))
				if(NORTH)
					push_y = 16
				if(SOUTH)
					push_y = -16
				if(EAST)
					push_x = 16
				if(WEST)
					push_x = -16
				if(NORTHEAST)
					push_x = 8
					push_y = 8
				if(NORTHWEST)
					push_x = -8
					push_y = 8
				if(SOUTHEAST)
					push_x = 8
					push_y = -8
				if(SOUTHWEST)
					push_x = -8
					push_y = -8
			var/obj/icon_obj = new()
			icon_obj.mouse_opacity = 1
			icon_obj.appearance = animated_mob.appearance
			icon_obj.layer = EFFECTS_LAYER
			icon_obj.dir = animated_mob.dir
			icon_obj.pixel_x = animated_mob.pixel_x
			icon_obj.pixel_y = animated_mob.pixel_y
			icon_obj.color = blink_value
			var/matrix/P = new
			P.Scale(1.5)
			animated_mob.vis_contents += icon_obj
			animate(icon_obj, time = wind_up, color = blink_value, transform = P, alpha = 0)
			sleep(wind_up)
			animated_mob.vis_contents -= icon_obj
			qdel(icon_obj)
			animate(animated_mob, time = attack,pixel_x = push_x, pixel_y = push_y)

		if("g")
			var/push_x = 0
			var/push_y = 0
			switch(get_dir(current_turf,target))
				if(NORTH)
					push_y = 16
				if(SOUTH)
					push_y = -16
				if(EAST)
					push_x = 16
				if(WEST)
					push_x = -16
				if(NORTHEAST)
					push_x = 8
					push_y = 8
				if(NORTHWEST)
					push_x = -8
					push_y = 8
				if(SOUTHEAST)
					push_x = 8
					push_y = -8
				if(SOUTHWEST)
					push_x = -8
					push_y = -8
			var/obj/icon_obj = new()
			icon_obj.mouse_opacity = 1
			icon_obj.appearance = animated_mob.appearance
			icon_obj.layer = EFFECTS_LAYER
			icon_obj.dir = animated_mob.dir
			icon_obj.pixel_x = animated_mob.pixel_x
			icon_obj.pixel_y = animated_mob.pixel_y
			icon_obj.color = blink_value
			var/matrix/P = new
			P.Scale(1.5)
			animated_mob.vis_contents += icon_obj
			animate(icon_obj, time = wind_up, color = blink_value, transform = P, alpha = 0)
			sleep(wind_up)
			animated_mob.vis_contents -= icon_obj
			qdel(icon_obj)
			animate(animated_mob, time = attack,pixel_x = push_x, pixel_y = push_y)

		if("t")
			var/pull_x = animated_mob.pixel_x
			var/pull_y = animated_mob.pixel_y
			var/push_x = animated_mob.pixel_x
			var/push_y = animated_mob.pixel_y
			switch(get_dir(current_turf,target))
				if(NORTH)
					animated_mob.dir = NORTH
					pull_y -= 30
				if(NORTHEAST)
					animated_mob.dir = EAST
					pull_y -= 15
					pull_x -= 15
				if(EAST)
					animated_mob.dir = EAST
					pull_x -= 30
				if(SOUTHEAST)
					animated_mob.dir = EAST
					pull_x -= 15
					pull_y += 15
				if(SOUTH)
					animated_mob.dir = SOUTH
					pull_y += 30
				if(SOUTHWEST)
					animated_mob.dir = WEST
					pull_y += 15
					pull_x += 15
				if(WEST)
					animated_mob.dir = WEST
					pull_x += 30
				if(NORTHWEST)
					animated_mob.dir = WEST
					pull_x += 15
					pull_y -= 15
			animate(animated_mob,time = wind_up, pixel_x = pull_x, pixel_y = pull_y)
			animate(time = attack, pixel_x = push_x, pixel_y = push_y)
		if("f")
			var/push_x = 0
			var/push_y = 0
			switch(get_dir(current_turf,target))
				if(NORTH)
					push_y = 8
				if(SOUTH)
					push_y = -8
				if(EAST)
					push_x = 8
				if(WEST)
					push_x = -8
				if(NORTHEAST)
					push_x = 4
					push_y = 4
				if(NORTHWEST)
					push_x = -4
					push_y = 4
				if(SOUTHEAST)
					push_x = 4
					push_y = -4
				if(SOUTHWEST)
					push_x = -4
					push_y = -4
			animate(animated_mob,time = anim_time, pixel_x = push_x, pixel_y = push_y)

	animate(animated_mob,time = 1, pixel_x = starting_x, pixel_y = starting_y, flags = ANIMATION_CONTINUE)
	sleep(anim_time + 1)
	animated_mob.vis_contents -= indicator
	qdel(indicator)
	return

/datum/combat_ai/proc/damage_animation(mob/target,type)
	switch(type)
		if(null)
			return
		if("poise_restore")
			var/obj/icon_obj = new()
			icon_obj.mouse_opacity = 1
			icon_obj.appearance = target.appearance
			icon_obj.dir = target.dir
			icon_obj.layer = EFFECTS_LAYER
			icon_obj.alpha = 0
			var/matrix/M = new
			M.Scale(3)
			icon_obj.transform = M
			var/matrix/N = new
			N.Scale(1)
			animate(icon_obj, time = 5, alpha = 255, transform = N)
			target.vis_contents += icon_obj
			sleep(6)
			target.vis_contents -= icon_obj
		if("poise_break")
			var/obj/icon_obj = new()
			icon_obj.mouse_opacity = 1
			icon_obj.appearance = target.appearance
			icon_obj.layer = EFFECTS_LAYER
			icon_obj.dir = target.dir
			var/matrix/M = new
			M.Scale(3)
			animate(icon_obj, time = 5, alpha = 0, transform = M)
			target.vis_contents += icon_obj
			sleep(6)
			target.vis_contents -= icon_obj
		if("poise_hit")
			var/obj/icon_obj = new()
			icon_obj.mouse_opacity = 1
			icon_obj.appearance = target.appearance
			icon_obj.layer = EFFECTS_LAYER
			var/matrix/M = new
			M.Scale(1.2 + (0.05 * ((initial(poise) + 1) - poise)))
			animate(icon_obj, time = 3, alpha = 0, transform = M)
			target.vis_contents += icon_obj
			sleep(4)
			target.vis_contents -= icon_obj
		if("dam_hit")
			var/starting_x = target.pixel_x
			var/starting_y = target.pixel_y
			var/displacement_x = starting_x + pick(-3,3)
			var/displacement_y = starting_y + pick(-3,3)
			playsound(target,pick('sound/bullets/bullet_armor3.ogg','sound/bullets/bullet_armor4.ogg'))
			animate(target, time = 1, pixel_x = displacement_x, pixel_y = displacement_y)
			animate(time = 1, pixel_x = starting_x, pixel_y = starting_y)

/datum/combat_ai/proc/die()
	loop_terminator = 1
	var/matrix/M = new
	M.Turn(pick(-90,90))
	var/displacement_x = owner.pixel_x + rand(-10,10)
	var/displacement_y = owner.pixel_y + rand(-10,10)
	animate(owner, time = 4, pixel_x = displacement_x, pixel_y = displacement_y, transform = M, easing = QUAD_EASING|EASE_IN)
	owner.density = 0
	owner.animate_movement = SLIDE_STEPS
	sleep(300)
	animate(owner, time = 10, alpha = 0)
	sleep(10)
	qdel(owner)

/datum/combat_ai/proc/process_damage(damage_number,damage_type)
	if(!damage_number) return
	if(health == 0) return
	var/damage_to_deal = damage_number - armor
	return_override = 0
	anchor_turf = get_turf(owner)
	if(in_grab == 1)
		grab_durability -= damage_to_deal
		if(grab_durability <= 0)
			poise = 0
			in_grab = 0
			INVOKE_ASYNC(src,PROC_REF(damage_animation),owner,"poise_break")
			INVOKE_ASYNC(src,PROC_REF(process_knockback),owner,1)
			INVOKE_ASYNC(src,PROC_REF(combat_stun))
			turf_block = list()
			return

	if(damage_type == "poise")
		if(poise >= 0)
			poise -= damage_to_deal
			if(poise <= 0)
				poise = 0
				INVOKE_ASYNC(src,PROC_REF(damage_animation),owner,"poise_break")
				INVOKE_ASYNC(src,PROC_REF(process_knockback),owner,1)
				INVOKE_ASYNC(src,PROC_REF(combat_stun))
				turf_block = list()
				return
			else
				INVOKE_ASYNC(src,PROC_REF(damage_animation),owner,"poise_hit")
		return
	if(damage_type == "health")
		if(health > 0)
			var/new_health = health - damage_number
			if(new_health <= 0)
				health = 0
				owner.add_splatter_floor(get_turf(owner),0)
				playsound(owner,get_sfx("alien_growl"),50)
				INVOKE_ASYNC(src,PROC_REF(die))
				return
			else
				health -= damage_number
				owner.add_splatter_floor(get_turf(owner))
				if((last_sound_played + 30) > world.time)
					last_sound_played = world.time
					playsound(owner,get_sfx("alien_hiss"),50)
				INVOKE_ASYNC(src,PROC_REF(damage_animation),owner,"dam_hit")
				return
	if(damage_type == BURN)
		INVOKE_ASYNC(src, PROC_REF(process_damage),(damage_number),"health")
		return
	if(poise > 0) INVOKE_ASYNC(src, PROC_REF(process_damage),(damage_number * 2),"poise")
	INVOKE_ASYNC(src, PROC_REF(process_damage),(damage_number),"health")

/datum/combat_ai/proc/list_turfs_in_line(turf/origin_turf,direction,distance,flag) // flag = 1 returns list of turfs, 2 returns just last turf
	var/turf/current_turf = origin_turf
	switch(flag)
		if(1)
			var/list/turf_list = list()
			var/distance_checked = 1
			var/turf/next_turf
			while(distance_checked <= distance)
				switch(direction)
					if(NORTH)
						next_turf = locate(current_turf.x, current_turf.y + distance_checked, current_turf.z)
					if(NORTHEAST)
						next_turf = locate(current_turf.x + distance_checked, current_turf.y + distance_checked, current_turf.z)
					if(EAST)
						next_turf = locate(current_turf.x + distance_checked, current_turf.y, current_turf.z)
					if(SOUTHEAST)
						next_turf = locate(current_turf.x + distance_checked, current_turf.y - distance_checked, current_turf.z)
					if(SOUTH)
						next_turf = locate(current_turf.x, current_turf.y - distance_checked, current_turf.z)
					if(SOUTHWEST)
						next_turf = locate(current_turf.x - distance_checked, current_turf.y - distance_checked, current_turf.z)
					if(WEST)
						next_turf = locate(current_turf.x - distance_checked, current_turf.y, current_turf.z)
					if(NORTHWEST)
						next_turf = locate(current_turf.x - distance_checked, current_turf.y + distance_checked, current_turf.z)
				turf_list.Add(next_turf)
				distance_checked += 1
			return turf_list
		if(2)
			var/turf/turf_to_return
			switch(direction)
				if(NORTH)
					turf_to_return = locate(current_turf.x, current_turf.y + distance, current_turf.z)
				if(NORTHEAST)
					turf_to_return = locate(current_turf.x + distance, current_turf.y + distance, current_turf.z)
				if(EAST)
					turf_to_return = locate(current_turf.x + distance, current_turf.y, current_turf.z)
				if(SOUTHEAST)
					turf_to_return = locate(current_turf.x + distance, current_turf.y - distance, current_turf.z)
				if(SOUTH)
					turf_to_return = locate(current_turf.x, current_turf.y - distance, current_turf.z)
				if(SOUTHWEST)
					turf_to_return = locate(current_turf.x - distance, current_turf.y - distance, current_turf.z)
				if(WEST)
					turf_to_return = locate(current_turf.x - distance, current_turf.y, current_turf.z)
				if(NORTHWEST)
					turf_to_return = locate(current_turf.x - distance, current_turf.y + distance, current_turf.z)
			return turf_to_return


/datum/combat_ai/proc/animate_knockback(mob/target_mob,turf/target_turf,collision = 0,distance)
	var/turf/turf_to_target = target_turf
	var/mob/mob_to_animate = target_mob
	var/turf/mob_turf = get_turf(mob_to_animate)
	mob_to_animate.anchored = 1
	var/original_animate_movement = mob_to_animate.animate_movement
	mob_to_animate.animate_movement = NO_STEPS
	if(distance)
		var/origin_px = mob_to_animate.pixel_x
		var/origin_py = mob_to_animate.pixel_y
		var/displacement_x = (turf_to_target.x - mob_turf.x) * 32
		var/displacement_y = (turf_to_target.y - mob_turf.y) * 32
		if(collision == 1)
			if(displacement_x > 0)
				displacement_x -= 32
			else
				displacement_x += 32
			if(displacement_y > 0)
				displacement_y -= 32
			else
				displacement_y += 32
		var/animation_time = 1 + ceil(distance / 3)
		animate(mob_to_animate,time = animation_time, pixel_x = origin_px + displacement_x, pixel_y = origin_py + displacement_y, easing = SINE_EASING|EASE_OUT)
		sleep(animation_time)
		mob_to_animate.pixel_x = origin_px
		mob_to_animate.pixel_y = origin_py
		mob_to_animate.forceMove(turf_to_target)
	if(collision == 1)
		if(istype(mob_to_animate,/mob/living/))
			var/mob/living/living_mob = mob_to_animate
			if(!istype(living_mob,/mob/living/npc))
				INVOKE_ASYNC(src, PROC_REF(damage_animation),living_mob,"dam_hit")
			living_mob.apply_damage((5 * distance), BRUTE)
			living_mob.add_splatter_floor(get_turf(living_mob))
	mob_to_animate.anchored = 0
	mob_to_animate.animate_movement = original_animate_movement

/datum/combat_ai/proc/get_diagonal(turf/base_turf,turf/target_turf)
	var/ref_direction = get_dir(base_turf,target_turf)
	var/return_direction
	switch(ref_direction)
		if(NORTH,SOUTH)
			return_direction = pick(EAST,WEST)
		if(EAST,WEST)
			return_direction = pick(NORTH,SOUTH)
		if(NORTHWEST,SOUTHEAST)
			return_direction = pick(NORTHEAST,SOUTHWEST)
		if(NORTHEAST,SOUTHWEST)
			return_direction = pick(NORTHWEST,SOUTHEAST)
	return return_direction

/datum/combat_ai/proc/process_thrust(list/turfs_to_attack,thrust_power)
	for (var/turf/turf_to_hit in turfs_to_attack)
		sleep(2)
		for(var/mob/living/attacked_mob in turf_to_hit)
			if(istype(attacked_mob,/mob/living/carbon/))
				var/mob/living/carbon/attacked_carbon_mob = attacked_mob
				attacked_carbon_mob.apply_damage((rand(owner.melee_damage_lower,owner.melee_damage_upper)) / 2)
				attacked_carbon_mob.add_splatter_floor(get_turf(attacked_carbon_mob))
				var/owner_turf = get_turf(owner)
				INVOKE_ASYNC(src, PROC_REF(damage_animation),attacked_carbon_mob,"dam_hit")
				INVOKE_ASYNC(src, PROC_REF(process_knockback),attacked_carbon_mob,thrust_power,get_diagonal(owner_turf,turf_to_hit))


/datum/combat_ai/proc/animate_thrust(mob/target_mob,turf/target_turf)
	var/mob/mob_to_animate = target_mob
	var/turf/mob_turf = get_turf(target_mob)
	var/distance_to_animate = get_dist(mob_turf,target_turf)
	var/origin_px = mob_to_animate.pixel_x
	var/origin_py = mob_to_animate.pixel_y
	var/displacement_x = (mob_turf.x - target_turf.x) * 32
	var/displacement_y = (mob_turf.y - target_turf.y) * 32
	mob_to_animate.forceMove(target_turf)
	mob_to_animate.pixel_x += displacement_x
	mob_to_animate.pixel_y += displacement_y
	animate(mob_to_animate,time = distance_to_animate * 2, pixel_x = origin_px, pixel_y = origin_py, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

/datum/combat_ai/proc/process_knockback(mob/target_mob,distance,direction)
	var/turf/mob_turf = get_turf(target_mob)
	var/knockback_dir
	if(!direction)
		switch(target_mob.dir)
			if(EAST)
				knockback_dir = WEST
			if(WEST)
				knockback_dir = EAST
			if(NORTH)
				knockback_dir = SOUTH
			if(SOUTH)
				knockback_dir = NORTH
			if(NORTHEAST)
				knockback_dir = SOUTHWEST
			if(SOUTHEAST)
				knockback_dir = NORTHWEST
			if(NORTHWEST)
				knockback_dir = SOUTHEAST
			if(SOUTHWEST)
				knockback_dir = NORTHEAST

	else
		knockback_dir = direction
	var/list/crossed_turfs = list_turfs_in_line(mob_turf, knockback_dir, distance,1)
	var/distance_to_animate = 0
	var/collision = 0
	var/turf/ending_turf = mob_turf
	for(var/turf/turf_to_test in crossed_turfs)
		if(istype(turf_to_test,/turf/closed/))
			collision = 1
			break
		for(var/obj/obj_to_test in turf_to_test)
			if(obj_to_test && obj_to_test.density == 1)
				collision = 1
				break
		distance_to_animate += 1
		ending_turf = turf_to_test
	animate_knockback(target_mob,ending_turf,collision,distance_to_animate)

/datum/combat_ai/proc/process_grab(mob/target_mob,grab_type)
	loop_terminator = 1
	var/mob/living/carbon/grabbed_mob = target_mob
	switch(grab_type)
		if(1)
			in_grab = 1
			grabbed_mob.anchored = 1
			owner.anchored = 1
			ADD_TRAIT(grabbed_mob, TRAIT_IMMOBILIZED, "t_s_combat")
			var/turf/owner_turf = get_turf(owner)
			var/turf/target_turf = get_turf(grabbed_mob)
			var/owner_px = owner.pixel_x
			var/owner_py = owner.pixel_y
			var/target_px = grabbed_mob.pixel_x
			var/target_py = grabbed_mob.pixel_y
			var/hits_animated = 0
			while(in_grab == 1 && (hits_animated < 3))
				switch(get_dir(owner_turf,target_turf))
					if(NORTH)
						animate(owner,time = 2,pixel_y = 12)
						animate(grabbed_mob,time = 2,pixel_y = -12)
					if(SOUTH)
						animate(owner,time = 2,pixel_y = -12)
						animate(grabbed_mob,time = 2,pixel_y = 12)
					if(EAST)
						animate(owner,time = 2,pixel_x = 12)
						animate(grabbed_mob,time = 2,pixel_x = -12)
					if(WEST)
						animate(owner,time = 2,pixel_x = -12)
						animate(grabbed_mob,time = 2,pixel_x = 12)
					if(NORTHEAST)
						animate(owner,time = 2,pixel_y = 12, pixel_x = 12)
						animate(grabbed_mob,time = 2,pixel_y = -12, pixel_x = -12)
					if(NORTHWEST)
						animate(owner,time = 2,pixel_y = 12, pixel_x = -12)
						animate(grabbed_mob,time = 2,pixel_y = -12, pixel_x = 12)
					if(SOUTHEAST)
						animate(owner,time = 2,pixel_y = -12, pixel_x = 12)
						animate(grabbed_mob,time = 2,pixel_y = 12, pixel_x = -12)
					if(SOUTHWEST)
						animate(owner,time = 2,pixel_y = -12, pixel_x = -12)
						animate(grabbed_mob,time = 2,pixel_y = 12, pixel_x = 12)
				sleep(2)
				if(in_grab == 0) break
				switch(get_dir(owner_turf,target_turf))
					if(NORTH)
						animate(owner,time = 3,pixel_y = -12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_y = 12, easing = SINE_EASING|EASE_IN)
					if(SOUTH)
						animate(owner,time = 3,pixel_y = 12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_y = -12, easing = SINE_EASING|EASE_IN)
					if(EAST)
						animate(owner,time = 3,pixel_x = -12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_x = 12, easing = SINE_EASING|EASE_IN)
					if(WEST)
						animate(owner,time = 3,pixel_x = 12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_x = -12, easing = SINE_EASING|EASE_IN)
					if(NORTHEAST)
						animate(owner,time = 3,pixel_y = -12,pixel_x = -12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_y = 12,pixel_x = 12, easing = SINE_EASING|EASE_IN)
					if(NORTHWEST)
						animate(owner,time = 3,pixel_y = -12, pixel_x = 12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_y = 12, pixel_x = -12, easing = SINE_EASING|EASE_IN)
					if(SOUTHEAST)
						animate(owner,time = 3,pixel_y = 12,pixel_x = -12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_y = -12, pixel_x = 12, easing = SINE_EASING|EASE_IN)
					if(SOUTHWEST)
						animate(owner,time = 3,pixel_y = 12, pixel_x = 12, easing = SINE_EASING|EASE_IN)
						animate(time = 3,pixel_y = -12, pixel_x = -12, easing = SINE_EASING|EASE_IN)
				sleep(6)
				if(in_grab == 1)
					grabbed_mob.apply_damage(rand(owner.melee_damage_lower / 2,owner.melee_damage_upper / 2))
					INVOKE_ASYNC(src, PROC_REF(damage_animation),grabbed_mob,"dam_hit")
					grabbed_mob.add_splatter_floor(get_turf(grabbed_mob))
				hits_animated += 1
				if(hits_animated < 3) sleep(3)

			animate(owner,time = 2,pixel_x = owner_px, pixel_y = owner_py)
			animate(grabbed_mob,time = 2,pixel_x = target_px, pixel_y = target_py)
			in_grab = 0
			grabbed_mob.anchored = 0
			REMOVE_TRAIT(grabbed_mob, TRAIT_IMMOBILIZED, "t_s_combat")
			INVOKE_ASYNC(src, PROC_REF(process_knockback),grabbed_mob,1,get_dir(owner_turf,target_turf))
			if(loop_terminator == 1 && health > 0 && poise > 0)
				loop_terminator = 0
				sleep(attack_delay)
				INVOKE_ASYNC(src, PROC_REF(ai_loop))


/datum/combat_ai/proc/process_attack(turf/target_turf)
	var/turf/attacked_turf
	if(!target_turf)
		var/turf/owner_turf = get_turf(owner)
		var/turf/turf_to_target = get_turf(target_player)
		var/target_dir = get_dir(owner_turf,turf_to_target)
		attacked_turf = list_turfs_in_line(owner_turf,target_dir,1,2)
	else
		attacked_turf = target_turf
	var/list/attack_list = pick(attack_cadence)
	attacking_flag = 1
	var/target_recheck = 1
	var/current_position = 1
	while(current_position <= attack_list.len)
		if(loop_terminator)
			attack_list = list()
			break

		var/current_line = attack_list[current_position]
		var/number_bits = 0
		var/current_bit = 1
		var/bit_to_test = copytext(current_line,current_bit,current_bit+1)
		while(text2num(bit_to_test) != null)
			number_bits += 1
			current_bit += 1
			bit_to_test = copytext(current_line,current_bit,current_bit+1)
		if(number_bits == 0) return "err_no_bits"
		var/attack_time = text2num(copytext(current_line,1,1 + number_bits))
		var/attack_type = copytext(current_line,number_bits+1,number_bits+2)
		var/attack_factor
		if(length(current_line) > number_bits + 1) attack_factor = text2num(copytext(current_line,number_bits+2,0))
		if(target_recheck == 1)
			var/turf/owner_turf = get_turf(owner)
			var/turf/turf_to_target = get_turf(target_player)
			var/target_dir = get_dir(owner_turf,turf_to_target)
			attacked_turf = list_turfs_in_line(owner_turf,target_dir,1,2)
		owner.dir = get_dir(get_turf(owner),attacked_turf)
		INVOKE_ASYNC(src, PROC_REF(attack_animation),owner,attacked_turf,attack_type,attack_time,attack_factor)
		sleep(attack_time)
		// Attack types and parrying

		switch(attack_type)
			if("n")
				for(var/mob/living/attacked_mob in attacked_turf)
					if(istype(attacked_mob,/mob/living/carbon/))
						var/mob/living/carbon/attacked_carbon_mob = attacked_mob
						INVOKE_ASYNC(src, PROC_REF(damage_animation),attacked_carbon_mob,"dam_hit")
						attacked_carbon_mob.apply_damage(rand(owner.melee_damage_lower,owner.melee_damage_upper))
						attacked_carbon_mob.add_splatter_floor(get_turf(attacked_carbon_mob))
			if("a")
				var/list/turfs_attacked = list()
				var/turf/turf_to_add = get_step(owner,NORTHEAST)
				turfs_attacked += turf_to_add
				turf_to_add = get_step(owner,EAST)
				turfs_attacked += turf_to_add
				turf_to_add = get_step(owner,SOUTHEAST)
				turfs_attacked += turf_to_add
				turf_to_add = get_step(owner,SOUTH)
				turfs_attacked += turf_to_add
				turf_to_add = get_step(owner,SOUTHWEST)
				turfs_attacked += turf_to_add
				turf_to_add = get_step(owner,WEST)
				turfs_attacked += turf_to_add
				turf_to_add = get_step(owner,NORTHWEST)
				turfs_attacked += turf_to_add
				turf_to_add = get_step(owner,NORTH)
				turfs_attacked += turf_to_add
				for(var/turf/turf_to_check in turfs_attacked)
					for(var/mob/living/attacked_mob in turf_to_check)
						if(istype(attacked_mob,/mob/living/carbon/))
							var/mob/living/carbon/attacked_carbon_mob = attacked_mob
							INVOKE_ASYNC(src, PROC_REF(damage_animation),attacked_carbon_mob,"dam_hit")
							attacked_carbon_mob.apply_damage(ceil(owner.melee_damage_upper / 2))
							attacked_carbon_mob.add_splatter_floor(get_turf(attacked_carbon_mob))
							if(attack_factor == 1)
								var/owner_turf = get_turf(owner)
								var/kd_dir = get_dir(turf_to_check,owner_turf)
								INVOKE_ASYNC(src, PROC_REF(process_knockback),attacked_carbon_mob,1,kd_dir)
			if("c")
				var/list/turfs_attacked = list()
				var/turf/own_turf = get_turf(owner)
				var/turf/turf_to_add
				switch(get_dir(own_turf,attacked_turf))
					if(NORTH)
						turf_to_add = locate(own_turf.x,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x - 1,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x + 1,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
					if(SOUTH)
						turf_to_add = locate(own_turf.x,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x - 1,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x + 1,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
					if(EAST)
						turf_to_add = locate(own_turf.x + 1,own_turf.y, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x + 1,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x + 1,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
					if(WEST)
						turf_to_add = locate(own_turf.x - 1,own_turf.y, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x - 1,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x - 1,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
					if(NORTHEAST)
						turf_to_add = locate(own_turf.x + 1,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x + 1,own_turf.y, own_turf.z)
						turfs_attacked += turf_to_add
					if(NORTHWEST)
						turf_to_add = locate(own_turf.x - 1,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x,own_turf.y + 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x - 1,own_turf.y, own_turf.z)
						turfs_attacked += turf_to_add
					if(SOUTHEAST)
						turf_to_add = locate(own_turf.x + 1,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x + 1,own_turf.y, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
					if(SOUTHWEST)
						turf_to_add = locate(own_turf.x - 1,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x - 1,own_turf.y, own_turf.z)
						turfs_attacked += turf_to_add
						turf_to_add = locate(own_turf.x,own_turf.y - 1, own_turf.z)
						turfs_attacked += turf_to_add
				for(var/turf/turf_to_check in turfs_attacked)
					for(var/mob/living/attacked_mob in turf_to_check)
						if(istype(attacked_mob,/mob/living/carbon/))
							var/mob/living/carbon/attacked_carbon_mob = attacked_mob
							INVOKE_ASYNC(src, PROC_REF(damage_animation),attacked_carbon_mob,"dam_hit")
							attacked_carbon_mob.apply_damage(ceil(owner.melee_damage_upper / 2))
							var/owner_turf = get_turf(owner)
							var/kd_dir = get_dir(turf_to_check,owner_turf)
							if(attack_factor == 1) INVOKE_ASYNC(src, PROC_REF(process_knockback),attacked_carbon_mob,1,kd_dir)
							attacked_carbon_mob.add_splatter_floor(get_turf(attacked_carbon_mob))
			if("p")
				for(var/mob/living/attacked_mob in attacked_turf)
					if(istype(attacked_mob,/mob/living/carbon/))
						var/mob/living/carbon/attacked_carbon_mob = attacked_mob
						attacked_carbon_mob.apply_damage(rand(owner.melee_damage_lower * 1.5,owner.melee_damage_upper * 1.5))
						INVOKE_ASYNC(src, PROC_REF(damage_animation),attacked_carbon_mob,"dam_hit")
						var/owner_turf = get_turf(owner)
						var/kd_dir = get_dir(owner_turf,attacked_turf)
						INVOKE_ASYNC(src, PROC_REF(process_knockback),attacked_carbon_mob,2,kd_dir)
			if("t")
				var/distance_to_thrust = attack_factor
				var/turf/own_turf = get_turf(owner)
				var/thrust_direction = get_dir(own_turf,attacked_turf)
				var/final_turf = list_turfs_in_line(own_turf,thrust_direction,distance_to_thrust,2)
				var/list/turfs_to_ping = list()
				turfs_to_ping = list_turfs_in_line(own_turf,thrust_direction,distance_to_thrust,1)
				if(turfs_to_ping.len > 0)
					INVOKE_ASYNC(src, PROC_REF(animate_thrust),owner,final_turf)
					INVOKE_ASYNC(src, PROC_REF(process_thrust),turfs_to_ping,attack_factor)
			if("g")
				for(var/mob/living/attacked_mob in attacked_turf)
					if(istype(attacked_mob,/mob/living/carbon/))
						var/mob/living/carbon/attacked_carbon_mob = attacked_mob
						if(attacked_carbon_mob.client && !HAS_TRAIT(attacked_mob,TRAIT_IMMOBILIZED))
							INVOKE_ASYNC(src, PROC_REF(process_grab),attacked_carbon_mob,attack_factor)
							break
			if("f")
				if(attack_factor == 1) skip_warning = 0
				for(var/mob/living/attacked_mob in attacked_turf)
					if(istype(attacked_mob,/mob/living/carbon/))
						var/mob/living/carbon/attacked_carbon_mob = attacked_mob
						attacked_carbon_mob.apply_damage(rand(owner.melee_damage_lower,owner.melee_damage_upper) / 2)
						INVOKE_ASYNC(src, PROC_REF(damage_animation),attacked_carbon_mob,"dam_hit")
						attacked_carbon_mob.add_splatter_floor(get_turf(attacked_carbon_mob))
		if(loop_terminator)
			attack_list = list()
			break
		sleep(floor(attack_time / 2))
		if(loop_terminator)
			attack_list = list()
			break
		current_position += 1
	attacking_flag = 0

/datum/combat_ai/proc/animate_step(turf/target_turf)
	var/turf/owner_turf = get_turf(owner)
	if(owner_turf == target_turf)
		sleep(movement_time)
		return
	var/current_pixel_x = owner.pixel_x
	var/current_pixel_y = owner.pixel_y
	owner.forceMove(target_turf)
	switch(get_dir(owner_turf,target_turf))
		if(NORTH)
			owner.pixel_y -= 32
			owner.dir = NORTH
		if(SOUTH)
			owner.pixel_y += 32
			owner.dir = SOUTH
		if(EAST)
			owner.pixel_x -= 32
			owner.dir = EAST
		if(WEST)
			owner.pixel_x += 32
			owner.dir = WEST
		if(NORTHEAST)
			owner.pixel_y -= 32
			owner.pixel_x -= 32
			owner.dir = EAST
		if(NORTHWEST)
			owner.pixel_y -= 32
			owner.pixel_x += 32
			owner.dir = WEST
		if(SOUTHEAST)
			owner.pixel_y += 32
			owner.pixel_x -= 32
			owner.dir = EAST
		if(SOUTHWEST)
			owner.pixel_y += 32
			owner.pixel_x += 32
			owner.dir = WEST
	animate(owner,time = movement_time, pixel_x = current_pixel_x, pixel_y = current_pixel_y,easing = LINEAR_EASING)
	sleep(movement_time)
	owner.pixel_x = current_pixel_x
	owner.pixel_y = current_pixel_y
	return

/datum/combat_ai/proc/navigate_around(turf/starting_turf,turf/ending_turf)
	if((starting_turf == ending_turf)) return 1
	var/turf/new_turf
	switch(get_dir(starting_turf,ending_turf))
		if(NORTH)
			new_turf = locate(ending_turf.x + 1,ending_turf.y + 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x - 1,ending_turf.y + 1,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x + 1,ending_turf.y,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x - 1,ending_turf.y,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
		if(NORTH,SOUTH)
			new_turf = locate(ending_turf.x + 1,ending_turf.y - 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x - 1,ending_turf.y - 1,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x + 1,ending_turf.y,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x - 1,ending_turf.y,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
		if(EAST)
			new_turf = locate(ending_turf.x - 1,ending_turf.y - 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x - 1,ending_turf.y + 1,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x,ending_turf.y + 1,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x,ending_turf.y - 1,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
		if(WEST)
			new_turf = locate(ending_turf.x + 1,ending_turf.y - 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x + 1,ending_turf.y + 1,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x,ending_turf.y + 1,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x,ending_turf.y - 1,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
		if(NORTHEAST)
			new_turf = locate(ending_turf.x,ending_turf.y + 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x + 1,ending_turf.y,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x - 1,ending_turf.y + 1,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x + 1,ending_turf.y - 1,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
		if(NORTHWEST)
			new_turf = locate(ending_turf.x,ending_turf.y + 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x - 1,ending_turf.y,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x + 1,ending_turf.y + 1,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x - 1,ending_turf.y - 1,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
		if(SOUTHEAST)
			new_turf = locate(ending_turf.x, ending_turf.y - 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x + 1,ending_turf.y,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x - 1,ending_turf.y - 1,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x + 1,ending_turf.y + 1,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
		if(SOUTHWEST)
			new_turf = locate(ending_turf.x,ending_turf.y - 1,ending_turf.z)
			for(var/atom/atom_to_test_1 in new_turf)
				if(atom_to_test_1.density == 1 || istype(new_turf,/turf/closed))
					new_turf = locate(ending_turf.x - 1,ending_turf.y,ending_turf.z)
					for(var/atom/atom_to_test_2 in new_turf)
						if(atom_to_test_2.density == 1 || istype(new_turf,/turf/closed))
							new_turf = locate(ending_turf.x + 1,ending_turf.y - 1,ending_turf.z)
							for(var/atom/atom_to_test_3 in new_turf)
								if(atom_to_test_3.density == 1 || istype(new_turf,/turf/closed))
									new_turf = locate(ending_turf.x - 1,ending_turf.y + 1,ending_turf.z)
									for(var/atom/atom_to_test_4 in new_turf)
										if(atom_to_test_4.density == 1 || istype(new_turf,/turf/closed)) return 1
	animate_step(new_turf)

/datum/combat_ai/proc/process_structure_attack(obj/target_structure)
	if(!target_structure) return
	var/obj/structure/attacked_structure = target_structure
	var/turf/attacked_turf = get_turf(attacked_structure)
	attacking_flag = 1
	INVOKE_ASYNC(src, PROC_REF(attack_animation),owner,attacked_turf,"n",10)
	sleep(10)
	if (istype(target_structure,/obj/structure/barricade/))
		var/obj/structure/barricade/hit_cade
		hit_cade.take_damage(rand(owner.melee_damage_lower,owner.melee_damage_upper))
		if(hit_cade.is_wired == 1)
			process_damage(1)
	else
		attacked_structure.pve_hp -= 1
		INVOKE_ASYNC(src, PROC_REF(damage_animation),attacked_structure,"dam_hit")
		if(attacked_structure.pve_hp <= 0) attacked_structure.deconstruct()
	var/turf/structure_turf = get_turf(attacked_structure)
	playsound(structure_turf,get_sfx("slam"),50)
	attacking_flag = 0

/datum/combat_ai/proc/process_movement(turf/starting_turf,turf/ending_turf)

	if(get_dist(starting_turf,ending_turf) > 1)
		var/turf/next_turf = get_step_towards(starting_turf,ending_turf)
		var/non_structure_atom = 0
		for(var/atom/atom_to_test in next_turf)
			if(atom_to_test.density == 1)
				if (istype(atom_to_test,/obj/structure/))
					var/obj/structure/structure_target = atom_to_test
					process_structure_attack(structure_target)
					return
				non_structure_atom = 1
			if(non_structure_atom == 1 || istype(next_turf,/turf/closed))
				if(navigate_around(starting_turf, next_turf) == 1)
					turf_block = list()
					target_player = null
					sleep(1)
					return
			else
				for(var/mob/mob_in_area in next_turf)
					if(mob_in_area && navigate_around(starting_turf, next_turf) == 1)
						target_player = null
						turf_block = list()
						sleep(1)
						return
		animate_step(next_turf)

		return
	if(get_dist(starting_turf,ending_turf) == 1)
		return 1

/datum/combat_ai/proc/process_target()
	if(!target_player)
		var/list/potential_targets = list()
		var/turf/owner_turf = get_turf(owner)
		if(turf_block.len == 0)
			turf_block = block(locate(owner_turf.x - attack_distance,owner_turf.y - attack_distance,owner_turf.z),locate(owner_turf.x + attack_distance,owner_turf.y + attack_distance,owner_turf.z))
		for(var/turf/turf_to_scan in turf_block)
			for(var/mob/living/mob_in_range in turf_to_scan)
				var/turf_in_range = get_turf(mob_in_range)
				if(get_dist(anchor_turf,turf_in_range) <= return_distance && mob_in_range.client && !(mob_in_range.is_dead()))
					potential_targets.Add(mob_in_range)
					return_override = 0
		if(potential_targets.len > 0)
			target_player = pick(potential_targets)
	else if(get_dist(target_player,anchor_turf) > return_distance)
		if(get_dist(target_player,owner) > 3)
			return_override = 1
			target_player = null
		else
			anchor_turf = get_turf(owner)

/datum/combat_ai/proc/ai_loop()
	while(loop_terminator == 0)
		if(attacking_flag == 1)
			sleep(mob_heartbeat)
			continue
		var/turf/own_turf = get_turf(owner)
		if(return_override == 1)
			process_movement(own_turf,anchor_turf)
		process_target()
		if(!target_player)
			sleep(mob_heartbeat)
			continue
		var/turf/target_turf = get_turf(target_player)
		if(own_turf == target_turf)
			step_away(owner, target_player)
			sleep(mob_heartbeat)
			continue
		if(process_movement(own_turf,target_turf) == 1)
			process_attack()
			if(target_player.is_dead()) target_player = null
			if(attack_delay != 0) sleep(attack_delay)
