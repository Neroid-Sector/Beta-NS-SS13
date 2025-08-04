/datum/weather_event/ash
	name = "Volcanic Ash"
	display_name = "Ash Fall"
	length = 10 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/low
	turf_overlay_icon_state = "light_ash"

	effect_message = "You feel ashy dust blow into every crevice of your body. This is going suck to clean."
	damage_per_tick = 0

	ambience = 'sound/ambience/strata/strata_snow.ogg'

	fire_smothering_strength = 0

/datum/weather_event/volcanic_ash
	name = "Volcanic Ash Storm"
	display_name = "Volcanic Ash Storm"
	length = 6 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/medium
	turf_overlay_icon_state = "ash_storm"

	effect_message = "You feel ashy dust blow into every crevice of your body. It's burning hot to the touch!"
	damage_per_tick = 1
	damage_type = BURN
	lightning_chance = 4

	ambience = 'sound/ambience/volcanic_ash.mp3'

	fire_smothering_strength = 0

/datum/weather_event/burning_ash
	name = "Volcanic Burning Ash Storm"
	display_name = "Volcanic Burning Ash Storm"
	length = 6 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/medium
	turf_overlay_icon_state = "ash_storm"

	effect_message = "You feel ashy dust blow into every crevice of your body. It's burning hot to the touch!"
	damage_per_tick = 5
	damage_type = BURN
	lightning_chance = 4
	ignite_target = TRUE

	ambience = 'sound/ambience/volcanic_ash.mp3'

	fire_smothering_strength = 0

/datum/weather_event/nuke_ash
	name = "Nuclear Fallout"
	display_name = "Nuclear Fallout"
	length = 10 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/low
	turf_overlay_icon_state = "light_ash"

	effect_message = "You feel ashy dust blow into every crevice of your body. You feel sort of nauseated."
	damage_per_tick = 1
	damage_type = TOX
	status_effect = DAZE
	status_strength = 0.5

	ambience = 'sound/ambience/strata/strata_snow.ogg'

	fire_smothering_strength = 1

/datum/weather_event/slo_snow
	name = "Slowing Snow"
	display_name = "Snow"
	length = 10 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/low
	turf_overlay_icon_state = "strata_snowing"

	effect_message = "You feel the icy winds chill you!"
	damage_per_tick = 0
	status_effect = SUPERSLOW
	status_strength = 1

	ambience = 'sound/ambience/strata/strata_snow.ogg'

	fire_smothering_strength = 3

/datum/weather_event/fog
	name = "Fog"
	display_name = "Fog"
	length = 15 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/high
	turf_overlay_icon_state = "common_fog"
	turf_overlay_alpha = 120

	effect_message = "You feel a damp humidity roll in, and your vision grow hazy. A chill runs down your spine as you struggle to peer through the fog."
	damage_per_tick = 0
	damage_type = BRUTE

	ambience = 'sound/ambience/strata/strata_snow.ogg'

	fire_smothering_strength = 1
