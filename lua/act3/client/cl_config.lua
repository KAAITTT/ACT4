function ACT3_Options_Camera( CPanel )

    CPanel:AddControl("ComboBox", {
        MenuButton = 1,
        Folder = "ACT3_Camera",
        Options = {
        ["first person (immersive mode)"] = {
            ["act3_cam_enable"] = "1",
            ["act3_cam_up"] = "2",
            ["act3_cam_forward"] = "2",
            ["act3_cam_right"] = "0",
            ["act3_cam_relativemotion"] = "0",
            ["act3_fov"] = "90",
            ["act3_anticlip"] = "1",
            ["act3_hipzoom"] = "0",
            ["act3_rcam_up"] = "2",
            ["act3_rcam_forward"] = "2",
            ["act3_rcam_right"] = "0",
        },
        ["third person"] = {
            ["act3_cam_enable"] = "1",
            ["act3_cam_up"] = "-2",
            ["act3_cam_forward"] = "-85",
            ["act3_cam_right"] = "16",
            ["act3_cam_relativemotion"] = "1",
            ["act3_fov"] = "90",
            ["act3_anticlip"] = "0",
            ["act3_hipzoom"] = "1",
            ["act3_rcam_up"] = "-2",
            ["act3_rcam_forward"] = "-85",
            ["act3_rcam_right"] = "16",
        }},
        CVars = {
            "act3_cam_enable",
            "act3_cam_up",
            "act3_cam_forward",
            "act3_cam_right",
            "act3_fov",
            "act3_anticlip",
            "act3_sensitivity",
            "act3_hipzoom",
            "act3_objcam",
            "act3_rcam_up",
            "act3_rcam_forward",
            "act3_rcam_right",
            "act3_insightsfov",
            "act3_forcedcam",
            "act3_camerasmoothing",
            "act3_fovchangespeed",
            "act3_weaponsightfov",
        }
    })

    CPanel:AddControl("Header", {Description = "NOTE: USE THE PRESET BOX ^^^ABOVE^^^ TO ENABLE FIRST/THIRD PERSON!"})
    CPanel:AddControl("Checkbox", {Label = "Enable Camera", Command = "act3_cam_enable" })
    CPanel:AddControl("Slider", {Label = "Camera Up", Command = "act3_cam_up", Min = -512, Max = 512, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Camera Forward", Command = "act3_cam_forward", Min = -512, Max = 512, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Camera Right", Command = "act3_cam_right", Min = -512, Max = 512, Type = "float" })
    CPanel:AddControl("Header", {Description = ""})
    CPanel:AddControl("Checkbox", {Label = "Force Server Camera", Command = "act3_rcam" })
    CPanel:AddControl("Slider", {Label = "Camera Up", Command = "act3_rcam_up", Min = -512, Max = 512, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Camera Forward", Command = "act3_rcam_forward", Min = -512, Max = 512, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Camera Right", Command = "act3_rcam_right", Min = -512, Max = 512, Type = "float" })
    CPanel:AddControl("Header", {Description = ""})
    CPanel:AddControl("Slider", {Label = "Camera FOV", Command = "act3_fov", Min = 70, Max = 130, Type = "float" })
    CPanel:AddControl("Checkbox", {Label = "Relative Camera", Command = "act3_cam_relativemotion" })
    CPanel:AddControl("Checkbox", {Label = "Anti-Clip", Command = "act3_anticlip" })
    CPanel:AddControl("Checkbox", {Label = "Zoom In Hipfire", Command = "act3_hipzoom" })
    CPanel:AddControl("Checkbox", {Label = "Non-Head-Mounted Camera", Command = "act3_objcam" })
    CPanel:AddControl("Checkbox", {Label = "WeaponFOV in sights", Command = "act3_insightsfov" })
    CPanel:AddControl("Checkbox", {Label = "Force ACT3 like cam on all weapons", Command = "act3_forcedcam" })
    CPanel:AddControl("Checkbox", {Label = "Body smoothing", Command = "act3_camerasmoothing" })
    CPanel:AddControl("Slider", {Label = "Speed of FOV changing", Command = "act3_fovchangespeed", Min = 1, Max = 10, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Insight FOV", Command = "act3_weaponsightfov", Min = 50, Max = 90, Type = "float" })
    CPanel:AddControl("Header", {Description = ""})
    CPanel:AddControl("Slider", {Label = "Sensitivity", Command = "act3_sensitivity", Min = 0, Max = 10, Type = "float" })
end

function ACT3_Options_Graphics( CPanel )

    CPanel:AddControl("ComboBox", {
        MenuButton = 1,
        Folder = "ACT3_Graphics",
        Options = {
        ["default"] = {
            ["act3_effect_quality"] = "3",
            ["act3_shelltime"] = "60",
            ["act3_shell_disable"] = "0"
        }},
        CVars = {
            "act3_effect_quality",
            "act3_shelltime",
            "act3_shell_disable"
        }
    })

    CPanel:AddControl("Slider", {Label = "Effect Quality", Command = "act3_effect_quality", Min = 1, Max = 3 })
    CPanel:AddControl("Slider", {Label = "Shell Time", Command = "act3_shelltime", Min = 0, Max = 360, Type = "float" })
    CPanel:AddControl("Checkbox", {Label = "Disable Shells", Command = "act3_shell_disable" })

end

function ACT3_Options_HUD( CPanel )

    CPanel:AddControl("ComboBox", {
        MenuButton = 1,
        Folder = "ACT3_HUD",
        Options = {
        ["default"] = {
            ["act3_hud_enable"] = "1",
            ["act3_hud_reduce"] = "0",
            ["act3_hitmarkers"] = "0",
            ["act3_hitmarker_time"] = "0.25",
            ["act3_hitmarker_sounds"] = "0",
            ["act3_hud_crosshair_enable"] = "1",
            ["act3_hud_crosshair_top"] = "1",
            ["act3_hud_crosshair_left"] = "1",
            ["act3_hud_crosshair_right"] = "1",
            ["act3_hud_crosshair_bottom"] = "1",
            ["act3_hud_crosshair_prongsize"] = "16",
            ["act3_hud_crosshair_sizemin"] = "2",
            ["act3_hud_crosshair_sizemax"] = "8"
        }},
        CVars = {
            "act3_hud_enable",
            "act3_hud_reduce",
            "act3_hitmarkers",
            "act3_hitmarker_time",
            "act3_hitmarker_size",
            "act3_hitmarker_sounds",
            "act3_hud_crosshair_enable",
            "act3_hud_crosshair_top",
            "act3_hud_crosshair_left",
            "act3_hud_crosshair_right",
            "act3_hud_crosshair_bottom",
            "act3_hud_crosshair_prongsize",
            "act3_hud_crosshair_sizemin",
            "act3_hud_crosshair_sizemax"
        }
    })

    CPanel:AddControl("Checkbox", {Label = "Enable HUD", Command = "act3_hud_enable" })
    CPanel:AddControl("Checkbox", {Label = "Reduced HUD", Command = "act3_hud_reduce" })

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Draw HP/Armor Panel", Command = "act3_hud_drawhpanel" })

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Enable Hitmarkers", Command = "act3_hitmarkers" })
    CPanel:AddControl("Slider", {Label = "Hitmarker Time", Command = "act3_hitmarker_time", Min = 0, Max = 5, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Hitmarker Size", Command = "act3_hitmarker_size", Min = 0, Max = 128 })
    CPanel:AddControl("Checkbox", {Label = "Hitmarker Sounds", Command = "act3_hitmarker_sounds" })

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Enable Crosshair", Command = "act3_hud_crosshair_enable" })
    CPanel:AddControl("Checkbox", {Label = "Crosshair Top Prong", Command = "act3_hud_crosshair_top" })
    CPanel:AddControl("Checkbox", {Label = "Crosshair Left Prong", Command = "act3_hud_crosshair_left" })
    CPanel:AddControl("Checkbox", {Label = "Crosshair Right Prong", Command = "act3_hud_crosshair_right" })
    CPanel:AddControl("Checkbox", {Label = "Crosshair Bottom Prong", Command = "act3_hud_crosshair_bottom" })
    CPanel:AddControl("Slider", {Label = "Prong Size", Command = "act3_hud_crosshair_prongsize", Min = 0, Max = 256, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Crosshair Min Size", Command = "act3_hud_crosshair_sizemin", Min = 0, Max = 32, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Crosshair Min Size", Command = "act3_hud_crosshair_sizemax", Min = 0, Max = 32, Type = "float" })

    CPanel:AddControl("Header", {Description = ""})

    -- CPanel:AddControl("Checkbox", {Label = "Show Hints", Command = "act3_showhints" })
end

function ACT3_Options_Gameplay( CPanel )

    CPanel:AddControl("ComboBox", {
        MenuButton = 1,
        Folder = "ACT3_Gameplay",
        Options = {
        ["default"] = {
            ["act3_infinite_atts"] = "1",
            ["act3_infinite_loose"] = "1",
            ["act3_infinite_nades"] = "1",
            ["act3_infinite_mags"] = "1",
            ["act3_mult_damage"] = "1",
            ["act3_mult_sway"] = "1",
            ["act3_mult_recoil"] = "1",
            ["act3_mult_dispersion"] = "1",
            ["act3_mult_precision"] = "1",
            ["act3_mult_precision_shotgun"] = "1",
            ["act3_mult_npcdamage"] = "1",
            ["act3_mult_npcdispersion"] = "1",
            ["act3_bullets_enable"] = "1",
            ["act3_bullets_velmult"] = "1",
            ["act3_bullets_dragmult"] = "1",
            ["act3_bullets_gravity"] = "600",
            ["act3_bullets_snap"] = "1",
            ["act3_dropmags"] = "1",
            ["act3_givefreemagazine"] = "1",
            ["act3_mags_defaultload"] = "1",
            ["act3_magslots"] = "24",
            ["act3_mags_time"] = "60",
            ["act3_hipholdtype"] = "1",
            ["act3_hipfiretime"] = "2",
            ["act3_sendhitmarkers"] = "1",
            ["act3_propmarkers"] = "0",
            ["act3_serverdebris_time"] = "60",
            ["act3_trueirons_enabled"] = "1",
            ["act3_truescopes_enabled"] = "1",
            ["act3_npcequality"] = "0",
            ["act3_npc_give"] = "1",
            ["act3_npc_dupe"] = "0",
            ["act3_npc_usetogive"] = "1",
            ["act3_weapon_time"] = "30",
            ["act3_realangles"] = "0",
            ["act3_penetration"] = "1",
            ["act3_penetration_mult"] = "1",
            ["act3_ricochet"] = "1",
            ["act3_npc_ratts"] = "1",
            ["act3_npc_rmag"] = "0",
            ["act3_npc_rbullets"] = "0",
            ["act3_npc_rall"] = "0",
            ["act3_disable_sightabovebore"] = "0",
            ["act3_magdropreload"] = "0"
        }},
        CVars = {
            "act3_infinite_atts",
            "act3_infinite_loose",
            "act3_infinite_nades",
            "act3_infinite_mags",
            "act3_mult_damage",
            "act3_mult_sway",
            "act3_mult_recoil",
            "act3_mult_dispersion",
            "act3_mult_precision",
            "act3_mult_precision_shotgun",
            "act3_bullets_enable",
            "act3_bullets_velmult",
            "act3_bullets_dragmult",
            "act3_bullets_gravity",
            "act3_bullets_snap",
            "act3_dropmags",
            "act3_givefreemagazine",
            "act3_mags_defaultload",
            "act3_magslots",
            "act3_mags_time",
            "act3_hipholdtype",
            "act3_hipfiretime",
            "act3_sendhitmarkers",
            "act3_propmarkers",
            "act3_serverdebris_time",
            "act3_trueirons_enabled",
            "act3_truescopes_enabled",
            "act3_npc_give",
            "act3_npc_usetogive",
            "act3_npc_dupe",
            "act3_npc_ratts",
            "act3_npc_rbullets",
            "act3_npc_rall",
            "act3_npc_rmag",
            "act3_weapon_time",
            "act3_realangles",
            "act3_penetration",
            "act3_penetration_mult",
            "act3_ricochet",
            "act3_mult_npcdamage",
            "act3_mult_npcdispersion",
        }
    })

    CPanel:AddControl("Checkbox", {Label = "Inf. Attachments", Command = "act3_infinite_atts"})
    CPanel:AddControl("Checkbox", {Label = "Inf. Loose Rounds", Command = "act3_infinite_loose"})
    CPanel:AddControl("Checkbox", {Label = "Inf. Throwables", Command = "act3_infinite_nades"})
    CPanel:AddControl("Checkbox", {Label = "Inf. Magazines", Command = "act3_infinite_mags"})

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Slider", {Label = "Damage Mult", Command = "act3_mult_damage", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Sway Mult", Command = "act3_mult_sway", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Recoil Mult", Command = "act3_mult_recoil", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Precision Mult", Command = "act3_mult_precision", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Shotgun Precision Mult", Command = "act3_mult_precision_shotgun", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Dispersion Mult", Command = "act3_mult_dispersion", Min = 0, Max = 100, Type = "float" })

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Physical Bullets", Command = "act3_bullets_enable"})
    CPanel:AddControl("Slider", {Label = "Muzzle Velocity Mult", Command = "act3_bullets_velmult", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Drag Mult", Command = "act3_bullets_dragmult", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "Gravity", Command = "act3_bullets_gravity", Min = 0, Max = 10000, Type = "float" })
    CPanel:AddControl("Checkbox", {Label = "Bullet Snap", Command = "act3_bullets_snap"})

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Bullet Penetration", Command = "act3_penetration"})
    CPanel:AddControl("Slider", {Label = "Penetration Multiplier", Command = "act3_penetration_mult", Min = 0, Max = 10, Type = "float" })
    CPanel:AddControl("Checkbox", {Label = "Bullet Ricochet", Command = "act3_ricochet"})

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Enable True Irons", Command = "act3_trueirons_enabled"})
    CPanel:AddControl("Checkbox", {Label = "Enable True Scopes", Command = "act3_truescopes_enabled"})
    CPanel:AddControl("Checkbox", {Label = "Enable Real Angles", Command = "act3_realangles"})
    CPanel:AddControl("Checkbox", {Label = "Disable Sight Above Bore", Command = "act3_disable_sightabovebore"})
    CPanel:AddControl("Checkbox", {Label = "Require Mag Drop To Reload", Command = "act3_magdropreload"})

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Drop Magazines", Command = "act3_dropmags"})
    CPanel:AddControl("Checkbox", {Label = "Free Magazine With Guns", Command = "act3_givefreemagazine"})
    CPanel:AddControl("Checkbox", {Label = "Free Ammo With Mags", Command = "act3_mags_defaultload"})
    CPanel:AddControl("Slider", {Label = "Magazine Slots", Command = "act3_magslots", Min = 0, Max = 200 })
    CPanel:AddControl("Slider", {Label = "Despawn Time", Command = "act3_mags_time", Min = 0, Max = 1000 })

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Seperate Hipfire Holdtype", Command = "act3_hipholdtype"})
    CPanel:AddControl("Checkbox", {Label = "Always Active", Command = "act3_alwaysactive"})
    CPanel:AddControl("Slider", {Label = "Hipfire Time", Command = "act3_hipfiretime", Min = 0, Max = 30, Type = "float" })

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Checkbox", {Label = "Send Hitmarkers", Command = "act3_sendhitmarkers"})
    CPanel:AddControl("Checkbox", {Label = "Hitmarkers on Prop Damage", Command = "act3_propmarkers"})

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Slider", {Label = "Debris Despawn Time", Command = "act3_serverdebris_time", Min = 0, Max = 10000 })
    CPanel:AddControl("Slider", {Label = "NPC Weapon Despawn Time", Command = "act3_weapon_time", Min = 0, Max = 10000 })

    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Slider", {Label = "NPC Damage Mult", Command = "act3_mult_npcdamage", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Slider", {Label = "NPC Dispersion Mult", Command = "act3_mult_npcdispersion", Min = 0, Max = 100, Type = "float" })
    CPanel:AddControl("Checkbox", {Label = "Use USE key to give weapons to NPCs", Command = "act3_npc_usetogive"})
    CPanel:AddControl("Checkbox", {Label = "Allow Giving Weapons to NPCs", Command = "act3_npc_give"})
    CPanel:AddControl("Checkbox", {Label = "Duplicate Given Weapons", Command = "act3_npc_dupe"})
    CPanel:AddControl("Checkbox", {Label = "Automatically Replace Default Weapons", Command = "act3_npc_replace"})
    CPanel:AddControl("Checkbox", {Label = "Randomize NPC attachments", Command = "act3_npc_ratts"})
    CPanel:AddControl("Checkbox", {Label = "Randomize NPC ammunition", Command = "act3_npc_rbullets"})
    CPanel:AddControl("Checkbox", {Label = "Randomize NPC magazine", Command = "act3_npc_rmag"})
    CPanel:AddControl("Checkbox", {Label = "Insanity Mode: Randomize All", Command = "act3_npc_rall"})

    CPanel:AddControl("Header", {Description = "(Use 'act3_give' in console to give weapons)"})

end

hook.Add( "PopulateToolMenu", "ACT3_Options", function()
    spawnmenu.AddToolMenuOption( "Options", "ACT3", "ACT3_Options_Camera", "Camera", "", "", ACT3_Options_Camera)
    spawnmenu.AddToolMenuOption( "Options", "ACT3", "ACT3_Options_HUD", "HUD", "", "", ACT3_Options_HUD)
    spawnmenu.AddToolMenuOption( "Options", "ACT3", "ACT3_Options_Graphics", "Graphics", "", "", ACT3_Options_Graphics)
    spawnmenu.AddToolMenuOption( "Options", "ACT3", "ACT3_Options_Gameplay", "Gameplay", "", "", ACT3_Options_Gameplay)
end )