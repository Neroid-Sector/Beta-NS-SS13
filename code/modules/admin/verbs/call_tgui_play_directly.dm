/client/proc/call_tgui_play_directly()
    set category = "Admin.Fun"
    set name = "Play Music From Direct Link"
    set desc = "Plays a music file from a https:// link through tguis music player, bypassing the filtering done by the other admin command. This will play as an admin atmospheric and will be muted by clinets who have that setting turned on as expected. A blurb displaying song info can also be displayed as an extra option."


    if(!check_rights(R_ADMIN))
        return

    var/targets = GLOB.mob_list
    var/list/music_extra_data = list()
    var/web_sound_url = tgui_input_text(usr, "Enter link to sound file. Must use https://","LINK to play", timeout = 0)
    var/show_blurb_indicator = tgui_alert(usr, "Show title blurb?", "Blurb", list("No","Yes"), timeout = 0)
    music_extra_data["title"] = tgui_input_text(usr, "Enter song Title, leaving this blank/null will use its url instead.","Title input", timeout = 0)
    music_extra_data["artist"] = tgui_input_text(usr, "Enter song Artist, or leave blank to not display.", "Artist input", timeout = 0)
    music_extra_data["album"] = tgui_input_text(usr, "Enter song Album, or leave blank to not display.","Album input", timeout = 0)
    if(music_extra_data["title"] == null) music_extra_data["title"] = web_sound_url
    if(music_extra_data["artist"] == null) music_extra_data["artist"] = "Unknown Artist"
    if(music_extra_data["album"] == null) music_extra_data["album"] = "Unknown Album"
    music_extra_data["link"] = "Song Link Hidden"
    music_extra_data["duration"] = "None"
    for(var/mob/mob as anything in targets)
        var/client/client = mob?.client
        if((client?.prefs?.toggles_sound & SOUND_MIDI) && (client?.prefs?.toggles_sound & SOUND_ADMIN_ATMOSPHERIC))
            if(show_blurb_indicator == "Yes") show_blurb_song(title = music_extra_data["title"], additional = "[music_extra_data["artist"]] - [music_extra_data["album"]]")
            client?.tgui_panel?.play_music(web_sound_url, music_extra_data)
        else
            client?.tgui_panel?.stop_music()

/proc/show_blurb_song(title = "Song Name",additional = "Song Artist - Song Album",)//Shows song blurb, a two line blurb. The first line passes
    var/message_to_display = "<b>[title]</b>\n[additional]"
    show_blurb(GLOB.player_list, 10 SECONDS, "[message_to_display]", screen_position = "LEFT+0:16,BOTTOM+1:16", text_alignment = "left", text_color = "#FFFFFF", blurb_key = "song[title]", ignore_key = TRUE, speed = 1)
