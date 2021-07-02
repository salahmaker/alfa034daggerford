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
    if (sTemplate == "loot")
    {
        switch( Random( 10+1 ))
                {
                    case 1: sRetTemplate = "corpse006"; break;
                    case 2: sRetTemplate = "corpse007"; break;
                    case 3: sRetTemplate = "corpse008"; break;
                    case 4: sRetTemplate = "corpse009"; break;
                    case 5: sRetTemplate = ""; break;
                    case 6: sRetTemplate = "lootbag007"; break;
                    case 7: sRetTemplate = "lootbag006"; break;
                    case 8: sRetTemplate = "lootbag004"; break;
                    case 9: sRetTemplate = ""; break;
                    case 10: sRetTemplate = ""; break;
                }
    }

    if (sTemplate == "web")
    {
        switch( Random( 4+1 ))
                {
                    case 1: sRetTemplate = "brazier004"; break;
                    case 2: sRetTemplate = "brazier005"; break;
                    case 3: sRetTemplate = "brazier006"; break;
                    case 4: sRetTemplate = "brazier007"; break;
                }
    }

    if (sTemplate == "chest_locked")
    {
        switch( Random( 4+1 ))
                {
                    case 1: sRetTemplate = "chest002"; break;
                    case 2: sRetTemplate = "chest003"; break;
                    case 3: sRetTemplate = "chest004"; break;
                    case 4: sRetTemplate = "chest005"; break;
                }
    }

    if (sTemplate == "chest_locked2")
    {
        switch( Random( 4+1 ))
                {
                    case 1: sRetTemplate = "chest006"; break;
                    case 2: sRetTemplate = "chest007"; break;
                    case 3: sRetTemplate = "chest008"; break;
                    case 4: sRetTemplate = "chest009"; break;
                }
    }

    if (sTemplate == "chest_locked_trapped")
    {
        switch( Random( 4+1 ))
                {
                    case 1: sRetTemplate = "chest010"; break;
                    case 2: sRetTemplate = "chest011"; break;
                    case 3: sRetTemplate = "chest012"; break;
                    case 4: sRetTemplate = "chest013"; break;
                }
    }

    if (sTemplate == "box")
    {
        switch( Random( 4+1 ))
                {
                    case 1: sRetTemplate = "box002"; break;
                    case 2: sRetTemplate = "box003"; break;
                    case 3: sRetTemplate = "box004"; break;
                    case 4: sRetTemplate = "box005"; break;
                }
    }

     if (sTemplate == "halflings")

    {
        switch( Random( 4+1 ))
                {
                    case 1: sRetTemplate = "halfling"; break;
                    case 2: sRetTemplate = "femalehalfling"; break;
                    case 3: sRetTemplate = "halfling001"; break;
                    case 4: sRetTemplate = "femalehalflin001"; break;
                }
    }

     if (sTemplate == "052_cw_goblins")

    {
        switch( Random( 44+1 ))
                {
                    case 1:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 2:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 3:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 4:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 5:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 6:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 7:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 8:  sRetTemplate = "052_cw_gobwar1"; break;
                    case 9:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 10:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 11:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 12:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 13:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 14:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 15:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 16:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 17:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 18:  sRetTemplate = "052_cw_gobwar2"; break;
                    case 19:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 20:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 21:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 22:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 23:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 24:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 25:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 26:  sRetTemplate = "052_cw_gobwar3"; break;
                    case 27: sRetTemplate = "052_cw_gobaxe1"; break;
                    case 28: sRetTemplate = "052_cw_gobaxe1"; break;
                    case 29: sRetTemplate = "052_cw_gobaxe1"; break;
                    case 30: sRetTemplate = "052_cw_gobaxe1"; break;
                    case 31: sRetTemplate = "052_cw_gobaxe1"; break;
                    case 32: sRetTemplate = "052_cw_gobaxe2"; break;
                    case 33: sRetTemplate = "052_cw_gobaxe2"; break;
                    case 34: sRetTemplate = "052_cw_gobaxe2"; break;
                    case 35: sRetTemplate = "052_cw_gobaxe2"; break;
                    case 36: sRetTemplate = "052_cw_gobaxe2"; break;
                    case 37: sRetTemplate = "052_cw_gobaxe3"; break;
                    case 38: sRetTemplate = "052_cw_gobaxe3"; break;
                    case 39: sRetTemplate = "052_cw_gobaxe3"; break;
                    case 40: sRetTemplate = "052_cw_gobaxe3"; break;
                    case 41: sRetTemplate = "052_cw_gobaxe3"; break;
                    case 42: sRetTemplate = "052_cw_gobsha1"; break;
                    case 43: sRetTemplate = "052_cw_gobsha2"; break;
                    case 44: sRetTemplate = "052_cw_gobsha3"; break;
                }
    }


    if (sTemplate == "furniture")
    {
        switch( Random( 8+1 ))
                {
                    case 1: sRetTemplate = "desk001"; break;
                    case 2: sRetTemplate = "desk002"; break;
                    case 3: sRetTemplate = "couch001"; break;
                    case 4: sRetTemplate = "armoire001"; break;
                    case 5: sRetTemplate = "bookshelf001"; break;
                    case 6: sRetTemplate = "cabinet001"; break;
                    case 7: sRetTemplate = "chstdrwrs001"; break;
                    case 8: sRetTemplate = "bookshelf001"; break;
                }
    }


   if (sTemplate == "misc")
    {
        switch( Random( 10+1 ))
                {
                    case 1: sRetTemplate = "pottedplant001"; break;
                    case 2: sRetTemplate = "pottedplant001"; break;
                    case 3: sRetTemplate = "urn001"; break;
                    case 4: sRetTemplate = "woodpile001"; break;
                    case 5: sRetTemplate = "birdcage001"; break;
                    case 6: sRetTemplate = "barrel001"; break;
                    case 7: sRetTemplate = "barrel001"; break;
                    case 8: sRetTemplate = "pottedplant001"; break;
                    case 9: sRetTemplate = "cot001"; break;
                    case 10: sRetTemplate = "pntingeasel001"; break;
                }
    }

if (sTemplate == "debris")
    {
        switch( Random( 20+1 ))
                {
                    case 1: sRetTemplate = "debris001"; break;
                    case 2: sRetTemplate = "debris002"; break;
                    case 3: sRetTemplate = "debris003"; break;
                    case 4: sRetTemplate = "debris004"; break;
                    case 5: sRetTemplate = "debris005"; break;
                    case 6: sRetTemplate = "debris006"; break;
                    case 7: sRetTemplate = "debris007"; break;
                    case 8: sRetTemplate = "debris008"; break;
                    case 9: sRetTemplate = "debris009"; break;
                    case 10: sRetTemplate = "debris0010"; break;
                    case 11: sRetTemplate = "debris011"; break;
                    case 12: sRetTemplate = "debris012"; break;
                    case 13: sRetTemplate = "debris013"; break;
                    case 14: sRetTemplate = "debris014"; break;
                    case 15: sRetTemplate = "debris015"; break;
                    case 16: sRetTemplate = "debris016"; break;
                    case 17: sRetTemplate = "debris017"; break;
                    case 18: sRetTemplate = "debris018"; break;
                    case 19: sRetTemplate = "debris019"; break;
                    case 20: sRetTemplate = "debris020"; break;
                }
    }

     if (sTemplate == "housethief")
    {
        switch( Random( 40+1 ))
                {
                    case 1: sRetTemplate = "thief001"; break;
                    case 2: sRetTemplate = "thief002"; break;
                    case 3: sRetTemplate = "thief003"; break;
                    case 4: sRetTemplate = "thief004"; break;
                    case 5: sRetTemplate = "thief005"; break;
                    case 6: sRetTemplate = "streetthug001"; break;
                    case 7: sRetTemplate = "NW_BTLFIRE"; break;
                    case 8: sRetTemplate = "NW_DOG"; break;
                    case 9: sRetTemplate = "streetthug"; break;
                    case 10: sRetTemplate = "NW_SPIDGIANT"; break;
                    case 11: sRetTemplate = "NW_BTLFIRE"; break;
                    case 12: sRetTemplate = "NW_STIRGE"; break;
                    case 13: sRetTemplate = "cc_thief_01"; break;
                    case 14: sRetTemplate = "cc_thief_02"; break;
                    case 15: sRetTemplate = "cc_thief_03"; break;
                    case 16: sRetTemplate = "cc_thief_04"; break;
                    case 17: sRetTemplate = "streetthug004"; break;
                    case 18: sRetTemplate = "thief001"; break;
                    case 19: sRetTemplate = "dog001"; break;
                    case 20: sRetTemplate = ""; break;
                    case 21: sRetTemplate = "dog001"; break;
                    case 22: sRetTemplate = ""; break;
                    case 23: sRetTemplate = "dog001"; break;
                    case 24: sRetTemplate = "dog001"; break;
                    case 25: sRetTemplate = "NW_BTLFIRE"; break;
                    case 26: sRetTemplate = "Nw_DOG"; break;
                    case 27: sRetTemplate = "streetthug"; break;
                    case 28: sRetTemplate = "dog001"; break;
                    case 29: sRetTemplate = "NW_BTLFIRE"; break;
                    case 30: sRetTemplate = "NW_STIRGE"; break;
                    case 31: sRetTemplate = "dog001"; break;
                    case 32: sRetTemplate = "dog001"; break;
                    case 33: sRetTemplate = "dog001"; break;
                    case 34: sRetTemplate = "dog001"; break;
                    case 35: sRetTemplate = "streetthug004"; break;
                    case 36: sRetTemplate = "thief001"; break;
                    case 37: sRetTemplate = ""; break;
                    case 38: sRetTemplate = ""; break;
                    case 39: sRetTemplate = ""; break;
                    case 40: sRetTemplate = ""; break;
                    }

    }


    if (sTemplate == "rug")
    {
        switch( Random( 12+1 ))
                {
                    case 1: sRetTemplate = "throwrug001"; break;
                    case 2: sRetTemplate = "throwrug002"; break;
                    case 3: sRetTemplate = "throwrug003"; break;
                    case 4: sRetTemplate = "throwrug004"; break;
                    case 5: sRetTemplate = "throwrug005"; break;
                    case 6: sRetTemplate = "throwrug006"; break;
                    case 7: sRetTemplate = "throwrug007"; break;
                    case 8: sRetTemplate = "throwrug008"; break;
                    case 9: sRetTemplate = "throwrug009"; break;
                    case 10: sRetTemplate = "throwrug010"; break;
                    case 11: sRetTemplate = "throwrug0011"; break;
                    case 12: sRetTemplate = "throwrug"; break;
                    }
    }

    if (sTemplate == "undead")
    {
        switch( Random( 30+1 ))
                {
                    case 1: sRetTemplate = "skeleton001"; break;
                    case 2: sRetTemplate = "skelpriest001"; break;
                    case 3: sRetTemplate = "zombie002"; break;
                    case 4: sRetTemplate = "zombie003"; break;
                    case 5: sRetTemplate = "zombwarr017"; break;
                    case 6: sRetTemplate = "ghoul001"; break;
                    case 7: sRetTemplate = "ghast001"; break;
                    case 8: sRetTemplate = "allip001"; break;
                    case 9: sRetTemplate = "shadow001"; break;
                    case 10: sRetTemplate = "mummy001"; break;
                    case 11: sRetTemplate = "skeleton001"; break;
                    case 12: sRetTemplate = "skeleton001"; break;
                    case 13: sRetTemplate = "skeleton001"; break;
                    case 14: sRetTemplate = "skelpriest001"; break;
                    case 15: sRetTemplate = "zombie002"; break;
                    case 16: sRetTemplate = "zombie003"; break;
                    case 17: sRetTemplate = "skeleton001"; break;
                    case 18: sRetTemplate = "skeleton001"; break;
                    case 19: sRetTemplate = "skelpriest001"; break;
                    case 20: sRetTemplate = "zombie002"; break;
                    case 21: sRetTemplate = ""; break;
                    case 22: sRetTemplate = ""; break;
                    case 23: sRetTemplate = ""; break;
                    case 24: sRetTemplate = ""; break;
                    case 25: sRetTemplate = ""; break;
                    case 26: sRetTemplate = ""; break;
                    case 27: sRetTemplate = ""; break;
                    case 28: sRetTemplate = ""; break;
                    case 29: sRetTemplate = ""; break;
                    case 30: sRetTemplate = ""; break;
                    }
    }

if (sTemplate == "winter")
    {
        switch( Random( 40+1 ))
                {
                    case 1: sRetTemplate = "owlbear"; break;
                    case 2: sRetTemplate = "bearpolar001"; break;
                    case 3: sRetTemplate = "wolf001"; break;
                    case 4: sRetTemplate = "worg001"; break;
                    case 5: sRetTemplate = "wolfwint001"; break;
                    case 6: sRetTemplate = "wolfwint001"; break;
                    case 7: sRetTemplate = "wolfwint001"; break;
                    case 8: sRetTemplate = "wolfwint001"; break;
                    case 9: sRetTemplate = "wolfwint001"; break;
                    case 10: sRetTemplate = "bearpolar001"; break;
                    case 11: sRetTemplate = "bearpolar001"; break;
                    case 12: sRetTemplate = "bearpolar001"; break;
                    case 13: sRetTemplate = "wolf001"; break;
                    case 14: sRetTemplate = "wolf001"; break;
                    case 15: sRetTemplate = "worg002"; break;
                    case 16: sRetTemplate = "worg002"; break;
                    case 17: sRetTemplate = "orcchiefa001"; break;
                    case 18: sRetTemplate = "rakeshshaman002"; break;
                    case 19: sRetTemplate = "orcwiza002"; break;
                    case 20: sRetTemplate = "orcchiefb001"; break;
                    case 21: sRetTemplate = "orcwizb001"; break;
                    case 22: sRetTemplate = "rakeshshaman002"; break;
                    case 23: sRetTemplate = "wilddeer"; break;
                    case 24: sRetTemplate = "sw_deer_02"; break;
                    case 25: sRetTemplate = "ettin001"; break;
                    case 26: sRetTemplate = "gnthill001"; break;
                    case 27: sRetTemplate = "gntmount001"; break;
                    case 28: sRetTemplate = "ogre003"; break;
                    case 29: sRetTemplate = "owlbear"; break;
                    case 30: sRetTemplate = "stirge001"; break;
                    case 31: sRetTemplate = "ogre003"; break;
                    case 32: sRetTemplate = "grayrend001"; break;
                    case 33: sRetTemplate = "krenshar001"; break;
                    case 34: sRetTemplate = "krenshar001"; break;
                    case 35: sRetTemplate = "krenshar001"; break;
                    case 36: sRetTemplate = "ogre002"; break;
                    case 37: sRetTemplate = "minotaur001"; break;
                    case 38: sRetTemplate = "minotaur001"; break;
                    case 39: sRetTemplate = "minotaur001"; break;
                    case 40: sRetTemplate = "minotaur001"; break;
                    }
    }


if (sTemplate == "forest")
    {
        switch( Random( 40+1 ))
                {
                    case 1: sRetTemplate = "bearbrwn001"; break;
                    case 2: sRetTemplate = "bearkodiak001"; break;
                    case 3: sRetTemplate = "bearblck001"; break;
                    case 4: sRetTemplate = "wolf001"; break;
                    case 5: sRetTemplate = "wolf001"; break;
                    case 6: sRetTemplate = "worg002"; break;
                    case 7: sRetTemplate = "worg002"; break;
                    case 8: sRetTemplate = "cougar001"; break;
                    case 9: sRetTemplate = "cat001"; break;
                    case 10: sRetTemplate = "panther001"; break;
                    case 11: sRetTemplate = "ev_deer"; break;
                    case 12: sRetTemplate = "ev_deer"; break;
                    case 13: sRetTemplate = "sw_deer_02"; break;
                    case 14: sRetTemplate = "ev_deer"; break;
                    case 15: sRetTemplate = "bugchiefa003"; break;
                    case 16: sRetTemplate = "bugchiefa002"; break;
                    case 17: sRetTemplate = "bugchiefa004"; break;
                    case 18: sRetTemplate = "bugwiza001"; break;
                    case 19: sRetTemplate = "bugwizb001"; break;
                    case 20: sRetTemplate = "bugchiefb004"; break;
                    case 21: sRetTemplate = "uc_treant"; break;
                    case 22: sRetTemplate = "gobchiefb001"; break;
                    case 23: sRetTemplate = "gobchiefa001"; break;
                    case 24: sRetTemplate = "gobwiza001"; break;
                    case 25: sRetTemplate = "ettin001"; break;
                    case 26: sRetTemplate = "gnthill001"; break;
                    case 27: sRetTemplate = "gobwizb001"; break;
                    case 28: sRetTemplate = "ogre002"; break;
                    case 29: sRetTemplate = "owlbear"; break;
                    case 30: sRetTemplate = "lion001"; break;
                    case 31: sRetTemplate = "lion001"; break;
                    case 32: sRetTemplate = "troll001"; break;
                    case 33: sRetTemplate = "ettin001"; break;
                    case 34: sRetTemplate = "spidgiant001"; break;
                    case 35: sRetTemplate = "spidgiant001"; break;
                    case 36: sRetTemplate = "ettercap001"; break;
                    case 37: sRetTemplate = "ettercap001"; break;
                    case 38: sRetTemplate = "umberhulk001"; break;
                    case 39: sRetTemplate = "umberhulk001"; break;
                    case 40: sRetTemplate = "minotaur001"; break;
                    }
    }

    if (sTemplate == "underground")
    {
        switch( Random( 30+1 ))
                {
                    case 1: sRetTemplate = "skeleton001"; break;
                    case 2: sRetTemplate = "skelpriest001"; break;
                    case 3: sRetTemplate = "zombie002"; break;
                    case 4: sRetTemplate = "zombie003"; break;
                    case 5: sRetTemplate = "zombwarr017"; break;
                    case 6: sRetTemplate = "ghoul001"; break;
                    case 7: sRetTemplate = "ghast001"; break;
                    case 8: sRetTemplate = "allip001"; break;
                    case 9: sRetTemplate = "shadow001"; break;
                    case 10: sRetTemplate = "mummy001"; break;
                    case 11: sRetTemplate = "skeleton001"; break;
                    case 12: sRetTemplate = "skeleton001"; break;
                    case 13: sRetTemplate = "skeleton001"; break;
                    case 14: sRetTemplate = "skelpriest001"; break;
                    case 15: sRetTemplate = "zombie002"; break;
                    case 16: sRetTemplate = "zombie003"; break;
                    case 17: sRetTemplate = "skeleton001"; break;
                    case 18: sRetTemplate = "skeleton001"; break;
                    case 19: sRetTemplate = "skelpriest001"; break;
                    case 20: sRetTemplate = "zombie002"; break;
                    case 21: sRetTemplate = ""; break;
                    case 22: sRetTemplate = ""; break;
                    case 23: sRetTemplate = ""; break;
                    case 24: sRetTemplate = ""; break;
                    case 25: sRetTemplate = ""; break;
                    case 26: sRetTemplate = ""; break;
                    case 27: sRetTemplate = ""; break;
                    case 28: sRetTemplate = ""; break;
                    case 29: sRetTemplate = ""; break;
                    case 30: sRetTemplate = ""; break;
                    }
    }
    // watchgroup (1 Watchman, 1 Wizard, 1 Civilar and 1 Armar)
    if (sTemplate == "watchgroup")
    {
         switch( Random( 12+1 ))
                {
                    case 1: sRetTemplate = "citywatchman"; break;
                    case 2: sRetTemplate = "citywatchman"; break;
                    case 3: sRetTemplate = "citywatchman"; break;
                    case 4: sRetTemplate = "citywatchman"; break;
                    case 5: sRetTemplate = "citywatchman"; break;
                    case 6: sRetTemplate = "citywatchman"; break;
                    case 7: sRetTemplate = "citywatchman"; break;
                    case 8: sRetTemplate = "citywatchman"; break;
                    case 9: sRetTemplate = "citywatcharmar"; break;
                    case 10: sRetTemplate = "citywatcharmar"; break;
                    case 11: sRetTemplate = "citywatchwizarde"; break;
                    case 12: sRetTemplate = "citywatchcivilar"; break;
                           }
    }

        if (sTemplate == "Bandits")
    {
         switch( Random( 15+1 ))
                {
                    case 1: sRetTemplate = "bandit003"; break;
                    case 2: sRetTemplate = "banditrecruit"; break;
                    case 3: sRetTemplate = "bandit005"; break;
                    case 4: sRetTemplate = "banditfighter"; break;
                    case 5: sRetTemplate = "bandit006"; break;
                    case 6: sRetTemplate = "bandit004"; break;
                    case 7: sRetTemplate = "goblinbandit"; break;
                    case 8: sRetTemplate = "banditrecruit"; break;
                    case 9: sRetTemplate = "bandit004"; break;
                    case 10: sRetTemplate = "banditrecruit"; break;
                    case 11: sRetTemplate = "goblinbandit"; break;
                    case 12: sRetTemplate = "lizardmanbandit"; break;
                    case 13: sRetTemplate = "halforcbandit"; break;
                    case 14: sRetTemplate = "banditrecruit"; break;
                    case 15: sRetTemplate = "banditrecruit"; break;
                    }
    }
// watchgroup (1 Watchman, 1 Wizard, 1 Civilar and 1 Armar)
    if (sTemplate == "commoner")
    {
         switch( Random( 20+1 ))
                {
                    case 1: sRetTemplate = "hooker002"; break;
                    case 2: sRetTemplate = "noblmale001"; break;
                    case 3: sRetTemplate = "sw_comm_03"; break;
                    case 4: sRetTemplate = "noblmale002"; break;
                    case 5: sRetTemplate = "oldman001"; break;
                    case 6: sRetTemplate = "oldwoman001"; break;
                    case 7: sRetTemplate = "hooker003"; break;
                    case 8: sRetTemplate = "sw_comm_01"; break;
                    case 9: sRetTemplate = "humsailor001"; break;
                    case 10: sRetTemplate = "comfemale001"; break;
                    case 11: sRetTemplate = "commale003"; break;
                    case 12: sRetTemplate = "commale005"; break;
                    case 13: sRetTemplate = "hooker005"; break;
                    case 14: sRetTemplate = "comfemale002"; break;
                    case 15: sRetTemplate = "hooker004"; break;
                    case 16: sRetTemplate = "sw_comm_02"; break;
                    case 17: sRetTemplate = "noblmale003"; break;
                    case 18: sRetTemplate = "commale003"; break;
                    case 19: sRetTemplate = "hooker004"; break;
                    case 20: sRetTemplate = "oldwoman001"; break;

       }
    }

       if (sTemplate == "taverner")
    {
         switch( Random( 20+1 ))
                {
                    case 1: sRetTemplate = "hooker002"; break;
                    case 2: sRetTemplate = "noblmale001"; break;
                    case 3: sRetTemplate = "noblmale001"; break;
                    case 4: sRetTemplate = "noblmale002"; break;
                    case 5: sRetTemplate = "humsailor001"; break;
                    case 6: sRetTemplate = "humsailor001"; break;
                    case 7: sRetTemplate = "hooker002"; break;
                    case 8: sRetTemplate = "hooker003"; break;
                    case 9: sRetTemplate = "humsailor001"; break;
                    case 10: sRetTemplate = "comfemale001"; break;
                    case 11: sRetTemplate = "commale003"; break;
                    case 12: sRetTemplate = "comfemale001"; break;
                    case 13: sRetTemplate = "hooker005"; break;
                    case 14: sRetTemplate = "humsailor001"; break;
                    case 15: sRetTemplate = "hooker004"; break;
                    case 16: sRetTemplate = "hooker005"; break;
                    case 17: sRetTemplate = "noblmale003"; break;
                    case 18: sRetTemplate = "hooker005"; break;
                    case 19: sRetTemplate = "oldman001"; break;
                    case 20: sRetTemplate = "oldwoman001"; break;
                    }

       }
         if (sTemplate == "gnolls")
       {
         switch( Random( 10+1 ))
         {
                   case 1: sRetTemplate = "sw_gnoll_01"; break;
                   case 2: sRetTemplate = "sw_gnoll_01"; break;
                   case 3: sRetTemplate = "sw_gnoll_01"; break;
                   case 4: sRetTemplate = "sw_gnoll_02"; break;
                   case 5: sRetTemplate = "sw_gnoll_03"; break;
                   case 6: sRetTemplate = "sw_gnoll_03"; break;
                   case 7: sRetTemplate = "sw_gnoll_04"; break;
                   case 8: sRetTemplate = "sw_gnoll_04"; break;
                   case 9: sRetTemplate = "sw_gnoll_02"; break;
                   case 10: sRetTemplate = "sw_gnoll_03"; break;
                   }
                       }
         if (sTemplate == "game")
       {
         switch( Random( 15+1 ))
         {
                   case 1: sRetTemplate = "ev_deer"; break;
                   case 2: sRetTemplate = "ev_bearblck"; break;
                   case 3: sRetTemplate = "ev_wolf"; break;
                   case 4: sRetTemplate = "ev_boar"; break;
                   case 5: sRetTemplate = "ev_deer"; break;
                   case 6: sRetTemplate = "ev_deer"; break;
                   case 7: sRetTemplate = "ev_bearblck"; break;
                   case 8: sRetTemplate = "ev_deer"; break;
                   case 9: sRetTemplate = "ev_boar"; break;
                   case 10: sRetTemplate = "ev_deer"; break;
                   case 11: sRetTemplate = "ev_wolf"; break;
                   case 12: sRetTemplate = "ev_deer"; break;
                   case 13: sRetTemplate = "ev_bearblck"; break;
                   case 14: sRetTemplate = "sw_deer_02"; break;
                   case 15: sRetTemplate = "ev_wolf"; break;
                   }

       }
       if (sTemplate == "guildthief")
      {
       switch( Random( 20+1 ))
        {
                   case 1: sRetTemplate = "guildthief"; break;
                   case 2: sRetTemplate = "guildthief001"; break;
                   case 3: sRetTemplate = "dog001"; break;
                   case 4: sRetTemplate = "guildthief002"; break;
                   case 5: sRetTemplate = "guildthief003"; break;
                   case 6: sRetTemplate = "guildthief001"; break;
                   case 7: sRetTemplate = "dog001"; break;
                   case 8: sRetTemplate = "guildthief002"; break;
                   case 9: sRetTemplate = "guildthief"; break;
                   case 10: sRetTemplate = "guildthief004"; break;
                   case 11: sRetTemplate = "guildthief003"; break;
                   case 12: sRetTemplate = "dog001"; break;
                   case 13: sRetTemplate = "guildthief"; break;
                   case 14: sRetTemplate = "guildthief001"; break;
                   case 15: sRetTemplate = "guildthief002"; break;
                   case 16: sRetTemplate = "guildthief003"; break;
                   case 17: sRetTemplate = "dog001"; break;
                   case 18: sRetTemplate = "guildthief004"; break;
                   case 19: sRetTemplate = "guildthief"; break;
                   case 20: sRetTemplate = "guildthief001"; break;
                   }
         }
           if (sTemplate == "kobolds")
       {
         switch( Random( 15+1 ))
         {
                   case 1: sRetTemplate = "sw_kobold_01"; break;
                   case 2: sRetTemplate = "sw_kobold_02"; break;
                   case 3: sRetTemplate = "sw_kobold_07"; break;
                   case 4: sRetTemplate = "sw_kobold_11"; break;
                   case 5: sRetTemplate = "sw_kobold_12"; break;
                   case 6: sRetTemplate = "kobold002"; break;
                   case 7: sRetTemplate = "kobold006"; break;
                   case 8: sRetTemplate = "sw_kobold_01"; break;
                   case 9: sRetTemplate = "sw_kobold_02"; break;
                   case 10: sRetTemplate = "sw_kobold_07"; break;
                   case 11: sRetTemplate = "sw_kobold_11"; break;
                   case 12: sRetTemplate = "sw_kobold_12"; break;
                   case 13: sRetTemplate = "kobold002"; break;
                   case 14: sRetTemplate = "sw_kobold_01"; break;
                   case 15: sRetTemplate = "sw_kobold_11"; break;
                   }

       }
        if (sTemplate == "BG_Citizen")
       {
         switch( Random( 10+1 ))
         {
                   case 1: sRetTemplate = "comm1"; break;
                   case 2: sRetTemplate = "comm002"; break;
                   case 3: sRetTemplate = "comm003"; break;
                   case 4: sRetTemplate = "comm018"; break;
                   case 5: sRetTemplate = "halfling"; break;
                   case 6: sRetTemplate = "femalehalflin001"; break;
                   case 7: sRetTemplate = "baldursgatecitiz"; break;
                   case 8: sRetTemplate = "baldursgateciti001"; break;
                   case 9: sRetTemplate = "baldursgateciti002"; break;
                   case 10: sRetTemplate = "baldursgateciti003"; break;
                   }
                       }
                          if (sTemplate == "SMN_kobolds")
       {
         switch( Random( 6+1 ))
         {
                   case 1: sRetTemplate = "sr_kobold002"; break;
                   case 2: sRetTemplate = "sr_kobold002"; break;
                   case 3: sRetTemplate = "sr_kobold002"; break;
                   case 4: sRetTemplate = "sr_kobold003"; break;
                   case 5: sRetTemplate = "sr_kobold003"; break;
                   case 6: sRetTemplate = "sr_kobold004"; break;
         }

       }


    //
    // road_low/med/high
    //
    // Random Monster Scripting by Steven Wells (aka Sareena) -- 02/05/03
    //
    // Example flags: SP_SN10_RS15_SD1P_SA_SR60_PC10R_CD120_DS2_RW_SG
    //
    // RS15-20 works well so far, LT is assigned by script, SD is still being tweaked and I've run
    // into a bug (or server limitation?) that makes SD1=4.5 minutes, SD2=9 minutes, etc...,
    // I use SN10 for all wandering monsters since this script determines actual number and it's
    // easier to adjust this script to change numbers than to adjust a lot of spawns.
    //
    // NOTE: With SN10, DimRet will not give reduced experience until 10 mobs have spawned.
    // Since most spawns are 2-8 mobs, they will be giving experience longer than normal.  This
    // is a known bug.
    //
    // Edit encounters in the section marked EDIT HERE to reflect those on your server.
    // If you number encounter types like I have (i.e. sw_bandit_01, sw_bandit_02, etc) you can
    // have mixed spawn groups.  Put lower level versions in lower numbers.
    //
    // If the number of encounter changes, edit random numbers selector to correspond.
    //

    if (GetStringLeft(sTemplate, 5) == "road_")
    {
        int nCounterCur;    // current counter
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
            if (GetStringRight(sTemplate, 4) == "_low")
                nRandom = Random(8) +1;
            if (GetStringRight(sTemplate, 4) == "_med")
                nRandom = Random(5) +9;
            if (GetStringRight(sTemplate, 5) == "_high")
                nRandom = Random(4) +14;
            switch (nRandom)
            {
                // low has 8 mobs
                case 1:  sBlue = "sw_kobold_";   nCounterMax = Random(4) +0; nMaxVariance = 5; nStart = 1; nLoot = 550; break;
                case 2:  sBlue = "sw_goblin_";   nCounterMax = Random(4) +0; nMaxVariance = 3; nStart = 1; nLoot = 500; break;
                case 3:  sBlue = "sw_goblin_";   nCounterMax = Random(4) +0; nMaxVariance = 6; nStart = 1; nLoot = 500; break;
                case 4:  sBlue = "sw_gnoll_";    nCounterMax = Random(3) +0; nMaxVariance = 3; nStart = 1; nLoot = 500; break;
                case 5:  sBlue = "sw_hobgoblin_";nCounterMax = Random(3) +0; nMaxVariance = 1; nStart = 1; nLoot = 500; break;
                case 6:  sBlue = "sw_bugbear_";  nCounterMax = Random(2) +0; nMaxVariance = 6; nStart = 1; nLoot = 500; break;
                case 7:  sBlue = "sw_gibberling_";nCounterMax = Random(4) +0; nMaxVariance = 1; nStart = 1; nLoot = 500; break;
                case 8:  sBlue = "sw_orc_";      nCounterMax = Random(4) +0; nMaxVariance = 7; nStart = 1; nLoot = 500; break;
                // med has 4 mobs
                case 9:  sBlue = "sw_bugbear_";   nCounterMax = Random(3) +0; nMaxVariance = 6; nStart = 1; nLoot = 510; break;
                case 10:  sBlue = "sw_goblin_";   nCounterMax = Random(3) +4; nMaxVariance = 6; nStart = 1; nLoot = 510; break;
                case 11:  sBlue = "sw_hobgoblin_";nCounterMax = Random(2) +1; nMaxVariance = 3; nStart = 1; nLoot = 510; break;
                case 12:  sBlue = "sw_goblin_";   nCounterMax = Random(3) +4; nMaxVariance = 6; nStart = 1; nLoot = 510; break;
                case 13:  sBlue = "sw_hobgoblin_";nCounterMax = Random(4) +3; nMaxVariance = 6; nStart = 1; nLoot = 500; break;

                // high has 1 mob
                case 14:  sBlue = "sw_hillgiant_";nCounterMax = Random(1) +0; nMaxVariance = 3; nStart = 1; nLoot = 520; break;
                case 15:  sBlue = "sw_ettin_";    nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 520; break;
                //case 16:  sBlue = "sw_adv_";      nCounterMax = Random(2) +0; nMaxVariance = 6; nStart = 1; nLoot = 551; break;
                case 16:  sBlue = "sw_ogre_";     nCounterMax = Random(2) +1; nMaxVariance = 3; nStart = 1; nLoot = 520; break;

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
        if ((nCounterCur <= nCounterMax) && (GetStringRight(sBlue,1) == "_"))
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
                case 10:  sCurrentTemplate = sBlue + "10"; break;
                case 11:  sCurrentTemplate = sBlue + "11"; break;
                case 12:  sCurrentTemplate = sBlue + "12"; break;
                case 13:  sCurrentTemplate = sBlue + "13"; break;
                case 14:  sCurrentTemplate = sBlue + "14"; break;
                case 15:  sCurrentTemplate = sBlue + "15"; break;
                case 16:  sCurrentTemplate = sBlue + "16"; break;
                case 17:  sCurrentTemplate = sBlue + "16"; break;
            }

            sRetTemplate = sCurrentTemplate;
            SetLocalString(oSpawn, "TemplateCur", sRetTemplate);

            SetLocalInt(oSpawn, "f_LootTable", nLoot);  // default loot for mob

            nCounterCur++;
            SetLocalInt(oSpawn, "CounterCur", nCounterCur);
        }

        // Spawn single template mobs
        else if ((nCounterCur <= nCounterMax) && (GetStringRight(sBlue,1) != "_"))
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

   if (GetStringLeft(sTemplate, 5) == "wild_")
    {
        int nCounterCur;    // current counter
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
            if (GetStringRight(sTemplate, 4) == "_low")
                nRandom = Random(6) +1;
            if (GetStringRight(sTemplate, 4) == "_med")
                nRandom = Random(3) +6;
            if (GetStringRight(sTemplate, 5) == "_high")
                nRandom = Random(4) +9;
            if (GetStringRight(sTemplate, 7) == "_forlow")
                nRandom = Random(8) +13;
            if (GetStringRight(sTemplate, 7) == "_formed")
                nRandom = Random(7) +21;
            if (GetStringRight(sTemplate, 8) == "_forhigh")
                nRandom = Random(3) +28;
            if (GetStringRight(sTemplate, 6) == "_mtmed")
                nRandom = Random(7) +31;
            if (GetStringRight(sTemplate, 7) == "_mthigh")
                nRandom = Random(3) +38;
            if (GetStringRight(sTemplate, 6) == "_uglow")
                nRandom = Random(5) +41;
            if (GetStringRight(sTemplate, 6) == "_ugmed")
                nRandom = Random(7) +46;
            if (GetStringRight(sTemplate, 7) == "_ughigh")
                nRandom = Random(8) +53;
            switch (nRandom)
            {
                // low has 8 mobs
                case 1:  sBlue = "sw_bear_";     nCounterMax = Random(1) +0; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 2:  sBlue = "sw_wolf_";     nCounterMax = Random(1) +1; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 3:  sBlue = "sw_cat_";      nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 4:  sBlue = "sw_cat_";      nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 5:  sBlue = "sw_wolf_";     nCounterMax = Random(1) +1; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 6:  sBlue = "sw_boar_";     nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                // med has 4 mobs
                case 7:  sBlue = "sw_owlbear_";  nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 8:  sBlue = "sw_ankheg_";   nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 9:  sBlue = "sw_owlbear_";  nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 10:  sBlue = "sw_bulette_"; nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                // high has 1 mob
                case 11:  sBlue = "sw_grayrender_";nCounterMax = Random(1)+0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 12:  sBlue = "sw_umberhulk_"; nCounterMax = Random(1) +0; nMaxVariance = 0; nStart = 1; nLoot = 551; break;
                // forlow has 4 mobs
                case 13:  sBlue = "sw_cat_";     nCounterMax = Random(1) +0; nMaxVariance = 2; nStart = 1; nLoot = 551; break;
                case 14:  sBlue = "sw_bear_";    nCounterMax = Random(1) +0; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 15:  sBlue = "sw_spider_";  nCounterMax = Random(1) +0; nMaxVariance = 3; nStart = 1; nLoot = 551; break;
                case 16:  sBlue = "sw_ettercap_";nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 17:  sBlue = "sw_bear_";    nCounterMax = Random(5) +2; nMaxVariance = 1; nStart = 1; nLoot = 550; break;
                case 18:  sBlue = "sw_fey_";     nCounterMax = Random(2) +0; nMaxVariance = 4; nStart = 1; nLoot = 520; break;
                case 19:  sBlue = "sw_boar_";    nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 20:  sBlue = "sw_spider_";  nCounterMax = Random(2) +1; nMaxVariance = 2; nStart = 1; nLoot = 551; break;
                // formed has 2 mobs
                case 21:  sBlue = "sw_ettin_";   nCounterMax = Random(2) +0; nMaxVariance = 5; nStart = 1; nLoot = 520; break;
                case 22:  sBlue = "sw_bear_";    nCounterMax = Random(2) +0; nMaxVariance = 3; nStart = 2; nLoot = 551; break;
                case 23:  sBlue = "sw_spider_";  nCounterMax = Random(2) +0; nMaxVariance = 3; nStart = 1; nLoot = 551; break;
                case 24:  sBlue = "sw_ettercap_";nCounterMax = Random(2) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 25:  sBlue = "sw_cat_";    nCounterMax = Random(2) +4;  nMaxVariance = 0; nStart = 4; nLoot = 551; break;
                case 26:  sBlue = "sw_fey_";     nCounterMax = Random(2) +1; nMaxVariance = 3; nStart = 2; nLoot = 520; break;
                case 27:  sBlue = "sw_owlbear_"; nCounterMax = Random(2) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                // forhigh has 1 mob
                case 28:  sBlue = "sw_harpy_";   nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 520; break;
                case 29:  sBlue = "sw_bulette_"; nCounterMax = Random(1) +0; nMaxVariance = 3; nStart = 2; nLoot = 551; break;
                case 30:  sBlue = "sw_wyvern_";  nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                // mtmed has 2 mobs
                case 31:  sBlue = "sw_bear_";    nCounterMax = Random(1) +0; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 32:  sBlue = "sw_cat_";     nCounterMax = Random(2) +0; nMaxVariance = 0; nStart = 5; nLoot = 551; break;
                case 33:  sBlue = "sw_wogrider_";nCounterMax = Random(2) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 34:  sBlue = "sw_wogrider_";nCounterMax = Random(2) +0; nMaxVariance = 2; nStart = 1; nLoot = 520; break;
                case 35:  sBlue = "sw_minotaur_";nCounterMax = Random(3) +0; nMaxVariance = 1; nStart = 1; nLoot = 520; break;
                case 36:  sBlue = "sw_gnoll_";   nCounterMax = Random(4) +2; nMaxVariance = 4; nStart = 1; nLoot = 510; break;
                case 37:  sBlue = "sw_gnoll_";   nCounterMax = Random(2) +2; nMaxVariance = 4; nStart = 1; nLoot = 510; break;
                // mthigh has 1 mob
                case 38:  sBlue = "sw_adv_";     nCounterMax = Random(2) +0; nMaxVariance = 6; nStart = 1; nLoot = 520; break;
                case 39:  sBlue = "sw_basilisk_"; nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 40:  sBlue = "sw_mtgiant_"; nCounterMax = Random(2) +0; nMaxVariance = 4; nStart = 1; nLoot = 520; break;
                // uglow has 3 mob
                case 41:  sBlue = "sw_grimlock_";nCounterMax = Random(3) +1; nMaxVariance = 2; nStart = 1; nLoot = 500; break;
                case 42:  sBlue = "sw_carrion_"; nCounterMax = Random(2) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 43:  sBlue = "sw_rust_";    nCounterMax = Random(1) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 44:  sBlue = "sw_beetle_";  nCounterMax = Random(3) +0; nMaxVariance = 2; nStart = 1; nLoot = 551; break;
                case 45:  sBlue = "sw_stink_";   nCounterMax = Random(3) +0; nMaxVariance = 2; nStart = 1; nLoot = 551; break;
                // ugmed has 7 mobs
                case 46:  sBlue = "sw_beetle_";  nCounterMax = Random(3) +1; nMaxVariance = 2; nStart = 1; nLoot = 551; break;
                case 47:  sBlue = "sw_stink_";   nCounterMax = Random(3) +1; nMaxVariance = 2; nStart = 1; nLoot = 551; break;
                case 48:  sBlue = "sw_spider_";  nCounterMax = Random(2) +0; nMaxVariance = 3; nStart = 1; nLoot = 551; break;
                case 49:  sBlue = "sw_bombardier_";nCounterMax = Random(2) +1; nMaxVariance = 2; nStart = 1; nLoot = 551; break;
                case 50:  sBlue = "sw_ankheg_";  nCounterMax = Random(2) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 51:  sBlue = "sw_carrion_"; nCounterMax = Random(2) +1; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 52:  sBlue = "sw_grimlock_";nCounterMax = Random(3) +1; nMaxVariance = 2; nStart = 1; nLoot = 510; break;
                // ughigh has 3 mob
                case 53:  sBlue = "sw_basilisk_";nCounterMax = Random(2) +0; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 54:  sBlue = "sw_carrion_"; nCounterMax = Random(4) +2; nMaxVariance = 1; nStart = 1; nLoot = 551; break;
                case 55:  sBlue = "sw_umberhulk_";nCounterMax = Random(2) +2; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 56:  sBlue = "sw_beetle_";  nCounterMax = Random(2) +1; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 57:  sBlue = "sw_stink_";   nCounterMax = Random(2) +1; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 58:  sBlue = "sw_stag_";  nCounterMax = Random(1) +0; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 59:  sBlue = "sw_bombardier_";nCounterMax = Random(2) +1; nMaxVariance = 4; nStart = 1; nLoot = 551; break;
                case 60:  sBlue = "sw_grimlock_";nCounterMax = Random(4) +4; nMaxVariance = 2; nStart = 1; nLoot = 510; break;

                }



        // ********************************* CUSTOMIZE ABOVE HERE *************************** }
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
        if ((nCounterCur <= nCounterMax) && (GetStringRight(sBlue,1) == "_"))
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
                case 10:  sCurrentTemplate = sBlue + "10"; break;
                case 11:  sCurrentTemplate = sBlue + "11"; break;
                case 12:  sCurrentTemplate = sBlue + "12"; break;
                case 13:  sCurrentTemplate = sBlue + "13"; break;
                case 14:  sCurrentTemplate = sBlue + "14"; break;
                case 15:  sCurrentTemplate = sBlue + "15"; break;
                case 16:  sCurrentTemplate = sBlue + "16"; break;
                case 17:  sCurrentTemplate = sBlue + "17"; break;
                case 18:  sCurrentTemplate = sBlue + "18"; break;
                case 19:  sCurrentTemplate = sBlue + "19"; break;
                case 20:  sCurrentTemplate = sBlue + "20"; break;
                case 21:  sCurrentTemplate = sBlue + "21"; break;
                case 22:  sCurrentTemplate = sBlue + "22"; break;
                case 23:  sCurrentTemplate = sBlue + "23"; break;
                case 24:  sCurrentTemplate = sBlue + "24"; break;
                case 25:  sCurrentTemplate = sBlue + "25"; break;
                case 26:  sCurrentTemplate = sBlue + "26"; break;
                case 27:  sCurrentTemplate = sBlue + "27"; break;
                case 28:  sCurrentTemplate = sBlue + "28"; break;
                case 29:  sCurrentTemplate = sBlue + "29"; break;
                case 30:  sCurrentTemplate = sBlue + "30"; break;
                case 31:  sCurrentTemplate = sBlue + "31"; break;
                case 32:  sCurrentTemplate = sBlue + "32"; break;
                case 33:  sCurrentTemplate = sBlue + "33"; break;
                case 34:  sCurrentTemplate = sBlue + "34"; break;
                case 35:  sCurrentTemplate = sBlue + "35"; break;
                case 36:  sCurrentTemplate = sBlue + "36"; break;
                case 37:  sCurrentTemplate = sBlue + "37"; break;
                case 38:  sCurrentTemplate = sBlue + "38"; break;
                case 39:  sCurrentTemplate = sBlue + "39"; break;
                case 40:  sCurrentTemplate = sBlue + "40"; break;
                case 41:  sCurrentTemplate = sBlue + "41"; break;
                case 42:  sCurrentTemplate = sBlue + "42"; break;
                case 43:  sCurrentTemplate = sBlue + "43"; break;
                case 44:  sCurrentTemplate = sBlue + "44"; break;
                case 45:  sCurrentTemplate = sBlue + "45"; break;
                case 46:  sCurrentTemplate = sBlue + "46"; break;
                case 47:  sCurrentTemplate = sBlue + "47"; break;
                case 48:  sCurrentTemplate = sBlue + "48"; break;
                case 49:  sCurrentTemplate = sBlue + "49"; break;
                case 50:  sCurrentTemplate = sBlue + "50"; break;
                case 51:  sCurrentTemplate = sBlue + "51"; break;
                case 52:  sCurrentTemplate = sBlue + "52"; break;
                case 53:  sCurrentTemplate = sBlue + "53"; break;
                case 54:  sCurrentTemplate = sBlue + "44"; break;
                case 55:  sCurrentTemplate = sBlue + "45"; break;
                case 56:  sCurrentTemplate = sBlue + "46"; break;
                case 57:  sCurrentTemplate = sBlue + "47"; break;
                case 58:  sCurrentTemplate = sBlue + "48"; break;
                case 59:  sCurrentTemplate = sBlue + "47"; break;
                case 60:  sCurrentTemplate = sBlue + "48"; break;
                }


            sRetTemplate = sCurrentTemplate;
            SetLocalString(oSpawn, "TemplateCur", sRetTemplate);

            SetLocalInt(oSpawn, "f_LootTable", nLoot);  // default loot for mob

            nCounterCur++;
            SetLocalInt(oSpawn, "CounterCur", nCounterCur);
        }

        // Spawn single template mobs
        else if ((nCounterCur <= nCounterMax) && (GetStringRight(sBlue,1) != "_"))
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
    // watch patrol and leader
    if (sTemplate == "patrolgroup")
    {
        int iLeader = GetLocalInt(oSpawn, "IsLeaderSpawned");
        if (iLeader == TRUE)
        {
            // spawn regular watchman
            sRetTemplate = "citywatchman";
        }
        else
        {
            // Spawn a patrol leader
            sRetTemplate = "citywatcharmar";
            SetLocalInt(oSpawn, "IsLeaderSpawned", TRUE);
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
    //if (sTemplate == "mongrelmen")
    //{
    //    if (d2(1) == 1)
    //    {
    //        sRetTemplate = "bugchiefa002";
    //    }
    //    else
    //    {
    //        sRetTemplate = "bugchiefa002";
    //    }
    //}
    //

    // Mongrelmen and Boss
    if (sTemplate == "mongrelmen")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "bugchiefa003");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "bugchiefa002";
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
            sRetTemplate = "bugchiefa003";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }

// Bugbears and Boss
    if (sTemplate == "bugbears")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "bugchiefa001");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "bugbeara001";
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
            sRetTemplate = "bugchiefa001";
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


// -------------------------------------------
// Only Make Modifications Between These Lines
//
    return sRetTemplate;
}
