/datum/language/common
	name = LANGUAGE_ENGLISH
	desc = "Common Earth English. The standard language of the United Americas."
	speech_verb = "says"
	key = "1"
	flags = RESTRICTED

	syllables = list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa",
					"all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio",
					"uld", "ver", "was", "wit", "you")

/datum/language/common/get_spoken_verb(msg_end)
	switch(msg_end)
		if("!")
			return pick("exclaims","shouts","yells") //TODO: make the basic proc handle lists of verbs.
		if("?")
			return ask_verb
	return speech_verb


/datum/language/generated //parent type for languages with custom sound generation methods like chinese and japanese
	space_chance = 100 //uses a unique system

// Galactic common languages (systemwide accepted standards).
/datum/language/generated/japanese
	name = LANGUAGE_JAPANESE
	desc = "A notoriously complex language boasting an extensive grammatical system, three writing systems, and a new smattering of English loanwords. It has gained popularity due to high cultural contact in the 3WE, and finds use outside due to emigration."
	speech_verb = "vocalizes"
	color = "japanese"
	key = "2"

/datum/language/russian
	name = LANGUAGE_RUSSIAN
	desc = "An East Slavic language from Earth. The dominant tongue of the UPP and frequently used by Slavic minorities in the United Americas."
	speech_verb = "enunciates"
	color = "russian"
	key = "3"

	syllables = list("al", "an", "bi", "vye", "vo", "go", "dye", "yel", "en", "yer", "yet", "ka", "ko", "la", "ly", "lo", "l", "na", "nye", "ny", "no", "ov", "ol", "on", "or", "slog", "ot", "po", "pr", "ra", "rye", "ro", "st",
					"ta", "tye", "to", "t", "at", "bil", "vyer", "yego", "yeny", "yenn", "yest", "kak", "ln", "ova", "ogo", "oro", "ost", "oto", "pry", "pro", "sta", "stv", "tor", "chto", "eto", "rus", "nar", "arya", "mol")

/datum/language/german
	name = LANGUAGE_GERMAN
	desc = "Standard High-German, a language spoken mostly in Central Europe, and by German immigrants elsewhere."
	speech_verb = "proclaims"
	ask_verb = "inquires"
	exclaim_verb = "bellows"
	color = "german"
	key = "4"

	syllables = list("die", "das", "wein", "mir", "und", "wir", "ein", "nein", "gen", "en", "sauen", "bin", "nein", "rhein", "deut", "der", "lieb", "en", "stein", "nein", "ja", "wolle", "sil", "bei", "der", "sie", "sch", "kein",
					"nur", "ach", "kann", "volk", "vau", "gelb", "grun", "macht", "zwei", "vier", "nacht", "tag")

/datum/language/spanish
	name = LANGUAGE_SPANISH
	desc = "The second most common language spoken in the UA, brought from marines from the Latin American territories and in the former southern USA."
	speech_verb = "dice"
	ask_verb = "cuestiona"
	exclaim_verb = "grita"
	color = "spanish"
	key = "5"

	syllables = list("ha", "pana", "ja", "blo", "que", "spa", "di", "ga", "na", "ces", "si", "mo", "so", "de", "el", "to", "ro", "mi", "ca", "la", "di", "ah", "mio", "tar", "ion", "gran", "van", "jo", "cie", "qie", "las",
					"locho", "mas", "no", "gui", "es", "mal")

/datum/language/french
	name = LANGUAGE_FRENCH
	desc = "An traditional romance language descended from Roman Latin, primarily used in western European areas including France and the Benelux region."
	speech_verb = "discours"
	ask_verb = "quoi"
	exclaim_verb = "exclamer"
	color = "french"
	key = "10"

	syllables = list("une", "est", "par", "les", "en", "et", "se", "dans", "du", "qui", "vous", "avez", "sur", "trois", "c'est", "en", "pas", "à", "me", "poser", "ce", "titre", "avec", "sons", "cinq", "bien", "valse", "pour", "plus", "de", "ou",
					"é", "éde", "comme", "mot", "bl", "ch", "sui", "peut", "être", "pouvez")

/datum/language/generated/chinese
	name = LANGUAGE_CHINESE
	desc = "The secondary language of the UPP, widespread around Asia and with a notable immigrant population in other parts of the world. The most spoken language in charted space."
	speech_verb = "shuo"
	ask_verb = "wen"
	exclaim_verb = "han"
	color = "chinese"
	key = "8"

// Minor Languages

/datum/language/celtic
	name = LANGUAGE_CELTIC
	desc = "A subset of languages most commonly used in Ireland and Scotland. Celtic usage has been in steady decline for centuries and is usually a rare sight in the wild."
	speech_verb = "cànans"
	ask_verb = "larrs"
	exclaim_verb = "scread"
	color = "celtic"
	key = "11"

	syllables = list("tá", "an", "ag", "spéir", "sa", "go", "lonrú", "Bhí", "mé", "siúl", "ar", "mi", "anns", "loch", "fhàs", "a'", "dia", "nos", "hwyl", "tú", "sláá", "n-éirí", "dté", "ball", "thú", "leat", "orm", "baa", "agat", "rai", "da", "pryn",
					"duit", "slá", "cro")

/datum/language/farsi
	name = LANGUAGE_FARSI
	desc = "Also known as Persian, Farsi is a language primarily used in Iran, Afghanistan and Pakistan."
	speech_verb = "kardans"
	ask_verb = "persidan"
	exclaim_verb = "faryads"
	color = "farsi"
	key = "12"

	syllables = list("laam", "Khosh", "a'ama", "vakh", "tam", "aste", "naaba", "shid", "saala", "baas", "shi'id", "ahvaal", "chet", "oreh", "e'tun", "khu", "ban", "mersi", "valla", "nista", "ejaaz", "bakh", "khaam", "miko",
					"befar", "maa'id", "maz'", "erat'", "afa", "faar")

/datum/language/arabic
	name = LANGUAGE_ARABIC
	desc = "The main language used in Egypt, parts of the Middle-east, and certain parts of Africa."
	speech_verb = "khitaabs"
	ask_verb = "as’al"
	exclaim_verb = "nehtef"
	color = "arabic"
	key = "13"

	syllables = list("mar", "haba", "sabah", "al-kha", "ayr'", "masa", "shu", "kran", "jaz", "eezla", "afwan", "ana", "asef", "min", "fad", "fah", "afk", "lik", "uzra", "kayfa", "haluk", "kallam", "al-ara'", "ibya", "adah", "kinuk", "alta", "duth", "'abta",
					"ma", "is", "ki", "fa", "ka'", "jah'", "sa'h")

/datum/language/swedish
	name = LANGUAGE_SWEDISH
	desc = "Mainly used by the sweds, pioneers of affordable furniture and... meatballs.."
	speech_verb = "tal"
	ask_verb = "fråga "
	exclaim_verb = "utropa"
	color = "swedish"
	key = "17"

	syllables = list("hur", "mår", "du", "jag", "pra", "tar", "inte", "sven", "ska", "ta", "lyc", "till", "äls", "urs", "vad", "heter", "håll", "jäv", "god", "såd", "läg", "är", "bjor", "tje", "valk", "tack", "omen", "in", "för", "lat")

/datum/language/finnish
	name = LANGUAGE_FINNISH
	desc = "The main language spoken by the proud Finnish people back on Earth."
	speech_verb = "sanoo"
	ask_verb = "kysyy"
	exclaim_verb = "huutaa"
	color = "finnish"
	key = "15"

	syllables = list("se", "ko", "si", "ta", "va", "ra", "ti", "tta", "va", "ka", "aa", "aa", "kko", "saa", "tuu", "puu", "la", "llo", "lo", "llo", "it", "ku", "kuu", "ro", "rre", "re", "yk", "yh", "ta", "lto", "rto", "ju", "ma", "la",
					"lau", "muo", "muu", "maa", "mme", "mma", "kki", "ri", "lla", "paa", "y", "a", "u", "o", "ol", "a", "al", "ni", "mi", "ki", "li", "ly", "lyi", "vyi", "hi", "hie")
	space_chance = 30

/datum/language/latin
	name = LANGUAGE_LATIN
	desc = "A classical language very rarely seen anywhere but scholarly institutions, popularized by the ancient Roman empire of old."
	speech_verb = "oratio"
	ask_verb = "rogare"
	exclaim_verb = "exclamo"
	color = "latin"
	key = "16"

	syllables = list("carpe", "ipsum", "lor", "vene", "sere", "sed", "lex", "tu", "tempus", "sic", "panem", "unum", "di", "um", "fug", "vici", "vidi", "ergo", "ave", "mori", "et", "est", "pro", "astra", "ex", "salu", "nōn", "ad", "potes", "inimi", "mortem",
					"effu", "gere", "ip", "disti", "peri", "lux", "seca", "miser", "quod", "illia", "fo", "ibi", "cēte", "tenta", "cor", "tuum", "cadit", "tene", "bris")

/datum/language/berber
	name = LANGUAGE_BERBER
	desc = "An African language primarly used in the northern sections of the continent."
	speech_verb = "tamazight"
	ask_verb = "ankatte"
	exclaim_verb = "“suɣ"
	color = "berber"
	key = "17"

	syllables = list("az", "ul", "mata", "aàn", "laba", "sbah", "ms", "ikhr", "yàw", "nit", "ar", "mez", "zra", "wahd", "khem", "àach", "meya", "iqeh", "nes", "sleh", "atag", "chal", "tagin", "sou", "foul", "ous", "tan", "mert", "ehba", "ch", "ab", "uhe",
					"igh", "lla", "med", "ash", "tis", "lam", "tu", "fat", "ghur", "mam")

/datum/language/bantu
	name = LANGUAGE_BANTU
	desc = "One of the more common Central and South African languages."
	speech_verb = "di̧ika"
	ask_verb = "búudi̧a"
	exclaim_verb = "tsk!"
	color = "bantu"
	key = "18"

	syllables = list("di̧", "ika", "kar", "ibu", "ha", "ri", "ar", "nan", "naf", "fur", "ahi", "kuko", "ona", "kwa", "nae", "ewa", "nia", "mpya", "lewa", "ae", "ra", "pah", "ku", "bu", "nje", "te", "ya")

/datum/language/hindi
	name = LANGUAGE_HINDI
	desc = "The most common language spoken on the indian sub-continent."
	speech_verb = "bolna"
	ask_verb = "pūchanā"
	exclaim_verb = "chillana"
	color = "hindi"
	key = "19"

	syllables = list("kai", "svā", "haiṅ", "nama", "as", "te", "skār", "he", "lo", "āp", "kai", "ka", "hāṁ ", "tum", "ho", "acchā", "maiṁ", "vād", "aur", "ṭh", "īk", "dek", "ha", "bahut", "sam", "nahīṅ","hārā", "merā", "se", "ke", "śubh", "yātr")

// Special Languages

/datum/language/commando
	name = LANGUAGE_TSL
	desc = "TSL is a modern technique with a combination of modified American sign language, tactical hand signals and discreet and esoteric code names for radios only known by elite commando groups."
	speech_verb = "discreetly communicates"
	ask_verb = "interrogates"
	exclaim_verb = "orders"
	color = "commando"
	key = "l"

	syllables = list("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
					"n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "?", "@", "#" ,"*")
	sentence_chance = 50
	space_chance = 50

/datum/language/sainja //Yautja tongue
	name = LANGUAGE_YAUTJA
	desc = "The deep, rumbling, guttural sounds of the Yautja predators. It is difficult to speak for those without facial mandibles."
	speech_verb = "rumbles"
	ask_verb = "rumbles"
	exclaim_verb = "roars"
	color = "tajaran"
	key = "s"
	flags = WHITELISTED

	syllables = list("!", "?", ".", "@", "$", "%", "^", "&", "*", "-", "=", "+", "e", "b", "y", "p", "|", "z", "~", ">")
	space_chance = 20

/datum/language/hellhound
	name = LANGUAGE_HELLHOUND
	desc = "A growling, guttural method of communication, only Hellhounds seem to be capable of producing these sounds."
	speech_verb = "growls"
	ask_verb = "grumbles"
	exclaim_verb = "snarls"
	color = "monkey"
	key = "h"

/datum/language/hellhound/scramble(input)
	return pick("Grrr...", "Grah!", "Gurrr...")

/datum/language/primitive
	name = LANGUAGE_MONKEY
	desc = "Ook ook ook."
	speech_verb = "chimpers"
	ask_verb = "chimpers"
	exclaim_verb = "screeches"
	color = "monkey"
	key = "9"

/datum/language/xenomorph
	name = LANGUAGE_XENOMORPH
	color = "xenotalk"
	desc = "The common tongue of the xenomorphs."
	speech_verb = "hisses"
	ask_verb = "hisses"
	exclaim_verb = "hisses"
	key = "x"
	flags = RESTRICTED

/datum/language/xenos
	name = LANGUAGE_HIVEMIND
	desc = "Xenomorphs have the strange ability to commune over a psychic hivemind."
	speech_verb = "hiveminds"
	ask_verb = "hiveminds"
	exclaim_verb = "hiveminds"
	color = "xeno"
	key = "q"
	flags = RESTRICTED|HIVEMIND

//Make queens BOLD text
/datum/language/xenos/broadcast(mob/living/speaker, message, speaker_mask)
	if(iscarbon(speaker))
		var/mob/living/carbon/C = speaker

		if(!(C.hivenumber in GLOB.hive_datum))
			return

		C.hivemind_broadcast(message, GLOB.hive_datum[C.hivenumber])

/datum/language/apollo
	name = LANGUAGE_APOLLO
	desc = "The APOLLO Link is an AI subprocessor designed by SEEGSON, allowing for coordination of maintenance drones and Working Joes. WY denies claims the processor was stolen for ARES."
	color = "apollo"
	speech_verb = "states"
	ask_verb = "queries"
	exclaim_verb = "declares"
	key = "6"
	flags = RESTRICTED|HIVEMIND

/datum/language/apollo/broadcast(mob/living/speaker, message, speaker_mask)
	if(!speaker.hear_apollo())
		return

	if (!message)
		return

	///Font size
	var/scale = "message"
	if(isARES(speaker))
		scale = "large"

	var/message_start = "<i><span class='game say'>[name], <span class='name'>[speaker.name]</span>"
	var/message_body = "<span class='message'>broadcasts, \"[message]\"</span></span></i>"
	var/full_message = "<span class='[scale]'><span class='[color]'>[message_start] [message_body]</span></span>"


	GLOB.STUI.game.Add("\[[time_stamp()]]<font color='#FFFF00'>APOLLO: [key_name(speaker)] : [message]</font><br>")
	GLOB.STUI.processing |= STUI_LOG_GAME_CHAT
	log_say("[speaker.name != "Unknown" ? speaker.name : "([speaker.real_name])"] \[APOLLO\]: [message] (CKEY: [speaker.key]) (JOB: [speaker.job])")
	log_ares_apollo(speaker.real_name, message)
	for (var/mob/dead in GLOB.dead_mob_list)
		if(!istype(dead,/mob/new_player) && !istype(dead,/mob/living/brain)) //No meta-evesdropping
			var/dead_message = "<span class='[scale]'><span class='[color]'>[message_start](<a href='byond://?src=\ref[dead];track=\ref[speaker]'>F</a>) [message_body]</span></span>"
			dead.show_message(dead_message, SHOW_MESSAGE_VISIBLE)

	for (var/mob/living/listener in GLOB.alive_mob_list)

		if (!listener.hear_apollo())
			continue

		listener.show_message(full_message, SHOW_MESSAGE_VISIBLE)

	var/list/listening = hearers(1, src)
	listening -= src

	for (var/mob/living/M in listening)
		if(isSilicon(M) || M.hear_apollo())
			continue
		M.show_message("<i><span class='game say'><span class='name'>synthesised voice</span> <span class='message'>beeps, \"beep beep beep\"</span></span></i>",2)

	//robot binary xmitter component power usage
	if (isrobot(speaker))
		var/mob/living/silicon/robot/R = speaker
		var/datum/robot_component/C = R.components["comms"]
		R.cell_use_power(C.active_usage)

/datum/language/event_hivemind
	name = LANGUAGE_TELEPATH
	desc = "An event only language that provides a hivemind for its users."
	speech_verb = "resonates"
	ask_verb = "resonates"
	exclaim_verb = "resonates"
	color = "yautja"
	key = "7"
	flags = RESTRICTED|HIVEMIND
