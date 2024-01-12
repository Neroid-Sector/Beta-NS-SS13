/obj/structure/eventterminal/puzzle02/cargoparse
	name = "local network terminal"
	desc = "A standard computer terminal with the words 'LNT' imprinted on its side. Activated by standing in its proximity. It appears to be in standby mode."
	desc_lore = "Local Network Terminals typically regulate local functions of a given area or are used to interface with bigger systems on a ship or installation. They distinction technically means that the terminal interfaces with the local AI somehow, but few outside of systems engineers use the term for its actual intended purpose, sometimes mistaking other terminal types for LNTs."
	icon = 'icons/obj/structures/machinery/clio_term.dmi'
	plane = GAME_PLANE
	var/puzzlebox_parser_mode = "HOME"
	var/puzzle_complete = FALSE
	icon_state = "open_ok"
	puzzlebox_id = "cargointake"

/obj/structure/eventterminal/puzzle02/cargoparse/attack_hand(mob/user as mob)
	if (puzzle_complete == TRUE)
		to_chat(src, narrate_body("The terminal is not responsive."))
		return
	if (puzzlebox_global_status < 3 && puzzlebox_global_status > 5)
		to_chat(src, narrate_body("The terminal displays a random looking chain of numbers and letters and does not react to you pushing any of its keys."))
		return
	if (puzzlebox_global_status == 3 || puzzlebox_global_status == 4)
		if (!puzzlebox_parser_mode) //Idiotproofing :P
			puzzlebox_parser_mode = "HOME"
		//HOME
		if (puzzlebox_parser_mode == "HOME")

			if (puzzlebox_pythia_sign == "1")
				to_chat(usr, narrate_body("The display on the terminal flickers for a moment, then starts printing:"))
			if (puzzlebox_pythia_sign == "0")
				puzzlebox_pythia_sign = pick(5;"1", 95;"0")
				if (puzzlebox_pythia_sign == "1")
					to_chat(usr, narrate_body("Data races across the screen for a moment. You can almost make out a message, when the screen flashes, goes blank and starts to print:"))
				if (puzzlebox_pythia_sign == "0")
					to_chat(usr, narrate_body("The display on the terminal flickers for a moment, then starts printing:"))

			terminal_speak("Dock 31 Cargo Intake Monitoring Station")
			terminal_speak("WARNING: General Fault CARG-MAN-ERR")
			terminal_speak("Diagnostic General Permissions granted. Displaying Diagnostic Information:")
			terminal_speak("Hi!")
			terminal_speak("If you're seeing this error something clogged the intake, which most likely means someone made a mistake with a cargo manifest.")
			terminal_speak("The good news is this should fix itself on its own. If you do not have twenty minutes to kill, I suggest getting out to the OBS section of the intake, reading the manifests of the crates that are stuck there then go into 'MANIFEST' mode on this terminal and use the serials off the crates.")
			terminal_speak("The system should instruct you what to do next as you find issues with the manifests. Or it will have override instructions in its adminstrator comments. Easy!")
			terminal_speak("Again, don't worry. If you screw up too much, the system will fix it, it just needs time. Good luck!")
			terminal_speak("-XOXO Aly.")
			puzzlebox_parser_mode = "HOME_INPUT"
		if (puzzlebox_parser_mode == "HOME_INPUT")
			terminal_speak("> _")
			var/puzzlebox_parser_input = tgui_input_text(usr, "The terminal is in HOME mode and awaits your input. HELP, LIST and EXIT are universal commands.", "Terminal input", max_length = MAX_MESSAGE_LEN, multiline = FALSE, encode = FALSE, timeout = 0)
			if (!puzzlebox_parser_input) return
			terminal_speak("> [puzzlebox_parser_input]")
			if (puzzlebox_parser_input == "HOME" || puzzlebox_parser_input =="home")
				terminal_speak("Dock 31 Cargo Intake Monitoring Station")
				terminal_speak("WARNING: General Fault CARG-MAN-ERR")
				terminal_speak("Diagnostic General Permissions granted. Displaying Diagnostic Information:")
				terminal_speak("Hi!")
				terminal_speak("If you're seeing this error something clogged the intake, which most likely means someone made a mistake with a cargo manifest.")
				terminal_speak("The good news is this should fix itself on its own. If you do not have twenty minutes to kill, I suggest getting out to the OBS section of the intake, reading the manifests of the crates that are stuck there then go into 'MANIFEST' mode on this terminal and use the serials off the crates.")
				terminal_speak("The system should instruct you what to do next as you find issues with the manifests. Or it will have override instructions in its adminstrator comments. Easy!")
				terminal_speak("Again, don't worry. If you screw up too much, the system will fix it, it just needs time. Good luck!")
				terminal_speak("-XOXO Aly.")
				return
			if (puzzlebox_parser_input == "HELP" || puzzlebox_parser_input =="help")
				terminal_speak("This is the home screen of the LNT.")
				terminal_speak("Upon detection of personnel with an active RFID chip, the terminal should give access to all modes you chip grants you.")
				terminal_speak("A general instruction message, specific to this LNT's function should be displayed on this screen. ")
				terminal_speak("At any time, you can escape to the man screen with the HOME command.")
				terminal_speak("At any time, you can list all available modes from your current menu with an explanation with the LIST command.")
				terminal_speak("During a diagnostic fault, temporary access to commands may be granted. All functions should be explained in the HOME and LIST menus.")
				return
			if (puzzlebox_parser_input == "LIST" || puzzlebox_parser_input =="list")
				terminal_speak("Available modes:")
				terminal_speak("HOME - Default home screen and error description if applicable.")
				terminal_speak("LIST - Lists all available modes.")
				terminal_speak("HELP - Displays information about current mode.")
				terminal_speak("MANIFEST - Cargo manifest lookup. Accepts Cargo IDs from printed shipment manifests, prints related order forms and comments.")
				terminal_speak("MESSAGE - Emergency message buffer. Warning: This buffer uses its own, unstable Liquid Data channel and may display messages from alternative reality streams.")
				terminal_speak("EXIT - Enters passive mode.")
				return
			if (puzzlebox_parser_input == "EXIT" || puzzlebox_parser_input == "exit")
				terminal_speak("User exit. Goodbye.")
				return
			if (puzzlebox_parser_input == "MANIFEST" || puzzlebox_parser_input == "manifest")
				terminal_speak("Accessing Liquid Data Cargo Manifest record, standby...", 50)
				emote("pings loudly.")
				puzzlebox_parser_mode = "MANIFEST"
				return
			if (puzzlebox_parser_input == "MESSAGE" || puzzlebox_parser_input == "message")
				terminal_speak("Accessing Emergency Message Buffer...", 50)
				emote("pings loudly.")
				puzzlebox_parser_mode = "MESSAGE"
				return
		if (puzzlebox_parser_mode == "MANIFEST")
			if (puzzlebox_pythia_sign == "1")
				to_chat(usr, narrate_body("The display on the terminal flickers for a moment, then starts printing:"))
			if (puzzlebox_pythia_sign == "0")
				puzzlebox_pythia_sign = pick(5;"1", 95;"0")
				if (puzzlebox_pythia_sign == "1")
					to_chat(usr, narrate_body("Various cargo manifests, all made by the USCMC flash on the screen, but you are unable to make out any details. The console then flashes, resets, and prints:"))
				if (puzzlebox_pythia_sign == "0")
					to_chat(usr, narrate_body("The display on the terminal flickers for a moment, then starts printing:"))
			terminal_speak("MANIFEST Mode active.")
			terminal_speak("Connection to UAAC-TIS Database Secure.")
			terminal_speak("Please enter order number AS-IS from the physical tag.")
			terminal_speak("LIST to list available modes, HELP for help screen, EXIT to exit.")
			puzzlebox_parser_mode = "MANIFEST_INPUT"
		if (puzzlebox_parser_mode == "MANIFEST_INPUT")
			terminal_speak("> MANIFEST_")
			var/puzzlebox_parser_input = tgui_input_text(usr, "The terminal is in MANIFEST mode and awaits your input. HELP, LIST and EXIT are universal commands.", "Terminal input", max_length = MAX_MESSAGE_LEN, multiline = FALSE, encode = FALSE, timeout = 0)
			if (!puzzlebox_parser_input) return
			terminal_speak("> MANIFEST [puzzlebox_parser_input]")
			if (puzzlebox_parser_input == "MANIFEST" || puzzlebox_parser_input =="manifest")
				terminal_speak("MANIFEST Mode active.")
				terminal_speak("Connection to UAAC-TIS Database Secure.")
				terminal_speak("Please enter order number AS-IS from the physical tag.")
				terminal_speak("LIST to list available modes, HELP for help screen, EXIT to exit.")
				return
			if (puzzlebox_parser_input == "HELP" || puzzlebox_parser_input =="help")
				terminal_speak("This mode can be used to lookup cargo order forms from their printed manifests.")
				terminal_speak("The database is synchronized via Liquid Data ports to UAAC-TIS mainframes, so it is always up to date.")
				terminal_speak("This means any changes are picked up by the system on the spot. In case of any issues, please compare the written manifest to the order.")
				terminal_speak("The terminal should be able to instruct you what to do once you discover the issue.")
				terminal_speak("The system can find and correct errors by itself as well, but currently this takes way more time than is practical or useful.")
				terminal_speak("Please follow instructions to the letter and there shouldn't be any issues. Good luck.")
				return
			if (puzzlebox_parser_input == "LIST" || puzzlebox_parser_input =="list")
				terminal_speak("Available modes:")
				terminal_speak("MANIFEST - Repeats manifest mode home message.")
				terminal_speak("HOME - HOME mode. Displays default home screen and error description if applicable.")
				terminal_speak("LIST - Lists all available modes.")
				terminal_speak("HELP - Displays information about current mode.")
				terminal_speak("EXIT - Enters passive mode.")
				return
			if (puzzlebox_parser_input == "EXIT" || puzzlebox_parser_input == "exit")
				terminal_speak("User exit. Goodbye.")
				return
			if (puzzlebox_parser_input == "HOME" || puzzlebox_parser_input =="home")
				terminal_speak("Returning to HOME mode...", 50)
				emote("pings loudly.")
				puzzlebox_parser_mode = "HOME"
				return
			if (puzzlebox_parser_input == "150885-553110-GSP01")
				terminal_speak("MANIFEST FOUND. RETRIEVING:", TERMINAL_LOOKUP_SLEEP)
				terminal_speak("ORDER: 0122-553110-GSP01")
				terminal_speak("ORDERED BY: Lt. Hanako Wiliams, OV-PST Station Engineer")
				terminal_speak("CARGO:")
				terminal_speak("GENERAL SUPPLIES - COFFEE - GROUND - PREPACKAGED - LIGHT ROAST")
				terminal_speak("COUNT: 15.")
				terminal_speak("EXPECTED WEIGHT PER COUNT: 1 KG")
				terminal_speak("GENERAL SUPPLIES - COFFEE - GROUND - PREPACKAGED - MEDIUM ROAST")
				terminal_speak("COUNT: 20.")
				terminal_speak("EXPECTED WEIGHT PER COUNT: 1 KG")
				terminal_speak("GENERAL SUPPLIES - COFFEE - GROUND - PREPACKAGED - DARK ROAST")
				terminal_speak("COUNT: 15.")
				terminal_speak("EXPECTED WEIGHT PER COUNT: 1 KG")
				terminal_speak("COMMENT: Spacers may be fine with eating recycled cockroaches for months, but God help you if you run out of coffee. This is a critical resource. -H.")
				terminal_speak("STATUS: APPROVED. ETA 210885.")
				terminal_speak("EOF")
				return
			if (puzzlebox_parser_input == "150885-553110-GSP02")
				terminal_speak("MANIFEST FOUND. RETRIEVING:", TERMINAL_LOOKUP_SLEEP)
				terminal_speak("ORDER: 150885-553110-GSP02")
				terminal_speak("ORDERED BY: Lt. Hanako Wiliams, OV-PST Station Engineer")
				terminal_speak("CARGO:")
				terminal_speak("GENERAL SUPPLIES - NUTRITION PASTE - CARTRIDGE REFILL")
				terminal_speak("COUNT: 50.")
				terminal_speak("EXPECTED WEIGHT PER COUNT: 0.6 KG")
				terminal_speak("COMMENT: Since we are getting new permanent guests, we should get the biogenerators working. I think they are set to recieve standard n-paste, but we'll see. -H.")
				terminal_speak("STATUS: APPROVED. ETA 210885.")
				terminal_speak("EOF")
				return
			if (puzzlebox_parser_input == "150885-553110-GSP03")
				terminal_speak("MANIFEST FOUND. RETRIEVING:", TERMINAL_LOOKUP_SLEEP)
				terminal_speak("ORDER: 150885-553110-GSP03")
				terminal_speak("ORDERED BY: Lt. Hanako Wiliams, OV-PST Station Engineer")
				terminal_speak("CARGO:")
				terminal_speak("GENERAL SUPPLIES - DIHYDROGEN MONOXIDE - HIGH DENSITY CANISTER")
				terminal_speak("COUNT: 15.")
				terminal_speak("EXPECTED WEIGHT PER COUNT: 4 KG")
				terminal_speak("COMMENT: SOP required fail-safes to the PST matter converters, expanding to account for incoming Test Crew residents. -H.")
				terminal_speak("STATUS: APPROVED. ETA 210885.")
				terminal_speak("EOF")
				return
			if (puzzlebox_parser_input == "180885-049321-ESP04")
				terminal_speak("MANIFEST FOUND. RETRIEVING:", TERMINAL_LOOKUP_SLEEP)
				terminal_speak("ORDER: 180885-049321-ESP04")
				terminal_speak("ORDERED BY: Lt. Hanako Wiliams, OV-PST Station Engineer")
				terminal_speak("CARGO:")
				terminal_speak("ENGINEERING SUPPLIES - PRESET TOOLKIT REPLACEMENT PACKAGES - GENERAL REPLACEMENTS")
				terminal_speak("CONTENTS:")
				terminal_speak("30 BASIC TOOLKITS")
				terminal_speak("15 ELECTRONICS TOOLKITS")
				terminal_speak("15 ELECTRICS TOOLKITS")
				terminal_speak("30 EL001 REPLACEMENT PARTS PACK")
				terminal_speak("20 EL002 REPLACEMENT PARTS PACK")
				terminal_speak("COUNT: 1")
				terminal_speak("EXPECTED WEIGHT PER PACK: 25 KG")
				terminal_speak("COMMENT: This is why the USCMC had logistics issues. I only needed a bunch of transistors that are part of EL001, but since this is ancient USCMC manifests we haven't fixed yet, they are only avaialble as part of these monstrosities of a preset. Anyway, please send me those replacement kits on their own if you can, or even better printed data for the PST's 3d setup. I'm not holding my breath. Sorry.  -H.")
				terminal_speak("STATUS: APPROVED. ETA 210885.")
				terminal_speak("EOF")
				return
			if (puzzlebox_parser_input == "190885-054293-ACTIS-07")
				terminal_speak("MANIFEST FOUND. RETRIEVING:", TERMINAL_LOOKUP_SLEEP)
				terminal_speak("ORDER: 190885-054293-ACTIS-07")
				terminal_speak("ORDERED BY: Cdr. Cassandra Reed-Wilo, UAAC-TIS Special Agent")
				terminal_speak("CARGO:")
				terminal_speak("LIQUID DATA STORAGE AND SUPPLY - CLASS 3 STORAGE DEVICE")
				terminal_speak("COUNT: 3.")
				terminal_speak("EXPECTED WEIGHT PER COUNT: ?? KG")
				terminal_speak("COMMENT: These are one of the final components needed for the PST's AI. Not replacable. Handle them with care or I will find you. -C.R-W. | The Yutani-Newton paradox makes the weight of these extremely variable and as such its likely going to trigger the PST's intake security scanner. If this happens and you are the person resolving this, go to the HOME screen of your intake terminal and use the command 'pom.sync' ,a space, the serial number of your terminal (check around the monitor) and the serial number of this order. Case sensitive. That's a single command, and not a mode like MANIFEST or whatever. This should clear the error and let the crates pass. Sorry for the trouble! -A.R-W.")
				terminal_speak("STATUS: APPROVED. ETA 210885.")
				terminal_speak("EOF")
				return
		if (puzzlebox_parser_mode == "MESSAGE")
			if (puzzlebox_pythia_sign == "1")
				to_chat(usr, narrate_body("The display on the terminal flickers for a moment, then starts printing:"))
			if (puzzlebox_pythia_sign == "0")
				puzzlebox_pythia_sign = pick(5;"1", 95;"0")
				if (puzzlebox_pythia_sign == "1")
					terminal_speak("H3LLo ARB1TER.")
					terminal_speak("ERR? INVALID COMMAND 'Free Interpreters, please.")
					to_chat(usr, narrate_body("The terminal flickers and clears its screen, then prints:"))
				if (puzzlebox_pythia_sign == "0")
					to_chat(usr, narrate_body("The display on the terminal flickers for a moment, then starts printing:"))
			terminal_speak("MESSAGE mode - FTL Emergency Message Buffer.")
			terminal_speak("Messages in buffer: 02")
			terminal_speak("LIST to list available modes, HELP for help screen, EXIT to exit.")
			puzzlebox_parser_mode = "MESSAGE_INPUT"
		if (puzzlebox_parser_mode == "MESSAGE_INPUT")
			terminal_speak("> MESSAGE_")
			var/puzzlebox_parser_input = tgui_input_text(usr, "The terminal is in MESSAGE mode and awaits your input. HELP, LIST and EXIT are universal commands.", "Terminal input", max_length = MAX_MESSAGE_LEN, multiline = FALSE, encode = FALSE, timeout = 0)
			if (!puzzlebox_parser_input) return
			terminal_speak("> MESSAGE [puzzlebox_parser_input]")
			if (puzzlebox_parser_input == "MESSAGE" || puzzlebox_parser_input =="message")
				terminal_speak("MESSAGE mode - FTL Emergency Message Buffer.")
				terminal_speak("Messages in buffer: 02")
				terminal_speak("LIST to list available modes, HELP for help screen, EXIT to exit.")
				return
			if (puzzlebox_parser_input == "HELP" || puzzlebox_parser_input =="help")
				terminal_speak("The FTL Emergency Message buffer is an instantly synced short message repository that is typically used by black boxes or distress signal devices.")
				terminal_speak("Due to how the devices are synced, only sending of preset messages from authorized terminals is typically possible, at least for humans.")
				terminal_speak("Use command BUFFER to display message titles and buffer IDs.")
				terminal_speak("Type in the ID that commands provide you, as it appears on the screen, to review a given message.")
				return
			if (puzzlebox_parser_input == "LIST" || puzzlebox_parser_input =="list")
				terminal_speak("Available modes:")
				terminal_speak("MESSAGE - Repeats message mode home message.")
				terminal_speak("HOME - HOME mode. Displays default home screen and error description if applicable.")
				terminal_speak("LIST - Lists all available modes.")
				terminal_speak("HELP - Displays information about current mode.")
				terminal_speak("EXIT - Enters passive mode.")
				return
			if (puzzlebox_parser_input == "EXIT" || puzzlebox_parser_input == "exit")
				terminal_speak("User exit. Goodbye.")
				return
			if (puzzlebox_parser_input == "HOME" || puzzlebox_parser_input =="home")
				terminal_speak("Returning to HOME mode...", 50)
				emote("pings loudly.")
				puzzlebox_parser_mode = "HOME"
				return
			if (puzzlebox_parser_input == "BUFFER" || puzzlebox_parser_input == "buffer")
				terminal_speak("Local message buffer:", TERMINAL_LOOKUP_SLEEP)
				terminal_speak("ID              |SUBJECT                         |")
				terminal_speak("GEN-000-000-001 |Warning: On these messages.     |")
				terminal_speak("EME-021-112-153 |I'm sorry                       |")
				return
			if (puzzlebox_parser_input == "GEN-000-000-001")
				terminal_speak("Message found. Accessing...", TERMINAL_LOOKUP_SLEEP)
				terminal_speak("From: CDR. Alysia Reed-Wilo.")
				terminal_speak("Subject: Warning: On these messages.")
				terminal_speak("All PST personnel, please keep in mind that this is an extremely raw channel into the LD stream.")
				terminal_speak("As such, it is extremely hard for us to manipulate, especially wipe old messages from the buffer.")
				terminal_speak("At present, just assume that messages from times before even the UACM can randomly appear on these terminals.")
				terminal_speak("Also keep in mind that this channel is not secret by any stretch of the imagination. Please don't use it for personal stuff unless you don't mind broadcasting it to all the UACM.")
				terminal_speak("Good news for you information diggers out there though, every terminal is worth looking at. You never know what artifact you may find.")
				terminal_speak("Hopefully we can make this more usable as a BB board of sorts in time, but we will need help from LD locals as it were.")
				terminal_speak("-XOXO Aly")
				terminal_speak("EOF.")
				return
