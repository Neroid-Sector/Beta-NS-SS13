/datum/character_trait/language
	var/language_name
	applyable = FALSE
	trait_group = /datum/character_trait_group/language

/datum/character_trait/language/New()
	..()
	trait_name = "Speaks [language_name]"
	trait_desc = "Can speak the language [language_name]."

/datum/character_trait/language/apply_trait(mob/living/carbon/human/target)
	..()
	target.add_language(language_name)

/datum/character_trait/language/unapply_trait(mob/living/carbon/human/target)
	..()
	target.remove_language(language_name)

/datum/character_trait_group/language
	trait_group_name = "Languages"

// Major Languages

/datum/character_trait/language/russian
	language_name = LANGUAGE_RUSSIAN
	applyable = TRUE
	cost = 2

/datum/character_trait/language/japanese
	language_name = LANGUAGE_JAPANESE
	applyable = TRUE
	cost = 2

/datum/character_trait/language/chinese
	language_name = LANGUAGE_CHINESE
	applyable = TRUE
	cost = 2

/datum/character_trait/language/german
	language_name = LANGUAGE_GERMAN
	applyable = TRUE
	cost = 2

/datum/character_trait/language/spanish
	language_name = LANGUAGE_SPANISH
	applyable = TRUE
	cost = 2

/datum/character_trait/language/french
	language_name = LANGUAGE_FRENCH
	applyable = TRUE
	cost = 2

// Minor Languages

/datum/character_trait/language/korean
	language_name = LANGUAGE_KOREAN
	applyable = TRUE
	cost = 2

/datum/character_trait/language/finnish
	language_name = LANGUAGE_FINNISH
	applyable = TRUE
	cost = 2

/datum/character_trait/language/swedish
	language_name = LANGUAGE_SWEDISH
	applyable = TRUE
	cost = 2

/datum/character_trait/language/celtic
	language_name = LANGUAGE_CELTIC
	applyable = TRUE
	cost = 2

/datum/character_trait/language/berber
	language_name = LANGUAGE_BERBER
	applyable = TRUE
	cost = 3

/datum/character_trait/language/bantu
	language_name = LANGUAGE_BANTU
	applyable = TRUE
	cost = 3

/datum/character_trait/language/farsi
	language_name = LANGUAGE_FARSI
	applyable = TRUE
	cost = 3

/datum/character_trait/language/arabic
	language_name = LANGUAGE_ARABIC
	applyable = TRUE
	cost = 3

/datum/character_trait/language/hindi
	language_name = LANGUAGE_HINDI
	applyable = TRUE
	cost = 3

/datum/character_trait/language/latin
	language_name = LANGUAGE_LATIN
	applyable = TRUE
	cost = 3

// Special Languages

/datum/character_trait/language/primitive
	language_name = LANGUAGE_MONKEY
	applyable = FALSE

/datum/character_trait/language/xenomorph
	language_name = LANGUAGE_XENOMORPH
	applyable = FALSE

/datum/character_trait/language/sainja
	language_name = LANGUAGE_YAUTJA
	applyable = FALSE
