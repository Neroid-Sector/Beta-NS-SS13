/datum/map_template/interior
	name = "Base Interior Template"
	var/prefix = "maps/interiors/"
	var/interior_id = "SHOULD NEVER EXIST"


/datum/map_template/interior/New()
	if(interior_id == "SHOULD NEVER EXIST")
		stack_trace("invalid interior datum")
	mappath = "[prefix][interior_id].dmm"
	return ..()

// Military Interiors

/datum/map_template/interior/apc
	name = "APC"
	interior_id = "apc"

/datum/map_template/interior/apc_command
	name = "Command APC"
	interior_id = "apc_command"

/datum/map_template/interior/apc_med
	name = "Med APC"
	interior_id = "apc_med"

/datum/map_template/interior/apc_no_fpw
	name = "APC - No FPW"
	interior_id = "apc_no_fpw"

/datum/map_template/interior/tank
	name = "Tank"
	interior_id = "tank"

/datum/map_template/interior/aev
	name = "AEV"
	interior_id = "aev"

/datum/map_template/interior/bmp
	name = "bmp"
	interior_id = "bmp"

/datum/map_template/interior/jeep
	name = "jeep"
	interior_id = "jeep"

/datum/map_template/interior/jeep_cmd
	name = "jeep_cmd"
	interior_id = "jeep_cmd"

/datum/map_template/interior/jeep_pass
	name = "jeep_pass"
	interior_id = "jeep_pass"

// Civilian Interiors

/datum/map_template/interior/atruck
	name = "Atruck"
	interior_id = "atruck"

/datum/map_template/interior/atruck_cmb
	name = "CMB Atruck"
	interior_id = "atruck_cmb"

/datum/map_template/interior/atruck_med
	name = "med atruck"
	interior_id = "atruck_med"

/datum/map_template/interior/van
	name = "Van"
	interior_id = "van"

/datum/map_template/interior/truck
	name = "Truck"
	interior_id = "truck"

/datum/map_template/interior/minitruck
	name = "Mini-Truck"
	interior_id = "minitruck"

/datum/map_template/interior/crane
	name = "Crane"
	interior_id = "crane"

/datum/map_template/interior/civvan
	name = "CivvVan"
	interior_id = "civvan"

/datum/map_template/interior/civtruck
	name = "Civtruck"
	interior_id = "civtruck"

// Other

/datum/map_template/interior/fancy_locker
	name = "Fancy Locker"
	interior_id = "fancylocker"
