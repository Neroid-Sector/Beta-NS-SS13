//TWE AUTO RACKS
/obj/item/reqcard/twe
	name = "TWE naval budget authorization card"
	color = "blue"

/obj/structure/machinery/auto_rack/twe
	budget_card = /obj/item/reqcard/twe

//SA80

/obj/structure/machinery/auto_rack/twe/sa80/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the sa80 Pulse Rifle."
	icon_state = "sa80rack"
	stocked_weapon = /obj/item/weapon/gun/rifle/sa80
	restock_type = /obj/item/weapon/gun/rifle/sa80

/obj/structure/machinery/auto_rack/twe/sa80/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the sa80 Pulse Rifle."
	icon_state = "sa80rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/sa80
	restock_type = /obj/item/weapon/gun/rifle/sa80

/obj/structure/machinery/auto_rack/twe/sa80/full/ugl
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the sa80 Pulse Rifle."
	icon_state = "sa80rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/sa80/ugl
	restock_type = /obj/item/weapon/gun/rifle/sa80/ugl

/obj/structure/machinery/auto_rack/twe/sa80/full/rfm
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the sa80 Pulse Rifle."
	icon_state = "sa80rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/sa80/rifleman
	restock_type = /obj/item/weapon/gun/rifle/sa80/rifleman
