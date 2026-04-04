#define LCU_HEAD_ICONS \
	icon = 'modular_tfn/modules/launch_clothing_update/icons/clothing.dmi'; \
	worn_icon = 'modular_tfn/modules/launch_clothing_update/icons/worn.dmi'; \
	ONFLOOR_ICON_HELPER('modular_tfn/modules/launch_clothing_update/icons/onfloor.dmi')

/obj/item/clothing/head/vampire
	abstract_type = /obj/item/clothing/head/vampire

/obj/item/clothing/head/vampire/hat
	LCU_HEAD_ICONS

/obj/item/clothing/head/vampire/hat/bucket
	name = "bucket hat"
	desc = "Music festival high fashion."
	icon_state = "bucket_hat"
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/vampire/hat/boater
	name = "boater hat"
	desc = "Few dare wear this cheerful straw hat past September 15."
	icon_state = "boater_hat"

/obj/item/clothing/head/vampire/hat/beaver
	name = "beaver hat"
	desc = "The felt is soft and elegant. You can see why the beaver misses it."
	icon_state = "beaver_hat"

/obj/item/clothing/head/vampire/hat/wool
	name = "white wool hat"
	desc = "Knitted for those cold, chilly nights."
	icon_state = "woolhat"
	LCU_HEAD_ICONS

/obj/item/clothing/head/vampire/hat/wool/blue
	name = "blue and white wool hat"
	desc = "Knitted for those cold, chilly nights."
	icon_state = "woolhat_blue"

/obj/item/clothing/head/vampire/picture
	name = "picture hat"
	desc = "An old-fashioned hat with a brim low enough to cover your eyes."
	icon_state = "picture"
	flags_cover = HEADCOVERSEYES //check if anything actually uses this flag?
	LCU_HEAD_ICONS

/obj/item/clothing/head/vampire/picture/red
	name = "red picture hat"
	desc = "An old-fashioned hat with a brim low enough to cover your eyes."
	icon_state = "picture_red"

//Costume hats

/obj/item/clothing/head/vampire/headband_frilly
	name = "frilly headband"
	desc = "A headband made of white frills and black bows. Maidenly!"
	icon_state = "frilly_headband"
	LCU_HEAD_ICONS

/obj/item/clothing/head/vampire/headdress_black
	name = "black headdress"
	desc = "A fancy black headdress. Mysterious!"
	icon_state = "blackngoldheaddress"
	LCU_HEAD_ICONS

#undef LCU_HEAD_ICONS
