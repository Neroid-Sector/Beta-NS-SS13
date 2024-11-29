/client/proc/adminpanelstgweapons()
	set name = "Space to Ground Weapons"
	set category = "Admin.Ship"

	var/weapontype = tgui_input_list(src, "What weapon?", "Choose wisely!", list("Space-To-Ground Missile", "Railgun"), 20 SECONDS)
	if(!weapontype)
		return

	var/hiteta = tgui_input_number(src, "Give an ETA for the weapon to hit.", "Death from above!", 10, 120, 10, 20 SECONDS)
	if(!hiteta)
		return

	var/prompt = tgui_alert(src, "Are you sure you want to open fire towards your current location?", "Beware the 'Good hits' !", list("Yes", "No"), 20 SECONDS)
	if(prompt != "Yes")
		return

	message_admins("[key_name_admin(src)] fired a [weapontype] unto a target as bombardment.")
	if(weapontype == "Space-To-Ground Missile")
		marine_announcement("ATTENTION: SOLUTION RECEIVED. DISPENSING SPACE TO GROUND MISSILE AGAINST GPS TARGET. ETA: [hiteta] SECONDS.", "AUTOMATED FIRING CONTROL", 'sound/effects/missile_warning.ogg', FACTION_MARINE)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(stgweaponhits), 1, mob.loc), hiteta SECONDS)
	if(weapontype == "Railgun")
		marine_announcement("ATTENTION: EO TRACKS CORRELATED, SOLUTION FOUND. DISPENSING RAILGUN ROUND TOWARDS AO. ETA: [hiteta] SECONDS.", "AUTOMATED FIRING CONTROL", 'sound/effects/missile_warning.ogg', FACTION_MARINE)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(stgweaponhits), 2, mob.loc), hiteta SECONDS)
