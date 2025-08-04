//NERO AREAS--------------------------------------//
// Fore = West  | Aft = East //
// Port = South | Starboard = North //
// Bow = Western|Stern = Eastern //(those are the front and back small sections)
// Naming convention is to start by port or starboard then put eitheir (bow,fore,midship,aft,stern)
/area/nero
	icon = 'icons/turf/area_almayer.dmi'
	// ambience = list('sound/ambience/shipambience.ogg')
	icon_state = "almayer"
	ceiling = CEILING_METAL
	powernet_name = "nero"
	sound_environment = SOUND_ENVIRONMENT_ROOM
	soundscape_interval = 30
	// soundscape_playlist = list('sound/effects/xylophone1.ogg', 'sound/effects/xylophone2.ogg', 'sound/effects/xylophone3.ogg')
	ambience_exterior = AMBIENCE_ALMAYER
	ceiling_muffle = FALSE

	///Whether this area is used for hijack evacuation progress
	var/hijack_evacuation_area = FALSE

	///The weight this area gives towards hijack evacuation progress
	var/hijack_evacuation_weight = 0

	///Whether this area is additive or multiplicative towards evacuation progress
	var/hijack_evacuation_type = EVACUATION_TYPE_NONE

/area/nero/Initialize(mapload, ...)
	. = ..()

	if(hijack_evacuation_area)
		SShijack.progress_areas[src] = power_equip

/obj/structure/machinery/computer/shuttle_control/nero/hangar
	name = "Elevator Console"
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "supply"
	unslashable = TRUE
	unacidable = TRUE
	explo_proof = TRUE
	density = TRUE
	req_access = null
	shuttle_tag = "Hangar"

/obj/structure/machinery/computer/shuttle_control/nero/maintenance
	name = "Elevator Console"
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "shuttle"
	unslashable = TRUE
	unacidable = TRUE
	explo_proof = TRUE
	density = TRUE
	req_access = null
	shuttle_tag = "Maintenance"

// command
/area/nero/command
	minimap_color = MINIMAP_AREA_COMMAND

/area/nero/command/cic
	name = "\improper Combat Information Center"
	icon_state = "cic"
	soundscape_playlist = SCAPE_PL_CIC
	soundscape_interval = 50
	flags_area = AREA_NOTUNNEL

/area/nero/command/cicconference
	name = "\improper Upper Deck Aft Conference Room"
	icon_state = "cic"

/area/nero/command/computerlab
	name = "\improper Upper Deck Computer Lab"
	icon_state = "ceroom"

/area/nero/command/telecomms
	name = "\improper Lower Deck Aft Telecommunications"
	icon_state = "tcomms"
	flags_area = AREA_NOTUNNEL

// engineering
/area/nero/engineering
	minimap_color = MINIMAP_AREA_ENGI

/area/nero/engineering/lower
	name = "\improper Lower Deck Engineering"
	icon_state = "lowerengineering"

/area/nero/engineering/lower/engine_core
	name = "\improper Reactor Core"
	icon_state = "coreroom"
	soundscape_playlist = SCAPE_PL_ENG
	soundscape_interval = 15
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 0.2
	hijack_evacuation_type = EVACUATION_TYPE_ADDITIVE

/area/nero/shipboard
	minimap_color = MINIMAP_AREA_SEC

/area/nero/shipboard/starboard_missiles
	name = "\improper Starboard Missile Tube"
	icon_state = "starboardmissile"

/area/nero/shipboard/port_torpedos
	name = "\improper Port Torpedo Tube"
	icon_state = "portmissile"

/area/nero/shipboard/weapon_room/notunnel
	flags_area = AREA_NOTUNNEL
	requires_power = FALSE

// brig
/area/nero/shipboard/brig
	name = "\improper Lower Deck Fore Brig"
	icon_state = "brig"

// lower hallway
/area/nero/hallways/lower

/area/nero/hallways/lower/fore_hallway
	name = "\improper Lower Deck Fore Hallway"
	icon_state = "port"

/area/nero/hallways/lower/aft_hallway
	name = "\improper Lower Deck Aft Hallway"
	icon_state = "starboard"

//port
/area/nero/hallways/lower/port_fore_hallway
	name = "\improper Lower Deck Port-Fore Hallway"
	icon_state = "port"

/area/nero/hallways/lower/port_midship_hallway
	name = "\improper Lower Deck Port-Midship Hallway"
	icon_state = "port"

/area/nero/hallways/lower/port_aft_hallway
	name = "\improper Lower Deck Port-Aft Hallway"
	icon_state = "port"

//starboard
/area/nero/hallways/lower/starboard_fore_hallway
	name = "\improper Lower Deck Starboard-Fore Hallway"
	icon_state = "starboard"

/area/nero/hallways/lower/starboard_midship_hallway
	name = "\improper Lower Deck Starboard-Midship Hallway"
	icon_state = "starboard"

/area/nero/hallways/lower/starboard_aft_hallway
	name = "\improper Lower Deck Starboard-Aft Hallway"
	icon_state = "starboard"

// upper hallway
/area/nero/hallways/upper

/area/nero/hallways/upper/aft_hallway
	name = "\improper Upper Deck Aft Hallway"
	icon_state = "aft"

/area/nero/hallways/upper/fore_hallway
	name = "\improper Upper Deck Fore Hallway"
	icon_state = "stern"

/area/nero/hallways/upper/midship_hallway
	name = "\improper Upper Deck Midship Hallway"
	icon_state = "stern"

/area/nero/hallways/upper/port
	name = "\improper Upper Deck Port Hallway"
	icon_state = "port"

/area/nero/hallways/upper/starboard
	name = "\improper Upper Deck Starboard Hallway"
	icon_state = "starboard"

//area that are used for transition between decks.
/area/nero/stair_clone
	name = "\improper Stairs"
	icon_state = "stairs_lowerdeck"
	resin_construction_allowed = FALSE

/area/nero/stair_clone/lower
	name = "\improper Lower Deck Mid Stairs"
	icon_state = "stairs_upperdeck"

/area/nero/stair_clone/upper
	name = "\improper Upper Deck Mid Stairs"
	icon_state = "stairs_upperdeck"

// hull areas
/area/nero/maint/hull

// lower deck hull areas
/area/nero/maint/hull/lower
	name = "\improper Lower Deck Hull"
	icon_state = "lowerhull"

// stairs.
/area/nero/maint/hull/lower/stairs
	name = "\improper Lower Deck Stairs Hull"

/area/nero/maint/hull/lower/stern
	name = "\improper Lower Deck Stern Hull"

/area/nero/maint/hull/lower/p_bow
	name = "\improper Lower Deck Port-Bow Hull"

/area/nero/maint/hull/lower/s_bow
	name = "\improper Lower Deck Starboard-Bow Hull"

/area/nero/maint/hull/lower/l_f_s
	name = "\improper Lower Deck Starboard-Fore Hull"

/area/nero/maint/hull/lower/l_m_s
	name = "\improper Lower Deck Starboard-Midship Hull"

/area/nero/maint/hull/lower/l_a_s
	name = "\improper Lower Deck Starboard-Aft Hull"

/area/nero/maint/hull/lower/l_f_p
	name = "\improper Lower Deck Port-Fore Hull"

/area/nero/maint/hull/lower/l_m_p
	name = "\improper Lower Deck Port-Midship Hull"

/area/nero/maint/hull/lower/l_a_p
	name = "\improper Lower Deck Port-Aft Hull"

// upper deck hull areas
/area/nero/maint/hull/upper
	name = "\improper Upper Deck Hull"
	icon_state = "upperhull"

// Stairs.
/area/nero/maint/hull/upper/stairs
	name = "\improper Upper Deck Stairs Hull"

/area/nero/maint/hull/upper/p_bow
	name = "\improper Upper Deck Port-Bow Hull"

/area/nero/maint/hull/upper/s_bow
	name = "\improper Upper Deck Starboard-Bow Hull"

/area/nero/maint/hull/upper/p_stern
	name = "\improper Upper Deck Port-Stern Hull"

/area/nero/maint/hull/upper/s_stern
	name = "\improper Upper Deck Starboard-Stern Hull"

/area/nero/maint/hull/upper/u_f_s
	name = "\improper Upper Deck Starboard-Fore Hull"

/area/nero/maint/hull/upper/u_m_s
	name = "\improper Upper Deck Starboard-Midship Hull"

/area/nero/maint/hull/upper/u_a_s
	name = "\improper Upper Deck Starboard-Aft Hull"

/area/nero/maint/hull/upper/u_f_p
	name = "\improper Upper Deck Port-Fore Hull"

/area/nero/maint/hull/upper/u_m_p
	name = "\improper Upper Deck Port-Midship Hull"

/area/nero/maint/hull/upper/u_a_p
	name = "\improper Upper Deck Port-Aft Hull"

//Living
/area/nero/living
	minimap_color = MINIMAP_AREA_COLONY

/area/nero/living/cryo_cells
	name = "\improper Lower Deck Cryo Cells"
	icon_state = "cryo"

/area/nero/living/briefing
	name = "\improper Briefing Area"
	icon_state = "briefing"

/area/nero/living/cafeteria_port
	name = "\improper Galley"
	icon_state = "food"

/area/nero/living/captain_mess
	name = "\improper Captain's Mess"
	icon_state = "briefing"

/area/nero/living/bridgebunks
	name = "\improper Staff Officer Bunks"
	icon_state = "livingspace"

/area/nero/living/commandbunks
	name = "\improper Commanding Officer's Bunk"
	icon_state = "livingspace"

/area/nero/living/numbertwobunks
	name = "\improper Executive Officer's Bunk"
	icon_state = "livingspace"

/area/nero/medical
	minimap_color = MINIMAP_AREA_MEDBAY

/area/nero/medical/upper_medical
	name = "\improper Upper Deck Medical Bay"
	icon_state = "medical"
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/nero/medical/operating_room
	name = "\improper Operating Room"
	icon_state = "operating"
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/nero/medical/medical_science
	name = "\improper Research lab"
	icon_state = "science"

/area/nero/medical/containment
	name = "\improper Research containment"
	icon_state = "science"
	flags_area = AREA_AVOID_BIOSCAN|AREA_NOTUNNEL|AREA_CONTAINMENT

/area/nero/medical/pharmacy
	name = "\improper Medical Pharmacy"
	icon_state = "chemistry"

/area/nero/squads/alpha_bravo_shared
	name = "\improper Squad Preparation"
	icon_state = "ab_shared"

/area/nero/squads/req
	name = "\improper Requisitions"
	icon_state = "req"

/area/nero/powered //for objects not intended to lose power
	name = "\improper Powered"
	icon_state = "selfdestruct"
	requires_power = 0

/area/nero/engineering/airmix
	icon_state = "selfdestruct"
	requires_power = 0
	flags_area = AREA_NOTUNNEL
