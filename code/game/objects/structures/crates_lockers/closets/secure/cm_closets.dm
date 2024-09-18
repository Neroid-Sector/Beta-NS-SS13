GLOBAL_LIST_EMPTY(co_secure_boxes)

//**********************Marine Gear**************************/

//MARINE COMMAND CLOSET
/obj/structure/closet/secure_closet/commander
	name = "commanding officer's locker"
	req_access = list(ACCESS_MARINE_CO)
	icon_state = "secure_locked_commander"
	icon_closed = "secure_unlocked_commander"
	icon_locked = "secure_locked_commander"
	icon_opened = "secure_open_commander"
	icon_broken = "secure_locked_commander"
	icon_off = "secure_closed_commander"

/obj/structure/closet/secure_closet/commander/Initialize()
	. = ..()
	new /obj/item/storage/backpack/mcommander(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/suit/storage/jacket/marine/dress/officer(src)
	new /obj/item/clothing/head/marine/peaked/captain(src)

/obj/structure/closet/secure_closet/securecom
	name = "commanding officer's secure box"
	req_access = list(ACCESS_MARINE_CO)
	desc = "A safe for the Commanding Officer to store any equipment they need to have ready at a moment's notice. There's a note inside saying that whatever was inside it before was moved out."
	icon = 'icons/obj/structures/marine_closet.dmi'
	icon_state = "commander_safe"
	icon_opened = "commander_safe_open"
	icon_closed = "commander_safe"
	icon_locked = "commander_safe"

/obj/structure/closet/secure_closet/securecom/Initialize()
	. = ..()
	new /obj/item/storage/box/kit/honorguard(src)
	new /obj/item/storage/box/kit/honorguard(src)
	GLOB.co_secure_boxes += src

/obj/structure/closet/secure_closet/securecom/Destroy()
	GLOB.co_secure_boxes -= src
	return ..()

/obj/structure/closet/secure_closet/staff_officer
	name = "staff officer's locker"
	req_access = list(ACCESS_MARINE_COMMAND)
	icon_state = "secure_locked_staff"
	icon_closed = "secure_unlocked_staff"
	icon_locked = "secure_locked_staff"
	icon_opened = "secure_open_staff"
	icon_broken = "secure_locked_staff"
	icon_off = "secure_closed_staff"

/obj/structure/closet/secure_closet/staff_officer/gear/Initialize()
	. = ..()
	new /obj/item/clothing/head/beret/cm(src)
	new /obj/item/clothing/head/beret/cm(src)
	new /obj/item/clothing/head/cmcap/bridge(src)
	new /obj/item/clothing/head/cmcap/bridge(src)
	new /obj/item/clothing/under/marine/officer/bridge(src)
	new /obj/item/clothing/under/marine/officer/bridge(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/storage/belt/marine(src)
	new /obj/item/storage/belt/marine(src)
	new /obj/item/clothing/under/marine/officer/boiler(src)
	new /obj/item/clothing/under/marine/officer/boiler(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/gloves/combat(src)

/obj/structure/closet/secure_closet/staff_officer/armory
	name = "staff officer's armory locker"

/obj/structure/closet/secure_closet/staff_officer/armory/Initialize()
	. = ..()
	new /obj/item/clothing/head/helmet/marine/MP/SO(src)
	new /obj/item/clothing/head/helmet/marine/MP/SO(src)
	new /obj/item/clothing/suit/storage/marine/MP/SO(src)
	new /obj/item/clothing/suit/storage/marine/MP/SO(src)
	new /obj/item/device/radio/headset/almayer/mcom(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/shoes/marine/knife(src)

/obj/structure/closet/secure_closet/staff_officer/armory/m4a1/Initialize()
	. = ..()
	new /obj/item/storage/belt/marine(src)
	new /obj/item/storage/belt/marine(src)

/obj/structure/closet/secure_closet/staff_officer/armory/shotgun/Initialize()
	. = ..()
	new /obj/item/storage/belt/shotgun(src)
	new /obj/item/storage/belt/shotgun(src)
	new /obj/item/storage/large_holster/m37(src)

/obj/structure/closet/secure_closet/staff_officer/intel
	name = "intelligence officer's locker"

/obj/structure/closet/secure_closet/staff_officer/intel/Initialize()
	. = ..()
	new /obj/item/clothing/head/beret/cm(src)
	new /obj/item/clothing/head/beret/cm/tan(src)
	new /obj/item/clothing/head/cmcap/bridge(src)
	new /obj/item/clothing/head/helmet/marine/rto/intel(src)
	new /obj/item/clothing/under/marine/officer/intel(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/storage/belt/gun/m4a3(src)
	new /obj/item/storage/backpack/marine/satchel/intel(src)
	new /obj/item/clothing/suit/storage/marine/rto/intel(src)
	new /obj/item/storage/pouch/document(src)
	new /obj/item/storage/pouch/document(src)
	new /obj/item/device/motiondetector/intel(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/clothing/accessory/storage/webbing(src)
	new /obj/item/stack/fulton(src)

/obj/structure/closet/secure_closet/staff_officer/intel/select_gamemode_equipment(gamemode)
	if (SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new /obj/item/clothing/mask/rebreather/scarf(src)

/obj/structure/closet/secure_closet/pilot_officer
	name = "pilot officer's locker"
	req_access = list(ACCESS_MARINE_PILOT)
	icon_state = "secure_locked_pilot"
	icon_closed = "secure_unlocked_pilot"
	icon_locked = "secure_locked_pilot"
	icon_opened = "secure_open_pilot"
	icon_broken = "secure_locked_pilot"
	icon_off = "secure_closed_pilot"

/obj/structure/closet/secure_closet/pilot_officer/Initialize()
	. = ..()
	new /obj/item/clothing/head/helmet/marine/pilot(src)
	new /obj/item/clothing/under/marine/officer/pilot(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/clothing/suit/armor/vest/pilot(src)
	new /obj/item/storage/belt/gun/m39(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	new /obj/item/clothing/gloves/yellow(src)
	new /obj/item/clothing/glasses/sunglasses(src)

/obj/structure/closet/secure_closet/pilot_officer/select_gamemode_equipment(gamemode)
	if (SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new /obj/item/clothing/mask/rebreather/scarf(src)
		new /obj/item/clothing/mask/rebreather/scarf(src)

//**********************Military Police Gear**************************/
/obj/structure/closet/secure_closet/military_police
	name = "military police's locker"
	req_access = list(ACCESS_MARINE_BRIG)
	icon_state = "secure_locked_police"
	icon_closed = "secure_unlocked_police"
	icon_locked = "secure_locked_police"
	icon_opened = "secure_open_police"
	icon_broken = "secure_broken_police"
	icon_off = "secure_closed_police"

/obj/structure/closet/secure_closet/military_police/Initialize()
	. = ..()
	new /obj/item/clothing/head/beret/marine/mp(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/clothing/accessory/storage/holster/armpit(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/clothing/under/marine/mp(src)
	new /obj/item/clothing/suit/storage/marine/MP(src)
	new /obj/item/storage/belt/security/MP(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/clothing/glasses/sunglasses/sechud(src)
	new /obj/item/device/radio/headset/almayer/mmpo(src)
	new /obj/item/weapon/gun/energy/taser(src)
	new /obj/item/weapon/baton(src)
	new /obj/item/device/flash(src)
	new /obj/item/handcuffs(src)
	new /obj/item/reagent_container/spray/pepper(src)
	new /obj/item/storage/pouch/general/medium(src)
	if(prob(50))
		new /obj/item/storage/backpack/security(src)
	else
		new /obj/item/storage/backpack/satchel/sec(src)

/obj/structure/closet/secure_closet/warrant_officer
	name = "chief MP's locker"
	req_access = list(ACCESS_MARINE_BRIG)
	icon_state = "secure_locked_warrant"
	icon_closed = "secure_unlocked_warrant"
	icon_locked = "secure_locked_warrant"
	icon_opened = "secure_open_warrant"
	icon_broken = "secure_locked_warrant"
	icon_off = "secure_closed_warrant"

/obj/structure/closet/secure_closet/warrant_officer/Initialize()
	. = ..()
	new /obj/item/clothing/head/beret/marine/mp/cmp(src)
	new /obj/item/clothing/accessory/storage/holster/armpit(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/clothing/under/marine/officer/warrant(src)
	new /obj/item/clothing/suit/storage/marine/MP/WO(src)
	new /obj/item/storage/belt/security/MP(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/clothing/glasses/sunglasses/sechud(src)
	new /obj/item/device/radio/headset/almayer/cmpcom(src)
	new /obj/item/weapon/gun/energy/taser(src)
	new /obj/item/weapon/baton(src)
	new /obj/item/storage/backpack/security (src)
	new /obj/item/storage/backpack/satchel/sec(src)
	new /obj/item/device/flash(src)
	new /obj/item/reagent_container/spray/pepper(src)
	new /obj/item/handcuffs(src)
	new /obj/item/storage/pouch/general/large(src)

/obj/structure/closet/secure_closet/military_officer_spare
	name = "extra equipment locker"
	req_access = list(ACCESS_MARINE_BRIG)
	icon_state = "secure_locked_warrant"
	icon_closed = "secure_unlocked_warrant"
	icon_locked = "secure_locked_warrant"
	icon_opened = "secure_open_warrant"
	icon_broken = "secure_locked_warrant"
	icon_off = "secure_closed_warrant"

/obj/structure/closet/secure_closet/military_officer_spare/Initialize()
	. = ..()
	new /obj/item/clothing/accessory/storage/holster/armpit(src)
	new /obj/item/storage/backpack/security(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/clothing/under/marine/mp(src)
	new /obj/item/clothing/suit/storage/marine/MP(src)
	new /obj/item/clothing/head/helmet/riot(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/device/radio/headset/almayer/mmpo(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/device/radio/headset/almayer/mmpo(src)
	new /obj/item/clothing/accessory/storage/holster/waist(src)

//ALMAYER MEDICAL CLOSET
/obj/structure/closet/secure_closet/medical_doctor
	name = "medical doctor's locker"
	req_access = list(ACCESS_MARINE_MEDBAY)
	icon_state = "secure_locked_medical"
	icon_closed = "secure_unlocked_medical"
	icon_locked = "secure_locked_medical"
	icon_opened = "secure_open_medical"
	icon_broken = "secure_broken_medical"
	icon_off = "secure_closed_medical"

/obj/structure/closet/secure_closet/medical_doctor/Initialize()
	. = ..()
	new /obj/item/storage/backpack/marine/satchel(src)
	if(!is_ground_level(z))
		new /obj/item/device/radio/headset/almayer/doc(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/storage/belt/medical/full(src)
	new /obj/item/clothing/under/rank/medical/green(src)
	new /obj/item/clothing/under/rank/medical/blue(src)
	new /obj/item/clothing/under/rank/medical/purple(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/clothing/head/surgery/green(src)
	new /obj/item/clothing/head/surgery/blue(src)
	new /obj/item/clothing/head/surgery/purple(src)
	new /obj/item/clothing/glasses/hud/health(src)

/obj/structure/closet/secure_closet/medical_doctor/select_gamemode_equipment(gamemode)
	if (SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new /obj/item/clothing/suit/storage/snow_suit/doctor(src)
		new /obj/item/clothing/mask/rebreather/scarf(src)

/obj/structure/closet/secure_closet/hydroresearch
	name = "Hydroponics Research Locker"
	req_access = list(ACCESS_MARINE_RESEARCH)
	icon_state = "secure_locked_medical_white"
	icon_closed = "secure_unlocked_medical_white"
	icon_locked = "secure_locked_medical_white"
	icon_opened = "secure_open_medical_white"
	icon_broken = "secure_closed_medical_white"
	icon_off = "secure_closed_medical_white"

/obj/structure/closet/secure_closet/hydroresearch/Initialize()
	. = ..()
	new /obj/item/reagent_container/spray/hydro(src)
	new /obj/item/reagent_container/spray/hydro(src)
	new /obj/item/reagent_container/spray/hydro(src)
	new /obj/item/storage/box/botanydisk(src)
	new /obj/item/storage/box/botanydisk(src)
	new /obj/item/storage/bag/plants(src)
	new /obj/item/storage/bag/plants(src)
	new /obj/item/device/analyzer/plant_analyzer(src)
	new /obj/item/device/analyzer/plant_analyzer(src)
	new /obj/item/tool/minihoe(src)
	new /obj/item/tool/wirecutters/clippers(src)
	new /obj/item/tool/hatchet(src)
	new /obj/item/tool/shovel/spade(src)
	new /obj/item/reagent_container/glass/bucket(src)

//ALAMAYER CARGO CLOSET
/obj/structure/closet/secure_closet/req_officer
	name = "\improper RO's Locker"
	req_access = list(ACCESS_MARINE_RO)
	icon_state = "secure_locked_cargo"
	icon_closed = "secure_unlocked_cargo"
	icon_locked = "secure_locked_cargo"
	icon_opened = "secure_open_cargo"
	icon_broken = "secure_broken_cargo"
	icon_off = "secure_off_cargo"

/obj/structure/closet/secure_closet/req_officer/Initialize()
	. = ..()
	new /obj/item/device/radio/headset/almayer/qm(src)
	new /obj/item/clothing/under/rank/qm_suit(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/storage/belt/marine(src)
	new /obj/item/clothing/head/cmcap/req(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/storage/backpack/marine/satchel(src)

/obj/structure/closet/secure_closet/cargotech
	name = "Cargo Technician's Locker"
	req_access = list(ACCESS_MARINE_CARGO)
	icon_state = "secure_locked_cargo"
	icon_closed = "secure_unlocked_cargo"
	icon_locked = "secure_locked_cargo"
	icon_opened = "secure_open_cargo"
	icon_broken = "secure_broken_cargo"
	icon_off = "secure_off_cargo"

/obj/structure/closet/secure_closet/cargotech/Initialize()
	. = ..()
	new /obj/item/clothing/under/rank/cargotech(src)
	new /obj/item/clothing/shoes/marine(src)
	new /obj/item/device/encryptionkey/req(src)
	new /obj/item/clothing/gloves/yellow(src)
	new /obj/item/clothing/head/beanie(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	return

/obj/structure/closet/secure_closet/sea
	name = "\improper SEA's Locker"
	req_access = list(ACCESS_MARINE_SEA)
	icon_state = "secure_locked_commander"
	icon_closed = "secure_unlocked_commander"
	icon_locked = "secure_locked_commander"
	icon_opened = "secure_open_commander"
	icon_broken = "secure_locked_commander"
	icon_off = "secure_closed_commander"

/obj/structure/closet/secure_closet/sea/Initialize()
	. = ..()
	new /obj/item/device/whistle(src)
	new /obj/item/device/binoculars/range(src)
	new /obj/item/clothing/suit/armor/bulletproof/badge(src)
	new /obj/item/clothing/under/marine/officer/bridge(src)
	new /obj/item/clothing/shoes/dress(src)
	new /obj/item/storage/backpack/marine/satchel(src)

/obj/structure/closet/secure_closet/cmdcabinet
	name = "command tablet cabinet"
	desc = "A bulletproof cabinet containing the command tablet for usage by the CO and XO. Opens only to them and department heads."
	density = FALSE
	store_mobs = FALSE
	req_access = list(ACCESS_MARINE_SENIOR)
	icon_state = "secure_locked_cmdcabinet"
	icon_closed = "secure_unlocked_cmdcabinet"
	icon_locked = "secure_locked_cmdcabinet"
	icon_opened = "secure_open_cmdcabinet"
	icon_broken = "secure_locked_cmdcabinet"
	icon_off = "secure_unlocked_cmdcabinet"
	wall_mounted = TRUE


//MARINE SQUAD CLOSETS
/obj/structure/closet/secure_closet/squad
	name = "Squad Locker"
	req_access = list(ACCESS_MARINE_PREP)
	var/registered_name = null
	desc = "It's a secure locker for marine personnel to store their personal gear. The lock is paired to the first ID swiped to ensure privacy."
	icon = 'icons/obj/structures/marine_closet.dmi'
	icon_state = "squad_locked"
	icon_closed = "squad_unlocked"
	icon_locked = "squad_locked"
	icon_opened = "squad_open"
	icon_broken = "squad_broken"
	icon_off = "squad_off"

/obj/structure/closet/secure_closet/squad/attackby(obj/item/W as obj, mob/user as mob)
	if (src.opened)
		return ..()
	if(istype(W, /obj/item/card/id))
		if(src.broken)
			to_chat(user, SPAN_DANGER("It appears to be broken."))
			return
		var/obj/item/card/id/I = W
		if(!I || !I.registered_name) return
		if(src.allowed(user) || !src.registered_name || (istype(I) && (src.registered_name == I.registered_name)))
			//they can open all lockers, or nobody owns this, or they own this locker
			src.locked = !( src.locked )
			if(src.locked) src.icon_state = src.icon_locked
			else src.icon_state = src.icon_closed

			if(!src.registered_name)
				src.registered_name = I.registered_name
				src.desc = "The Nameplate says: [I.registered_name]."
		else
			to_chat(user, SPAN_DANGER("Access Denied"))
	else
		to_chat(user, SPAN_DANGER("Access Denied"))
	return

/obj/structure/closet/secure_closet/squad/verb/reset()
	set src in oview(1) // One square distance
	set category = "Object"
	set name = "Reset Lock"
	if(!usr.canmove || usr.stat || usr.is_mob_restrained()) // Don't use it if you're not able to! Checks for stuns, ghost and restrain
		return
	if(ishuman(usr))
		src.add_fingerprint(usr)
		if (src.locked || !src.registered_name)
			to_chat(usr, SPAN_DANGER("You need to unlock it first."))
		else if (src.broken)
			to_chat(usr, SPAN_DANGER("It appears to be broken."))
		else
			if (src.opened)
				if(!src.close())
					return
			src.locked = 1
			src.icon_state = src.icon_locked
			src.registered_name = null
			src.desc = "It's a secure locker for marine personnel to store their personal gear. The lock is paired to the first ID swiped to ensure privacy."
	return


//MARINE SQUAD CLOSET ALPHA
/obj/structure/closet/secure_closet/squad/alpha
	name = "ALPHA Squad Locker"
	req_access = list(ACCESS_MARINE_PREP)
	icon_state = "squad_alpha_locked"
	icon_closed = "squad_alpha_unlocked"
	icon_locked = "squad_alpha_locked"
	icon_opened = "squad_alpha_open"
	icon_broken = "squad_alpha_broken"
	icon_off = "squad_alpha_off"

/obj/structure/closet/secure_closet/squad/alpha/full/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/device/radio/headset/almayer/marine/cryo(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/head/helmet/marine(src)
	new /obj/item/clothing/suit/storage/marine/carrier(src)

//MARINE SQUAD CLOSET BRAVO
/obj/structure/closet/secure_closet/squad/bravo
	name = "BRAVO Squad Locker"
	req_access = list(ACCESS_MARINE_PREP)
	icon_state = "squad_bravo_locked"
	icon_closed = "squad_bravo_unlocked"
	icon_locked = "squad_bravo_locked"
	icon_opened = "squad_bravo_open"
	icon_broken = "squad_bravo_broken"
	icon_off = "squad_bravo_off"

/obj/structure/closet/secure_closet/squad/bravo/full/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/device/radio/headset/almayer/marine/cryo(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/head/helmet/marine(src)
	new /obj/item/clothing/suit/storage/marine/carrier(src)

//MARINE SQUAD CLOSET
/obj/structure/closet/secure_closet/squad/charlie
	name = "CHARLIE Squad Locker"
	req_access = list(ACCESS_MARINE_PREP)
	icon_state = "squad_charlie_locked"
	icon_closed = "squad_charlie_unlocked"
	icon_locked = "squad_charlie_locked"
	icon_opened = "squad_charlie_open"
	icon_broken = "squad_charlie_broken"
	icon_off = "squad_charlie_off"

/obj/structure/closet/secure_closet/squad/charlie/full/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/device/radio/headset/almayer/marine/cryo(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/head/helmet/marine(src)
	new /obj/item/clothing/suit/storage/marine/carrier(src)

//MARINE SQUAD CLOSET DELTA
/obj/structure/closet/secure_closet/squad/delta
	name = "DELTA Squad Locker"
	req_access = list(ACCESS_MARINE_PREP)
	icon_state = "squad_delta_locked"
	icon_closed = "squad_delta_unlocked"
	icon_locked = "squad_delta_locked"
	icon_opened = "squad_delta_open"
	icon_broken = "squad_delta_broken"
	icon_off = "squad_delta_off"

/obj/structure/closet/secure_closet/squad/delta/full/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/device/radio/headset/almayer/marine/cryo(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/head/helmet/marine(src)
	new /obj/item/clothing/suit/storage/marine/carrier(src)

//MARINE SQUAD CLOSET ECHO
/obj/structure/closet/secure_closet/squad/echo
	name = "ECHO Squad Locker"
	req_access = list(ACCESS_MARINE_PREP)
	icon_state = "squad_echo_locked"
	icon_closed = "squad_echo_unlocked"
	icon_locked = "squad_echo_locked"
	icon_opened = "squad_echo_open"
	icon_broken = "squad_echo_broken"
	icon_off = "squad_echo_off"

/obj/structure/closet/secure_closet/squad/echo/full/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/device/radio/headset/almayer/marine/cryo(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/head/helmet/marine(src)
	new /obj/item/clothing/suit/storage/marine/carrier(src)

//MARINE SQUAD CLOSET FOXTROT
/obj/structure/closet/secure_closet/squad/fox
	name = "FOXTROT Squad Locker"
	req_access = list(ACCESS_MARINE_PREP)
	icon_state = "squad_fox_locked"
	icon_closed = "squad_fox_unlocked"
	icon_locked = "squad_fox_locked"
	icon_opened = "squad_fox_open"
	icon_broken = "squad_fox_broken"
	icon_off = "squad_fox_off"

/obj/structure/closet/secure_closet/squad/fox/full/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/device/radio/headset/almayer/marine/cryo(src)
	new /obj/item/storage/backpack/marine/satchel(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/gloves/marine(src)
	new /obj/item/clothing/head/helmet/marine(src)
	new /obj/item/clothing/suit/storage/marine/carrier(src)
