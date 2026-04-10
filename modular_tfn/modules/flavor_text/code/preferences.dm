/datum/preference/text/theme
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_theme"
	maximum_value_length = MAX_MESSAGE_LEN
	///How much time between the informational chat messages?
	var/cooldown_duration = 1 MINUTES
	///Handles the informational chat message timer.
	COOLDOWN_DECLARE(theme_cooldown)
	///Assoc list of ckeys and their links, used to cut down on chat spam
	var/static/list/stored_links = list()
	var/static/link_regex = regex("files.catbox.moe")
	var/static/list/valid_extensions = list("mp3", "ogg", "mp4") // Regex works fine, if you know how it works

/datum/preference/text/theme/apply_to_human(mob/living/carbon/human/target, value)
	target?.dna.features[EXAMINE_DNA_THEME] = value

/datum/preference/text/theme/is_valid(value)
	if(!length(value))
		return TRUE

	var/find_index = findtext(value, "https://")
	if(find_index != 1)
		to_chat(usr, span_warning("Your link must be https!"))
		return

	if(!findtext(value, "."))
		to_chat(usr, span_warning("Invalid link!"))
		return
	var/list/value_split = splittext(value, ".")

	// extension will always be the last entry
	var/extension = value_split[length(value_split)]
	if(!(lowertext(extension) in valid_extensions))
		to_chat(usr, span_warning("The theme must be one of the following extensions: '[english_list(valid_extensions)]'"))
		return

	find_index = findtext(value, link_regex)
	if(find_index != 9)
		to_chat(usr, span_warning("The theme must be hosted on a site capable of secure mp3 hosting, i.e: 'Catbox (catbox.moe)'"))
		return

	if(stored_links[usr.ckey] && stored_links[usr.ckey][type] != value && COOLDOWN_FINISHED(src,theme_cooldown))
		COOLDOWN_START(src, theme_cooldown, cooldown_duration)
		to_chat(usr, span_notice("Please [span_bold("do not")] upload any music that may be considered unfitting for the setting. Credit the music used and the artist in the appopriate manner."))
		to_chat(usr, span_notice("If the song doesn't  play properly, ensure that it's a direct link that opens properly in a browser."))
		to_chat(usr, span_notice("Leave blank to clear your current song."))
		to_chat(usr, span_notice("[span_bold("Abuse of this feature may result in a ban.")]"))
		log_game("[usr] has set their character theme to '[value]'.")

	apply_theme(value)
	return TRUE

/datum/preference/text/theme/proc/apply_theme(value)
	if(isnull(stored_links[usr?.ckey]))
		stored_links[usr?.ckey] = list()
	stored_links[usr?.ckey][type] = value
	return TRUE
