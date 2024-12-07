SUBSYSTEM_DEF(horde_mode_mobs)
	name   = "Horde Mode Mobs"
	wait   = 1 SECONDS
	flags  = SS_NO_INIT | SS_KEEP_TIMING
	priority   = SS_PRIORITY_MOB

	var/list/currentrun = list()

/datum/controller/subsystem/horde_mode_mobs/stat_entry(msg)
	msg = "P:[length(SShorde_mode.current_xenos) + length(SShorde_mode.corrupted_xenos)]"
	return ..()


/datum/controller/subsystem/horde_mode_mobs/fire(resumed = FALSE)
	if (!resumed)
		currentrun = SShorde_mode.current_xenos.Copy() + SShorde_mode.corrupted_xenos.Copy()

	while (length(currentrun))
		var/mob/living/M = currentrun[length(currentrun)]
		currentrun.len--

		if (!M || QDELETED(M))
			continue

		M.Life(wait * 0.1)

		if (MC_TICK_CHECK)
			return
