//
// Spawn Flags
//
void SpawnFlags(object oSpawn, int nFlagTableNumber)
{
    // Initialize Values
    string sSpawnName = GetName(oSpawn);
    string sSpawnTag = GetTag(oSpawn);
    string sFlags, sTemplate;

//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // Sample Complex Replacement
    // Using FT without FT00 will
    // Default to nFlagTableNumber 0
    if (nFlagTableNumber == 0)
    {
        // Old Method of using SpawnTag
        if (sSpawnTag == "myspawns")
        {
            sFlags = "SP_SN02_SA_RW";
            sTemplate = "NW_DOG";
        }

        if (sSpawnTag == "undead")
        {
            sFlags = "SP_SNO4";
            sTemplate = "NW_ZOMBIE01";
        }
    }
    //

    // Sample Simple Replacement Flag
    // Completely Replaces Flags
    // On Spawnpoints with FT01
    if (nFlagTableNumber == 1)
    {
        sFlags = "SP_SN04_RW_DOD";
        sTemplate = "NW_DOG";
    }
    //

    // Sample Template Flags
    // These Flags Get Added
    // To Spawnpoints with FT02
    if (nFlagTableNumber == 2)
    {
        sFlags = "_RW_PC05R";
    }
     if (nFlagTableNumber == 25)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_taverner")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SN03_SA03_SG_TR30D30_LT504A25B15C5_CD0T3";
            sTemplate = "taverner";
        }
     }
    if (nFlagTableNumber == 33)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_adventurers")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SN03_SA03_SG_TR30D30_LT504A25B15C5_CD0T3";
            sTemplate = "adventurers";
        }
     }
    if (nFlagTableNumber == 65)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_performer")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_PC01_SF_CD0T3";
            sTemplate = "sw_performer";
        }
     }

if (nFlagTableNumber == 26)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_small")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SN03_SA03_SG_TR30D30_LT505A25B15C5_CD0T3";
            sTemplate = "small";
        }
     }

if (nFlagTableNumber == 27)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_elves")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SN03_SA03_SG_TR30D30_LT504A25B15C5_CD0T3";
            sTemplate = "elves";
        }
     }


    if (nFlagTableNumber == 29)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_undead")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD30_SG_CD0T3_RW_RHD50";
            sTemplate = "undead";
        }
    }

    if (nFlagTableNumber == 80)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_vermin_lesser")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT503A01B01C01_CD0T3_RW_RHD60";
            sTemplate = "sw_vermin_lesser";
        }
    }

    if (nFlagTableNumber == 81)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_vermin")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT503A01B01C01_CD0T3_RW_RHD60";
            sTemplate = "sw_vermin";
        }
    }

    if (nFlagTableNumber == 82)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_vermin_greater")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT503A01B01C01_CD0T3_RW_RHD60";
            sTemplate = "sw_vermin_greater";
        }
    }

    if (nFlagTableNumber == 83)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_beasts")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT503A05B02C01_CD0T3_RW_RHD40";
            sTemplate = "sw_beasts";
        }
    }

    if (nFlagTableNumber == 84)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_demon_lesser")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT501A05B02C01_CD0T3_RW_RHD40";
            sTemplate = "sw_demon_lesser";
        }
    }

    if (nFlagTableNumber == 85)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_demon")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT501A45B30C15_CD0T3_RW_RHD30";
            sTemplate = "sw_demon";
        }
    }

    if (nFlagTableNumber == 86)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_demon_greater")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT502A40B20C05_CD0T3_RW_RHD30";
            sTemplate = "sw_demon_greater";
        }
    }

    if (nFlagTableNumber == 87)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_undead_lesser")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT501A05B02C01_CD0T3_RW_RHD50";
            sTemplate = "sw_undead_lesser";
        }
    }

    if (nFlagTableNumber == 88)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_undead1")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT501A20B05C01_CD0T3_RW_RHD50";
            sTemplate = "sw_undead";
        }
    }

    if (nFlagTableNumber == 89)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_undead_high")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT502A30B20C10_CD0T3_RW_RHD30";
            sTemplate = "sw_undead_high";
        }
    }

    if (nFlagTableNumber == 90)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_undead_impos")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SD60_SG_LT502A60B40C20_CD0T3_RW_RHD30";
            sTemplate = "sw_undead_impos";
        }
    }

    if (nFlagTableNumber == 30)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_housethief")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_TR50_SR25_SD60_NOD_SG_LT504A25B15C5_CD0T3";
            sTemplate = "housethief";
        }
    }

    if (nFlagTableNumber == 31)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_watchgroup")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SN04_SA_PC_SG_PR31T1_LT505A25B15C5_CD0T3";
            sTemplate = "watchgroup";
        }

        if (sSpawnTag == "sw_patrolgroup")
        {
            sFlags = "SP_SN05_SA_SG_PR31T2_CD300T2";
            sTemplate = "patrolgroup";
        }

        // This one adds to the current spawn tags, so you can
        // specify the number you want in the waypoint name
        if (sSpawnTag ==  "sw_num_watchman")
        {
            sFlags = sSpawnName + "_SA_CD300T2";
            sTemplate = "citywatchman";
        }
    }

    else if (nFlagTableNumber == 32)
    {
        if (sSpawnTag == "k_patrol_010")
        {
            sFlags = "SP_SN05_SA_PR10_SS10_HB10_CD300T2";
            sTemplate = "k_patrol_010";
        }
    }

        if (nFlagTableNumber == 41)
    {
        // These use the GROUP flag -- see spawn_cfg_group file

//   PLn|Tn|Pn
//   : Placeable Object
//   : Spawns a Placeable Object with Behavior
//   :   Behavior 0: Default Behavior
//   :   Behavior 1: Despawn if Empty
//   :   Behavior 2: Refill if Empty
//   :   Behavior 3: Refresh (despawn/respawn) every P000 minutes; default
//   :   (if no Pn specified) is 60 minutes
//   : Optional Flag: T00
//   :   Trap Disabled Chance
//   :   00% to 99% chance of Trap Disabled
//   :   Trap must already be part of Placeable's Template
//   :   Default 100% Chance Trap is Disabled
//   : Optional Flag: P00
//   :   Refresh period (in minutes)

        if (sSpawnTag == "sw_box")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_SF_PC200_PL0_LT508A10B05C01_TR50_SD200P";
            sTemplate = "box";
        }
    }

    if (nFlagTableNumber == 42)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_chest_locked")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_SF_PC200_PL0_LT508A30B05C01_SD200P";
            sTemplate = "chest_locked";
        }
    }

    if (nFlagTableNumber == 43)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_chest_locked2")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_SF_PC200_PL0_LT507A30B05C01_SD200P";
            sTemplate = "chest_locked2";
        }
    }

    if (nFlagTableNumber == 44)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_chest_locked_trapped")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_SF_PC200_PL0_LT506A20B05C01_SD200P";
            sTemplate = "chest_locked_trapped";
        }
    }

    if (nFlagTableNumber == 45)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_furniture")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_SF_PC_PL0";
            sTemplate = "furniture";
        }
    }

    if (nFlagTableNumber == 46)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_misc")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_SF_PC_PL0";
            sTemplate = "misc";
        }
    }

if (nFlagTableNumber == 47)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_rug")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SG_SF_PC_PL0";
            sTemplate = "rug";
        }
    }

if (nFlagTableNumber == 48)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_commoner")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_DO_SN03_SA_SR20_SG_PC01_TR30D30_LT505A25B15C5_RW_RHD80";
            sTemplate = "commoner";
        }
    }

if (nFlagTableNumber == 49)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_comsingle")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_DO_SN01_SG_PC05_TR30D30_RW_RHD80";
            sTemplate = "comsingle";
        }
    }

   // Sample Complex Replacement
    // Using FT without FT00 will
    // Default to nFlagTableNumber 0
    if (nFlagTableNumber == 0)
    {
        // Old Method of using SpawnTag
        if (sSpawnTag == "alleythief")
        {
            sFlags = "SP_SD99_TR30";
            sTemplate = "alleythief";
        }

        if (sSpawnTag == "undead")
        {
            sFlags = "SP_SNO4";
            sTemplate = "NW_ZOMBIE01";
        }
    }
    //

    // Sample Simple Replacement Flag
    // Completely Replaces Flags
    // On Spawnpoints with FT01
    if (nFlagTableNumber == 1)
    {
        sFlags = "SP_PC01";
        sTemplate = "alleythief";
    }
    //

    // Sample Template Flags
    // These Flags Get Added
    // To Spawnpoints with FT02

    if (nFlagTableNumber == 2)
    {
        sFlags = "_RW_PC05R";
    }
      if (nFlagTableNumber == 31)
    {
        // These use the GROUP flag -- see spawn_cfg_group file
        if (sSpawnTag == "sw_watchgroup")
        {
            // SN05 = Keep 4 alive
            // SG = spawn group (check spawn_cfg_group file for sTemplate
            // SA = spawn all at once
            // PR31T1 = walk wapoints that start with PR31 and T1 do it circular path
            // CD = drop a corpse, but just inventory on them, no wielded or worn stuff
            sFlags = "SP_SN04_SA_SG_PR31T1_PC05_CD300T2";
            sTemplate = "watchgroup";
        }

        if (sSpawnTag == "sw_patrolgroup")
        {
            sFlags = "SP_SN05_SA_SG_PR31T2_CD300T2";
            sTemplate = "patrolgroup";
        }

        // This one adds to the current spawn tags, so you can
        // specify the number you want in the waypoint name
        if (sSpawnTag ==  "sw_num_watchman")
        {
            sFlags = sSpawnName + "_SA_CD300T2";
            sTemplate = "citywatchman";
        }
    }

    else if (nFlagTableNumber == 32)
    {
        if (sSpawnTag == "k_patrol_010")
        {
            sFlags = "SP_SN05_SA_PR10_SS10_HB10_CD300T2";
            sTemplate = "k_patrol_010";
        }
    }

   // Sample Complex Replacement
    // Using FT without FT00 will
    // Default to nFlagTableNumber 0
    if (nFlagTableNumber == 0)
    {
        // Old Method of using SpawnTag
        if (sSpawnTag == "alleythief")
        {
            sFlags = "SP_SD99";
            sTemplate = "alleythief";
        }

        if (sSpawnTag == "undead")
        {
            sFlags = "SP_SNO4";
            sTemplate = "NW_ZOMBIE01";
        }
    }
    //

    // Sample Simple Replacement Flag
    // Completely Replaces Flags
    // On Spawnpoints with FT01
    if (nFlagTableNumber == 2)
    {
        sFlags = "SP_PR11_PC01";
        sTemplate = "alleythief";
    }
    //

    // Sample Template Flags
    // These Flags Get Added
    // To Spawnpoints with FT02
    if (nFlagTableNumber == 2)
    {
        sFlags = "_RW_PC05R";
    }
    //


// -------------------------------------------
// Only Make Modifications Between These Lines
//

    // Record Values
    if (sFlags != "")
    {
        SetLocalString(oSpawn, "f_Flags", sFlags);
    }
    else
    {
        SetLocalString(oSpawn, "f_Flags", sSpawnName);
    }
    if (sTemplate != "")
    {
        SetLocalString(oSpawn, "f_Template", sTemplate);
    }
    else
    {
        SetLocalString(oSpawn, "f_Template", sSpawnTag);
    }
}
