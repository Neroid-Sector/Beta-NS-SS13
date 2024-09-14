/obj/item/mortar_shell
	name = "\improper 80mm mortar shell"
	desc = "An unlabeled 80mm mortar shell, probably a casing."
	icon = 'icons/obj/structures/mortar.dmi'
	icon_state = "mortar_ammo_cas"
	w_class = SIZE_HUGE
	flags_atom = FPRINT|CONDUCT
	var/datum/cause_data/cause_data
	ground_offset_x = 7
	ground_offset_y = 6

/// is it currently on fire and about to explode?
	var/burning = FALSE

/obj/item/mortar_shell/Destroy()
	. = ..()
	cause_data = null

/obj/item/mortar_shell/proc/detonate(turf/T)
	forceMove(T)

/obj/item/mortar_shell/proc/deploy_camera(turf/T)
	var/obj/structure/machinery/camera/mortar/old_cam = locate() in T
	if(old_cam)
		qdel(old_cam)
	new /obj/structure/machinery/camera/mortar(T)

/obj/item/mortar_shell/he
	name = "\improper 80mm high explosive mortar shell"
	desc = "An 80mm mortar shell, loaded with a high explosive charge."
	icon_state = "mortar_ammo_he"

/obj/item/mortar_shell/he/detonate(turf/T)
	explosion(T, 0, 3, 5, 7, explosion_cause_data = cause_data)

/obj/item/mortar_shell/frag
	name = "\improper 80mm fragmentation mortar shell"
	desc = "An 80mm mortar shell, loaded with a fragmentation charge."
	icon_state = "mortar_ammo_frag"

/obj/item/mortar_shell/frag/detonate(turf/T)
	create_shrapnel(T, 60, cause_data = cause_data)
	sleep(1)
	cell_explosion(T, 60, 200, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)

/obj/item/mortar_shell/incendiary
	name = "\improper 80mm incendiary mortar shell"
	desc = "An 80mm mortar shell, loaded with a Type B napalm charge. Perfect for long-range area denial."
	icon_state = "mortar_ammo_inc"
	var/radius = 7
	var/flame_level = BURN_TIME_TIER_5 + 5 //Type B standard, 50 base + 5 from chemfire code.
	var/burn_level = BURN_LEVEL_TIER_2
	var/flameshape = FLAMESHAPE_DEFAULT
	var/fire_type = FIRE_VARIANT_TYPE_B //Armor Shredding Greenfire

/obj/item/mortar_shell/incendiary/detonate(turf/T)
	explosion(T, 0, 2, 4, 7, explosion_cause_data = cause_data)
	flame_radius(cause_data, radius, T, flame_level, burn_level, flameshape, null, fire_type)
	playsound(T, 'sound/weapons/gun_flamethrower2.ogg', 35, 1, 4)

/obj/item/mortar_shell/shaped
	name = "\improper 80mm incendiary shaped blast mortar shell"
	desc = "An 80mm mortar shell, loaded with a Shaped napalm charge. Perfect for clearing large areas and trenches."
	icon_state = "mortar_ammo_shaped"
	var/radius = 7
	var/flame_level = BURN_TIME_TIER_1
	var/burn_level = BURN_LEVEL_TIER_9
	var/flameshape = FLAMESHAPE_STAR
	var/fire_type = FIRE_VARIANT_DEFAULT

/obj/item/mortar_shell/shaped/detonate(turf/T)
	explosion(T, 0, 2, 4, 7, explosion_cause_data = cause_data)
	flame_radius(cause_data, radius, T, flame_level, burn_level, flameshape, null, fire_type)
	playsound(T, 'sound/weapons/gun_flamethrower2.ogg', 35, 1, 4)


/obj/item/mortar_shell/wp
	name = "\improper 80mm White Phosphorus mortar shell"
	desc = "An 80mm mortar shell, loaded with a Willey Pete charge. Perfect for long-range area denial."
	icon_state = "mortar_ammo_wp"
	var/radius = 6
	var/flame_level = BURN_TIME_TIER_4
	var/burn_level = BURN_LEVEL_TIER_7
	var/flameshape = FLAMESHAPE_DEFAULT
	var/fire_type = FIRE_VARIANT_DEFAULT

/obj/item/mortar_shell/wp/detonate(turf/T)
	explosion(T, 0, 2, 4, 7, explosion_cause_data = cause_data)
	sleep(2)
	new /obj/item/explosive/grenade/phosphorus/primed(T)
	flame_radius(cause_data, radius, T, flame_level, burn_level, flameshape, null, fire_type)

/obj/item/mortar_shell/flare
	name = "\improper 80mm flare/camera mortar shell"
	desc = "An 80mm mortar shell, loaded with an illumination flare / camera combo, attached to a parachute."
	icon_state = "mortar_ammo_flr"

/obj/item/mortar_shell/flare/detonate(turf/T)
	new /obj/item/device/flashlight/flare/on/illumination(T)
	playsound(T, 'sound/weapons/gun_flare.ogg', 50, 1, 4)
	deploy_camera(T)

/obj/item/mortar_shell/flash
	name = "\improper 80mm Nova-Flash Starburst mortar shell"
	desc = "An 80mm mortar shell, loaded with a blinding phosphorus charge, that explodes extra loudly. Best used on rioters."
	icon_state = "mortar_ammo_fsh"
	var/strength = 50
	var/no_damage = FALSE

/obj/item/mortar_shell/flash/detonate(turf/T)
	explosion(T, 0, 0, 0.1, 1, explosion_cause_data = cause_data)

	for(var/obj/structure/closet/L in hear(14, T))
		SEND_SIGNAL(L, COMSIG_CLOSET_FLASHBANGED, src)

	for(var/mob/living/carbon/M in hear(14, T))
		bang(T, M)

	playsound(src.loc, 'sound/effects/bang.ogg', 250, 1)

	new/obj/effect/particle_effect/smoke/flashbang(T)
	qdel(src)
	return

/obj/item/mortar_shell/flash/proc/bang(turf/T , mob/living/carbon/M)

	if(isxeno(M))
		return

	to_chat(M, SPAN_WARNING("<B>BANG</B>"))

	for(var/obj/item/device/chameleon/S in M)
		S.disrupt(M)

	var/trained_human = FALSE
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(skillcheck(H, SKILL_POLICE, SKILL_POLICE_SKILLED))
			trained_human = TRUE

		var/list/protections = list(H.glasses, H.wear_mask, H.head)
		var/total_eye_protection = 0

		for(var/obj/item/clothing/C in protections)
			if(C && (C.flags_armor_protection & BODY_FLAG_EYES))
				total_eye_protection += C.armor_energy

		if(total_eye_protection >= strength)
			to_chat(M, SPAN_HELPFUL("Your gear protects you from \the [src]."))
			return

	var/weaken_amount
	var/paralyze_amount
	var/deafen_amount

	if(M.flash_eyes())
		weaken_amount += 2
		paralyze_amount += 10

	if((get_dist(M, T) <= 2 || src.loc == M.loc || src.loc == M))
		if(trained_human)
			weaken_amount += 2
			paralyze_amount += 1
		else
			weaken_amount += 10
			paralyze_amount += 3
			deafen_amount += 15
			if(!no_damage)
				if((prob(14) || (M == src.loc && prob(70))))
					M.ear_damage += rand(1, 10)
				else
					M.ear_damage += rand(0, 5)

	else if(get_dist(M, T) <= 5)
		if(!trained_human)
			weaken_amount += 8
			deafen_amount += 10
			if(!no_damage)
				M.ear_damage += rand(0, 3)

	else if(!trained_human)
		weaken_amount += 4
		deafen_amount += 5
		if(!no_damage)
			M.ear_damage += rand(0, 1)

	if(HAS_TRAIT(M, TRAIT_EAR_PROTECTION))
		weaken_amount *= 0.85
		paralyze_amount *= 0.85
		deafen_amount = 0
		to_chat(M, SPAN_HELPFUL("Your gear protects you from the worst of the 'bang'."))

	M.apply_effect(weaken_amount, WEAKEN)
	M.apply_effect(paralyze_amount, PARALYZE)
	if(deafen_amount)
		M.SetEarDeafness(max(M.ear_deaf, deafen_amount))

//This really should be in mob not every check
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/datum/internal_organ/eyes/E = H.internal_organs_by_name["eyes"]
		if (E && E.damage >= E.min_bruised_damage)
			to_chat(M, SPAN_WARNING("Your eyes start to burn badly!"))
			if(!no_damage)
				if (E.damage >= E.min_broken_damage)
					to_chat(M, SPAN_WARNING("You can't see anything!"))
	if (M.ear_damage >= 15)
		to_chat(M, SPAN_WARNING("Your ears start to ring badly!"))
		if(!no_damage)
			if (prob(M.ear_damage - 10 + 5))
				to_chat(M, SPAN_WARNING("You can't hear anything!"))
				M.sdisabilities |= DISABILITY_DEAF
	else
		if (M.ear_damage >= 5)
			to_chat(M, SPAN_WARNING("Your ears start to ring!"))

/obj/item/mortar_shell/airburst
	name = "\improper 80mm air-burst mortar shell"
	desc = "An 80mm mortar shell, loaded with a cluster charge."
	icon_state = "mortar_ammo_air"
	var/total_amount = 10 // how many times will the shell fire?
	var/instant_amount = 2 // how many explosions per time it fires?
	var/delay_between_clusters = 0.4 SECONDS // how long between each firing?

/obj/item/mortar_shell/airburst/proc/start_cluster(turf/target)
	set waitfor = 0

	var/range_num = 7
	var/list/turf_list = list()

	for(var/turf/T in range(range_num, target))
		turf_list += T

	for(var/i = 1 to total_amount)
		for(var/k = 1 to instant_amount)
			var/turf/selected_turf = pick(turf_list)
			if(protected_by_pylon(TURF_PROTECTION_MORTAR, selected_turf))
				continue
			var/area/selected_area = get_area(selected_turf)
			if(CEILING_IS_PROTECTED(selected_area?.ceiling, CEILING_PROTECTION_TIER_2))
				continue
			fire_in_a_hole(selected_turf)

		sleep(delay_between_clusters)
	QDEL_IN(src, 5 SECONDS)

/obj/item/mortar_shell/airburst/proc/fire_in_a_hole(turf/T)
	explosion(T, 0, 0.05, 0.1, 2, explosion_cause_data = cause_data)

/obj/item/mortar_shell/airburst/detonate(turf/T)
	playsound(T, 'sound/effects/spike_spray.ogg', 50, 1, 4)
	sleep(5)
	start_cluster(T)

//---Gas Shells---\\

/obj/item/mortar_shell/gas
	name = "\improper (DEV USE ONLY!)"
	desc = "If you're seeing this something has gone wrong"
	icon_state = "mortar_ammo_gas"

/obj/item/mortar_shell/chlorine
	name = "\improper 80mm chlorine gas mortar shell"
	desc = "An 80mm mortar shell, loaded with a chlorine gas canister."
	icon_state = "mortar_ammo_gas"

/obj/item/mortar_shell/chlorine/detonate(turf/T)
	explosion(T, 0, 0, 0.05, 7, explosion_cause_data = cause_data)
	sleep(1)
	new /obj/item/explosive/grenade/chlorine_gas/primed(T)

/obj/item/mortar_shell/smoke
	name = "\improper 80mm smoke mortar shell"
	desc = "An 80mm mortar shell, loaded with a smoke charge."
	icon_state = "mortar_ammo_smk"

/obj/item/mortar_shell/smoke/detonate(turf/T)
	explosion(T, 0, 0, 0.05, 7, explosion_cause_data = cause_data)
	new /obj/item/explosive/grenade/smokebomb/primed(T)

/obj/item/mortar_shell/cn20
	name = "\improper 80mm cn20 mortar shell"
	desc = "An 80mm mortar shell, loaded with a cn20 nerve gas canister."
	icon_state = "mortar_ammo_cn20"

/obj/item/mortar_shell/cn20/detonate(turf/T)
	explosion(T, 0, 0, 0.05, 7, explosion_cause_data = cause_data)
	new /obj/item/explosive/grenade/nerve_gas/primed(T)


/obj/item/mortar_shell/mustard
	name = "\improper 80mm mustard gas mortar shell"
	desc = "An 80mm mortar shell, loaded with a mustard gas canister."
	icon_state = "mortar_ammo_must"

/obj/item/mortar_shell/mustard/detonate(turf/T)
	explosion(T, 0, 0, 0.05, 7, explosion_cause_data = cause_data)
	new /obj/item/explosive/grenade/mustard_gas/primed(T)


//===other-stuff===\\

/obj/item/mortar_shell/custom
	name = "\improper 80mm custom mortar shell"
	desc = "An 80mm mortar shell."
	icon_state = "mortar_ammo_custom"
	matter = list("metal" = 18750) //5 sheets
	var/obj/item/explosive/warhead/mortar/warhead
	var/obj/item/reagent_container/glass/fuel
	var/fuel_requirement = 60
	var/fuel_type = "hydrogen"
	var/locked = FALSE

/obj/item/mortar_shell/custom/get_examine_text(mob/user)
	. = ..()
	if(fuel)
		. += SPAN_NOTICE("Contains fuel.")
	if(warhead)
		. += SPAN_NOTICE("Contains a warhead[warhead.has_camera ? " with integrated camera drone." : ""].")

/obj/item/mortar_shell/custom/detonate(turf/T)
	if(fuel)
		var/fuel_amount = fuel.reagents.get_reagent_amount(fuel_type)
		if(fuel_amount >= fuel_requirement)
			forceMove(T)
			if(warhead?.has_camera)
				deploy_camera(T)
	if(warhead && locked && warhead.detonator)
		warhead.cause_data = cause_data
		warhead.prime()

/obj/item/mortar_shell/custom/attack_self(mob/user)
	..()

	if(locked)
		return

	if(warhead)
		user.put_in_hands(warhead)
		warhead = null
	else if(fuel)
		user.put_in_hands(fuel)
		fuel = null
	icon_state = initial(icon_state)

/obj/item/mortar_shell/custom/attackby(obj/item/W as obj, mob/user)
	if(!skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
		to_chat(user, SPAN_WARNING("You do not know how to tinker with [name]."))
		return
	if(HAS_TRAIT(W, TRAIT_TOOL_SCREWDRIVER))
		if(!warhead)
			to_chat(user, SPAN_NOTICE("[name] must contain a warhead to do that!"))
			return
		if(locked)
			to_chat(user, SPAN_NOTICE("You unlock [name]."))
			icon_state = initial(icon_state) +"_unlocked"
		else
			to_chat(user, SPAN_NOTICE("You lock [name]."))
			if(fuel && fuel.reagents.get_reagent_amount(fuel_type) >= fuel_requirement)
				icon_state = initial(icon_state) +"_locked"
			else
				icon_state = initial(icon_state) +"_no_fuel"
		locked = !locked
		playsound(loc, 'sound/items/Screwdriver.ogg', 25, 0, 6)
		return
	else if(istype(W,/obj/item/reagent_container/glass) && !locked)
		if(fuel)
			to_chat(user, SPAN_DANGER("The [name] already has a fuel container!"))
			return
		else
			user.temp_drop_inv_item(W)
			W.forceMove(src)
			fuel = W
			to_chat(user, SPAN_DANGER("You add [W] to [name]."))
			playsound(loc, 'sound/items/Screwdriver2.ogg', 25, 0, 6)
	else if(istype(W,/obj/item/explosive/warhead/mortar) && !locked)
		if(warhead)
			to_chat(user, SPAN_DANGER("The [name] already has a warhead!"))
			return
		var/obj/item/explosive/warhead/mortar/det = W
		if(det.assembly_stage < ASSEMBLY_LOCKED)
			to_chat(user, SPAN_DANGER("The [W] is not secured!"))
			return
		user.temp_drop_inv_item(W)
		W.forceMove(src)
		warhead = W
		to_chat(user, SPAN_DANGER("You add [W] to [name]."))
		icon_state = initial(icon_state) +"_unlocked"
		playsound(loc, 'sound/items/Screwdriver2.ogg', 25, 0, 6)

/obj/item/mortar_shell/ex_act(severity, explosion_direction)
	if(!burning)
		return ..()

/obj/item/mortar_shell/attack_hand(mob/user)
	if(burning)
		to_chat(user, SPAN_DANGER("[src] is on fire and might explode!"))
		return
	return ..()

/obj/item/mortar_shell/flamer_fire_act(dam, datum/cause_data/flame_cause_data)
	if(burning)
		return
	burning = TRUE
	cause_data = create_cause_data("Burning Mortar Shell", flame_cause_data.resolve_mob(), src)
	handle_fire()

/obj/item/mortar_shell/proc/handle_fire()
	visible_message(SPAN_WARNING("[src] catches on fire and starts cooking off! It's gonna blow!"))
	anchored = TRUE // don't want other explosions launching it elsewhere

	var/datum/effect_system/spark_spread/sparks = new()
	sparks.set_up(n = 10, loca = loc)
	sparks.start()
	new /obj/effect/warning/explosive(loc, 5 SECONDS)

	addtimer(CALLBACK(src, PROC_REF(detonate), loc), 5 SECONDS)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), (src)), 5.5 SECONDS)



//--------Crates---------//

/obj/structure/closet/crate/secure/mortar_ammo
	name = "\improper M402 mortar ammo crate"
	desc = "A crate containing live mortar shells with various payloads. DO NOT DROP. KEEP AWAY FROM FIRE SOURCES."
	icon = 'icons/obj/structures/mortar.dmi'
	icon_state = "secure_locked_mortar"
	icon_opened = "secure_open_mortar"
	icon_locked = "secure_locked_mortar"
	icon_unlocked = "secure_unlocked_mortar"
	req_one_access = list(ACCESS_MARINE_OT, ACCESS_MARINE_CARGO, ACCESS_MARINE_ENGPREP)

/obj/structure/closet/crate/secure/mortar_ammo/full/Initialize()
	. = ..()
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/incendiary(src)
	new /obj/item/mortar_shell/incendiary(src)
	new /obj/item/mortar_shell/incendiary(src)
	new /obj/item/mortar_shell/incendiary(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)

/obj/structure/closet/crate/secure/mortar_ammo/mortar_kit
	name = "\improper M402 mortar kit"
	desc = "A crate containing a basic set of a mortar and some shells, to get an engineer started."
	var/jtac_key_type = /obj/item/device/encryptionkey/jtac

/obj/structure/closet/crate/secure/mortar_ammo/mortar_kit/Initialize()
	. = ..()
	new /obj/item/mortar_kit(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/incendiary(src)
	new /obj/item/mortar_shell/incendiary(src)
	new /obj/item/mortar_shell/incendiary(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/device/encryptionkey/engi(src)
	new /obj/item/device/encryptionkey/engi(src)
	new jtac_key_type(src)
	new jtac_key_type(src)
	new /obj/item/device/binoculars/range(src)
	new /obj/item/device/binoculars/range(src)

/obj/structure/closet/crate/secure/mortar_ammo/mortar_kit/hvh
	jtac_key_type = /obj/item/device/encryptionkey/upp/engi

/obj/structure/closet/crate/secure/mortar_ammo/mortar_kit/hvh/pmc
	jtac_key_type = /obj/item/device/encryptionkey/pmc/engi

/obj/structure/closet/crate/secure/mortar_ammo/mortar_kit/hvh/clf
	jtac_key_type = /obj/item/device/encryptionkey/clf/engi
