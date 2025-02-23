/obj/structure/prop/almayer/computers/hackable_comp
	name = "Secure computer"
	desc = "The IBM series 10 computer retrofitted to work as a sensor computer or some kind of sentry control network. While somewhat dated it still serves its purpose."
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "genericcomp_bulky"
	var/countdown_max = 20 // Maxiumum value in ticks.
	var/operation_complete = FALSE // If the multitooling was complete
	var/countdown_step = 10 // How many seconds between percentage annoucements
	var/terminal_in_use = FALSE
	var/start_text = "Initiating Download please wait..."
	var/hasdisk = FALSE


/obj/structure/prop/almayer/computers/hackable_comp/attackby(obj/item/W, mob/user)
	terminal_in_use = TRUE
	if((HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL)) && operation_complete == FALSE)
		playsound(loc, 'sound/machines/lockdownalarm.ogg', 25)
		user.visible_message(SPAN_NOTICE("[user]begins tampering with the [src]."), \
		SPAN_NOTICE("Your begin tampering with the [src]."))
		if(do_after(user, 80, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			for(var/obj/structure/prop/almayer/computers/hackable_comp/H in world)
				if(H.terminal_in_use == TRUE)
					INVOKE_ASYNC(H, TYPE_PROC_REF(/obj/structure/prop/almayer/computers/hackable_comp, special_countdown))
					return
    return

/obj/structure/prop/almayer/computers/hackable_comp/proc/special_countdown(turf/T)
	var/temp_countdown = 0
	terminal_in_use = FALSE
	if(temp_countdown == 0)
		playsound(loc, 'sound/machines/computer_startup.mp3', 25)
		talkas("Initiating Download please wait...")
	if (countdown_max == 0 && countdown_step == 0)
		to_chat(world, SPAN_WARNING("Admin dummy, tried to divide by zero. Point and laugh."))
		return
	while(temp_countdown < countdown_max)
		sleep(countdown_step)
		temp_countdown += countdown_step
		playsound(loc, 'sound/machines/dialup.mp3', 25)
		talkas("Download in progress. [round(((temp_countdown / countdown_max) * 100),0.5)] percent complete.")
	if(temp_countdown >= countdown_max)
		playsound(loc, 'sound/machines/fax.ogg', 25)
		talkas("Task Complete.")
		operation_complete = TRUE
		var/turf/current_turf = get_turf(usr.loc)
		message_admins(FONT_SIZE_XL("[src] has finished operations"),current_turf.x, current_turf.y, current_turf.z)
		if(hasdisk == TRUE)
			new /obj/item/disk(T)
		return

/obj/structure/prop/almayer/computers/hackable_comp/short_timer
	name = "Secure computer"
	desc = "The IBM series 10 computer retrofitted to work as a sensor computer or some kind of sentry control network. While somewhat dated it still serves its purpose."
	icon_state = "genericcomp_bulky"
	countdown_max = 100
	countdown_step = 10

/obj/structure/prop/almayer/computers/hackable_comp/med_timer
	name = "Secure computer"
	desc = "The IBM series 10 computer retrofitted to work as a sensor computer or some kind of sentry control network. While somewhat dated it still serves its purpose."
	icon_state = "genericcomp_bulky"
	countdown_max = 300
	countdown_step = 50

/obj/structure/prop/almayer/computers/hackable_comp/long_timer
	name = "Secure computer"
	desc = "The IBM series 10 computer retrofitted to work as a sensor computer or some kind of sentry control network. While somewhat dated it still serves its purpose."
	icon_state = "genericcomp_bulky"
	countdown_max = 1200
	countdown_step = 150
