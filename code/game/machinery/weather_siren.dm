/obj/structure/machinery/weather_siren
	name = "Weather Siren"
	desc = "A siren used to play weather warnings for the colony."
	icon = 'icons/obj/structures/machinery/loudspeaker.dmi'
	icon_state = "loudspeaker"
	density = FALSE
	anchored = TRUE
	unacidable = 1
	unslashable = 1
	use_power = USE_POWER_NONE
	health = 0

/obj/structure/machinery/weather_siren/Initialize()
	weather_notify_objects += src
	return ..()

/obj/structure/machinery/weather_siren/Destroy()
	weather_notify_objects -= src
	. = ..()

/obj/structure/machinery/weather_siren/power_change()
	return

/obj/structure/machinery/weather_siren/proc/weather_warning()
	playsound(loc, 'sound/effects/weather_warning.ogg', 50, 0)
	visible_message(SPAN_DANGER("The [src] blares. ATTENTION. POTENTIALLY HAZARDOUS WEATHER ANOMALY DETECTED. SEEK SHELTER IMMEDIATELY."))



/obj/structure/machinery/checkpoint_broadcaster
	name = "Automated Checkpoint PA Speaker"
	desc = "A siren used to play propaganda and safety warnings"
	icon = 'icons/obj/structures/machinery/loudspeaker.dmi'
	icon_state = "loudspeaker"
	density = FALSE
	anchored = TRUE
	unacidable = 1
	unslashable = 1
	use_power = USE_POWER_NONE
	health = 0
	var/id



/obj/structure/machinery/checkpoint_broadcaster/proc/play_checkpoint_warning()
	playsound(loc, 'sound/effects/weather_warning.ogg', 50, 0)
	visible_message(SPAN_DANGER("The [src] crackles to life spewing a menacing warning in a monotone voice."))
