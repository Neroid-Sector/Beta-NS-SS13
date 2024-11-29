/client/proc/admin_general_quarters()
	set name = "Call General Quarters"
	set category = "Admin.Ship"

	if(security_level == SEC_LEVEL_RED || security_level == SEC_LEVEL_DELTA)
		tgui_alert(src, "Security is already red or above, General Quarters cannot be called.", "Acknowledge!", list("ok."), 10 SECONDS)
		return FALSE
	var/customannouncement = FALSE
	var/whattoannounce = null

	var/prompt = tgui_alert(src, "Are you sure you want to send General Quarters? This will force red alert if it is not.", "Choose.", list("Yes", "No"), 20 SECONDS)
	if(prompt != "Yes")
		return FALSE

	var/log = "[key_name_admin(src)] Sent General Quarters!"

	prompt = tgui_alert(src, "Do you want to use a custom announcement?", "Choose.", list("Yes", "No"), 20 SECONDS)
	if(prompt == "Yes")
		customannouncement = TRUE
		whattoannounce = tgui_input_text(src, "Please enter announcement text.", "what?")
		log = "[key_name_admin(src)] Sent General Quarters! (Using a custom announcement)"

	set_security_level(SEC_LEVEL_RED, TRUE, FALSE)
	shipwide_ai_announcement(whattoannounce, MAIN_AI_SYSTEM, 'sound/effects/GQfullcall.ogg')
	generalquarters(customannouncement, whattoannounce)
	message_admins(log)
	//test
	return TRUE
