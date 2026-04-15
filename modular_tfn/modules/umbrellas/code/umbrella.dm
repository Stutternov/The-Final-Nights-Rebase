/obj/item/umbrella
	name = "umbrella"
	desc = "A foldable umbrella."
	icon = 'modular_tfn/modules/umbrellas/icons/umbrella.dmi'
	icon_state = "umbrella_closed"
	lefthand_file = 'modular_tfn/modules/umbrellas/icons/umbrella_inhand_l.dmi'
	righthand_file = 'modular_tfn/modules/umbrellas/icons/umbrella_inhand_r.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/open = FALSE

/obj/item/umbrella/attack_self(mob/user)
	. = ..()
	toggle_open(user)

/obj/item/umbrella/proc/toggle_open(mob/user)
	open = !open
	icon_state = open ? "umbrella_open" : "umbrella_closed"
	balloon_alert(user, open ? "opened" : "closed")
	if(open)
		ADD_TRAIT(user, TRAIT_RAINSTORM_IMMUNE, REF(src))
	else
		REMOVE_TRAIT(user, TRAIT_RAINSTORM_IMMUNE, REF(src))

/obj/item/umbrella/equipped(mob/user, slot)
	. = ..()
	if(open && (slot & ITEM_SLOT_HANDS))
		ADD_TRAIT(user, TRAIT_RAINSTORM_IMMUNE, REF(src))

/obj/item/umbrella/dropped(mob/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_RAINSTORM_IMMUNE, REF(src))

/obj/item/umbrella/parasol
	name = "parasol"
	desc = "A foldable parasol."
	icon = 'modular_tfn/modules/umbrellas/icons/umbrella.dmi'
	icon_state = "umbrella_closed"
	lefthand_file = 'modular_tfn/modules/umbrellas/icons/umbrella_inhand_l.dmi'
	righthand_file = 'modular_tfn/modules/umbrellas/icons/umbrella_inhand_r.dmi'
	w_class = WEIGHT_CLASS_TINY

/obj/item/umbrella/parasol/toggle_open(mob/user)
	open = !open
	icon_state = open ? "parasol_open" : "parasol_closed"
	balloon_alert(user, open ? "opened" : "closed")
	if(open)
		ADD_TRAIT(user, TRAIT_RAINSTORM_IMMUNE, REF(src))
	else
		REMOVE_TRAIT(user, TRAIT_RAINSTORM_IMMUNE, REF(src))

