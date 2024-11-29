//otter
/mob/living/simple_animal/otter
	name = "\improper otter"
	real_name = "otter"
	desc = "It's a otter."
	icon_state = "otter"
	icon_living = "otter"
	icon_dead = "otter_dead"
	speak = list("YAP", "Woof!", "Bark!", "AUUUUUU")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks", "woofs", "yaps","pants")
	emote_see = list("shakes its head", "shivers")
	speak_chance = 1
	turns_per_move = 10
	meat_type = /obj/item/reagent_container/food/snacks/meat/otter
	meat_amount = 3
	response_help  = "pets the"
	response_disarm = "bops the"
	response_harm   = "kicks the"
	see_in_dark = 5
	mob_size = MOB_SIZE_SMALL
	black_market_value = 50
	dead_black_market_value = 0
	var/obj/item/inventory_head
	var/obj/item/inventory_back
	var/facehugger

//IAN! SQUEEEEEEEEE~
/mob/living/simple_animal/otter/Ian
	name = "Ian"
	real_name = "Ian" //Intended to hold the name without altering it.
	gender = MALE
	desc = "It's a otter."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"

/mob/living/simple_animal/otter/Ian/Life(delta_time)
	..()
	INVOKE_ASYNC(src, PROC_REF(look_for_food))

/mob/living/simple_animal/otter/Ian/proc/look_for_food()
	//Feeding, chasing food, FOOOOODDDD
	if(!stat && !resting && !buckled)
		turns_since_scan++
		if(turns_since_scan > 5)
			turns_since_scan = 0
			if((movement_target) && !(isturf(movement_target.loc) || ishuman(movement_target.loc) ))
				movement_target = null
				stop_automated_movement = 0
			if( !movement_target || !(movement_target.loc in oview(src, 3)) )
				movement_target = null
				stop_automated_movement = 0
				for(var/obj/item/reagent_container/food/snacks/S in oview(src,3))
					if(isturf(S.loc) || ishuman(S.loc))
						movement_target = S
						break
			if(movement_target)
				stop_automated_movement = 1
				step_to(src,movement_target,1)
				sleep(3)
				step_to(src,movement_target,1)
				sleep(3)
				step_to(src,movement_target,1)

				if(movement_target) //Not redundant due to sleeps, Item can be gone in 6 decisecomds
					if (movement_target.loc.x < src.x)
						setDir(WEST)
					else if (movement_target.loc.x > src.x)
						setDir(EAST)
					else if (movement_target.loc.y < src.y)
						setDir(SOUTH)
					else if (movement_target.loc.y > src.y)
						setDir(NORTH)
					else
						setDir(SOUTH)

					if(isturf(movement_target.loc) )
						movement_target.attack_animal(src)
					else if(ishuman(movement_target.loc) )
						if(prob(20))
							INVOKE_ASYNC(src, PROC_REF(emote), "stares at the [movement_target] that [movement_target.loc] has with a sad puppy-face")

		if(prob(1))
			INVOKE_ASYNC(src, PROC_REF(emote), pick("dances around","chases its tail"))
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					setDir(i)
					sleep(1)

/mob/living/simple_animal/otter/death()
	. = ..()
	if(!.) return //was already dead
	if(last_damage_data)
		var/mob/user = last_damage_data.resolve_mob()
		if(user)
			user.count_niche_stat(STATISTICS_NICHE_OTTER)

/obj/item/reagent_container/food/snacks/meat/otter
	name = "otter meat"
	desc = "Tastes like... well you know..."


/mob/living/simple_animal/otter/attackby(obj/item/O as obj, mob/user as mob)  //Marker -Agouri
	if(istype(O, /obj/item/newspaper))
		if(!stat)
			for(var/mob/M as anything in viewers(user, null))
				if ((M.client && !( M.blinded )))
					M.show_message(SPAN_NOTICE("[user] baps [name] on the nose with the rolled-up [O]"), SHOW_MESSAGE_VISIBLE)
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2))
					setDir(i)
					sleep(1)
	else
		..()

/mob/living/simple_animal/otter/regenerate_icons()
	overlays = list()

	if(inventory_head)
		var/head_icon_state = inventory_head.icon_state
		if(health <= 0)
			head_icon_state += "2"

		var/icon/head_icon = image('icons/mob/humans/onmob/corgi_head.dmi',head_icon_state)
		if(head_icon)
			overlays += head_icon

	if(inventory_back)
		var/back_icon_state = inventory_back.icon_state
		if(health <= 0)
			back_icon_state += "2"

		var/icon/back_icon = image('icons/mob/humans/onmob/corgi_back.dmi',back_icon_state)
		if(back_icon)
			overlays += back_icon

	if(facehugger)
		overlays += image('icons/mob/humans/onmob/mask.dmi',"facehugger_otter")

	return
