/datum/quirk/darkpack/setite_initiate
	name = "Setite Initiate"
	desc = "You were embraced into a clan other than the Followers of Set but have undergone the rigorous vetting process and rites and are considered a member of them now."
	value = 5
	mob_trait = TRAIT_SETITE_INITIATE
	gain_text = span_notice("You have been initiated as a Follower of Set and are now considered one of them.")
	lose_text = span_notice("You somehow have been uninitiated from the Followers of Set and are no longer part of them.")
	allowed_splats = list(SPLAT_KINDRED)
	excluded_clans = list(VAMPIRE_CLAN_SETITE)
	icon = FA_ICON_SKULL_CROSSBONES
	failure_message = "You somehow have been uninitiated from the Followers of Set and are no longer part of them."
