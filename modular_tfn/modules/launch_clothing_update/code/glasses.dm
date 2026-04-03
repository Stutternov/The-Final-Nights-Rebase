#define LCU_GLASSES_ICONS \
	icon = 'modular_tfn/modules/launch_clothing_update/icons/clothing.dmi'; \
	worn_icon = 'modular_tfn/modules/launch_clothing_update/icons/worn.dmi'; \
	ONFLOOR_ICON_HELPER('modular_tfn/modules/launch_clothing_update/icons/onfloor.dmi')

//Aviators
/obj/item/clothing/glasses/vampire/aviator
	name = "aviators"
	desc = "Thick framed aviators."
	icon_state = "aviator"
	inhand_icon_state = "sunglasses"
	LCU_GLASSES_ICONS

/obj/item/clothing/glasses/vampire/aviator/green
	name = "green aviators"
	desc = "Thick-framed aviators, now in green."
	icon_state = "aviator_green"

/obj/item/clothing/glasses/vampire/aviator/blue
	name = "blue aviators"
	desc = "Thick-framed aviators, now in blue."
	icon_state = "aviator_blue"

//Sunglassses
/obj/item/clothing/glasses/vampire/sun/oversized
	name = "oversized sunglasses"
	desc = "Oversized visor sunglasses. Extra cool at night."
	icon_state = "sun_oversized"
	inhand_icon_state = "sunglasses"
	LCU_GLASSES_ICONS

/obj/item/clothing/glasses/vampire/sun/thin
	name = "thin sunglasses"
	desc = "A pair of thin-framed sunglasses."
	icon_state = "sun_thin"
	inhand_icon_state = "sunglasses"
	LCU_GLASSES_ICONS

//Perception Glasses
/obj/item/clothing/glasses/vampire/perception/green
	name = "green prescription glasses"
	desc = "Prescription glasses with thick, green plastic frames."
	icon_state = "perception_green"
	inhand_icon_state = "glasses"
	LCU_GLASSES_ICONS

/obj/item/clothing/glasses/vampire/perception/retro
	name = "retro glasses"
	desc = "Prescription glasses straight out of the 1980s."
	icon_state = "perception_retro"
	inhand_icon_state = "glasses"
	LCU_GLASSES_ICONS

/obj/item/clothing/glasses/vampire/perception/metal
	name = "metal-framed prescription glasses"
	desc = "Prescribed glasses with a thick metal frame."
	icon_state = "perception_metal"
	inhand_icon_state = "glasses"
	LCU_GLASSES_ICONS

//Misc Glasses
/obj/item/clothing/glasses/vampire/bicolor
	name = "bicolor glasses"
	desc = "These let you see the whole world in 3D."
	icon_state = "3d"
	inhand_icon_state = "glasses"
	LCU_GLASSES_ICONS

/obj/item/clothing/glasses/vampire/safety
	name = "safety goggles"
	desc = "Always wear personal protective equipment when sulking."
	icon_state = "safety_goggles"
	inhand_icon_state = "glasses"
	LCU_GLASSES_ICONS

//Eyepatches
/obj/item/clothing/glasses/vampire/eyepatch
	name = "right eyepatch"
	desc = "Black and menacing."
	icon_state = "eyepatch"
	LCU_GLASSES_ICONS

/obj/item/clothing/glasses/vampire/eyepatch/left
	name = "left eyepatch"
	desc = "Black and menacing."
	icon_state = "eyepatch_left"

/obj/item/clothing/glasses/vampire/eyepatch/white
	name = "white right eyepatch"
	desc = "The less menacing option."
	icon_state = "eyepatch_white"

/obj/item/clothing/glasses/vampire/eyepatch/white_left
	name = "white left eyepatch"
	desc = "The less menacing option."
	icon_state = "eyepatch_white_left"

//Veils
/obj/item/clothing/glasses/vampire/veil
	name = "white veil"
	desc = "A white lace veil that covers the eyes."
	icon_state = "veil"
	LCU_GLASSES_ICONS

/obj/item/clothing/glasses/vampire/veil/black
	name = "black veil"
	desc = "A black lace veil that obscures the wearer's face."
	icon_state = "veil_black"

#undef LCU_GLASSES_ICONS
