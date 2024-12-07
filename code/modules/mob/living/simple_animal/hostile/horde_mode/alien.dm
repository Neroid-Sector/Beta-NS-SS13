
#define FIRE_LAYER 1
#define ishordemodemob(A) (istype(A, /mob/living/simple_animal/hostile/alien/horde_mode))

#define HM_XENO_SPEED_VERY_SLOW 5
#define HM_XENO_SPEED_SLOW 4.5
#define HM_XENO_SPEED_AVERAGE 4
#define HM_XENO_SPEED_FAST 3.75
#define HM_XENO_SPEED_VERY_FAST 3.5
#define HM_XENO_SPEED_RUNNER 2.5

/mob/living/simple_animal/hostile/alien/horde_mode
	health = XENO_HEALTH_TIER_3
	melee_damage_lower = XENO_DAMAGE_TIER_2
	melee_damage_upper = XENO_DAMAGE_TIER_3
	melee_damage_taken_multiplier = 3
	move_to_delay = HM_XENO_SPEED_AVERAGE
	icon_size = 48
	destroy_surroundings = FALSE
	///How much damage the mob takes from explosives.
	var/explosive_damage_multiplier = 1.5
	///How much damage the mob takes from fire.
	var/fire_damage_multiplier = 1
	///Used for tracking which mob hit this xeno last, so we can reward them points accordingly.
	var/mob/living/last_hit_by
	///Used for giving extra points on death, mainly for melee kills. Will be overridden to 0 if shot by a bullet.
	var/death_bonus = 0
	///How many points do you get for killing them?
	var/kill_reward = 150

/mob/living/simple_animal/hostile/alien/horde_mode/Initialize()
	. = ..()
	//HORDE MODE MOBS ARE ADDED TO A DIFFERENT SUBSYSTEM IN horde_mode_mobs.dm, THEY DO NOT USE THE MISC MOBS SUBSYSTEM!!
	SShorde_mode.current_xenos += src
	//Boss enemies will always be a set strength.
	if(!istype(src, /mob/living/simple_animal/hostile/alien/horde_mode/boss))
		maxHealth *= SShorde_mode.xeno_health_mod
		melee_damage_upper *= SShorde_mode.xeno_damage_mod
		melee_damage_lower *= SShorde_mode.xeno_damage_mod
	find_random_target()
	ForceMoveToTarget()

///Gives us a random target to hunt down.
/mob/living/simple_animal/hostile/alien/horde_mode/proc/find_random_target()
	if(length(SShorde_mode.corrupted_xenos) && prob(66))
		target_mob = pick(SShorde_mode.corrupted_xenos)
		return

	target_mob = SShorde_mode.return_random_player()

/mob/living/simple_animal/hostile/alien/horde_mode/Life(delta_time)
	handle_fire()
	. = ..()
	//FindTarget() would be expensive for the distances xenos need to cover from their spawn.
	//Corrupted xenos are supposed to idle if there's nothing in their vision. Regular xenos should NEVER be idle.
	if(!target_mob && hivenumber != XENO_HIVE_CORRUPTED)
		find_random_target()
		ForceMoveToTarget()

/mob/living/simple_animal/hostile/alien/horde_mode/MoveToTarget()
	//It's possible for a MoveToTarget() to be ordered while the mob is stunned. This will cause it to move while it's stunned. That's bad.
	if(body_position == LYING_DOWN)
		return
	. = ..()

//MoveToTarget() checks for targets within view. If there is nothing in view they'll revert to being idle.
//This is not ideal for enemies that just spawn. We need to force them to move regardless of vision.
/mob/living/simple_animal/hostile/alien/horde_mode/proc/ForceMoveToTarget()
	if(target_mob && body_position != LYING_DOWN)
		walk_to(src, target_mob, 1, move_to_delay)

///PROCS FOR HANDLING FIRE.
/mob/living/simple_animal/hostile/alien/horde_mode/IgniteMob()
	. = ..()
	if (. & IGNITE_IGNITED)
		roar_emote()

/mob/living/simple_animal/hostile/alien/horde_mode/handle_fire()
	if(..())
		return

	health -= fire_reagent.intensityfire * fire_damage_multiplier
	var/mob/player_mob = last_damage_data.resolve_mob()
	last_hit_by = player_mob
	if(stat != DEAD)
		SShorde_mode.update_points(player_mob, 10)
		balloon_alert(player_mob, "+10")

/mob/living/simple_animal/hostile/alien/horde_mode/update_fire()
	if(on_fire && fire_reagent)
		var/image/I
		if(mob_size >= MOB_SIZE_BIG)
			if((!initial(pixel_y) || body_position != LYING_DOWN)) // what's that pixel_y doing here??? (i don't know)
				I = image("icon"='icons/mob/xenos/overlay_effects64x64.dmi', "icon_state"="alien_fire", "layer"=-FIRE_LAYER)
			else
				I = image("icon"='icons/mob/xenos/overlay_effects64x64.dmi', "icon_state"="alien_fire_lying", "layer"=-FIRE_LAYER)
		else
			I = image("icon" = 'icons/mob/xenos/effects.dmi', "icon_state"="alien_fire", "layer"=-FIRE_LAYER)

		I.appearance_flags |= RESET_COLOR|RESET_ALPHA
		I.color = fire_reagent.burncolor
		overlays += I
	if(!on_fire)
		for(var/image/fire_overlay in overlays)
			if(fire_overlay.icon_state == "alien_fire" || fire_overlay.icon_state == "alien_fire_lying")
				overlays -= fire_overlay

/mob/living/simple_animal/hostile/alien/horde_mode/Destroy()
	. = ..()
	SShorde_mode.current_xenos -= src

/mob/living/simple_animal/hostile/alien/horde_mode/death(cause, gibbed, deathmessage)
	. = ..()
	if(!isnull(last_hit_by))
		if(last_hit_by.stat != DEAD)
			SShorde_mode.update_points(last_hit_by, kill_reward + death_bonus)
			balloon_alert(last_hit_by, "+[kill_reward + death_bonus]")

	SShorde_mode.current_xenos -= src

/mob/living/simple_animal/hostile/alien/horde_mode/bullet_act(obj/projectile/bullet)
	. = ..()
	var/mob/living/bullet_owner = bullet.firer

	if(ishuman(bullet_owner))
		death_bonus = 0
		last_hit_by = bullet_owner
		if(stat != DEAD)
			SShorde_mode.update_points(bullet_owner, 10)
			balloon_alert(bullet_owner, "+10")

/mob/living/simple_animal/hostile/alien/horde_mode/attackby(obj/item/weapon, mob/user)
	. = ..()
	//We need to check for the weapon's force so players don't get rewarded with extra points for just hitting them with a pencil.
	if(stat != DEAD && weapon.force >= MELEE_FORCE_NORMAL)
		if(isgun(weapon))
			var/obj/item/weapon/gun/weapon_gun = weapon
			//Without this check, every PB would count as a melee hit.
			if(weapon_gun.PB_fired)
				return
		last_hit_by = user
		death_bonus = 100
		SShorde_mode.update_points(user, 20)
		balloon_alert(user, "+20")

/mob/living/simple_animal/hostile/alien/horde_mode/ex_act(severity, direction, datum/cause_data/explosion_cause_data)
	if(severity >= 30)
		flash_eyes()

	if(severity >= health && severity >= EXPLOSION_THRESHOLD_GIB)
		gib()
		return

	var/mob/explosion_source_mob = explosion_cause_data?.resolve_mob()
	if(explosion_source_mob)
		last_hit_by = explosion_source_mob
		SShorde_mode.update_points(explosion_source_mob, 20)
		balloon_alert(explosion_source_mob, "+20")

	apply_damage(severity * explosive_damage_multiplier, BRUTE)
	updatehealth()
	death_bonus = 0

	if(mob_size < MOB_SIZE_BIG)
		var/knock_value = min(round( severity*0.1, 1), 5)
		if(knock_value > 0)
			apply_effect(knock_value, WEAKEN)
			apply_effect(knock_value, PARALYZE)
			explosion_throw(severity, direction)

/mob/living/simple_animal/hostile/alien/horde_mode/make_jittery(amount)
	if(stat == DEAD) return
	jitteriness = min(1000, jitteriness + amount)
	if(jitteriness > 100 && !is_jittery)
		INVOKE_ASYNC(src, PROC_REF(jittery_process))

//TURN INTO CORRUPTED
/////////////////////
/mob/living/simple_animal/hostile/alien/horde_mode/proc/turn_corrupt()
	make_jittery(105)
	sleep(1 SECONDS)

	LoseTarget()

	visible_message(SPAN_XENOHIGHDANGER("[src] falls to the ground, its limbs and head twitching erradically in horrid pain!"))
	playsound(loc, "alien_help", 25, 1)
	manual_emote("writhes in pain!")
	animate(src, time = 4 SECONDS, easing = QUAD_EASING, color = "#80ff80")
	if(!istype(src, /mob/living/simple_animal/hostile/alien/horde_mode/boss))
		apply_effect(8, WEAKEN)
		apply_effect(8, PARALYZE)
		sleep(3 SECONDS)
		visible_message(SPAN_DANGER("[src] is unable to endure the transformation process..."))
		addtimer(CALLBACK(src, PROC_REF(death), create_cause_data("cipher stim"), 3 SECONDS))
		return

	melee_damage_upper *= 2
	melee_damage_lower *= 2
	move_to_delay *= 0.8
	maxHealth *= 1.5
	SShorde_mode.corrupted_xenos += src
	SShorde_mode.current_xenos -= src

	apply_effect(5, WEAKEN)
	apply_effect(5, PARALYZE)

	health = maxHealth
	flick_heal_overlay(3 SECONDS, "#D9F500")

	faction = FACTION_MARINE
	faction_group = FACTION_LIST_MARINE
	attack_same = FALSE
	hivenumber = XENO_HIVE_CORRUPTED
	name = "Corrupted [initial(name)] (XX-[rand(1, 999)])"


//LESSER DRONE
//////////////
/mob/living/simple_animal/hostile/alien/horde_mode/lesser_drone
	name = "Lesser Drone"
	icon = 'icons/mob/xenos/lesser_drone.dmi'
	desc = "An alien drone. Looks... smaller."
	health = XENO_HEALTH_LESSER_DRONE
	melee_damage_lower = XENO_DAMAGE_TIER_1
	melee_damage_upper = XENO_DAMAGE_TIER_2
	move_to_delay = HM_XENO_SPEED_VERY_FAST
	pixel_x = 0
	icon_size = 32
	kill_reward = 100

//Lesser drones don't have wound states.
/mob/living/simple_animal/hostile/alien/horde_mode/lesser_drone/update_wounds()
	return

//RUNNER
////////
/mob/living/simple_animal/hostile/alien/horde_mode/runner
	name = "Runner"
	desc = "A fast, four-legged terror, but weak in sustained combat."
	icon = 'icons/mob/xenos/runner.dmi'
	icon_size = 64
	pixel_x = -16  //Needed for 2x2
	old_x = -16
	base_pixel_x = 0
	base_pixel_y = -20
	move_to_delay = HM_XENO_SPEED_RUNNER
	health = XENO_HEALTH_RUNNER
	kill_reward = 175

//LURKER
////////
/mob/living/simple_animal/hostile/alien/horde_mode/lurker
	name = "Lurker"
	desc = "A beefy, fast alien with sharp claws."
	icon = 'icons/mob/xenos/lurker.dmi'
	alpha = 60
	melee_damage_lower = XENO_DAMAGE_TIER_3
	melee_damage_upper = XENO_DAMAGE_TIER_4
	health = XENO_HEALTH_TIER_5
	move_to_delay = HM_XENO_SPEED_FAST
	kill_reward = 200

//DEFENDER
//////////
/mob/living/simple_animal/hostile/alien/horde_mode/defender
	name = "Defender"
	desc = "A alien with an armored crest."
	icon = 'icons/mob/xenos/defender.dmi'
	icon_size = 64
	melee_damage_lower = XENO_DAMAGE_TIER_2
	melee_damage_upper = XENO_DAMAGE_TIER_3
	health = XENO_HEALTH_TIER_13
	move_to_delay = HM_XENO_SPEED_SLOW
	kill_reward = 225
	var/crest_lowered = FALSE
	explosive_damage_multiplier = 0.25
	COOLDOWN_DECLARE(tail_swipe)
	COOLDOWN_DECLARE(crest_raise)

/mob/living/simple_animal/hostile/alien/horde_mode/defender/Initialize()
	. = ..()
	status_flags &= ~(CANKNOCKDOWN|CANSTUN|CANPUSH)

/mob/living/simple_animal/hostile/alien/horde_mode/defender/Life(delta_time)
	. = ..()
	if(crest_lowered && COOLDOWN_FINISHED(src, crest_raise))
		raise_crest()

/mob/living/simple_animal/hostile/alien/horde_mode/defender/AttackingTarget()
	if(Adjacent(target_mob) && prob(75) && COOLDOWN_FINISHED(src, tail_swipe) && target_mob.mob_size < MOB_SIZE_BIG && stat != DEAD)
		COOLDOWN_START(src, tail_swipe, 16 SECONDS)
		tail_swipe(target_mob, 4, FALSE)
		return

	. = ..()

/mob/living/simple_animal/hostile/alien/horde_mode/defender/ex_act(severity, direction, datum/cause_data/explosion_cause_data)
	. = ..()
	lower_crest()

/mob/living/simple_animal/hostile/alien/horde_mode/defender/bullet_act(obj/projectile/bullet)
	. = ..()
	if(bullet.ammo == GLOB.ammo_list[/datum/ammo/bullet/shotgun/buckshot]) //considering players only have access to buckshot there's no reason to check for other stun ammo
		INVOKE_ASYNC(src, PROC_REF(lower_crest))

/mob/living/simple_animal/hostile/alien/horde_mode/defender/proc/lower_crest()
	COOLDOWN_START(src, crest_raise, COOLDOWN_TIMELEFT(src, crest_lowered) + 4 SECONDS)
	if(!crest_lowered)
		crest_lowered = TRUE
		icon_state = "Normal Defender Crest"
		move_to_delay += 1

/mob/living/simple_animal/hostile/alien/horde_mode/defender/proc/raise_crest()
	crest_lowered = FALSE
	if(stat == DEAD)
		icon_state = "Normal Defender Dead"
		return

	icon_state = "Normal Defender Walking"
	move_to_delay -= 1

//RANGED BASE
/////////////
/mob/living/simple_animal/hostile/alien/horde_mode/ranged
	name = "Sentinel"
	desc = "A slithery, spitting kind of alien.."
	icon = 'icons/mob/xenos/sentinel.dmi'
	health = XENO_HEALTH_TIER_5
	kill_reward = 200
	COOLDOWN_DECLARE(ranged_cooldown)
	var/projectile_to_fire = /datum/ammo/xeno/acid/neuro
	var/attack_range = 7
	var/cooldown_duration = 6 SECONDS

/mob/living/simple_animal/hostile/alien/horde_mode/ranged/Life(delta_time)
	if(target_mob)
		INVOKE_ASYNC(src, PROC_REF(ranged_attack_checks), target_mob)

	. = ..()

/mob/living/simple_animal/hostile/alien/horde_mode/ranged/proc/ranged_attack_checks(mob/living/target)
	if(!(target_mob in ListTargets(attack_range)) || Adjacent(target_mob))
		return

	if(COOLDOWN_FINISHED(src, ranged_cooldown))
		var/datum/ammo/projectile_type = GLOB.ammo_list[projectile_to_fire]
		visible_message(SPAN_XENOWARNING("[src] spits at [target_mob]!"))
		playsound(loc, pick('sound/voice/alien_spitacid.ogg', 'sound/voice/alien_spitacid2.ogg'), 25, 1)

		var/obj/projectile/projectile = new /obj/projectile(loc, create_cause_data(src))
		projectile.generate_bullet(projectile_type)
		projectile.permutated += src
		projectile.fire_at(target_mob, src, src, projectile_type.max_range, projectile_type.shell_speed)
		COOLDOWN_START(src, ranged_cooldown, cooldown_duration)

//SENTINEL
/////////////
/mob/living/simple_animal/hostile/alien/horde_mode/ranged/sentinel
		health = XENO_HEALTH_TIER_5
		melee_damage_lower = XENO_DAMAGE_TIER_1
		melee_damage_upper = XENO_DAMAGE_TIER_2
		kill_reward = 300

/mob/living/simple_animal/hostile/alien/horde_mode/ranged/sentinel/AttackingTarget()
	. = ..()

	if(ishuman(target_mob))
		target_mob.apply_effect(0.5, SLOW)
		to_chat(target_mob, SPAN_DANGER("[src]'s claws inject you with a slowing venom!"))

//SPITTER
/////////////
/mob/living/simple_animal/hostile/alien/horde_mode/ranged/spitter
	name = "Spitter"
	health = XENO_HEALTH_TIER_6
	icon_size = 64
	icon = 'icons/mob/xenos/spitter.dmi'
	projectile_to_fire = /datum/ammo/xeno/acid
	melee_damage_lower = XENO_DAMAGE_TIER_2
	melee_damage_upper = XENO_DAMAGE_TIER_3
	kill_reward = 400
	move_to_delay = HM_XENO_SPEED_SLOW
	cooldown_duration = 6 SECONDS
	COOLDOWN_DECLARE(acid_line_cooldown)

/mob/living/simple_animal/hostile/alien/horde_mode/ranged/spitter/ranged_attack_checks(mob/living/target)
	. = ..()
	if(COOLDOWN_FINISHED(src, acid_line_cooldown) && prob(50))
		playsound(loc, 'sound/effects/refill.ogg', 30, 1)
		visible_message(SPAN_XENOWARNING("[src] vomits a flood of acid!"))
		do_acid_spray_line(get_line(src, target_mob, include_start_atom = FALSE), /obj/effect/xenomorph/spray/strong/no_stun/short_duration, 7)
		COOLDOWN_START(src, acid_line_cooldown, 10 SECONDS)


//WARRIOR
/////////
/mob/living/simple_animal/hostile/alien/horde_mode/warrior
	name = "Warrior"
	desc = "A beefy alien with an armored carapace."
	icon = 'icons/mob/xenos/warrior.dmi'
	melee_damage_lower = XENO_DAMAGE_TIER_4
	melee_damage_upper = XENO_DAMAGE_TIER_4
	health = XENO_HEALTH_TIER_6
	move_to_delay = HM_XENO_SPEED_SLOW
	kill_reward = 250
	COOLDOWN_DECLARE(fling_cooldown)
	COOLDOWN_DECLARE(lunge_cooldown)

/mob/living/simple_animal/hostile/alien/horde_mode/warrior/AttackingTarget()
	if(Adjacent(target_mob) && prob(75) && COOLDOWN_FINISHED(src, fling_cooldown) && target_mob.mob_size < MOB_SIZE_BIG)
		COOLDOWN_START(src, fling_cooldown, 14 SECONDS)
		fling(target_mob, stun = TRUE)
		return
	. = ..()

/mob/living/simple_animal/hostile/alien/horde_mode/warrior/Life(delta_time)
	if(!Adjacent(target_mob) && prob(66) && COOLDOWN_FINISHED(src, lunge_cooldown) && get_dist(src, target_mob) <= 5)
		COOLDOWN_START(src, lunge_cooldown, 20 SECONDS)
		INVOKE_ASYNC(src, PROC_REF(lunge), target_mob, 5)
		return
	. = ..()

/mob/living/simple_animal/hostile/alien/horde_mode/warrior/Initialize()
	. = ..()
	status_flags &= ~CANPUSH

//BOSS ENEMIES
//////////////
/mob/living/simple_animal/hostile/alien/horde_mode/boss
	name = "Praetorian"
	desc = "A huge, looming beast of an alien."
	icon = 'icons/mob/xenos/praetorian.dmi'
	icon_size = 64
	pixel_x = -16
	old_x = -16
	melee_damage_lower = XENO_DAMAGE_TIER_5
	melee_damage_upper = XENO_DAMAGE_TIER_5
	health = XENO_HEALTH_QUEEN
	move_to_delay = 4.5
	kill_reward = 3000
	mob_size = MOB_SIZE_BIG
	explosive_damage_multiplier = 0.25
	var/following_mob
	COOLDOWN_DECLARE(first_ability)
	COOLDOWN_DECLARE(second_ability)
	COOLDOWN_DECLARE(third_ability)
	COOLDOWN_DECLARE(fourth_ability)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/Life(delta_time)
	if(target_mob && (target_mob in ListTargets(10)))
		if(following_mob)
			following_mob = null
			walk_to(src, 0) //stop moving
		if(COOLDOWN_FINISHED(src, first_ability) && prob(75)) //DASH
			INVOKE_ASYNC(src, PROC_REF(first_ability))
		else if(COOLDOWN_FINISHED(src, second_ability) && prob(50)) //ACID LINE
			INVOKE_ASYNC(src, PROC_REF(second_ability))
		if(COOLDOWN_FINISHED(src, third_ability)) //SHRIEK
			INVOKE_ASYNC(src, PROC_REF(third_ability))
		if(COOLDOWN_FINISHED(src, fourth_ability) && Adjacent(target_mob)) //TAIL SWIPE
			INVOKE_ASYNC(src, PROC_REF(fourth_ability))

	. = ..()

	//Start following a random human player if there are no enemies to fight.
	//We are picking a random player because checking for the closest mob via a for() loop is pretty resource intensive.
	if(!target_mob && hivenumber == XENO_HIVE_CORRUPTED && body_position != LYING_DOWN && !following_mob)
		stop_automated_movement = 1
		following_mob = SShorde_mode.return_random_player()
		walk_to(src, following_mob, 4, move_to_delay)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(check_block))
	status_flags &= ~(CANKNOCKDOWN|CANSTUN|CANPUSH)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/proc/check_block(mob/queen, turf/new_loc)
	SIGNAL_HANDLER
	for(var/mob/living/simple_animal/hostile/alien/horde_mode/xeno in new_loc.contents)
		if(xeno.hivenumber == hivenumber)
			xeno.KnockDown((5 DECISECONDS))
			playsound(src, 'sound/weapons/alien_knockdown.ogg', 25, 1)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/AttackingTarget()
	if(!Adjacent(target_mob))
		return

	if(prob(65))
		fling(target_mob, 2, STUN = FALSE)
		return

	if(isliving(target_mob))
		var/mob/living/target = target_mob
		if(prob(50) || target.body_position == LYING_DOWN)
			INVOKE_ASYNC(src, PROC_REF(ravaging_attack), target)
		else
			target.attack_animal(src)
			animation_attack_on(target)
			flick_attack_overlay(target, "slash")
			playsound(loc, "alien_claw_flesh", 25, 1)
		return target

/mob/living/simple_animal/hostile/alien/horde_mode/boss/proc/first_ability()
	if(Adjacent(target_mob))
		return

	COOLDOWN_START(src, first_ability, 8 SECONDS)
	roar_emote()
	var/outline_color = "#FF0000"
	var/alpha = 70
	outline_color += num2text(alpha, 2, 16)

	add_filter("outline", 1, outline_filter(size = 0, color = outline_color))
	transition_filter("outline", list(size = 2), 2 SECONDS, QUAD_EASING)

	visible_message(SPAN_HIGHDANGER("[src] begins to dash forward!"))
	move_to_delay -= 1.5
	MoveToTarget()
	AddComponent(/datum/component/footstep, 2 , 35, 11, 4, "alien_footstep_large")
	sleep(3 SECONDS)

	alpha = 35
	outline_color += num2text(alpha, 2, 16)

	transition_filter("outline", list(size = 0, color = outline_color), 2 SECONDS, QUAD_EASING)
	move_to_delay += 1.5
	MoveToTarget()
	GetExactComponent(/datum/component/footstep).RemoveComponent()
	sleep(2 SECONDS)
	remove_filter("outline")

/mob/living/simple_animal/hostile/alien/horde_mode/boss/proc/second_ability()
	COOLDOWN_START(src, second_ability, 8 SECONDS)
	playsound(loc, 'sound/effects/refill.ogg', 30, 1)
	visible_message(SPAN_XENOWARNING("[src] vomits a flood of acid!"))
	do_acid_spray_line(get_line(src, target_mob, include_start_atom = FALSE), /obj/effect/xenomorph/spray/strong/no_stun/short_duration, 7)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/proc/third_ability()
	COOLDOWN_START(src, third_ability, 22 SECONDS)
	playsound(loc, pick('sound/voice/xenos_roaring.ogg'), 75)
	visible_message(SPAN_XENOHIGHDANGER("[src] emits a guttural roar! A strange healing mist starts surrounding them..."))
	for(var/mob/living/surrounding_mob in view(7, src))
		if(surrounding_mob.faction == faction)
			if(ishuman(surrounding_mob))
				var/mob/living/carbon/human/friendly_human = surrounding_mob
				var/total_health = friendly_human.species.total_health
				friendly_human.heal_overall_damage(total_health * 0.25, total_health * 0.25)
				to_chat(friendly_human, SPAN_HELPFUL("[src]'s pheromones appear to be closing your wounds!"))
			else
				surrounding_mob.health += maxHealth * 0.33
			surrounding_mob.flick_heal_overlay(3 SECONDS, "#D9F500")
	create_shriekwave(5)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/proc/fourth_ability()
	COOLDOWN_START(src, fourth_ability, 14 SECONDS)
	tail_swipe(target_mob, 5, TRUE)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/death(cause, gibbed, deathmessage)
	. = ..()
	var/list/all_players
	for(var/list/player_in_list as anything in SShorde_mode.current_players)
		var/player_mob = player_in_list["mob"]
		all_players += player_mob
	for(var/mob/player in all_players)
		SShorde_mode.update_points(player, kill_reward / length(all_players))
		balloon_alert_to_viewers("+[kill_reward]")

//RANDOM ABILTIIES
//////////////////
/mob/living/simple_animal/hostile/alien/horde_mode/proc/tail_swipe(mob/living/target, distance = 3, paralyze = FALSE)
	if(stat == DEAD)
		return

	spin_circle()
	manual_emote("swipes its tail.")

	for(target in view(1, src))
		if(target.stat == DEAD || target.mob_size >= MOB_SIZE_BIG || target.faction == faction)
			continue
		if(ishuman(target))
			var/mob/living/carbon/human/human_target = target
			if(human_target.check_shields(0, name))
				playsound(loc, "bonk", 75, FALSE)
				continue

		var/facing = get_dir(src, target)
		target.apply_damage(rand(melee_damage_upper, melee_damage_lower), BRUTE)
		playsound(target,'sound/weapons/alien_claw_block.ogg', 75, 1)
		throw_mob(target, facing, distance)
		if(paralyze)
			target.apply_effect(1, PARALYZE)
			target.apply_effect(1, WEAKEN)

/mob/living/simple_animal/hostile/alien/horde_mode/boss/proc/ravaging_attack(mob/living/target)
	attacktext = "tears into"
	for(var/times_to_attack = pick(2, 3, 4), times_to_attack > 0, times_to_attack--)
		if(Adjacent(target) && target.stat == CONSCIOUS)
			target.attack_animal(src)
			src.animation_attack_on(target)
			src.flick_attack_overlay(target, "slash")
			playsound(loc, "alien_claw_flesh", 25, 1)
			sleep(0.35 SECONDS)
	attacktext = initial(attacktext)

//ACID SPRAY PROCS
//////////////////
/mob/living/simple_animal/hostile/alien/proc/do_acid_spray_line(list/turflist, spray_path = /obj/effect/xenomorph/spray, distance_max = 5)
	if(isnull(turflist) || stat == DEAD)
		return
	var/turf/prev_turf = loc

	var/distance = 0
	for(var/turf/T in turflist)
		distance++

		if(!prev_turf && length(turflist) > 1)
			prev_turf = get_turf(src)
			continue //So we don't burn the tile we be standin on

		if(T.density || istype(T, /turf/open/space))
			break
		if(distance > distance_max)
			break

		var/atom/movable/temp = new spray_path()
		var/atom/movable/AM = LinkBlocked(temp, prev_turf, T)
		qdel(temp)
		if(AM)
			if(ishordemodemob(AM))
				var/mob/living/simple_animal/hostile/alien/horde_mode/alien = AM
				if(alien.faction != src.faction)
					AM.acid_spray_act(src)
					break
			else
				AM.acid_spray_act(src)
				break

		prev_turf = T
		new spray_path(T, create_cause_data(src))
		sleep(0.5)

//SHRIEK PROC
/////////////
/mob/living/simple_animal/hostile/alien/horde_mode/proc/create_shriekwave(shriekwaves_left)
	var/offset_y = 8
	if(mob_size == MOB_SIZE_XENO)
		offset_y = 24
	if(mob_size == MOB_SIZE_IMMOBILE)
		offset_y = 28

	//the shockwave center is updated eachtime shockwave is called and offset relative to the mob_size.
	//due to the speed of the shockwaves, it isn't required to be tied to the exact mob movements
	var/epicenter = loc //center of the shockwave, set at the center of the tile that the mob is currently standing on
	var/easing = QUAD_EASING | EASE_OUT
	var/stage1_radius = rand(11, 12)
	var/stage2_radius = rand(9, 11)
	var/stage3_radius = rand(8, 10)
	var/stage4_radius = 7.5

	//shockwaves are iterated, counting down once per shriekwave, with the total amount being determined on the respective xeno ability tile
	if(shriekwaves_left > 12)
		shriekwaves_left--
		new /obj/effect/shockwave(epicenter, stage1_radius, 0.5, easing, offset_y)
		addtimer(CALLBACK(src, PROC_REF(create_shriekwave), shriekwaves_left), 2)
		return
	if(shriekwaves_left > 8)
		shriekwaves_left--
		new /obj/effect/shockwave(epicenter, stage2_radius, 0.5, easing, offset_y)
		addtimer(CALLBACK(src, PROC_REF(create_shriekwave), shriekwaves_left), 3)
		return
	if(shriekwaves_left > 4)
		shriekwaves_left--
		new /obj/effect/shockwave(epicenter, stage3_radius, 0.5, easing, offset_y)
		addtimer(CALLBACK(src, PROC_REF(create_shriekwave), shriekwaves_left), 3)
		return
	if(shriekwaves_left > 1)
		shriekwaves_left--
		new /obj/effect/shockwave(epicenter, stage4_radius, 0.5, easing, offset_y)
		addtimer(CALLBACK(src, PROC_REF(create_shriekwave), shriekwaves_left), 3)
		return
	if(shriekwaves_left == 1)
		shriekwaves_left--
		new /obj/effect/shockwave(epicenter, 10.5, 0.6, easing, offset_y)

//LUNGE PROC
////////////
/mob/living/simple_animal/hostile/alien/horde_mode/proc/lunge(mob/living/target, lunge_distance)
	if(stat == DEAD)
		return

	manual_emote("lunges at [target]!")
	animation_attack_on(target)
	if(ishuman(target))
		var/mob/living/carbon/human/human_target = target
		if(human_target.check_shields(0, name))
			playsound(loc, "bonk", 75, FALSE)
			return

	throw_atom(get_step_towards(target, src), lunge_distance, SPEED_FAST, src)
	if(Adjacent(target))
		target.apply_effect(0.5, ROOT)
		to_chat(target_mob, SPAN_USERDANGER("[src]'s strong grip roots you in place!"))
		flick_attack_overlay(target, "grab")
		if(ishuman(target))
			INVOKE_ASYNC(target, TYPE_PROC_REF(/mob, emote), "scream")

//FLINGING PROCS
////////////////
/mob/living/simple_animal/hostile/alien/horde_mode/proc/fling(mob/living/target, fling_distance = 5, stun = FALSE)
	if(body_position == LYING_DOWN || !Adjacent(target) || target.mob_size >= MOB_SIZE_BIG || stat == DEAD)
		return

	animation_attack_on(target)
	if(ishuman(target))
		var/mob/living/carbon/human/human_target = target
		if(human_target.check_shields(0, name))
			playsound(loc, "bonk", 75, FALSE)
			return

	if(!stun)
		visible_message(SPAN_XENOWARNING("[src] effortlessly flings [target] to the side!"))
	else
		visible_message(SPAN_XENOWARNING("The force of [src]'s blow effortlessly throws [target] away!"))
		if(isanimal(target))
			target.apply_effect(1, WEAKEN)
			target.apply_effect(1, PARALYZE)
		if(stun)
			target.apply_effect(0.25, WEAKEN)
		if(prob(50))
			roar_emote()

	playsound(target,'sound/weapons/alien_claw_block.ogg', 75, 1)
	target.last_damage_data = create_cause_data(src)

	var/facing = get_dir(src, target)
	var/damage = rand(melee_damage_lower, melee_damage_upper)
	if(!stun)
		target.apply_damage(damage * 0.5, BRUTE)
	else
		target.apply_damage(damage, BRUTE)

	face_atom(target)
	animation_attack_on(target)
	flick_attack_overlay(target, "disarm")
	throw_mob(target, facing, fling_distance, SPEED_VERY_FAST, shake_camera = TRUE)

/mob/living/simple_animal/hostile/alien/horde_mode/proc/throw_mob(mob/living/target, direction, distance, speed = SPEED_VERY_FAST, shake_camera = TRUE)
	if(!direction)
		direction = get_dir(src, target)
	var/turf/target_destination = get_ranged_target_turf(target, direction, distance)

	var/list/end_throw_callbacks

	target.throw_atom(target_destination, distance, speed, src, spin = TRUE, end_throw_callbacks = end_throw_callbacks)
	if(shake_camera)
		shake_camera(target, 10, 1)


#undef FIRE_LAYER
#undef HM_XENO_SPEED_VERY_SLOW
#undef HM_XENO_SPEED_SLOW
#undef HM_XENO_SPEED_AVERAGE
#undef HM_XENO_SPEED_FAST
#undef HM_XENO_SPEED_VERY_FAST
#undef HM_XENO_SPEED_RUNNER
