GLOBAL_LIST_EMPTY (pve_active_npc)
GLOBAL_LIST_EMPTY (pve_active_spawners)

GLOBAL_VAR_INIT (pve_active_wave, 0)
GLOBAL_VAR_INIT (pve_spawned_npcs_in_wave, 0)

GLOBAL_VAR_INIT (pve_spawner_number, 0)

GLOBAL_VAR_INIT (pve_spawner_wave_npcs_total, 0)
GLOBAL_VAR_INIT (pve_spawner_wave_delay, 0)

GLOBAL_VAR_INIT (pve_active_npc_number, 0)
GLOBAL_VAR_INIT (pve_active_npc_max, 100)

GLOBAL_VAR_INIT (pve_npc_hp, 5)
GLOBAL_VAR_INIT (pve_npc_poise, 3)
GLOBAL_VAR_INIT (pve_npc_attack_lower, 15)
GLOBAL_VAR_INIT (pve_npc_attack_upper, 25)
GLOBAL_VAR_INIT (pve_npc_movement_time, 3)
GLOBAL_VAR_INIT (pve_npc_attack_cadence, "5n")

GLOBAL_VAR_INIT (pve_npc_attack_distance, 30)
GLOBAL_VAR_INIT (pve_npc_return_distance, 50)
