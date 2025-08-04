/datum/game_mode/extended/lv254m
	name = "Lv-254(mudskippers)"
	config_tag = "Lv-254"
	required_players = 0
	latejoin_larva_drop = 0
	votable = FALSE
	taskbar_icon = 'icons/taskbar/gml_colonyrp.png'

/datum/game_mode/extended/lv254m/announce()
	to_world("<B>The current game mode is - LV-254!</B>")

/datum/game_mode/extended/lv254m/get_roles_list()
	return GLOB.ROLES_BLACKGOLD

/datum/game_mode/extended/lv254m/post_setup()
	initialize_post_marine_gear_list()
	round_time_lobby = world.time
	return ..()

/datum/game_mode/extended/lv254m/process()
	. = ..()
	if(next_research_allocation < world.time)
		GLOB.chemical_data.update_credits(GLOB.chemical_data.research_allocation_amount)
		next_research_allocation = world.time + research_allocation_interval

/datum/game_mode/extended/lv254m/check_finished()
	if(round_finished)
		return TRUE

/datum/game_mode/extended/lv254m/check_win()
	return

/datum/game_mode/extended/lv254m/declare_completion()
	announce_ending()
	var/musical_track = pick('sound/theme/neutral_hopeful1.ogg','sound/theme/neutral_hopeful2.ogg')
	world << musical_track

	if(GLOB.round_statistics)
		GLOB.round_statistics.game_mode = name
		GLOB.round_statistics.round_length = world.time
		GLOB.round_statistics.end_round_player_population = length(GLOB.clients)
		GLOB.round_statistics.log_round_statistics()

	calculate_end_statistics()
	declare_completion_announce_predators()
	declare_completion_announce_medal_awards()

	GLOB.round_statistics?.save()

	return TRUE
