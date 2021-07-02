//
// Spawn Groups
//
//
// nChildrenSpawned
// : Number of Total Children ever Spawned
//
// nSpawnCount
// : Number of Children currently Alive
//
// nSpawnNumber
// : Number of Children to Maintain at Spawn
//
// nRandomWalk
// : Walking Randomly? TRUE/FALSE
//
// nPlaceable
// : Spawning Placeables? TRUE/FALSE
//
//
int ParseFlagValue(string sName, string sFlag, int nDigits, int nDefault);
int ParseSubFlagValue(string sName, string sFlag, int nDigits, string sSubFlag, int nSubDigits, int nDefault);
object GetChildByTag(object oSpawn, string sChildTag);
object GetChildByNumber(object oSpawn, int nChildNum);
object GetSpawnByID(int nSpawnID);
void DeactivateSpawn(object oSpawn);
void DeactivateSpawnsByTag(string sSpawnTag);
void DeactivateAllSpawns();
void DespawnChildren(object oSpawn);
void DespawnChildrenByTag(object oSpawn, string sSpawnTag);
//
//
string SpawnGroup(object oSpawn, string sTemplate)
{
    // Initialize
    string sRetTemplate;

    // Initialize Values
    int nSpawnNumber = GetLocalInt(oSpawn, "f_SpawnNumber");
    int nRandomWalk = GetLocalInt(oSpawn, "f_RandomWalk");
    int nPlaceable = GetLocalInt(oSpawn, "f_Placeable");
    int nChildrenSpawned = GetLocalInt(oSpawn, "ChildrenSpawned");
    int nSpawnCount = GetLocalInt(oSpawn, "SpawnCount");

//
// Only Make Modifications Between These Lines
// -------------------------------------------

    if (sTemplate == "chest_locked")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "chest002"; break;
                    case 1: sRetTemplate = "chest003"; break;
                    case 2: sRetTemplate = "chest004"; break;
                    case 3: sRetTemplate = "chest005"; break;
                }
    }

    if (sTemplate == "chest_locked2")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "chest006"; break;
                    case 1: sRetTemplate = "chest007"; break;
                    case 2: sRetTemplate = "chest008"; break;
                    case 3: sRetTemplate = "chest009"; break;
                }
    }

    if (sTemplate == "chest_locked_trapped")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "chest010"; break;
                    case 1: sRetTemplate = "chest011"; break;
                    case 2: sRetTemplate = "chest012"; break;
                    case 3: sRetTemplate = "chest013"; break;
                }
    }

    if (sTemplate == "box")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "box002"; break;
                    case 1: sRetTemplate = "box003"; break;
                    case 2: sRetTemplate = "box004"; break;
                    case 3: sRetTemplate = "box005"; break;
                }
    }


    if (sTemplate == "furniture")
    {
        switch( Random( 8 ))
                {
                    case 0: sRetTemplate = "desk001"; break;
                    case 1: sRetTemplate = "desk002"; break;
                    case 2: sRetTemplate = "couch001"; break;
                    case 3: sRetTemplate = "armoire001"; break;
                    case 4: sRetTemplate = "bookshelf001"; break;
                    case 5: sRetTemplate = "cabinet001"; break;
                    case 6: sRetTemplate = "chstdrwrs001"; break;
                    case 7: sRetTemplate = "bookshelf001"; break;
                }
    }


   if (sTemplate == "misc")
    {
        switch( Random( 10 ))
                {
                    case 0: sRetTemplate = "pottedplant001"; break;
                    case 1: sRetTemplate = "pottedplant001"; break;
                    case 2: sRetTemplate = "urn001"; break;
                    case 3: sRetTemplate = "woodpile001"; break;
                    case 4: sRetTemplate = "birdcage001"; break;
                    case 5: sRetTemplate = "barrel001"; break;
                    case 6: sRetTemplate = "barrel001"; break;
                    case 7: sRetTemplate = "pottedplant001"; break;
                    case 8: sRetTemplate = "cot001"; break;
                    case 9: sRetTemplate = "pntingeasel001"; break;
                }
    }

     if (sTemplate == "housethief")
    {
        switch( Random( 14 ))
                {
                    case 0: sRetTemplate = "thief001"; break;
                    case 1: sRetTemplate = "thief002"; break;
                    case 2: sRetTemplate = "thief003"; break;
                    case 3: sRetTemplate = "thief004"; break;
                    case 4: sRetTemplate = "thief"; break;
                    case 5: sRetTemplate = "cc_thief_01"; break;
                    case 6: sRetTemplate = "cc_thief_02"; break;
                    case 7: sRetTemplate = "cc_thief_03"; break;
                    case 8: sRetTemplate = "cc_thief_04"; break;
                    case 9: sRetTemplate = "streetthug"; break;
                    case 10: sRetTemplate = "streetthug001"; break;
                    case 11: sRetTemplate = "streetthug002"; break;
                    case 12: sRetTemplate = "streetthug003"; break;
                    case 13: sRetTemplate = "streetthug004"; break;

                    }
    }

if (sTemplate == "small")
    {
        switch( Random( 18 ))
                {
                    case 0: sRetTemplate = "tavern001"; break;
                    case 1: sRetTemplate = "tavern002"; break;
                    case 2: sRetTemplate = "tavern003"; break;
                    case 3: sRetTemplate = "tavern004"; break;
                    case 4: sRetTemplate = "tavern013"; break;
                    case 5: sRetTemplate = "tavern016"; break;
                    case 6: sRetTemplate = "tavern015"; break;
                    case 7: sRetTemplate = "tavern017"; break;
                    case 8: sRetTemplate = "goblina002"; break;
                    case 9: sRetTemplate = "goblina002"; break;
                    case 10: sRetTemplate = "tavern001"; break;
                    case 11: sRetTemplate = "tavern002"; break;
                    case 12: sRetTemplate = "tavern003"; break;
                    case 13: sRetTemplate = "tavern004"; break;
                    case 14: sRetTemplate = "tavern013"; break;
                    case 15: sRetTemplate = "tavern016"; break;
                    case 16: sRetTemplate = "tavern015"; break;
                    case 17: sRetTemplate = "tavern017"; break;
                }
    }

if (sTemplate == "drunks")
    {
        switch( Random( 8 ))
                {
                    case 0: sRetTemplate = "sailor003"; break;
                    case 1: sRetTemplate = "sailor004"; break;
                    case 2: sRetTemplate = "hooker001"; break;
                    case 3: sRetTemplate = "sailor005"; break;
                    case 4: sRetTemplate = "ruffian002"; break;
                    case 5: sRetTemplate = "ruffian003"; break;
                    case 6: sRetTemplate = "streetthug005"; break;
                    case 7: sRetTemplate = "streetthug006"; break;
                }
    }

if(sTemplate == "elves")
{
    switch(d4())
    {
            case 1: sRetTemplate = "tavern005"; break;
            case 2: sRetTemplate = "tavern006"; break;
            case 3: sRetTemplate = "tavern007"; break;
            case 4: sRetTemplate = "tavern009"; break;
    }
}



if(sTemplate == "adventurers")
{
    switch(Random(15))
    {
            case 0: sRetTemplate = "adventurer"; break;
            case 1: sRetTemplate = "adventurer001"; break;
            case 2: sRetTemplate = "adventurer002"; break;
            case 3: sRetTemplate = "adventurer003"; break;
            case 4: sRetTemplate = "adventurer004"; break;
            case 5: sRetTemplate = "adventurer005"; break;
            case 6: sRetTemplate = "adventurer006"; break;
            case 7: sRetTemplate = "adventurer007"; break;
            case 8: sRetTemplate = "adventurer008"; break;
            case 9: sRetTemplate = "ruffian001"; break;
            case 10: sRetTemplate = "ruffian"; break;
            case 11: sRetTemplate = "sailor"; break;
            case 12: sRetTemplate = "sailor001"; break;
            case 13: sRetTemplate = "sailor002"; break;
            case 14: sRetTemplate = "hooker"; break;
    }
}

if (sTemplate == "commoner")
    {

    switch( Random( 82 ))
                {
                    case 0: sRetTemplate = "femaledwarvencit"; break;
                    case 1: sRetTemplate = "femaleelvencitiz"; break;
                    case 2: sRetTemplate = "femalegnomishcit"; break;
                    case 3: sRetTemplate = "femalehalfelvenc"; break;
                    case 4: sRetTemplate = "femalehalflingci"; break;
                    case 5: sRetTemplate = "femalehalforccit"; break;
                    case 6: sRetTemplate = "femalehumancitiz"; break;
                    case 7: sRetTemplate = "maledwarvencitiz"; break;
                    case 8: sRetTemplate = "maleelvencitizen"; break;
                    case 9: sRetTemplate = "malegnomishcitiz"; break;
                    case 10: sRetTemplate = "malehalfelvencit"; break;
                    case 11: sRetTemplate = "malehalflingciti"; break;
                    case 12: sRetTemplate = "malehalforccitiz"; break;
                    case 13: sRetTemplate = "malehumancitizen"; break;
                    case 14: sRetTemplate = "malehumanciti001"; break;
                    case 15: sRetTemplate = "femaledwarven001"; break;
                    case 16: sRetTemplate = "femaleelvenci001"; break;
                    case 17: sRetTemplate = "femalegnomish001"; break;
                    case 18: sRetTemplate = "femalehalfelv001"; break;
                    case 19: sRetTemplate = "femalehalflin002"; break;
                    case 20: sRetTemplate = "femalehalforc001"; break;
                    case 21: sRetTemplate = "femalehalforc001"; break;
                    case 22: sRetTemplate = "femalehumanci001"; break;
                    case 23: sRetTemplate = "maledwarvenci003"; break;
                    case 24: sRetTemplate = "maleelvenciti001"; break;
                    case 25: sRetTemplate = "malegnomishci001"; break;
                    case 26: sRetTemplate = "malehalflingc001"; break;
                    case 27: sRetTemplate = "malehalforcci001"; break;
                    case 28: sRetTemplate = "malehumancitizen"; break;
                    case 29: sRetTemplate = "malehumanciti001"; break;
                    case 30: sRetTemplate = "malehumancitizen"; break;
                    case 31: sRetTemplate = "malehumanciti001"; break;
                    case 32: sRetTemplate = "malehumancitizen"; break;
                    case 33: sRetTemplate = "malehumanciti001"; break;
                    case 34: sRetTemplate = "malehumancitizen"; break;
                    case 35: sRetTemplate = "malehumanciti001"; break;
                    case 36: sRetTemplate = "malehumancitizen"; break;
                    case 37: sRetTemplate = "malehumanciti001"; break;
                    case 38: sRetTemplate = "malehumancitizen"; break;
                    case 39: sRetTemplate = "malehumanciti001"; break;
                    case 40: sRetTemplate = "malehumancitizen"; break;
                    case 41: sRetTemplate = "malehumanciti001"; break;
                    case 42: sRetTemplate = "malehumancitizen"; break;
                    case 43: sRetTemplate = "malehumanciti001"; break;
                    case 44: sRetTemplate = "dog002"; break;
                    case 45: sRetTemplate = "dog002"; break;
                    case 46: sRetTemplate = "femalehumancitiz"; break;
                    case 47: sRetTemplate = "femalehumanci001"; break;
                    case 48: sRetTemplate = "femalehumancitiz"; break;
                    case 49: sRetTemplate = "femalehumanci001"; break;
                    case 50: sRetTemplate = "femalehumancitiz"; break;
                    case 51: sRetTemplate = "femalehumanci001"; break;
                    case 52: sRetTemplate = "femalehumancitiz"; break;
                    case 53: sRetTemplate = "femalehumanci001"; break;
                    case 54: sRetTemplate = "femalehumancitiz"; break;
                    case 55: sRetTemplate = "femalehumanci001"; break;
                    case 56: sRetTemplate = "femalehumancitiz"; break;
                    case 57: sRetTemplate = "femalehumanci001"; break;
                    case 58: sRetTemplate = "femalehumancitiz"; break;
                    case 59: sRetTemplate = "femalehumanci001"; break;
                    case 60: sRetTemplate = "maledwarvencitiz"; break;
                    case 61: sRetTemplate = "maleelvencitizen"; break;
                    case 62: sRetTemplate = "femaledwarvencit"; break;
                    case 63: sRetTemplate = "femaleelvenci001"; break;
                    case 64: sRetTemplate = "maleelvenciti001"; break;
                    case 65: sRetTemplate = "femaleelvencitiz"; break;
                    case 66: sRetTemplate = "malehalflingc001"; break;
                    case 67: sRetTemplate = "malehalflingciti"; break;
                    case 68: sRetTemplate = "femalehalflin002"; break;
                    case 69: sRetTemplate = "femalehalflingci"; break;
                    case 70: sRetTemplate = "femalegnomishcit"; break;
                    case 71: sRetTemplate = "malegnomishci001"; break;
                    case 72: sRetTemplate = "malekid002"; break;
                    case 73: sRetTemplate = "malekid002"; break;
                    case 74: sRetTemplate = "malekid002"; break;
                    case 75: sRetTemplate = "malekid002"; break;
                    case 76: sRetTemplate = "malekid002"; break;
                    case 77: sRetTemplate = "femalekid002"; break;
                    case 78: sRetTemplate = "femalekid002"; break;
                    case 79: sRetTemplate = "femalekid002"; break;
                    case 80: sRetTemplate = "femalekid002"; break;
                    case 81: sRetTemplate = "femalekid002"; break;
    }
 }

if(sTemplate == "sw_performer")

{
    switch(Random(5))
    {
        case 0: sRetTemplate = "actor"; break;
        case 1: sRetTemplate = "actor001"; break;
        case 2: sRetTemplate = "actor002"; break;
        case 3: sRetTemplate = "actor003"; break;
        case 4: sRetTemplate = "trainedtroll"; break;
    }
}

//rat hills tables

    if (GetStringLeft(sTemplate, 9) == "rat_hills")
    {
        int nCounterCur;    // current counter, starts at 1st mob
        int nCounterMax;    // maximum number in a particular encounter
        int nRandom;        // general random number
        int nLoot = 500;    // default loot merchant to be used for treasure if not specified
        int nStart;         // starting blueprint _xx suffix number (ie to start at _03 would be 3)
        int nMaxVariance;   // total number of consecutive _xx values (ie _03 to _08 would be 5)
        string sBlue;       // blueprint prefix
        string sCurrentTemplate = GetLocalString(oSpawn, "TemplateCur");  // current monster template

        // ********************************* CUSTOMIZE BELOW HERE *****************************************************************

        if (sCurrentTemplate == "")
        {
            nRandom = Random(14) +1;

            switch (nRandom)
            {
                case 1: sBlue = "gelatenouscube"; nCounterMax = 1; nMaxVariance = 0; nStart = 0; nLoot = 551; break;
                case 2: sBlue = "rn_beetle_med_03"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 3: sBlue = "rn_rustmonster"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 4: sBlue = "rn_violetfungus"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 551; break;
                case 5: sBlue = "rn_vampire_01"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 6: sBlue = "rn_spider_05"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 7: sBlue = "rn_wererat"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 8: sBlue = "rn_skeleton_06"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 9: sBlue = "rn_wolf_03"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 10: sBlue = "rn_owlbear_01"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 11: sBlue = "rn_wasp_01"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 12: sBlue = "rn_greenhag_01"; nCounterMax = 1; nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 13: sBlue = "rn_zombie_04"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                case 14: sBlue = "rn_viper_04"; nCounterMax = d2() ; nMaxVariance = 0; nStart = 0; nLoot = 500; break;


        // ********************************* CUSTOMIZE ABOVE HERE *****************************************************************
            }
            SetLocalInt(oSpawn, "CounterMax", nCounterMax);
            SetLocalInt(oSpawn, "f_LootTable", nLoot);
            SetLocalInt(oSpawn, "MaxVariance", nMaxVariance);
            SetLocalInt(oSpawn, "Start", nStart);
            SetLocalString(oSpawn, "Blue", sBlue);
        }

        // Set variables for the current mob
        nCounterCur = GetLocalInt(oSpawn, "CounterCur");
        nCounterMax = GetLocalInt(oSpawn, "CounterMax");
        nLoot = GetLocalInt(oSpawn, "f_LootTable");
        nMaxVariance = GetLocalInt(oSpawn, "MaxVariance");
        nStart = GetLocalInt(oSpawn, "Start");
        sBlue = GetLocalString(oSpawn, "Blue");

        // Spawn random multiple template mobs (must follow Sareena's mob template numbering)
        if ((nCounterCur < nCounterMax) && (GetStringRight(sBlue,1) == "_"))   //changed <= to <
        {
            nRandom = Random(nMaxVariance) + nStart;
            switch (nRandom)
            {
                case 1:  sCurrentTemplate = sBlue + "01"; break;
                case 2:  sCurrentTemplate = sBlue + "02"; break;
                case 3:  sCurrentTemplate = sBlue + "03"; break;
                case 4:  sCurrentTemplate = sBlue + "04"; break;
                case 5:  sCurrentTemplate = sBlue + "05"; break;
                case 6:  sCurrentTemplate = sBlue + "06"; break;
                case 7:  sCurrentTemplate = sBlue + "07"; break;
                case 8:  sCurrentTemplate = sBlue + "08"; break;
                case 9:  sCurrentTemplate = sBlue + "09"; break;
            }

            sRetTemplate = sCurrentTemplate;
            SetLocalString(oSpawn, "TemplateCur", sRetTemplate);

        //    SetLocalInt(oSpawn, "f_LootTable", nLoot);  // default loot for mob

            nCounterCur++;
            SetLocalInt(oSpawn, "CounterCur", nCounterCur);
        }

        // Spawn single template mobs
        else if ((nCounterCur < nCounterMax) && (GetStringRight(sBlue,1) != "_"))  //changed <= to <
        {
            sRetTemplate = sBlue;
            SetLocalString(oSpawn, "TemplateCur", sRetTemplate);

            nCounterCur++;
            SetLocalInt(oSpawn, "CounterCur", nCounterCur);
        }

        // All spawns are done, clear the variables for next spawn
        else
        {
            sCurrentTemplate = "";
            DelayCommand(10.0, DeleteLocalString(oSpawn, "TemplateCur"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "CounterCur"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "CounterMax"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "f_LootTable"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "MaxVariance"));
            DelayCommand(10.0, DeleteLocalString(oSpawn, "Blue"));
        }
    }

//dungeon tables

    if (GetStringLeft(sTemplate, 8) == "dungeon_")
    {
        int nCounterCur;    // current counter, starts at 1st mob
        int nCounterMax;    // maximum number in a particular encounter
        int nRandom;        // general random number
        int nLoot = 500;    // default loot merchant to be used for treasure if not specified
        int nStart;         // starting blueprint _xx suffix number (ie to start at _03 would be 3)
        int nMaxVariance;   // total number of consecutive _xx values (ie _03 to _08 would be 5)
        string sBlue;       // blueprint prefix
        string sCurrentTemplate = GetLocalString(oSpawn, "TemplateCur");  // current monster template

        // ********************************* CUSTOMIZE BELOW HERE *****************************************************************

        if (sCurrentTemplate == "")
        {

            if (GetStringRight(sTemplate, 4) == "_cr1")
            {
                nRandom = Random(10) +1;

                switch (nRandom)
                {
                    case 1: sBlue = "rn_infectedrat"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 2: sBlue = "rn_beetle_med_01"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 3: sBlue = "rn_kobold_"; nCounterMax = d6() +3; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 4: sBlue = "rn_skeleton_"; nCounterMax = d3() +1; nMaxVariance = 4; nStart = 1; nLoot = 999; break;
                    case 5: sBlue = "rn_zombie_"; nCounterMax = d3(); nMaxVariance = 2; nStart = 1; nLoot = 999; break;
                    case 6: sBlue = "rn_spider_02"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 7: sBlue = "rn_krenshar"; nCounterMax = 1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 8: sBlue = "rn_goblin_"; nCounterMax = d4() +2; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 9: sBlue = "rn_direrat_01"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 10: sBlue = "rn_stirge"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                }
            }
            else if (GetStringRight(sTemplate, 4) == "_cr2")
            {
                nRandom = Random(11) +1;

                switch (nRandom)
                {
                    case 1: sBlue = "rn_spider_03"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 2: sBlue = "rn_hobgoblin_"; nCounterMax = d4() +2; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 3: sBlue = "rn_lizardfolk_"; nCounterMax = d3(); nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 4: sBlue = "rn_orc_"; nCounterMax = d4() +2; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 5: sBlue = "rn_zombie_"; nCounterMax = d4() +2; nMaxVariance = 2; nStart = 1; nLoot = 999; break;
                    case 6: sBlue = "rn_ghoul"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 7: sBlue = "rn_beetle_med_02"; nCounterMax = d3()+1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 8: sBlue = "rn_ant_01"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                    case 9: sBlue = "rn_gnoll_"; nCounterMax = d3(); nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 10: sBlue = "rn_adventurer_"; nCounterMax = d3(); nMaxVariance = 7; nStart = 1; nLoot = 999; break;
                    case 11: sBlue = "rn_ironfang_"; nCounterMax = d3(); nMaxVariance = 7; nStart = 1; nLoot = 550; break;
                }
            }
            else if (GetStringRight(sTemplate, 4) == "_cr3")
            {
                nRandom = Random(12) +1;

                switch (nRandom)
                {
                    case 1: sBlue = "rn_stinger_01"; nCounterMax = 1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 2: sBlue = "rn_beetle_med_03"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 3: sBlue = "rn_spider_04"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 4: sBlue = "rn_imp"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 500; break;
                    case 5: sBlue = "rn_gnoll_"; nCounterMax = d3() +2; nMaxVariance = 4; nStart = 1; nLoot = 999; break;
                    case 6: sBlue = "rn_duergar_"; nCounterMax = d4() +1; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 7: sBlue = "rn_derro_"; nCounterMax = d3(); nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 8: sBlue = "rn_ghast_01"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 9: sBlue = "gelatenouscube"; nCounterMax = 1; nMaxVariance = 0; nStart = 0; nLoot = 551; break;
                    case 10: sBlue = "rn_rustedbld_"; nCounterMax = d3(); nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 11: sBlue = "rn_kobold_"; nCounterMax = d6() +2; nMaxVariance = 7; nStart = 1; nLoot = 550; break;
                    case 12: sBlue = "rn_ironfang_"; nCounterMax = d3()+2; nMaxVariance = 7; nStart = 1; nLoot = 550; break;
                }
            }
            else if (GetStringRight(sTemplate, 4) == "_cr4")
            {
                nRandom = Random(12) +1;

                switch (nRandom)
                {
                    case 1: sBlue = "rn_orc_"; nCounterMax = d6() +3; nMaxVariance = 7; nStart = 1; nLoot = 550; break;
                    case 2: sBlue = "rn_goblin_"; nCounterMax = d6() +3; nMaxVariance = 7; nStart = 1; nLoot = 550; break;
                    case 3: sBlue = "rn_adventurer_"; nCounterMax = d4() +2; nMaxVariance = 4; nStart = 1; nLoot = 999; break;
                    case 4: sBlue = "rn_stinger_01"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 550; break;
                    case 5: sBlue = "rn_rustedbld_"; nCounterMax = d4() +1; nMaxVariance = 5; nStart = 1; nLoot = 550; break;
                    case 6: sBlue = "rn_derro_"; nCounterMax = d3() +2; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 7: sBlue = "rn_ogre_"; nCounterMax = d3(); nMaxVariance = 2; nStart = 1; nLoot = 550; break;
                    case 8: sBlue = "rn_rustmonster"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 9: sBlue = "rn_wight"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 10: sBlue = "rn_lizardfolk_"; nCounterMax = d4() +2; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 11: sBlue = "rn_formian_02"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 550; break;
                    case 12: sBlue = "rn_vampire_01"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                }
            }
            else if (GetStringRight(sTemplate, 4) == "_cr5")
            {
                nRandom = Random(11) +1;

                switch (nRandom)
                {
                    case 1: sBlue = "rn_spider_05"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 2: sBlue = "rn_bugbear_"; nCounterMax = d3() +2; nMaxVariance = 4; nStart = 1; nLoot = 550; break;
                    case 3: sBlue = "rn_ogre_"; nCounterMax = d3() +1; nMaxVariance = 2; nStart = 1; nLoot = 550; break;
                    case 4: sBlue = "rn_mummy_01"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 5: sBlue = "rn_wraith_01"; nCounterMax = d2(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 6: sBlue = "rn_mephit_"; nCounterMax = d3(); nMaxVariance = 9; nStart = 1; nLoot = 550; break;
                    case 7: sBlue = "rn_worg_01"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 8: sBlue = "rn_skeleton_06"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 9: sBlue = "rn_ant_02"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 10: sBlue = "rn_werewolf_01"; nCounterMax = d3(); nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                    case 11: sBlue = "rn_wererat_01"; nCounterMax = d3() +1; nMaxVariance = 0; nStart = 0; nLoot = 999; break;
                }

        // ********************************* CUSTOMIZE ABOVE HERE *****************************************************************
            }
            SetLocalInt(oSpawn, "CounterMax", nCounterMax);
            SetLocalInt(oSpawn, "f_LootTable", nLoot);
            SetLocalInt(oSpawn, "MaxVariance", nMaxVariance);
            SetLocalInt(oSpawn, "Start", nStart);
            SetLocalString(oSpawn, "Blue", sBlue);
        }

        // Set variables for the current mob
        nCounterCur = GetLocalInt(oSpawn, "CounterCur");
        nCounterMax = GetLocalInt(oSpawn, "CounterMax");
        nLoot = GetLocalInt(oSpawn, "f_LootTable");
        nMaxVariance = GetLocalInt(oSpawn, "MaxVariance");
        nStart = GetLocalInt(oSpawn, "Start");
        sBlue = GetLocalString(oSpawn, "Blue");

        // Spawn random multiple template mobs (must follow Sareena's mob template numbering)
        if ((nCounterCur < nCounterMax) && (GetStringRight(sBlue,1) == "_"))   //changed <= to <
        {
            nRandom = Random(nMaxVariance) + nStart;
            switch (nRandom)
            {
                case 1:  sCurrentTemplate = sBlue + "01"; break;
                case 2:  sCurrentTemplate = sBlue + "02"; break;
                case 3:  sCurrentTemplate = sBlue + "03"; break;
                case 4:  sCurrentTemplate = sBlue + "04"; break;
                case 5:  sCurrentTemplate = sBlue + "05"; break;
                case 6:  sCurrentTemplate = sBlue + "06"; break;
                case 7:  sCurrentTemplate = sBlue + "07"; break;
                case 8:  sCurrentTemplate = sBlue + "08"; break;
                case 9:  sCurrentTemplate = sBlue + "09"; break;
            }

            sRetTemplate = sCurrentTemplate;
            SetLocalString(oSpawn, "TemplateCur", sRetTemplate);

        //    SetLocalInt(oSpawn, "f_LootTable", nLoot);  // default loot for mob

            nCounterCur++;
            SetLocalInt(oSpawn, "CounterCur", nCounterCur);
        }

        // Spawn single template mobs
        else if ((nCounterCur < nCounterMax) && (GetStringRight(sBlue,1) != "_"))  //changed <= to <
        {
            sRetTemplate = sBlue;
            SetLocalString(oSpawn, "TemplateCur", sRetTemplate);

            nCounterCur++;
            SetLocalInt(oSpawn, "CounterCur", nCounterCur);
        }

        // All spawns are done, clear the variables for next spawn
        else
        {
            sCurrentTemplate = "";
            DelayCommand(10.0, DeleteLocalString(oSpawn, "TemplateCur"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "CounterCur"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "CounterMax"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "f_LootTable"));
            DelayCommand(10.0, DeleteLocalInt(oSpawn, "MaxVariance"));
            DelayCommand(10.0, DeleteLocalString(oSpawn, "Blue"));
        }
    }

    //
    if (sTemplate == "rustedblades")
    {
        int nBlade = Random(7) + 1;
        sRetTemplate = "rn_rustedbld_0" + IntToString(nBlade);
    }
    //


if (sTemplate == "sailors")
{
    switch(Random(33))
    {
        case 0: sRetTemplate = "sailor01"; break;
        case 1: sRetTemplate = "sailor02"; break;
        case 2: sRetTemplate = "sailor03"; break;
        case 3: sRetTemplate = "sailor04"; break;
        case 4: sRetTemplate = "sailor05"; break;
        case 5: sRetTemplate = "sailor06"; break;
        case 6: sRetTemplate = "sailor07"; break;
        case 7: sRetTemplate = "sailor08"; break;
        case 8: sRetTemplate = "sailor09"; break;
        case 9: sRetTemplate = "sailor10"; break;
        case 10: sRetTemplate = "prostitute01"; break;
        case 11: sRetTemplate = "prostitute02"; break;
        case 12: sRetTemplate = "prostitute03"; break;
        case 13: sRetTemplate = "prostitute04"; break;
        case 14: sRetTemplate = "prostitute05"; break;
        case 15: sRetTemplate = "prostitute06"; break;
        case 16: sRetTemplate = "prostitute07"; break;
        case 17: sRetTemplate = "prostitute08"; break;
        case 18: sRetTemplate = "prostitute09"; break;
        case 19: sRetTemplate = "prostitute10"; break;
        case 20: sRetTemplate = "tavern001"; break;
        case 21: sRetTemplate = "tavern002"; break;
        case 22: sRetTemplate = "tavern003"; break;
        case 23: sRetTemplate = "tavern004"; break;
        case 24: sRetTemplate = "tavern005"; break;
        case 25: sRetTemplate = "tavern006"; break;
        case 26: sRetTemplate = "tavern007"; break;
        case 27: sRetTemplate = "tavern008"; break;
        case 28: sRetTemplate = "tavern009"; break;
        case 29: sRetTemplate = "tavern010"; break;
        case 30: sRetTemplate = "tavern011"; break;
        case 31: sRetTemplate = "tavern012"; break;
        case 32: sRetTemplate = "tavern013"; break;
    }
}

if(sTemplate == "sw_vermin_lesser")

{
    switch(Random(10))
    {
        case 0: sRetTemplate = "ratdire002"; break;
        case 1: sRetTemplate = "rat004"; break;
        case 2: sRetTemplate = "btlfire001"; break;
        case 3: sRetTemplate = "tinyspider"; break;
        case 4: sRetTemplate = "tinyspider001"; break;
        case 5: sRetTemplate = "tinyspider002"; break;
        case 6: sRetTemplate = "ashrat"; break;
        case 7: sRetTemplate = "bat001"; break;
        case 8: sRetTemplate = "074_stirge"; break;
        case 10: sRetTemplate = "violetfungus"; break;
    }
}

if(sTemplate == "sw_vermin")

{
    switch(Random(11))
    {
        case 0: sRetTemplate = "nw_wererat"; break;
        case 1: sRetTemplate = "nw_btlbomb"; break;
        case 2: sRetTemplate = "btlfire003"; break;
        case 3: sRetTemplate = "nw_btlstink"; break;
        case 4: sRetTemplate = "tinyspider003"; break;
        case 5: sRetTemplate = "nw_spidphase"; break;
        case 6: sRetTemplate = "nw_spidswrd"; break;
        case 7: sRetTemplate = "nw_spidwra"; break;
        case 8: sRetTemplate = "nw_ettercap"; break;
        case 9: sRetTemplate = "nw_werewolf"; break;
        case 10: sRetTemplate = "diretoad"; break;
    }
}

if(sTemplate == "sw_vermin_greater")

{
    switch(Random(8))
    {
        case 0: sRetTemplate = "nw_btlstag"; break;
        case 1: sRetTemplate = "nw_spiderboss"; break;
        case 2: sRetTemplate = "nw_spiddire"; break;
        case 3: sRetTemplate = "nw_beetleboss"; break;
        case 4: sRetTemplate = "nw_werecat"; break;
        case 5: sRetTemplate = "tinyspider005"; break;
        case 6: sRetTemplate = "colossalspider"; break;
        case 7: sRetTemplate = "tinyspider004"; break;
    }
}

if(sTemplate == "sw_beasts")

{
    switch(Random(22))
    {
        case 0: sRetTemplate = "nw_grayrend"; break;
        case 1: sRetTemplate = "nw_horror"; break;
        case 2: sRetTemplate = "nw_devour"; break;
        case 3: sRetTemplate = "nw_umberhulk"; break;
        case 4: sRetTemplate = "nw_minotaur"; break;
        case 5: sRetTemplate = "nw_minchief"; break;
        case 6: sRetTemplate = "nw_minotaurboss"; break;
        case 7: sRetTemplate = "nw_minwiz"; break;
        case 8: sRetTemplate = "manticore"; break;
        case 9: sRetTemplate = "drider"; break;
        case 10: sRetTemplate = "drider001"; break;
        case 11: sRetTemplate = "thexanathar001"; break;
        case 12: sRetTemplate = "gelatenouscube"; break;
        case 13: sRetTemplate = "mindflayer"; break;
        case 14: sRetTemplate = "rustmonster"; break;
        case 15: sRetTemplate = "grayooze"; break;
        case 16: sRetTemplate = "blackpudding"; break;
        case 17: sRetTemplate = "ochrejelly"; break;
        case 18: sRetTemplate = "ochrejelly001"; break;
        case 19: sRetTemplate = "ochrejelly002"; break;
        case 20: sRetTemplate = "nishruu"; break;
        case 21: sRetTemplate = "nyth"; break;
    }
}

if(sTemplate == "sw_demon_lesser")

{
    switch(Random(15))
    {
        case 0: sRetTemplate = "nw_imp"; break;
        case 1: sRetTemplate = "nw_dmquasit"; break;
        case 2: sRetTemplate = "nw_mepsalt"; break;
        case 3: sRetTemplate = "nw_mepsteam"; break;
        case 4: sRetTemplate = "nw_mepmagma"; break;
        case 5: sRetTemplate = "nw_mepfire"; break;
        case 6: sRetTemplate = "nw_mepearth"; break;
        case 7: sRetTemplate = "nw_mepdust"; break;
        case 8: sRetTemplate = "nw_mepair"; break;
        case 9: sRetTemplate = "nw_mepice"; break;
        case 10: sRetTemplate = "nw_mepooze"; break;
        case 11: sRetTemplate = "nw_mepwater"; break;
        case 12: sRetTemplate = "nw_hellhound"; break;
        case 13: sRetTemplate = "grayooze"; break;
        case 14: sRetTemplate = "gelatenouscube"; break;
    }
}

if(sTemplate == "sw_demon")

{
    switch(Random(13))
    {
        case 0: sRetTemplate = "nw_rakshasa"; break;
        case 1: sRetTemplate = "nw_dmsucubus"; break;
        case 2: sRetTemplate = "nw_dmvrock"; break;
        case 3: sRetTemplate = "nw_slaadbl"; break;
        case 4: sRetTemplate = "nw_slaadgrn"; break;
        case 5: sRetTemplate = "nw_slaadred"; break;
        case 6: sRetTemplate = "blackpudding"; break;
        case 7: sRetTemplate = "nishruu"; break;
        case 8: sRetTemplate = "howler"; break;
        case 9: sRetTemplate = "nyth"; break;
        case 10: sRetTemplate = "nw_yuan_ti001"; break;
        case 11: sRetTemplate = "nw_yuan_ti002"; break;
        case 12: sRetTemplate = "nw_yuan_ti003"; break;
    }
}

if(sTemplate == "sw_demon_greater")

{
    switch(Random(8))
    {
        case 0: sRetTemplate = "nw_slaadgray"; break;
        case 1: sRetTemplate = "nw_demon"; break;
        case 2: sRetTemplate = "nw_slaaddeth"; break;
        case 3: sRetTemplate = "nw_slaaddthboss"; break;
        case 4: sRetTemplate = "nw_slaadgryboss"; break;
        case 5: sRetTemplate = "marilith"; break;
        case 6: sRetTemplate = "boneooze"; break;
        case 7: sRetTemplate = "banshee"; break;
    }
}

if(sTemplate == "sw_undead_lesser")

{
    switch(Random(17))
    {
        case 0: sRetTemplate = "skeleton001"; break;
        case 1: sRetTemplate = "nw_zombie01"; break;
        case 2: sRetTemplate = "nw_zombie02"; break;
        case 3: sRetTemplate = "crawlingclaw"; break;
        case 4: sRetTemplate = "skeleton002"; break;
        case 5: sRetTemplate = "skeleton003"; break;
        case 6: sRetTemplate = "skeleton004"; break;
        case 7: sRetTemplate = "skeleton005"; break;
        case 8: sRetTemplate = "skeleton006"; break;
        case 9: sRetTemplate = "skeleton007"; break;
        case 10: sRetTemplate = "skeleton008"; break;
        case 11: sRetTemplate = "skeleton009"; break;
        case 12: sRetTemplate = "skeleton010"; break;
        case 13: sRetTemplate = "skeleton011"; break;
        case 14: sRetTemplate = "skeleton012"; break;
        case 15: sRetTemplate = "skeleton013"; break;
        case 16: sRetTemplate = "skeleton014"; break;
    }
}

if(sTemplate == "sw_undead")

{
    switch(Random(22))
    {
        case 0: sRetTemplate = "nw_ghast"; break;
        case 1: sRetTemplate = "nw_ghoullord"; break;
        case 2: sRetTemplate = "nw_mummy"; break;
        case 3: sRetTemplate = "nw_wight"; break;
        case 4: sRetTemplate = "nw_curst001"; break;
        case 5: sRetTemplate = "nw_curst002"; break;
        case 6: sRetTemplate = "nw_curst003"; break;
        case 7: sRetTemplate = "nw_curst004"; break;
        case 8: sRetTemplate = "nw_skelmage"; break;
        case 9: sRetTemplate = "nw_skelpriest"; break;
        case 10: sRetTemplate = "nw_skelwarr01"; break;
        case 11: sRetTemplate = "nw_skelwarr02"; break;
        case 12: sRetTemplate = "nw_zombtyrant"; break;
        case 13: sRetTemplate = "nw_zombwarr01"; break;
        case 14: sRetTemplate = "nw_zombwarr02"; break;
        case 15: sRetTemplate = "nw_spectre"; break;
        case 16: sRetTemplate = "nw_wraith"; break;
        case 17: sRetTemplate = "nw_ghoul"; break;
        case 18: sRetTemplate = "nw_allip"; break;
        case 19: sRetTemplate = "nw_shadow"; break;
        case 20: sRetTemplate = "fledgelingvampir"; break;
        case 21: sRetTemplate = "annis"; break;
    }
}

if(sTemplate == "sw_undead_high")

{
    switch(Random(14))
    {
        case 0: sRetTemplate = "nw_ghoulboss"; break;
        case 1: sRetTemplate = "nw_mumcleric"; break;
        case 2: sRetTemplate = "nw_mumfight"; break;
        case 3: sRetTemplate = "nw_doomkght"; break;
        case 4: sRetTemplate = "nw_revenant001"; break;
        case 5: sRetTemplate = "vampire001"; break;
        case 6: sRetTemplate = "nw_shfiend"; break;
        case 7: sRetTemplate = "nw_skelchief"; break;
        case 8: sRetTemplate = "nw_zombieboss"; break;
        case 9: sRetTemplate = "nw_bodak"; break;
        case 10: sRetTemplate = "nighthag"; break;
        case 11: sRetTemplate = "nyth"; break;
        case 12: sRetTemplate = "fledgelingvampir"; break;
        case 13: sRetTemplate = "nishruu"; break;
    }
}

if(sTemplate == "sw_undead_impos")

{
    switch(Random(8))
    {
        case 0: sRetTemplate = "nw_mummyboss"; break;
        case 1: sRetTemplate = "nw_doomkghtboss"; break;
        case 2: sRetTemplate = "nw_mohrg"; break;
        case 3: sRetTemplate = "nw_skeldevour"; break;
        case 4: sRetTemplate = "nw_vampire003"; break;
        case 5: sRetTemplate = "nw_vampire004"; break;
        case 6: sRetTemplate = "nw_vampire002"; break;
        case 7: sRetTemplate = "nw_vampire001"; break;
    }
}

if(sTemplate == "bather")
{
    switch( Random(66))
    {
        case 0: sRetTemplate = "tavern014"; break;
        case 1: sRetTemplate = "tavern020"; break;
        case 2: sRetTemplate = "tavern021"; break;
        case 3: sRetTemplate = "tavern022"; break;
        case 4: sRetTemplate = "tavern023"; break;
        case 5: sRetTemplate = "tavern024"; break;
        case 6: sRetTemplate = "tavern025"; break;
        case 7: sRetTemplate = "tavern026"; break;
        case 8: sRetTemplate = "tavern027"; break;
        case 9: sRetTemplate = "tavern028"; break;
        case 10: sRetTemplate = "tavern029"; break;
        case 11: sRetTemplate = "tavern030"; break;
        case 12: sRetTemplate = "tavern031"; break;
        case 13: sRetTemplate = "tavern032"; break;
        case 14: sRetTemplate = "tavern036"; break;
        case 15: sRetTemplate = "tavern023"; break;
        case 16: sRetTemplate = "tavern024"; break;
        case 17: sRetTemplate = "tavern025"; break;
        case 18: sRetTemplate = "tavern028"; break;
        case 19: sRetTemplate = "tavern023"; break;
        case 20: sRetTemplate = "tavern024"; break;
        case 21: sRetTemplate = "tavern025"; break;
        case 22: sRetTemplate = "tavern028"; break;
        case 23: sRetTemplate = "tavern014"; break;
        case 24: sRetTemplate = "tavern020"; break;
        case 25: sRetTemplate = "tavern021"; break;
        case 26: sRetTemplate = "tavern022"; break;
        case 27: sRetTemplate = "tavern026"; break;
        case 28: sRetTemplate = "tavern027"; break;
        case 29: sRetTemplate = "tavern030"; break;
        case 30: sRetTemplate = "tavern031"; break;
        case 31: sRetTemplate = "tavern026"; break;
        case 32: sRetTemplate = "tavern027"; break;
        case 33: sRetTemplate = "tavern030"; break;
        case 34: sRetTemplate = "tavern031"; break;
        case 35: sRetTemplate = "tavern026"; break;
        case 36: sRetTemplate = "tavern027"; break;
        case 37: sRetTemplate = "tavern030"; break;
        case 38: sRetTemplate = "tavern031"; break;
        case 39: sRetTemplate = "tavern026"; break;
        case 40: sRetTemplate = "tavern027"; break;
        case 41: sRetTemplate = "tavern030"; break;
        case 42: sRetTemplate = "tavern031"; break;
        case 43: sRetTemplate = "tavern026"; break;
        case 44: sRetTemplate = "tavern027"; break;
        case 45: sRetTemplate = "tavern030"; break;
        case 46: sRetTemplate = "tavern031"; break;
        case 47: sRetTemplate = "tavern026"; break;
        case 48: sRetTemplate = "tavern027"; break;
        case 49: sRetTemplate = "tavern030"; break;
        case 50: sRetTemplate = "tavern031"; break;
        case 51: sRetTemplate = "tavern026"; break;
        case 52: sRetTemplate = "tavern027"; break;
        case 53: sRetTemplate = "tavern030"; break;
        case 54: sRetTemplate = "tavern031"; break;
        case 55: sRetTemplate = "tavern033"; break;
        case 56: sRetTemplate = "tavern035"; break;
        case 57: sRetTemplate = "tavern033"; break;
        case 58: sRetTemplate = "tavern035"; break;
        case 59: sRetTemplate = "tavern033"; break;
        case 60: sRetTemplate = "tavern035"; break;
        case 61: sRetTemplate = "tavern034"; break;
        case 62: sRetTemplate = "tavern032"; break;
        case 63: sRetTemplate = "tavern034"; break;
        case 64: sRetTemplate = "tavern026"; break;
        case 65: sRetTemplate = "tavern031"; break;
    }
}


if (sTemplate == "taverner")
    {
    SpeakString("Taverners");
        switch( Random( 66 ))
                {
                    case 0: sRetTemplate = "tavern001"; break;
                    case 1: sRetTemplate = "tavern002"; break;
                    case 2: sRetTemplate = "tavern003"; break;
                    case 3: sRetTemplate = "tavern004"; break;
                    case 4: sRetTemplate = "tavern005"; break;
                    case 5: sRetTemplate = "tavern006"; break;
                    case 6: sRetTemplate = "tavern007"; break;
                    case 7: sRetTemplate = "tavern008"; break;
                    case 8: sRetTemplate = "tavern009"; break;
                    case 9: sRetTemplate = "tavern010"; break;
                    case 10: sRetTemplate = "tavern011"; break;
                    case 11: sRetTemplate = "tavern012"; break;
                    case 12: sRetTemplate = "tavern013"; break;
                    case 13: sRetTemplate = "tavern015"; break;
                    case 14: sRetTemplate = "tavern016"; break;
                    case 15: sRetTemplate = "tavern017"; break;
                    case 16: sRetTemplate = "tavern018"; break;
                    case 17: sRetTemplate = "tavern019"; break;
                    case 18: sRetTemplate = "tavern008"; break;
                    case 19: sRetTemplate = "tavern010"; break;
                    case 20: sRetTemplate = "tavern011"; break;
                    case 21: sRetTemplate = "tavern012"; break;
                    case 22: sRetTemplate = "tavern008"; break;
                    case 23: sRetTemplate = "tavern010"; break;
                    case 24: sRetTemplate = "tavern011"; break;
                    case 25: sRetTemplate = "tavern012"; break;
                    case 26: sRetTemplate = "tavern008"; break;
                    case 27: sRetTemplate = "tavern010"; break;
                    case 28: sRetTemplate = "tavern011"; break;
                    case 29: sRetTemplate = "tavern012"; break;
                    case 30: sRetTemplate = "tavern008"; break;
                    case 31: sRetTemplate = "tavern010"; break;
                    case 32: sRetTemplate = "tavern011"; break;
                    case 33: sRetTemplate = "tavern012"; break;
                    case 34: sRetTemplate = "tavern008"; break;
                    case 35: sRetTemplate = "tavern010"; break;
                    case 36: sRetTemplate = "tavern011"; break;
                    case 37: sRetTemplate = "tavern012"; break;
                    case 38: sRetTemplate = "tavern001"; break;
                    case 39: sRetTemplate = "tavern002"; break;
                    case 40: sRetTemplate = "tavern003"; break;
                    case 41: sRetTemplate = "tavern004"; break;
                    case 42: sRetTemplate = "tavern005"; break;
                    case 43: sRetTemplate = "tavern006"; break;
                    case 44: sRetTemplate = "tavern007"; break;
                    case 45: sRetTemplate = "tavern009"; break;
                    case 46: sRetTemplate = "tavern005"; break;
                    case 47: sRetTemplate = "tavern006"; break;
                    case 48: sRetTemplate = "tavern007"; break;
                    case 49: sRetTemplate = "tavern009"; break;
                    case 50: sRetTemplate = "tavern015"; break;
                    case 51: sRetTemplate = "tavern016"; break;
                    case 52: sRetTemplate = "tavern018"; break;
                    case 53: sRetTemplate = "tavern019"; break;
                    case 54: sRetTemplate = "tavern018"; break;
                    case 55: sRetTemplate = "tavern019"; break;
                    case 56: sRetTemplate = "tavern018"; break;
                    case 57: sRetTemplate = "tavern019"; break;
                    case 58: sRetTemplate = "tavern008"; break;
                    case 59: sRetTemplate = "tavern010"; break;
                    case 60: sRetTemplate = "tavern011"; break;
                    case 61: sRetTemplate = "tavern012"; break;
                    case 62: sRetTemplate = "tavern008"; break;
                    case 63: sRetTemplate = "tavern010"; break;
                    case 64: sRetTemplate = "tavern011"; break;
                    case 65: sRetTemplate = "tavern012"; break;
                }
     }


if (sTemplate == "comsingle")
    {
        switch( Random( 28 ))
                {
                    case 0: sRetTemplate = "femaledwarvencit"; break;
                    case 1: sRetTemplate = "femaleelvencitiz"; break;
                    case 2: sRetTemplate = "femalegnomishcit"; break;
                    case 3: sRetTemplate = "femalehalfelvenc"; break;
                    case 4: sRetTemplate = "femalehalflingci"; break;
                    case 5: sRetTemplate = "femalehalforccit"; break;
                    case 6: sRetTemplate = "femalehumancitiz"; break;
                    case 7: sRetTemplate = "maledwarvencitiz"; break;
                    case 8: sRetTemplate = "maleelvencitizen"; break;
                    case 9: sRetTemplate = "malegnomishcitiz"; break;
                    case 10: sRetTemplate = "malehalfelvencit"; break;
                    case 11: sRetTemplate = "malehalflingciti"; break;
                    case 12: sRetTemplate = "malehalforccitiz"; break;
                    case 13: sRetTemplate = "malehumancitizen"; break;
                    case 14: sRetTemplate = "malehumanciti001"; break;
                    case 15: sRetTemplate = "femaledwarven001"; break;
                    case 16: sRetTemplate = "femaleelvenci001"; break;
                    case 17: sRetTemplate = "dog001"; break;
                    case 18: sRetTemplate = "dog001"; break;
                    case 19: sRetTemplate = "femalehalflin002"; break;
                    case 20: sRetTemplate = "dog001"; break;
                    case 21: sRetTemplate = "femalehalforc001"; break;
                    case 22: sRetTemplate = "femalehumanci001"; break;
                    case 23: sRetTemplate = "dog001"; break;
                    case 24: sRetTemplate = "dog001"; break;
                    case 25: sRetTemplate = "dog001"; break;
                    case 26: sRetTemplate = "dog001"; break;
                    case 27: sRetTemplate = "dog001"; break;
                    }
    }

    if (sTemplate == "rug")
    {
        switch( Random( 12 ))
                {
                    case 0: sRetTemplate = "throwrug001"; break;
                    case 1: sRetTemplate = "throwrug002"; break;
                    case 2: sRetTemplate = "throwrug003"; break;
                    case 3: sRetTemplate = "throwrug004"; break;
                    case 4: sRetTemplate = "throwrug005"; break;
                    case 5: sRetTemplate = "throwrug006"; break;
                    case 6: sRetTemplate = "throwrug007"; break;
                    case 7: sRetTemplate = "throwrug008"; break;
                    case 8: sRetTemplate = "throwrug009"; break;
                    case 9: sRetTemplate = "throwrug010"; break;
                    case 10: sRetTemplate = "throwrug0011"; break;
                    case 11: sRetTemplate = "throwrug"; break;
                    }
    }

    if (sTemplate == "undead")
    {
        switch( Random( 30 ))
                {
                    case 0: sRetTemplate = "skeleton001"; break;
                    case 1: sRetTemplate = "skelpriest001"; break;
                    case 2: sRetTemplate = "zombie002"; break;
                    case 3: sRetTemplate = "zombie003"; break;
                    case 4: sRetTemplate = "zombwarr017"; break;
                    case 5: sRetTemplate = "ghoul001"; break;
                    case 6: sRetTemplate = "ghast001"; break;
                    case 7: sRetTemplate = "allip001"; break;
                    case 8: sRetTemplate = "shadow001"; break;
                    case 9: sRetTemplate = "mummy001"; break;
                    case 10: sRetTemplate = "skeleton001"; break;
                    case 11: sRetTemplate = "skeleton001"; break;
                    case 12: sRetTemplate = "skeleton001"; break;
                    case 13: sRetTemplate = "skelpriest001"; break;
                    case 14: sRetTemplate = "zombie002"; break;
                    case 15: sRetTemplate = "zombie003"; break;
                    case 16: sRetTemplate = "skeleton001"; break;
                    case 17: sRetTemplate = "skeleton001"; break;
                    case 18: sRetTemplate = "skelpriest001"; break;
                    case 19: sRetTemplate = "zombie002"; break;
                    case 20: sRetTemplate = ""; break;
                    case 21: sRetTemplate = ""; break;
                    case 22: sRetTemplate = ""; break;
                    case 23: sRetTemplate = ""; break;
                    case 24: sRetTemplate = ""; break;
                    case 25: sRetTemplate = ""; break;
                    case 26: sRetTemplate = ""; break;
                    case 27: sRetTemplate = ""; break;
                    case 28: sRetTemplate = ""; break;
                    case 29: sRetTemplate = ""; break;
                    }
    }

if(sTemplate == "sw_gob_low")

{
    switch(Random(6))
    {
        case 0: sRetTemplate = "nw_goblina"; break;
        case 1: sRetTemplate = "nw_goblinb"; break;
        case 2: sRetTemplate = "nw_kobold001"; break;
        case 3: sRetTemplate = "nw_kobold002"; break;
        case 4: sRetTemplate = "nw_orca"; break;
        case 5: sRetTemplate = "nw_orcb"; break;
    }
}

if(sTemplate == "sw_gob_mid")

{
    switch(Random(7))
    {
        case 0: sRetTemplate = "nw_bugbeara"; break;
        case 1: sRetTemplate = "nw_bugbearb"; break;
        case 2: sRetTemplate = "nw_kobold004"; break;
        case 3: sRetTemplate = "nw_kobold006"; break;
        case 4: sRetTemplate = "nw_kobold005"; break;
        case 5: sRetTemplate = "nw_kobold003"; break;
        case 6: sRetTemplate = "nw_gnoll001"; break;
    }
}

if(sTemplate == "sw_gob_hi")

{
    switch(Random(10))
    {
        case 0: sRetTemplate = "nw_bugwiza"; break;
        case 1: sRetTemplate = "nw_bugwizb"; break;
        case 2: sRetTemplate = "nw_gobwiza"; break;
        case 3: sRetTemplate = "nw_gobwizb"; break;
        case 4: sRetTemplate = "nw_gobchiefa"; break;
        case 5: sRetTemplate = "nw_gobchiefb"; break;
        case 6: sRetTemplate = "nw_gnoll002"; break;
        case 7: sRetTemplate = "nw_orcchiefa"; break;
        case 8: sRetTemplate = "nw_orcchiefb"; break;
        case 9: sRetTemplate = "nw_orcwiza"; break;
    }
}

if(sTemplate == "sw_gob_huge")

{
    switch(Random(2))
    {
        case 0: sRetTemplate = "nw_bugchiefa"; break;
        case 1: sRetTemplate = "nw_bugchiefb"; break;
    }
}

if(sTemplate == "sw_giant")

{
    switch(Random(9))
    {
        case 0: sRetTemplate = "nw_ogre01"; break;
        case 1: sRetTemplate = "nw_ogre02"; break;
        case 2: sRetTemplate = "nw_ogrechief01"; break;
        case 3: sRetTemplate = "nw_ogrechief02"; break;
        case 4: sRetTemplate = "nw_ogremage01"; break;
        case 5: sRetTemplate = "nw_ogremage02"; break;
        case 6: sRetTemplate = "nw_troll"; break;
        case 7: sRetTemplate = "nw_trollchief"; break;
        case 8: sRetTemplate = "nw_trollwiz"; break;
    }
}

if(sTemplate == "sw_giant2")

{
    switch(Random(5))
    {
        case 0: sRetTemplate = "nw_ettin"; break;
        case 1: sRetTemplate = "nw_gnthill"; break;
        case 2: sRetTemplate = "nw_gntmount"; break;
        case 3: sRetTemplate = "nw_ogreboss"; break;
        case 4: sRetTemplate = "nw_trollboss"; break;
    }
}

if(sTemplate == "sw_ants")

{
    switch(Random(7))
    {
        case 0: sRetTemplate = "giantantqueen"; break;
        case 1: sRetTemplate = "giantantsoldier"; break;
        case 2: sRetTemplate = "giantantworker"; break;
        case 3: sRetTemplate = "giantantworker"; break;
        case 4: sRetTemplate = "giantantworker"; break;
        case 5: sRetTemplate = "giantantworker"; break;
        case 6: sRetTemplate = "giantantsoldier"; break;
    }
}

if(sTemplate == "sw_animals")
{
    switch(Random(8))
    {
        case 0: sRetTemplate = "nw_wolf"; break;
        case 1: sRetTemplate = "nw_wolf"; break;
        case 2: sRetTemplate = "nw_wolf"; break;
        case 3: sRetTemplate = "nw_wolf"; break;
        case 4: sRetTemplate = "nw_wolf"; break;
        case 5: sRetTemplate = "nw_boar"; break;
        case 6: sRetTemplate = "nw_boar"; break;
        case 7: sRetTemplate = "nw_boar"; break;
    }
}

if(sTemplate == "sw_bandits")
{
    switch(Random(8))
    {
        case 0: sRetTemplate = "nw_bandit001"; break;
        case 1: sRetTemplate = "nw_bandit001"; break;
        case 2: sRetTemplate = "nw_bandit002"; break;
        case 3: sRetTemplate = "nw_bandit003"; break;
        case 4: sRetTemplate = "nw_humanmerc001"; break;
        case 5: sRetTemplate = "nw_elfmerc001"; break;
        case 6: sRetTemplate = "nw_dwarfmerc001"; break;
        case 7: sRetTemplate = "nw_halfmerc001"; break;
    }
}

    // cr_militia
    if (sTemplate == "cr_militia")
    {
        switch(d2(1))
        {
            case 1:
            sRetTemplate = "cr_militia_m";
            break;
            case 2:
            sRetTemplate = "cr_militia_f";
            break;
        }
    }
    //

    // pg_guard
    if (sTemplate == "pg_guard")
    {
        switch(d2(1))
        {
            case 1:
            sRetTemplate = "pg_guard_m";
            break;
            case 2:
            sRetTemplate = "pg_guard_f";
            break;
        }
    }
    //

    // Goblins
    if (sTemplate == "goblins_low")
    {
        if (d2(1) == 1)
        {
            sRetTemplate = "NW_GOBLINA";
        }
        else
        {
            sRetTemplate = "NW_GOBLINB";
        }
    }
    //

    // Goblins and Boss
    if (sTemplate == "gobsnboss")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "NW_GOBCHIEFA");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "NW_GOBLINA";
            }
            else
            {
                // He's dead, Deactivate Camp!
                SetLocalInt(oSpawn, "SpawnDeactivated", TRUE);
            }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "NW_GOBCHIEFA";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

    // Scaled Encounter
    if (sTemplate == "scaledgobs")
    {
        // Initialize Variables
        int nTotalPCs;
        int nTotalPCLevel;
        int nAveragePCLevel;
        object oArea = GetArea(OBJECT_SELF);

        // Cycle through PCs in Area
        object oPC = GetFirstObjectInArea(oArea);
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC) == TRUE)
            {
                nTotalPCs++;
                nTotalPCLevel = nTotalPCLevel + GetHitDice(oPC);
            }
            oPC = GetNextObjectInArea(oArea);
        }
        if (nTotalPCs == 0)
        {
            nAveragePCLevel = 0;
        }
        else
        {
            nAveragePCLevel = nTotalPCLevel / nTotalPCs;
        }

        // Select a Creature to Spawn
        switch (nAveragePCLevel)
        {
            // Spawn Something with CR 1
            case 1:
                sRetTemplate = "cr1creature";
            break;
            //

            // Spawn Something with CR 5
            case 5:
                sRetTemplate = "cr5creature";
            break;
            //
        }
    }
    //

    // Pirates and Boss
    if (sTemplate == "pirates")
    {
        // Delay the Spawn for 45 Minutes
        if (GetLocalInt(oSpawn, "DelayEnded") == FALSE)
        {
            if (GetLocalInt(oSpawn, "DelayStarted") == FALSE)
            {
                // Start the Delay
                SetLocalInt(oSpawn, "DelayStarted", TRUE);
                DelayCommand(20.0, SetLocalInt(oSpawn, "DelayEnded", TRUE));
            }
            sRetTemplate = "";
            return sRetTemplate;
        }
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "NW_GOBCHIEFA");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "NW_GOBLINA";
            }
            else
            {
                // He's dead, Deactivate Camp!
                SetLocalInt(oSpawn, "SpawnDeactivated", TRUE);
            }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "NW_GOBCHIEFA";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

    // Advanced Scaled Encounter
    if (sTemplate == "advscaled")
    {
        //Initalize Variables
        int nTotalPCs;
        int nTotalPCLevel;
        int nAveragePCLevel;
        object oArea = GetArea(OBJECT_SELF);

        //Cycle through PCs in area
        object oPC = GetFirstObjectInArea(oArea);
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC) == TRUE)
            {
                nTotalPCs++;
                nTotalPCLevel = nTotalPCLevel + GetHitDice(oPC);
            }
        oPC = GetNextObjectInArea(oArea);
        }
        if (nTotalPCs == 0)
        {
            nAveragePCLevel = 0;
        }
        else
        {
            nAveragePCLevel = nTotalPCLevel / nTotalPCs;
        }

        //Select a Creature to Spawn
        switch (nAveragePCLevel)
        {
            //Spawn Something with CR 1
            case 1:
                switch (d6())
                {
                    case 1: sRetTemplate = "cr1example1";
                    case 2: sRetTemplate = "cr1example2";
                    case 3: sRetTemplate = "cr1example3";
                    case 4: sRetTemplate = "cr1example4";
                    case 5: sRetTemplate = "cr1example5";
                    case 6: sRetTemplate = "cr1example6";
                }
            break;
        }
    }
    //

    // Encounters
    if (sTemplate == "encounter")
    {
        // Declare Variables
        int nCounter, nCounterMax;
        string sCurrentTemplate;

        // Retreive and Increment Counter
        nCounter = GetLocalInt(oSpawn, "GroupCounter");
        nCounterMax = GetLocalInt(oSpawn, "CounterMax");
        nCounter++;

        // Retreive CurrentTemplate
        sCurrentTemplate = GetLocalString(oSpawn, "CurrentTemplate");

        // Check CounterMax
        if (nCounter > nCounterMax)
        {
            sCurrentTemplate = "";
            nCounter = 1;
        }

        if (sCurrentTemplate != "")
        {
            // Spawn Another CurrentTemplate
            sRetTemplate = sCurrentTemplate;
        }
        else
        {
            // Choose New CurrentTemplate and CounterMax
            switch (Random(2))
            {
                // Spawn 1-4 NW_DOGs
                case 0:
                sRetTemplate = "NW_DOG";
                nCounterMax = Random(4) + 1;
                break;
            }
            // Record New CurrentTemplate and CounterMax
            SetLocalString(oSpawn, "CurrentTemplate", sRetTemplate);
            SetLocalInt(oSpawn, "CounterMax", nCounterMax);
        }

        // Record Counter
        SetLocalInt(oSpawn, "GroupCounter", nCounter);
    }
    //

    //
    if (sTemplate == "kobolds")
    {
        int nKobold = Random(6) + 1;
        sRetTemplate = "NW_KOBOLD00" + IntToString(nKobold);
    }
        if (sTemplate == "chest_locked")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "chest002"; break;
                    case 1: sRetTemplate = "chest003"; break;
                    case 2: sRetTemplate = "chest004"; break;
                    case 3: sRetTemplate = "chest005"; break;
                }
    }

    if (sTemplate == "chest_locked2")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "chest006"; break;
                    case 1: sRetTemplate = "chest007"; break;
                    case 2: sRetTemplate = "chest008"; break;
                    case 3: sRetTemplate = "chest009"; break;
                }
    }

    if (sTemplate == "chest_locked_trapped")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "chest010"; break;
                    case 1: sRetTemplate = "chest011"; break;
                    case 2: sRetTemplate = "chest012"; break;
                    case 3: sRetTemplate = "chest013"; break;
                }
    }

    if (sTemplate == "box")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "box002"; break;
                    case 1: sRetTemplate = "box003"; break;
                    case 2: sRetTemplate = "box004"; break;
                    case 3: sRetTemplate = "box005"; break;
                }
    }


    if (sTemplate == "furniture")
    {
        switch( Random( 8 ))
                {
                    case 0: sRetTemplate = "desk001"; break;
                    case 1: sRetTemplate = "desk002"; break;
                    case 2: sRetTemplate = "couch001"; break;
                    case 3: sRetTemplate = "armoire001"; break;
                    case 4: sRetTemplate = "bookshelf001"; break;
                    case 5: sRetTemplate = "cabinet001"; break;
                    case 6: sRetTemplate = "chstdrwrs001"; break;
                    case 7: sRetTemplate = "bookshelf001"; break;
                }
    }


   if (sTemplate == "misc")
    {
        switch( Random( 10 ))
                {
                    case 0: sRetTemplate = "pottedplant001"; break;
                    case 1: sRetTemplate = "pottedplant001"; break;
                    case 2: sRetTemplate = "urn001"; break;
                    case 3: sRetTemplate = "woodpile001"; break;
                    case 4: sRetTemplate = "birdcage001"; break;
                    case 5: sRetTemplate = "barrel001"; break;
                    case 6: sRetTemplate = "barrel001"; break;
                    case 7: sRetTemplate = "pottedplant001"; break;
                    case 8: sRetTemplate = "cot001"; break;
                    case 9: sRetTemplate = "pntingeasel001"; break;
                }
    }

     if (sTemplate == "housethief")
    {
        switch( Random( 14 ))
                {
                    case 0: sRetTemplate = "thief001"; break;
                    case 1: sRetTemplate = "thief002"; break;
                    case 2: sRetTemplate = "thief003"; break;
                    case 3: sRetTemplate = "thief004"; break;
                    case 4: sRetTemplate = "thief"; break;
                    case 5: sRetTemplate = "cc_thief_01"; break;
                    case 6: sRetTemplate = "cc_thief_02"; break;
                    case 7: sRetTemplate = "cc_thief_03"; break;
                    case 8: sRetTemplate = "cc_thief_04"; break;
                    case 9: sRetTemplate = "streetthug"; break;
                    case 10: sRetTemplate = "streetthug001"; break;
                    case 11: sRetTemplate = "streetthug002"; break;
                    case 12: sRetTemplate = "streetthug003"; break;
                    case 13: sRetTemplate = "streetthug004"; break;

                    }
    }

if (sTemplate == "small")
    {
        switch( Random( 10 ))
                {
                    case 0: sRetTemplate = "tavern001"; break;
                    case 1: sRetTemplate = "tavern002"; break;
                    case 2: sRetTemplate = "tavern003"; break;
                    case 3: sRetTemplate = "tavern004"; break;
                    case 4: sRetTemplate = "tavern013"; break;
                    case 5: sRetTemplate = "tavern016"; break;
                    case 6: sRetTemplate = "tavern015"; break;
                    case 7: sRetTemplate = "tavern017"; break;
                    case 8: sRetTemplate = ""; break;
                    case 9: sRetTemplate = ""; break;
                }
    }

if(sTemplate == "elves")
{
    switch(d4())
    {
            case 1: sRetTemplate = "tavern005"; break;
            case 2: sRetTemplate = "tavern006"; break;
            case 3: sRetTemplate = "tavern007"; break;
            case 4: sRetTemplate = "tavern009"; break;
    }
}


if (sTemplate == "commoner")
    {
        switch( Random( 72 ))
                {
                    case 0: sRetTemplate = "femaledwarvencit"; break;
                    case 1: sRetTemplate = "femaleelvencitiz"; break;
                    case 2: sRetTemplate = "femalegnomishcit"; break;
                    case 3: sRetTemplate = "femalehalfelvenc"; break;
                    case 4: sRetTemplate = "femalehalflingci"; break;
                    case 5: sRetTemplate = "femalehalforccit"; break;
                    case 6: sRetTemplate = "femalehumancitiz"; break;
                    case 7: sRetTemplate = "maledwarvencitiz"; break;
                    case 8: sRetTemplate = "maleelvencitizen"; break;
                    case 9: sRetTemplate = "malegnomishcitiz"; break;
                    case 10: sRetTemplate = "malehalfelvencit"; break;
                    case 11: sRetTemplate = "malehalflingciti"; break;
                    case 12: sRetTemplate = "malehalforccitiz"; break;
                    case 13: sRetTemplate = "malehumancitizen"; break;
                    case 14: sRetTemplate = "malehumanciti001"; break;
                    case 15: sRetTemplate = "femaledwarven001"; break;
                    case 16: sRetTemplate = "femaleelvenci001"; break;
                    case 17: sRetTemplate = "femalegnomish001"; break;
                    case 18: sRetTemplate = "femalehalfelv001"; break;
                    case 19: sRetTemplate = "femalehalflin002"; break;
                    case 20: sRetTemplate = "femalehalforc001"; break;
                    case 21: sRetTemplate = "femalehalforc001"; break;
                    case 22: sRetTemplate = "femalehumanci001"; break;
                    case 23: sRetTemplate = "maledwarvenci003"; break;
                    case 24: sRetTemplate = "maleelvenciti001"; break;
                    case 25: sRetTemplate = "malegnomishci001"; break;
                    case 26: sRetTemplate = "malehalflingc001"; break;
                    case 27: sRetTemplate = "malehalforcci001"; break;
                    case 28: sRetTemplate = "malehumancitizen"; break;
                    case 29: sRetTemplate = "malehumanciti001"; break;
                    case 30: sRetTemplate = "malehumancitizen"; break;
                    case 31: sRetTemplate = "malehumanciti001"; break;
                    case 32: sRetTemplate = "malehumancitizen"; break;
                    case 33: sRetTemplate = "malehumanciti001"; break;
                    case 34: sRetTemplate = "malehumancitizen"; break;
                    case 35: sRetTemplate = "malehumanciti001"; break;
                    case 36: sRetTemplate = "malehumancitizen"; break;
                    case 37: sRetTemplate = "malehumanciti001"; break;
                    case 38: sRetTemplate = "malehumancitizen"; break;
                    case 39: sRetTemplate = "malehumanciti001"; break;
                    case 40: sRetTemplate = "malehumancitizen"; break;
                    case 41: sRetTemplate = "malehumanciti001"; break;
                    case 42: sRetTemplate = "malehumancitizen"; break;
                    case 43: sRetTemplate = "malehumanciti001"; break;
                    case 44: sRetTemplate = "dog002"; break;
                    case 45: sRetTemplate = "dog002"; break;
                    case 46: sRetTemplate = "femalehumancitiz"; break;
                    case 47: sRetTemplate = "femalehumanci001"; break;
                    case 48: sRetTemplate = "femalehumancitiz"; break;
                    case 49: sRetTemplate = "femalehumanci001"; break;
                    case 50: sRetTemplate = "femalehumancitiz"; break;
                    case 51: sRetTemplate = "femalehumanci001"; break;
                    case 52: sRetTemplate = "femalehumancitiz"; break;
                    case 53: sRetTemplate = "femalehumanci001"; break;
                    case 54: sRetTemplate = "femalehumancitiz"; break;
                    case 55: sRetTemplate = "femalehumanci001"; break;
                    case 56: sRetTemplate = "femalehumancitiz"; break;
                    case 57: sRetTemplate = "femalehumanci001"; break;
                    case 58: sRetTemplate = "femalehumancitiz"; break;
                    case 59: sRetTemplate = "femalehumanci001"; break;
                    case 60: sRetTemplate = "maledwarvencitiz"; break;
                    case 61: sRetTemplate = "maleelvencitizen"; break;
                    case 62: sRetTemplate = "femaledwarvencit"; break;
                    case 63: sRetTemplate = "femaleelvenci001"; break;
                    case 64: sRetTemplate = "maleelvenciti001"; break;
                    case 65: sRetTemplate = "femaleelvencitiz"; break;
                    case 66: sRetTemplate = "malehalflingc001"; break;
                    case 67: sRetTemplate = "malehalflingciti"; break;
                    case 68: sRetTemplate = "femalehalflin002"; break;
                    case 69: sRetTemplate = "femalehalflingci"; break;
                    case 70: sRetTemplate = "femalegnomishcit"; break;
                    case 71: sRetTemplate = "malegnomishci001"; break;
    }
 }

if(sTemplate == "sw_performer")

{
    switch(Random(5))
    {
        case 0: sRetTemplate = "actor"; break;
        case 1: sRetTemplate = "actor001"; break;
        case 2: sRetTemplate = "actor002"; break;
        case 3: sRetTemplate = "actor003"; break;
        case 4: sRetTemplate = "trainedtroll"; break;
    }
}

if(sTemplate == "sw_vermin_lesser")

{
    switch(Random(3))
    {
        case 0: sRetTemplate = "nw_ratdire001"; break;
        case 1: sRetTemplate = "nw_rat001"; break;
        case 2: sRetTemplate = "nw_btlfire"; break;
    }
}

if(sTemplate == "sw_vermin")

{
    switch(Random(10))
    {
        case 0: sRetTemplate = "nw_wererat"; break;
        case 1: sRetTemplate = "nw_btlbomb"; break;
        case 2: sRetTemplate = "nw_btlfire02"; break;
        case 3: sRetTemplate = "nw_btlstink"; break;
        case 4: sRetTemplate = "nw_spidgiant"; break;
        case 5: sRetTemplate = "nw_spidphase"; break;
        case 6: sRetTemplate = "nw_spidswrd"; break;
        case 7: sRetTemplate = "nw_spidwra"; break;
        case 8: sRetTemplate = "nw_ettercap"; break;
        case 9: sRetTemplate = "nw_werewolf"; break;
    }
}

if(sTemplate == "sw_vermin_greater")

{
    switch(Random(5))
    {
        case 0: sRetTemplate = "nw_btlstag"; break;
        case 1: sRetTemplate = "nw_spiderboss"; break;
        case 2: sRetTemplate = "nw_spiddire"; break;
        case 3: sRetTemplate = "nw_beetleboss"; break;
        case 4: sRetTemplate = "nw_werecat"; break;
    }
}

if(sTemplate == "sw_beasts")

{
    switch(Random(8))
    {
        case 0: sRetTemplate = "nw_grayrend"; break;
        case 1: sRetTemplate = "nw_horror"; break;
        case 2: sRetTemplate = "nw_devour"; break;
        case 3: sRetTemplate = "nw_umberhulk"; break;
        case 4: sRetTemplate = "nw_minotaur"; break;
        case 5: sRetTemplate = "nw_minchief"; break;
        case 6: sRetTemplate = "nw_minotaurboss"; break;
        case 7: sRetTemplate = "nw_minwiz"; break;
    }
}

if(sTemplate == "sw_demon_lesser")

{
    switch(Random(13))
    {
        case 0: sRetTemplate = "nw_imp"; break;
        case 1: sRetTemplate = "nw_dmquasit"; break;
        case 2: sRetTemplate = "nw_mepsalt"; break;
        case 3: sRetTemplate = "nw_mepsteam"; break;
        case 4: sRetTemplate = "nw_mepmagma"; break;
        case 5: sRetTemplate = "nw_mepfire"; break;
        case 6: sRetTemplate = "nw_mepearth"; break;
        case 7: sRetTemplate = "nw_mepdust"; break;
        case 8: sRetTemplate = "nw_mepair"; break;
        case 9: sRetTemplate = "nw_mepice"; break;
        case 10: sRetTemplate = "nw_mepooze"; break;
        case 11: sRetTemplate = "nw_mepwater"; break;
        case 12: sRetTemplate = "nw_hellhound"; break;
    }
}

if(sTemplate == "sw_demon")

{
    switch(Random(6))
    {
        case 0: sRetTemplate = "nw_rakshasa"; break;
        case 1: sRetTemplate = "nw_dmsucubus"; break;
        case 2: sRetTemplate = "nw_dmvrock"; break;
        case 3: sRetTemplate = "nw_slaadbl"; break;
        case 4: sRetTemplate = "nw_slaadgrn"; break;
        case 5: sRetTemplate = "nw_slaadred"; break;
    }
}

if(sTemplate == "sw_demon_greater")

{
    switch(Random(5))
    {
        case 0: sRetTemplate = "nw_slaadgray"; break;
        case 1: sRetTemplate = "nw_demon"; break;
        case 2: sRetTemplate = "nw_slaaddeth"; break;
        case 3: sRetTemplate = "nw_slaaddthboss"; break;
        case 4: sRetTemplate = "nw_slaadgryboss"; break;
    }
}

if(sTemplate == "sw_undead_lesser")

{
    switch(Random(21))
    {
        case 0: sRetTemplate = "skeleton001"; break;
        case 1: sRetTemplate = "nw_zombie01"; break;
        case 2: sRetTemplate = "nw_zombie02"; break;
        case 3: sRetTemplate = "nw_ghoul"; break;
        case 4: sRetTemplate = "nw_allip"; break;
        case 6: sRetTemplate = "nw_shadow"; break;
        case 7: sRetTemplate = "crawlingclaw"; break;
        case 8: sRetTemplate = "skeleton002"; break;
        case 9: sRetTemplate = "skeleton003"; break;
        case 10: sRetTemplate = "skeleton004"; break;
        case 11: sRetTemplate = "skeleton005"; break;
        case 12: sRetTemplate = "skeleton006"; break;
        case 13: sRetTemplate = "skeleton007"; break;
        case 14: sRetTemplate = "skeleton008"; break;
        case 15: sRetTemplate = "skeleton009"; break;
        case 16: sRetTemplate = "skeleton010"; break;
        case 17: sRetTemplate = "skeleton011"; break;
        case 18: sRetTemplate = "skeleton012"; break;
        case 19: sRetTemplate = "skeleton013"; break;
        case 20: sRetTemplate = "skeleton014"; break;
    }
}

if(sTemplate == "sw_undead")

{
    switch(Random(17))
    {
        case 0: sRetTemplate = "nw_ghast"; break;
        case 1: sRetTemplate = "nw_ghoullord"; break;
        case 2: sRetTemplate = "nw_mummy"; break;
        case 3: sRetTemplate = "nw_wight"; break;
        case 4: sRetTemplate = "nw_curst001"; break;
        case 5: sRetTemplate = "nw_curst002"; break;
        case 6: sRetTemplate = "nw_curst003"; break;
        case 7: sRetTemplate = "nw_curst004"; break;
        case 8: sRetTemplate = "nw_skelmage"; break;
        case 9: sRetTemplate = "nw_skelpriest"; break;
        case 10: sRetTemplate = "nw_skelwarr01"; break;
        case 11: sRetTemplate = "nw_skelwarr02"; break;
        case 12: sRetTemplate = "nw_zombtyrant"; break;
        case 13: sRetTemplate = "nw_zombwarr01"; break;
        case 14: sRetTemplate = "nw_zombwarr02"; break;
        case 15: sRetTemplate = "nw_spectre"; break;
        case 16: sRetTemplate = "nw_wraith"; break;
    }
}

if(sTemplate == "sw_undead_high")

{
    switch(Random(10))
    {
        case 0: sRetTemplate = "nw_ghoulboss"; break;
        case 1: sRetTemplate = "nw_mumcleric"; break;
        case 2: sRetTemplate = "nw_mumfight"; break;
        case 3: sRetTemplate = "nw_doomkght"; break;
        case 4: sRetTemplate = "nw_revenant001"; break;
        case 5: sRetTemplate = "vampire001"; break;
        case 6: sRetTemplate = "nw_shfiend"; break;
        case 7: sRetTemplate = "nw_skelchief"; break;
        case 8: sRetTemplate = "nw_zombieboss"; break;
        case 9: sRetTemplate = "nw_bodak"; break;
    }
}

if(sTemplate == "sw_undead_impos")

{
    switch(Random(8))
    {
        case 0: sRetTemplate = "nw_mummyboss"; break;
        case 1: sRetTemplate = "nw_doomkghtboss"; break;
        case 2: sRetTemplate = "nw_mohrg"; break;
        case 3: sRetTemplate = "nw_skeldevour"; break;
        case 4: sRetTemplate = "nw_vampire003"; break;
        case 5: sRetTemplate = "nw_vampire004"; break;
        case 6: sRetTemplate = "nw_vampire002"; break;
        case 7: sRetTemplate = "nw_vampire001"; break;
    }
}
if (sTemplate == "taverner")
    {
        switch( Random( 66 ))
                {
                    case 0: sRetTemplate = "tavern001"; break;
                    case 1: sRetTemplate = "tavern002"; break;
                    case 2: sRetTemplate = "tavern003"; break;
                    case 3: sRetTemplate = "tavern004"; break;
                    case 4: sRetTemplate = "tavern005"; break;
                    case 5: sRetTemplate = "tavern006"; break;
                    case 6: sRetTemplate = "tavern007"; break;
                    case 7: sRetTemplate = "tavern008"; break;
                    case 8: sRetTemplate = "tavern009"; break;
                    case 9: sRetTemplate = "tavern010"; break;
                    case 10: sRetTemplate = "tavern011"; break;
                    case 11: sRetTemplate = "tavern012"; break;
                    case 12: sRetTemplate = "tavern013"; break;
                    case 13: sRetTemplate = "tavern015"; break;
                    case 14: sRetTemplate = "tavern016"; break;
                    case 15: sRetTemplate = "tavern017"; break;
                    case 16: sRetTemplate = "tavern018"; break;
                    case 17: sRetTemplate = "tavern019"; break;
                    case 18: sRetTemplate = "tavern008"; break;
                    case 19: sRetTemplate = "tavern010"; break;
                    case 20: sRetTemplate = "tavern011"; break;
                    case 21: sRetTemplate = "tavern012"; break;
                    case 22: sRetTemplate = "tavern008"; break;
                    case 23: sRetTemplate = "tavern010"; break;
                    case 24: sRetTemplate = "tavern011"; break;
                    case 25: sRetTemplate = "tavern012"; break;
                    case 26: sRetTemplate = "tavern008"; break;
                    case 27: sRetTemplate = "tavern010"; break;
                    case 28: sRetTemplate = "tavern011"; break;
                    case 29: sRetTemplate = "tavern012"; break;
                    case 30: sRetTemplate = "tavern008"; break;
                    case 31: sRetTemplate = "tavern010"; break;
                    case 32: sRetTemplate = "tavern011"; break;
                    case 33: sRetTemplate = "tavern012"; break;
                    case 34: sRetTemplate = "tavern008"; break;
                    case 35: sRetTemplate = "tavern010"; break;
                    case 36: sRetTemplate = "tavern011"; break;
                    case 37: sRetTemplate = "tavern012"; break;
                    case 38: sRetTemplate = "tavern001"; break;
                    case 39: sRetTemplate = "tavern002"; break;
                    case 40: sRetTemplate = "tavern003"; break;
                    case 41: sRetTemplate = "tavern004"; break;
                    case 42: sRetTemplate = "tavern005"; break;
                    case 43: sRetTemplate = "tavern006"; break;
                    case 44: sRetTemplate = "tavern007"; break;
                    case 45: sRetTemplate = "tavern009"; break;
                    case 46: sRetTemplate = "tavern005"; break;
                    case 47: sRetTemplate = "tavern006"; break;
                    case 48: sRetTemplate = "tavern007"; break;
                    case 49: sRetTemplate = "tavern009"; break;
                    case 50: sRetTemplate = "tavern015"; break;
                    case 51: sRetTemplate = "tavern016"; break;
                    case 52: sRetTemplate = "tavern018"; break;
                    case 53: sRetTemplate = "tavern019"; break;
                    case 54: sRetTemplate = "tavern018"; break;
                    case 55: sRetTemplate = "tavern019"; break;
                    case 56: sRetTemplate = "tavern018"; break;
                    case 57: sRetTemplate = "tavern019"; break;
                    case 58: sRetTemplate = "tavern008"; break;
                    case 59: sRetTemplate = "tavern010"; break;
                    case 60: sRetTemplate = "tavern011"; break;
                    case 61: sRetTemplate = "tavern012"; break;
                    case 62: sRetTemplate = "tavern008"; break;
                    case 63: sRetTemplate = "tavern010"; break;
                    case 64: sRetTemplate = "tavern011"; break;
                    case 65: sRetTemplate = "tavern012"; break;
                }
     }


if (sTemplate == "comsingle")
    {
        switch( Random( 28 ))
                {
                    case 0: sRetTemplate = "femaledwarvencit"; break;
                    case 1: sRetTemplate = "femaleelvencitiz"; break;
                    case 2: sRetTemplate = "femalegnomishcit"; break;
                    case 3: sRetTemplate = "femalehalfelvenc"; break;
                    case 4: sRetTemplate = "femalehalflingci"; break;
                    case 5: sRetTemplate = "femalehalforccit"; break;
                    case 6: sRetTemplate = "femalehumancitiz"; break;
                    case 7: sRetTemplate = "maledwarvencitiz"; break;
                    case 8: sRetTemplate = "maleelvencitizen"; break;
                    case 9: sRetTemplate = "malegnomishcitiz"; break;
                    case 10: sRetTemplate = "malehalfelvencit"; break;
                    case 11: sRetTemplate = "malehalflingciti"; break;
                    case 12: sRetTemplate = "malehalforccitiz"; break;
                    case 13: sRetTemplate = "malehumancitizen"; break;
                    case 14: sRetTemplate = "malehumanciti001"; break;
                    case 15: sRetTemplate = "femaledwarven001"; break;
                    case 16: sRetTemplate = "femaleelvenci001"; break;
                    case 17: sRetTemplate = "dog001"; break;
                    case 18: sRetTemplate = "dog001"; break;
                    case 19: sRetTemplate = "femalehalflin002"; break;
                    case 20: sRetTemplate = "dog001"; break;
                    case 21: sRetTemplate = "femalehalforc001"; break;
                    case 22: sRetTemplate = "femalehumanci001"; break;
                    case 23: sRetTemplate = "dog001"; break;
                    case 24: sRetTemplate = "dog001"; break;
                    case 25: sRetTemplate = "dog001"; break;
                    case 26: sRetTemplate = "dog001"; break;
                    case 27: sRetTemplate = "dog001"; break;
                    }
    }

    if (sTemplate == "rug")
    {
        switch( Random( 12 ))
                {
                    case 0: sRetTemplate = "throwrug001"; break;
                    case 1: sRetTemplate = "throwrug002"; break;
                    case 2: sRetTemplate = "throwrug003"; break;
                    case 3: sRetTemplate = "throwrug004"; break;
                    case 4: sRetTemplate = "throwrug005"; break;
                    case 5: sRetTemplate = "throwrug006"; break;
                    case 6: sRetTemplate = "throwrug007"; break;
                    case 7: sRetTemplate = "throwrug008"; break;
                    case 8: sRetTemplate = "throwrug009"; break;
                    case 9: sRetTemplate = "throwrug010"; break;
                    case 10: sRetTemplate = "throwrug0011"; break;
                    case 11: sRetTemplate = "throwrug"; break;
                    }
    }

    if (sTemplate == "undead")
    {
        switch( Random( 30 ))
                {
                    case 0: sRetTemplate = "skeleton001"; break;
                    case 1: sRetTemplate = "skelpriest001"; break;
                    case 2: sRetTemplate = "zombie002"; break;
                    case 3: sRetTemplate = "zombie003"; break;
                    case 4: sRetTemplate = "zombwarr017"; break;
                    case 5: sRetTemplate = "ghoul001"; break;
                    case 6: sRetTemplate = "ghast001"; break;
                    case 7: sRetTemplate = "allip001"; break;
                    case 8: sRetTemplate = "shadow001"; break;
                    case 9: sRetTemplate = "mummy001"; break;
                    case 10: sRetTemplate = "skeleton001"; break;
                    case 11: sRetTemplate = "skeleton001"; break;
                    case 12: sRetTemplate = "skeleton001"; break;
                    case 13: sRetTemplate = "skelpriest001"; break;
                    case 14: sRetTemplate = "zombie002"; break;
                    case 15: sRetTemplate = "zombie003"; break;
                    case 16: sRetTemplate = "skeleton001"; break;
                    case 17: sRetTemplate = "skeleton001"; break;
                    case 18: sRetTemplate = "skelpriest001"; break;
                    case 19: sRetTemplate = "zombie002"; break;
                    case 20: sRetTemplate = ""; break;
                    case 21: sRetTemplate = ""; break;
                    case 22: sRetTemplate = ""; break;
                    case 23: sRetTemplate = ""; break;
                    case 24: sRetTemplate = ""; break;
                    case 25: sRetTemplate = ""; break;
                    case 26: sRetTemplate = ""; break;
                    case 27: sRetTemplate = ""; break;
                    case 28: sRetTemplate = ""; break;
                    case 29: sRetTemplate = ""; break;
                    }
    }

    // pg_guard
    if (sTemplate == "pg_guard")
    {
        switch(d2(1))
        {
            case 1:
            sRetTemplate = "pg_guard_m";
            break;
            case 2:
            sRetTemplate = "pg_guard_f";
            break;
        }
    }
    //

    // Goblins
    if (sTemplate == "goblins_low")
    {
        if (d2(1) == 1)
        {
            sRetTemplate = "goblina001";
        }
        else
        {
            sRetTemplate = "goblina001";
        }
    }
   if (sTemplate == "lp_lesser_skullkid")
    {
        switch( Random( 8 ))
                {
                    case 0: sRetTemplate = "lp_skullchild_1"; break;
                    case 1: sRetTemplate = "lp_skullchild_1"; break;
                    case 2: sRetTemplate = "lp_skullchild_1"; break;
                    case 3: sRetTemplate = "lp_skullchild_2"; break;
                    case 4: sRetTemplate = "lp_skullchild_2"; break;
                    case 5: sRetTemplate = "lp_skullchild_2"; break;
                    case 6: sRetTemplate = "lp_skullchild_3"; break;
                    case 7: sRetTemplate = "lp_skullchild_4"; break;
                }
    }
if (sTemplate == "lp_greater_skullkid")
    {
        switch( Random( 8 ))
                {
                    case 0: sRetTemplate = "lp_skullchild_2"; break;
                    case 1: sRetTemplate = "lp_skullchild_4"; break;
                    case 2: sRetTemplate = "lp_skullchild_4"; break;
                    case 3: sRetTemplate = "lp_skullchild_5"; break;
                    case 4: sRetTemplate = "lp_skullchild_5"; break;
                    case 5: sRetTemplate = "lp_skullchild_3"; break;
                    case 6: sRetTemplate = "lp_skullchild_3"; break;
                    case 7: sRetTemplate = "lp_skullchild_6"; break;
                }
    }
    if (sTemplate == "lp_skeleton_easy")
    {
        switch( Random( 8 ))
                {
                    case 0: sRetTemplate = "rn_skeleton_01"; break;
                    case 1: sRetTemplate = "rn_skeleton_01"; break;
                    case 2: sRetTemplate = "rn_skeleton_02"; break;
                    case 3: sRetTemplate = "rn_skeleton_02"; break;
                    case 4: sRetTemplate = "rn_skeleton_03"; break;
                    case 5: sRetTemplate = "rn_skeleton_04"; break;
                    case 6: sRetTemplate = "rn_skeleton_04"; break;
                    case 7: sRetTemplate = "lp_skeleton_05"; break;
                }
    }
     if (sTemplate == "lp_zombie_basic")
    {
        switch( Random( 7 ))
                {
                    case 0: sRetTemplate = "rn_zombie_01"; break;
                    case 1: sRetTemplate = "rn_zombie_01"; break;
                    case 2: sRetTemplate = "rn_zombie_01"; break;
                    case 3: sRetTemplate = "rn_zombie_02"; break;
                    case 4: sRetTemplate = "rn_zombie_02"; break;
                    case 5: sRetTemplate = "rn_zombie_02"; break;
                    case 6: sRetTemplate = "lp_illithidzo_2"; break;
                }
    }
      if (sTemplate == "lp_bonedeliver_easy")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "lp_bonedelver_1"; break;
                    case 1: sRetTemplate = "lp_bonedelver_1"; break;
                    case 2: sRetTemplate = "lp_bonedelver_2"; break;
                    case 3: sRetTemplate = "lp_bonedelver_2"; break;
                }
    }
          if (sTemplate == "lp_bonedeliver_hard")
    {
        switch( Random( 6 ))
                {
                    case 0: sRetTemplate = "lp_bonedelver_3"; break;
                    case 1: sRetTemplate = "lp_bonedelver_3"; break;
                    case 2: sRetTemplate = "lp_bonedelver_4"; break;
                    case 3: sRetTemplate = "lp_bonedelver_4"; break;
                    case 4: sRetTemplate = "lp_bonedelver_1"; break;
                    case 5: sRetTemplate = "lp_bonedelver_2"; break;
                }
    }
        if (sTemplate == "lp_bonebatmix")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "lp_bonebat_1"; break;
                    case 1: sRetTemplate = "lp_bonebat_1"; break;
                    case 2: sRetTemplate = "lp_bonebat_1"; break;
                    case 3: sRetTemplate = "lp_bonebat_2"; break;
                    }
    }
        if (sTemplate == "lp_illthidzombie_lesser") //I know I know couldn't resist:P
    {
        switch( Random( 3 ))
                {
                    case 0: sRetTemplate = "lp_illithidzo_1"; break;
                    case 1: sRetTemplate = "lp_illithidzo_2"; break;
                    case 2: sRetTemplate = "lp_illithidzo_3"; break;
                    }
    }
          if (sTemplate == "lp_littlebig_spidomix")
    {
        switch( Random( 4 ))
                {
                    case 0: sRetTemplate = "lp_tinyspido"; break;
                    case 1: sRetTemplate = "lp_tinyspido"; break;
                    case 2: sRetTemplate = "lp_tinyspido"; break;
                    case 3: sRetTemplate = "lp_spido"; break;
                }
    }
    //

    // Goblins and Boss
    if (sTemplate == "gobsnboss")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "gobchiefa001");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "goblina001";
            }
            else
            {
                // He's dead, Deactivate Camp!
                SetLocalInt(oSpawn, "SpawnDeactivated", TRUE);
            }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "gobchiefa001";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

    // Scaled Encounter
    if (sTemplate == "scaledgobs")
    {
        // Initialize Variables
        int nTotalPCs;
        int nTotalPCLevel;
        int nAveragePCLevel;
        object oArea = GetArea(OBJECT_SELF);

        // Cycle through PCs in Area
        object oPC = GetFirstObjectInArea(oArea);
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC) == TRUE)
            {
                nTotalPCs++;
                nTotalPCLevel = nTotalPCLevel + GetHitDice(oPC);
            }
            oPC = GetNextObjectInArea(oArea);
        }
        if (nTotalPCs == 0)
        {
            nAveragePCLevel = 0;
        }
        else
        {
            nAveragePCLevel = nTotalPCLevel / nTotalPCs;
        }

        // Select a Creature to Spawn
        switch (nAveragePCLevel)
        {
            // Spawn Something with CR 1
            case 1:
                sRetTemplate = "goblina001";
            break;
            //

            // Spawn Something with CR 5
            case 5:
                sRetTemplate = "gobchiefa001";
            break;
            //
        }
    }
    //

    // Pirates and Boss
    if (sTemplate == "pirates")
    {
        // Delay the Spawn for 45 Minutes
        if (GetLocalInt(oSpawn, "DelayEnded") == FALSE)
        {
            if (GetLocalInt(oSpawn, "DelayStarted") == FALSE)
            {
                // Start the Delay
                SetLocalInt(oSpawn, "DelayStarted", TRUE);
                DelayCommand(20.0, SetLocalInt(oSpawn, "DelayEnded", TRUE));
            }
            sRetTemplate = "";
            return sRetTemplate;
        }
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "gobchiefa001");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "goblina001";
            }
            else
            {
                // He's dead, Deactivate Camp!
                SetLocalInt(oSpawn, "SpawnDeactivated", TRUE);
            }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "gobchiefa001";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

    // Advanced Scaled Encounter
    if (sTemplate == "advscaled")
    {
        //Initalize Variables
        int nTotalPCs;
        int nTotalPCLevel;
        int nAveragePCLevel;
        object oArea = GetArea(OBJECT_SELF);

        //Cycle through PCs in area
        object oPC = GetFirstObjectInArea(oArea);
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC) == TRUE)
            {
                nTotalPCs++;
                nTotalPCLevel = nTotalPCLevel + GetHitDice(oPC);
            }
        oPC = GetNextObjectInArea(oArea);
        }
        if (nTotalPCs == 0)
        {
            nAveragePCLevel = 0;
        }
        else
        {
            nAveragePCLevel = nTotalPCLevel / nTotalPCs;
        }

        //Select a Creature to Spawn
        switch (nAveragePCLevel)
        {
            //Spawn Something with CR 1
            case 1:
                switch (d6())
                {
                    case 1: sRetTemplate = "cr1example1";
                    case 2: sRetTemplate = "cr1example2";
                    case 3: sRetTemplate = "cr1example3";
                    case 4: sRetTemplate = "cr1example4";
                    case 5: sRetTemplate = "cr1example5";
                    case 6: sRetTemplate = "cr1example6";
                }
            break;
        }
    }

    // Watch fix by Rick7475
    if (sTemplate == "patrolgroup")
    {
      switch( Random( 12 ))
        {
           case 0: sRetTemplate = "citywatchcivilar"; break;
           case 1: sRetTemplate = "citywatcharmar"; break;
           case 2: sRetTemplate = "citywatcharmar"; break;
           case 3: sRetTemplate = "citywatchmancpl"; break;
           case 4: sRetTemplate = "citywatchmancpl"; break;
           case 5: sRetTemplate = "citywatchman"; break;
           case 6: sRetTemplate = "citywatchman"; break;
           case 7: sRetTemplate = "citywatchman"; break;
           case 8: sRetTemplate = "citywatchman"; break;
           case 9: sRetTemplate = "citywatchwizarde"; break;
           case 10: sRetTemplate = "citywatchwizarde"; break;
           case 11: sRetTemplate = "citywatchwizarde"; break;
        }
    }

    //
    // Added by Rick7475 to restore the sewers to the plumber quest.
    if (sTemplate == "sewers_1")
    {
        switch( Random( 18 ))
                {
                    case 0: sRetTemplate = "ashrat"; break;
                    case 1: sRetTemplate = "stinkbeetle"; break;
                    case 2: sRetTemplate = "ratdisease"; break;
                    case 3: sRetTemplate = "ratdisease"; break;
                    case 4: sRetTemplate = "ratdisease"; break;
                    case 5: sRetTemplate = "wanderrat"; break;
                    case 6: sRetTemplate = "sewerm"; break;
                    case 7: sRetTemplate = "sewerwasp"; break;
                    case 8: sRetTemplate = "ratdisease"; break;
                    case 9: sRetTemplate = "stinkbeetle"; break;
                    case 10: sRetTemplate = "stinkbeetle"; break;
                    case 11: sRetTemplate = "sewerwasp"; break;
                    case 12: sRetTemplate = "stinkbeetle"; break;
                    case 13: sRetTemplate = "slimyspider"; break;
                    case 14: sRetTemplate = "slimyspider2"; break;
                    case 15: sRetTemplate = "slimygoblin3"; break;
                    case 16: sRetTemplate = "ratdisease"; break;
                    case 17: sRetTemplate = "slimyspider2"; break;
                }
    }

    // Added by Rick7475 to restore the sewers to the baby quest.
    if (sTemplate == "sewers_goblins")
    {
        switch( Random( 10 ))
                {
                    case 0: sRetTemplate = "slimygoblin1"; break;
                    case 1: sRetTemplate = "slimygoblin1"; break;
                    case 2: sRetTemplate = "slimygoblin2"; break;
                    case 3: sRetTemplate = "slimygoblin2"; break;
                    case 4: sRetTemplate = "slimygoblin3"; break;
                    case 5: sRetTemplate = "slimygoblin3"; break;
                    case 6: sRetTemplate = "slimygoblin3"; break;
                    case 7: sRetTemplate = "slimygoblin3"; break;
                    case 8: sRetTemplate = "slimygoblin4"; break;
                    case 9: sRetTemplate = "slimygoblin4"; break;
                }
    }



    // Encounters
    if (sTemplate == "encounter")
    {
        // Declare Variables
        int nCounter, nCounterMax;
        string sCurrentTemplate;

        // Retreive and Increment Counter
        nCounter = GetLocalInt(oSpawn, "GroupCounter");
        nCounterMax = GetLocalInt(oSpawn, "CounterMax");
        nCounter++;

        // Retreive CurrentTemplate
        sCurrentTemplate = GetLocalString(oSpawn, "CurrentTemplate");

        // Check CounterMax
        if (nCounter > nCounterMax)
        {
            sCurrentTemplate = "";
            nCounter = 1;
        }

        if (sCurrentTemplate != "")
        {
            // Spawn Another CurrentTemplate
            sRetTemplate = sCurrentTemplate;
        }
        else
        {
            // Choose New CurrentTemplate and CounterMax
            switch (Random(2))
            {
                // Spawn 1-4 NW_DOGs
                case 0:
                sRetTemplate = "NW_DOG";
                nCounterMax = Random(4) + 1;
                break;
            }
            // Record New CurrentTemplate and CounterMax
            SetLocalString(oSpawn, "CurrentTemplate", sRetTemplate);
            SetLocalInt(oSpawn, "CounterMax", nCounterMax);
        }

        // Record Counter
        SetLocalInt(oSpawn, "GroupCounter", nCounter);
    }
    //


// -------------------------------------------
// Only Make Modifications Between These Lines
//
    return sRetTemplate;
}
