#define BB_GANGSTER_DEFEND_SPOT "BB_gangster_defend_spot"
#define FACTION_GANGSTER_A "gangster_a"
#define FACTION_GANGSTER_B "gangster_b"

// turf war event where two sets of NPC gangsters fight it out over a landmark
/obj/effect/landmark/gangster_defend_area
	name = "turfwar marker"

/obj/effect/landmark/gangster_spawn/a
	name = "gangster spawn (A)"

/obj/effect/landmark/gangster_spawn/b
	name = "gangster spawn (B)"

/datum/outfit/gangster_a
	name = "Gangster (A)"
	uniform = /obj/item/clothing/under/vampire/bandit
	suit = /obj/item/clothing/suit/jacket/letterman_red
	shoes = /obj/item/clothing/shoes/vampire/jackboots

/datum/outfit/gangster_b
	name = "Gangster (B)"
	uniform = /obj/item/clothing/under/vampire/bandit
	suit = /obj/item/clothing/suit/vampire/jacket
	shoes = /obj/item/clothing/shoes/vampire/jackboots

/obj/effect/mob_spawn/corpse/human/gangster_a
	name = "Thug" // replaced on spawn to include the gang name
	outfit = /datum/outfit/gangster_a
	facial_hairstyle = "Shaved"

/obj/effect/mob_spawn/corpse/human/gangster_a/special(mob/living/carbon/human/spawned_human, mob/mob_possessor, apply_prefs)
	. = ..()
	spawned_human.skin_tone = pick("caucasian1", "caucasian2", "caucasian3", "latino")

/obj/effect/mob_spawn/corpse/human/gangster_b
	name = "Thug"
	outfit = /datum/outfit/gangster_b
	facial_hairstyle = "Shaved"

/obj/effect/mob_spawn/corpse/human/gangster_b/special(mob/living/carbon/human/spawned_human, mob/mob_possessor, apply_prefs)
	. = ..()
	spawned_human.skin_tone = pick("caucasian1", "mediterranean", "caucasian3", "latino")

/datum/ai_planning_subtree/prepare_travel_to_destination/gangster
	target_key = BB_GANGSTER_DEFEND_SPOT

/datum/ai_controller/basic_controller/trooper/gangster
	planning_subtrees = list(
		/datum/ai_planning_subtree/escape_captivity,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path/trooper,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/prepare_travel_to_destination/gangster,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target,
	)

/datum/ai_controller/basic_controller/trooper/gangster/ranged
	planning_subtrees = list(
		/datum/ai_planning_subtree/escape_captivity,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper,
		/datum/ai_planning_subtree/prepare_travel_to_destination/gangster,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target,
	)

/mob/living/basic/trooper/gangster/proc/find_defend_spot()
	var/patrol_area = rand(4, 8) // how close theyll get to the actual landmark before they start npc wandering
	for(var/obj/effect/landmark/gangster_defend_area/spot in GLOB.landmarks_list)
		var/distance = get_dist(src, spot)
		if(distance > patrol_area) // when they spawn, they run over to it until they're somewhere between 4-8 tiles away from the landmark
			ai_controller.set_blackboard_key(BB_GANGSTER_DEFEND_SPOT, spot)

/mob/living/basic/trooper/gangster
	name = "Gangster"
	desc = "Local gangster. Seems on edge!"
	faction = list(FACTION_GANGSTER_A)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/gangster_a
	corpse = /obj/effect/mob_spawn/corpse/human/gangster_a

/mob/living/basic/trooper/gangster/melee
	name = "Gangster"
	ai_controller = /datum/ai_controller/basic_controller/trooper/gangster
	melee_damage_lower = 15
	melee_damage_upper = 20
	attack_verb_continuous = "bludgeons"
	attack_verb_simple = "bludgeon"
	attack_sound = 'sound/items/weapons/genhit3.ogg'
	r_hand = /obj/item/melee/baseball_bat/vamp

/mob/living/basic/trooper/gangster/melee/Initialize(mapload)
	. = ..()
	find_defend_spot()

/mob/living/basic/trooper/gangster/ranged
	name = "Gangster"
	ai_controller = /datum/ai_controller/basic_controller/trooper/gangster/ranged
	r_hand = /obj/item/gun/ballistic/automatic/darkpack/uzi
	var/casingtype = /obj/item/ammo_casing/vampire/c9mm
	var/projectilesound = 'modular_darkpack/modules/deprecated/sounds/uzi.ogg'
	var/burst_shots = 3
	var/ranged_cooldown = 3 SECONDS

/mob/living/basic/trooper/gangster/ranged/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = casingtype,\
		projectile_sound = projectilesound,\
		cooldown_time = ranged_cooldown,\
		burst_shots = burst_shots,\
	)
	find_defend_spot()

/mob/living/basic/trooper/gangster/melee/rival
	name = "Rival Gangster"
	desc = "A gangster representing colors from a few blocks away."
	faction = list(FACTION_GANGSTER_B)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/gangster_b
	corpse = /obj/effect/mob_spawn/corpse/human/gangster_b

/mob/living/basic/trooper/gangster/ranged/rival
	name = "Rival Gangster"
	desc = "A gangster representing colors from a few blocks away."
	faction = list(FACTION_GANGSTER_B)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/gangster_b
	corpse = /obj/effect/mob_spawn/corpse/human/gangster_b

#undef BB_GANGSTER_DEFEND_SPOT
#undef FACTION_GANGSTER_A
#undef FACTION_GANGSTER_B
