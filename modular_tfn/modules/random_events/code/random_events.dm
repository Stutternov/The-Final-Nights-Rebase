// random in-round events to keep things interesting

SUBSYSTEM_DEF(tfnevents)
	name = "TFN Random Events"
	runlevels = RUNLEVEL_GAME
	wait = 1 MINUTES
	var/next_event = 0
	var/frequency_lower = 60 MINUTES
	var/frequency_upper = 120 MINUTES
	var/list/power_outage_pool = list(
		/area/vtm/interior/police,
		/area/vtm/interior/jazzclub,
		/area/vtm/interior/museum,
		/area/vtm/interior/bianchiBank,
	)

/datum/controller/subsystem/tfnevents/Initialize()
	reschedule()
	return SS_INIT_SUCCESS

/datum/controller/subsystem/tfnevents/fire()
	if(world.time < next_event)
		return
	var/list/events = list(
		PROC_REF(run_power_outage_event),
		PROC_REF(run_turfwar_event),
	)
	call(src, pick(events))()
	reschedule()

/datum/controller/subsystem/tfnevents/proc/reschedule()
	next_event = world.time + rand(frequency_lower, frequency_upper)

/datum/controller/subsystem/tfnevents/proc/run_power_outage_event()
	if(!length(power_outage_pool))
		return

	var/target_area_type = pick(power_outage_pool)
	power_outage_pool -= target_area_type
	var/area/target_area = locate(target_area_type)
	if(!target_area)
		return

	var/list/blown = list()
	for(var/obj/fusebox/box in target_area)
		if(box.damaged > 100) // dont doubly blow the thing if its already blown from say, the faulty grid event
			continue
		box.damaged = 150
		box.check_damage()
		blown += box

	if(!length(blown))
		message_admins("ERROR: Power outage event called but [target_area.name] had no fuseboxes. Tell Nimi.")
		return

	endpost_announce("Reports of power outages in [target_area.name]. Bring wirecutters if you want to help.", "SF Grid Watchers")

/datum/controller/subsystem/tfnevents/proc/run_turfwar_event()
	var/list/spawns_a = list()
	var/list/spawns_b = list()
	var/list/gang_names = list(
		"38th Street Gang",
		"The Avenues",
		"Forming Kaos",
		"Azusa 13",
		"Varrio Nuevo Estrada",
		"Venice 13",
		"Westside Locos 13",
		"Wilmas 13",
		"Vagos Motorcycle Club",
		"Varrio 204th Street",
		"Yakuza",
	)
	var/list/warning = list("Watch out bay area", "BREAKING", "CRIME WATCH", "Holy shit", "Wow")
	var/list/random_description = list("declared war on", "is beefing with", "said they are going to kill", "publicly declared their intent to wipe out")
	for(var/obj/effect/landmark/L in GLOB.landmarks_list)
		if(istype(L, /obj/effect/landmark/gangster_spawn/a))
			spawns_a += L
		else if(istype(L, /obj/effect/landmark/gangster_spawn/b))
			spawns_b += L

	if(!length(spawns_a) || !length(spawns_b)) // these are message_admins because its not a critical enough issue that gangsters arent murdering each other or power grids failing to warrant runtimes
		message_admins("ERROR: Turfwar event called but gangster spawn landmarks are missing.")
		return

	var/a_count = rand(5, 10)
	for(var/i in 1 to a_count)
		var/obj/effect/landmark/gangster_spawn/a/entry_point = pick(spawns_a)
		if(prob(50))
			new /mob/living/basic/trooper/gangster/ranged(entry_point.loc)
		else
			new /mob/living/basic/trooper/gangster/melee(entry_point.loc)

	var/b_count = rand(5, 10)
	for(var/i in 1 to b_count)
		var/obj/effect/landmark/gangster_spawn/b/entry_point = pick(spawns_b)
		if(prob(50))
			new /mob/living/basic/trooper/gangster/ranged/rival(entry_point.loc)
		else
			new /mob/living/basic/trooper/gangster/melee/rival(entry_point.loc)
	endpost_announce("[pick(warning)], [pick(gang_names)] [pick(random_description)] [pick(gang_names)].")

ADMIN_VERB(debug_run_power_outage_event, R_ADMIN, "Debug: Power Outage Event", "Manually trigger the power outage random event.", "OOC")
	SStfnevents.run_power_outage_event()
	message_admins("[key_name_admin(user)] manually triggered the power outage event.")

ADMIN_VERB(debug_run_turfwar_event, R_ADMIN, "Debug: Turfwar Event", "Manually trigger the turfwar random event.", "OOC")
	SStfnevents.run_turfwar_event()
	message_admins("[key_name_admin(user)] manually triggered the turfwar event.")
