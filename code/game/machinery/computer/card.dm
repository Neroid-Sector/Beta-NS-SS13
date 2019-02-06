//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

/obj/machinery/computer/card
	name = "Identification Computer"
	desc = "Terminal for programming USCM employee ID card access."
	icon_state = "id"
	req_access = list(ACCESS_MARINE_LOGISTICS)
	circuit = "/obj/item/circuitboard/computer/card"
	var/obj/item/card/id/scan = null
	var/obj/item/card/id/modify = null
	var/mode = 0.0
	var/printing = null

/obj/machinery/computer/card/proc/is_centcom()
	return 0

/obj/machinery/computer/card/proc/is_authenticated()
	return scan ? check_access(scan) : 0

/obj/machinery/computer/card/proc/get_target_rank()
	return modify && modify.assignment ? modify.assignment : "Unassigned"

/obj/machinery/computer/card/proc/format_jobs(list/jobs)
	var/list/formatted = list()
	for(var/job in jobs)
		formatted.Add(list(list(
			"display_name" = oldreplacetext(job, " ", "&nbsp"),
			"target_rank" = get_target_rank(),
			"job" = job)))

	return formatted

/obj/machinery/computer/card/verb/eject_id()
	set category = "Object"
	set name = "Eject ID Card"
	set src in oview(1)

	if(!usr || usr.stat || usr.lying)	return

	if(scan)
		usr << "You remove \the [scan] from \the [src]."
		scan.loc = get_turf(src)
		if(!usr.get_active_hand() && istype(usr,/mob/living/carbon/human))
			usr.put_in_hands(scan)
		scan = null
	else if(modify)
		usr << "You remove \the [modify] from \the [src]."
		modify.loc = get_turf(src)
		if(!usr.get_active_hand() && istype(usr,/mob/living/carbon/human))
			usr.put_in_hands(modify)
		modify = null
	else
		usr << "There is nothing to remove from the console."
	return

/obj/machinery/computer/card/attackby(obj/item/card/id/id_card, mob/user)
	if(!istype(id_card))
		return ..()

	if(!scan && ACCESS_MARINE_LOGISTICS in id_card.access)
		if(user.drop_held_item())
			id_card.forceMove(src)
			scan = id_card
	else if(!modify)
		if(user.drop_held_item())
			id_card.forceMove(src)
			modify = id_card

	nanomanager.update_uis(src)
	attack_hand(user)

/obj/machinery/computer/card/attack_ai(var/mob/user as mob)
	return attack_hand(user)

/obj/machinery/computer/card/attack_paw(var/mob/user as mob)
	return attack_hand(user)

/obj/machinery/computer/card/attack_hand(mob/user as mob)
	if(..()) return
	if(stat & (NOPOWER|BROKEN)) return
	ui_interact(user)

/obj/machinery/computer/card/ui_interact(mob/user, ui_key="main", var/datum/nanoui/ui = null, var/force_open = 1)

	user.set_interaction(src)

	var/data[0]
	data["src"] = "\ref[src]"
	data["station_name"] = station_name
	data["mode"] = mode
	data["printing"] = printing
	data["manifest"] = data_core ? data_core.get_manifest(0) : null
	data["target_name"] = modify ? modify.name : "-----"
	data["target_owner"] = modify && modify.registered_name ? modify.registered_name : "-----"
	data["target_rank"] = get_target_rank()
	data["scan_name"] = scan ? scan.name : "-----"
	data["authenticated"] = is_authenticated()
	data["has_modify"] = !!modify
	data["account_number"] = modify ? modify.associated_account_number : null
	data["centcom_access"] = is_centcom()
	data["all_centcom_access"] = null
	data["regions"] = null

	data["command_jobs"] = format_jobs(ROLES_COMMAND)
	data["engineering_jobs"] = format_jobs(ROLES_ENGINEERING)
	data["medical_jobs"] = format_jobs(ROLES_MEDICAL)
	data["marine_jobs"] = format_jobs(ROLES_UNASSIGNED)
	data["civilian_jobs"] = format_jobs(list("Colonist","Passenger"))
//	data["squad_jobs"] = format_jobs(all_squad_positions)
	data["centcom_jobs"] = format_jobs(get_all_centcom_jobs())

	if (modify && is_centcom())
		var/list/all_centcom_access = list()
		for(var/access in get_all_centcom_access())
			all_centcom_access.Add(list(list(
				"desc" = oldreplacetext(get_centcom_access_desc(access), " ", "&nbsp"),
				"ref" = access,
				"allowed" = (access in modify.access) ? 1 : 0)))

		data["all_centcom_access"] = all_centcom_access
	else if (modify)
		var/list/regions = list()
		for(var/i = 1; i <= 7; i++)
			var/list/accesses = list()
			for(var/access in get_region_accesses(i))
				if (get_access_desc(access))
					accesses.Add(list(list(
						"desc" = oldreplacetext(get_access_desc(access), " ", "&nbsp"),
						"ref" = access,
						"allowed" = (access in modify.access) ? 1 : 0)))

			regions.Add(list(list(
				"name" = get_region_accesses_name(i),
				"accesses" = accesses)))

		data["regions"] = regions

	ui = nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "identification_computer.tmpl", src.name, 600, 700)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/computer/card/Topic(href, href_list)
	if(..())
		return 1

	switch(href_list["choice"])
		if ("modify")
			if (modify)
				data_core.manifest_modify(modify.registered_name, modify.assignment, modify.rank)
				modify.name = text("[modify.registered_name]'s ID Card ([modify.assignment])")
				if(ishuman(usr))
					modify.loc = usr.loc
					if(!usr.get_active_hand())
						usr.put_in_hands(modify)
					modify = null
				else
					modify.loc = loc
					modify = null
			else
				var/obj/item/I = usr.get_active_hand()
				if (istype(I, /obj/item/card/id))
					if(usr.drop_held_item())
						I.forceMove(src)
						modify = I

		if ("scan")
			if (scan)
				if(ishuman(usr))
					scan.loc = usr.loc
					if(!usr.get_active_hand())
						usr.put_in_hands(scan)
					scan = null
				else
					scan.loc = src.loc
					scan = null
			else
				var/obj/item/I = usr.get_active_hand()
				if (istype(I, /obj/item/card/id))
					if(usr.drop_held_item())
						I.forceMove(src)
						scan = I

		if("access")
			if(href_list["allowed"])
				if(is_authenticated())
					var/access_type = text2num(href_list["access_target"])
					var/access_allowed = text2num(href_list["allowed"])
					if(access_type in (is_centcom() ? get_all_centcom_access() : get_all_accesses()))
						modify.access -= access_type
						if(!access_allowed)
							modify.access += access_type

		if ("assign")
			if (is_authenticated() && modify)
				var/t1 = href_list["assign_target"]
				if(t1 == "Custom")
					var/temp_t = copytext(sanitize(input("Enter a custom job assignment.","Assignment")),1,45)
					//let custom jobs function as an impromptu alt title, mainly for sechuds
					if(temp_t && modify)
						modify.assignment = temp_t
						message_admins("[key_name_admin(usr)] gave the ID of [modify.registered_name] the assignment [modify.assignment].")
						log_admin("[key_name_admin(usr)] gave the ID of [modify.registered_name] the assignment [modify.assignment].")
				else
					var/list/access = list()
					if(is_centcom())
						access = get_centcom_access(t1)
					else
						var/datum/job/jobdatum
						for(var/jobtype in typesof(/datum/job))
							var/datum/job/J = new jobtype
							if(ckey(J.title) == ckey(t1))
								jobdatum = J
								break
						if(!jobdatum)
							usr << "\red No log exists for this job: [t1]"
							return

						access = jobdatum.get_access()

					modify.access = access
					modify.assignment = t1
					modify.rank = t1
					message_admins("[key_name_admin(usr)] gave the ID of [modify.registered_name] the assignment [modify.assignment].")
					log_admin("[key_name_admin(usr)] gave the ID of [modify.registered_name] the assignment [modify.assignment].")

				callHook("reassign_employee", list(modify))

		if ("reg")
			if (is_authenticated())
				var/t2 = modify
				if ((modify == t2 && (in_range(src, usr) || (ishighersilicon(usr))) && istype(loc, /turf)))
					var/temp_name = reject_bad_name(href_list["reg"])
					if(temp_name)
						modify.registered_name = temp_name
					else
						src.visible_message("<span class='notice'>[src] buzzes rudely.</span>")
			nanomanager.update_uis(src)

		if ("account")
			if (is_authenticated())
				var/t2 = modify
				if ((modify == t2 && (in_range(src, usr) || (ishighersilicon(usr))) && istype(loc, /turf)))
					var/account_num = text2num(href_list["account"])
					modify.associated_account_number = account_num
			nanomanager.update_uis(src)

		if ("mode")
			mode = text2num(href_list["mode_target"])

		if ("print")
			if (!printing)
				printing = 1
				spawn(50)
					printing = null
					nanomanager.update_uis(src)

					var/obj/item/paper/P = new(loc)
					if (mode)
						P.name = text("crew manifest ([])", worldtime2text())
						P.info = {"<h4>Crew Manifest</h4>
							<br>
							[data_core ? data_core.get_manifest(0) : ""]
						"}
					else if (modify)
						P.name = "access report"
						P.info = {"<h4>Access Report</h4>
							<u>Prepared By:</u> [scan.registered_name ? scan.registered_name : "Unknown"]<br>
							<u>For:</u> [modify.registered_name ? modify.registered_name : "Unregistered"]<br>
							<hr>
							<u>Assignment:</u> [modify.assignment]<br>
							<u>Account Number:</u> #[modify.associated_account_number]<br>
							<u>Blood Type:</u> [modify.blood_type]<br><br>
							<u>Access:</u><br>
						"}

						for(var/A in modify.access)
							P.info += "  [get_access_desc(A)]"

		if ("terminate")
			if (is_authenticated())
				modify.assignment = "Terminated"
				modify.access = list()
				message_admins("[key_name_admin(usr)] terminated the ID of [modify.registered_name].")
				log_admin("[key_name_admin(usr)] terminated the ID of [modify.registered_name].")

				callHook("terminate_employee", list(modify))

	if (modify)
		modify.name = text("[modify.registered_name]'s ID Card ([modify.assignment])")

	return 1

/obj/machinery/computer/card/centcom
	name = "CentCom Identification Computer"
	circuit = "/obj/item/circuitboard/computer/card/centcom"
	req_access = list(ACCESS_WY_CORPORATE)


/obj/machinery/computer/card/centcom/is_centcom()
	return 1
