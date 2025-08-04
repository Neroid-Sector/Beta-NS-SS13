/obj/structure/tanktrap
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures/props/fences/fence.dmi'
	icon_state = "fence0"
	throwpass = TRUE
	density = TRUE
	anchored = TRUE
	layer = WINDOW_LAYER
	flags_atom = FPRINT
	health = 50
	minimap_color = MINIMAP_FENCE
	var/health_max = 50
	var/cut = 0 //Cut fences can be passed through
	var/junction = 0 //Because everything is terrible, I'm making this a fence-level var
	var/basestate = "fence"
	var/forms_junctions = TRUE

/obj/structure/tanktrap/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = PASS_THROUGH|PASS_HIGH_OVER_ONLY

//create_debris creates debris like shards and rods. This also includes the window frame for explosions
//If an user is passed, it will create a "user smashes through the window" message. AM is the item that hits
//Please only fire this after a hit
/obj/structure/tanktrap/proc/healthcheck(make_hit_sound = 1, create_debris = 1, mob/user, atom/movable/AM)

	if(cut) //It's broken/cut, just a frame!
		return
	if(health <= 0)
		if(user)
			user.visible_message(SPAN_DANGER("[user] smashes through [src][AM ? " with [AM]":""]!"))
		playsound(loc, 'sound/effects/grillehit.ogg', 25, 1)
		cut_grille()
	if(make_hit_sound)
		playsound(loc, 'sound/effects/grillehit.ogg', 25, 1)

/obj/structure/tanktrap/bullet_act(obj/projectile/Proj)
	//Tasers and the like should not damage windows.
	var/ammo_flags = Proj.ammo.flags_ammo_behavior | Proj.projectile_override_flags
	if(Proj.ammo.damage_type == HALLOSS || Proj.damage <= 0 || ammo_flags == AMMO_ENERGY)
		return 0

	health -= Proj.damage * 0.3
	..()
	healthcheck()
	return 1

/obj/structure/tanktrap/ex_act(severity)
	switch(severity)
		if(0 to EXPLOSION_THRESHOLD_LOW)
			health -= severity/2
			healthcheck(0, 1)
		if(EXPLOSION_THRESHOLD_LOW to INFINITY)
			deconstruct(TRUE)

/obj/structure/tanktrap/hitby(atom/movable/AM)
	..()
	visible_message(SPAN_DANGER("[src] was hit by [AM]."))
	var/tforce = 0
	if(ismob(AM))
		tforce = 40
	else if(isobj(AM))
		var/obj/item/I = AM
		tforce = I.throwforce/2
	health = max(0, health - tforce)
	healthcheck()

/obj/structure/tanktrap/attack_hand(mob/user as mob)
	if(ishuman(user) && user.a_intent == INTENT_HARM)
		var/mob/living/carbon/human/human = user
		if(human.species.can_shred(human))
			attack_generic(human, 25)

//Used by attack_animal
/obj/structure/tanktrap/proc/attack_generic(mob/living/user, damage = 0)
	health -= damage
	user.animation_attack_on(src)
	user.visible_message(SPAN_DANGER("[user] smashes into [src]!"))
	healthcheck(1, 1, user)

/obj/structure/tanktrap/attack_animal(mob/user as mob)
	if(!isanimal(user))
		return
	var/mob/living/simple_animal/simple = user
	if(simple.melee_damage_upper <= 0)
		return
	attack_generic(simple, simple.melee_damage_upper)
