/obj/structure/sign/double/barsign
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "empty"
	anchored = TRUE

/obj/structure/sign/double/barsign/New()
	..()
	ChangeSign(pick("pinkflamingo", "magmasea", "limbo", "rustyaxe", "armokbar", "brokendrum", "meadbay", "thedamnwall", "thecavern", "cindikate", "theorchard", "thesaucyclown", "theclownshead", "whiskeyimplant", "carpecarp", "robustroadhouse", "greytide", "theredshirt"))
	return

/obj/structure/sign/double/barsign/proc/ChangeSign(Text)
	src.icon_state = "[Text]"
	//on = 0
	//brightness_on = 4 //uncomment these when the lighting fixes get in
	return

/obj/structure/sign/double/barsign/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/card = I
		if(ACCESS_CIVILIAN_PUBLIC in card.GetAccess())
			var/sign_type = tgui_input_list(user, "What would you like to change the barsign to?", "Bar Sign", list("Off", "Pink Flamingo", "Magma Sea", "Limbo", "Rusty Axe", "Armok Bar", "Broken Drum", "Mead Bay", "The Damn Wall", "The Cavern", "Cindi Kate", "The Orchard", "The Saucy Clown", "The Clowns Head", "Whiskey Implant", "Carpe Carp", "Robust Roadhouse", "Greytide", "The Redshirt"))
			if(sign_type == null)
				return
			else
				sign_type = replacetext(lowertext(sign_type), " ", "") // lowercase, strip spaces - along with choices for user options, avoids huge if-else-else
				src.ChangeSign(sign_type)
				to_chat(user, "You change the barsign.")

//----------corp signs----------//

/obj/structure/sign/double/corpsign
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "empty"
	anchored = TRUE

/obj/structure/sign/double/corpsign/New()
	..()
	ChangeSign(pick("walmart", "kb", "pinkerton", "nanotrasen", "kelland", "seegson", "weyyu", "wy", "hyperdyne", "silver", "vaipo"))
	return

/obj/structure/sign/double/corpsign/proc/ChangeSign(Text)
	src.icon_state = "[Text]"
	//on = 0
	//brightness_on = 4 //uncomment these when the lighting fixes get in
	return

/obj/structure/sign/double/corpsign/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/card = I
		if(ACCESS_CIVILIAN_PUBLIC in card.GetAccess())
			var/sign_type = tgui_input_list(user, "What would you like to change the sign to?", "Bar Sign", list("walmart", "kb", "pinkerton", "nanotrasen", "kelland", "seegson", "weyyu", "wy", "hyperdyne", "silver", "vaipo"))
			if(sign_type == null)
				return
			else
				sign_type = replacetext(lowertext(sign_type), " ", "") // lowercase, strip spaces - along with choices for user options, avoids huge if-else-else
				src.ChangeSign(sign_type)
				to_chat(user, "You change the sign.")


/obj/structure/sign/double/norandom
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "meadbay"
	anchored = TRUE

/obj/structure/sign/double/norandom/proc/ChangeSign(Text)
	src.icon_state = "[Text]"
	//on = 0
	//brightness_on = 4 //uncomment these when the lighting fixes get in
	return

/obj/structure/sign/double/norandom/walmart
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "walmart"
	anchored = TRUE

/obj/structure/sign/double/norandom/kelland
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "kelland"
	anchored = TRUE

/obj/structure/sign/double/norandom/seegson
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "seegson"
	anchored = TRUE

/obj/structure/sign/double/norandom/weyyu
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "weyyu"
	anchored = TRUE

/obj/structure/sign/double/norandom/wy
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "wy"
	anchored = TRUE

/obj/structure/sign/double/norandom/kb
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "kb"
	anchored = TRUE

/obj/structure/sign/double/norandom/hyperdyne
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "hyperdyne"
	anchored = TRUE

/obj/structure/sign/double/norandom/nanotrasen
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "nanotrasen"
	anchored = TRUE

/obj/structure/sign/double/norandom/pinkerton
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "pinkerton"
	anchored = TRUE

/obj/structure/sign/double/norandom/vaipo
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "vaipo"
	anchored = TRUE

/obj/structure/sign/double/norandom/silver
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "silver"
	anchored = TRUE

/obj/structure/sign/double/norandom/shi
	icon = 'icons/obj/structures/props/barsigns.dmi'
	icon_state = "shi"
	anchored = TRUE
