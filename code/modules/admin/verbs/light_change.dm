/client/proc/change_lighting()
	set name = "Set Daylight"
	set category = "Admin.Events"

	if(!check_rights(R_ADMIN))
		return
	var/list/lightturfs
	var/light_str = input(usr, "Set the light power.", "Daytime Brightness", "0.3") as null|num
	var/daytime_color = input(usr, "Please select the color to use.", "Daytime Color") as color|null
	var/confirm = tgui_alert(usr, "Are you sure you wish to change daytime on the map to this settings?, THIS WILL LAG, and may take some time to update all tiles.", "Confirm", list("Yes", "No"), 1 HOURS)
	if(confirm != "Yes")
		return FALSE
	message_admins("[key_name(usr)] changed lighting on map to [daytime_color] color with [light_str].")
	lightturfs = block(locate(world.maxx, world.maxy, 5), locate(1, 1, 2))
	for(var/atom/A as anything in lightturfs)
		if(istype(A.loc,/area/))
			var/area/targeted = A.loc
			if(!targeted.daytime_affected)
				lightturfs -= A
	for(var/turf/T as anything in lightturfs)
		T.set_light(1, light_str, l_color = daytime_color)
