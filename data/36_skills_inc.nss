int ABILITY_INUSE_DETECTEVIL = 2001;
float ONE_ROUND = 6.0;

int ReturnEvilPowerRating(object oEvil)
{
    int retVal = 0;

    if( GetLevelByClass(CLASS_TYPE_CLERIC, oEvil) > 0 )
        retVal = GetLevelByClass(CLASS_TYPE_CLERIC, oEvil);
    else if( GetRacialType(oEvil) == RACIAL_TYPE_OUTSIDER )
        retVal = GetHitDice(oEvil);
    else if( GetRacialType(oEvil) == RACIAL_TYPE_ELEMENTAL ||
             GetRacialType(oEvil) == RACIAL_TYPE_UNDEAD )
        retVal = GetHitDice(oEvil)/2;
    else
        retVal = GetHitDice(oEvil)/5;

    return retVal;
}

string ReturnAuraString(int iPower)
{
    string sAura;

    if( iPower < 2 )
        sAura = "faint";
    else if( iPower < 5 )
        sAura = "moderate";
    else if( iPower < 11 )
        sAura = "strong";
    else
        sAura = "overwhelming";

    return sAura;
}

object ReturnGreaterEvil(object oEvil1, object oEvil2)
{
    object oEvil;
    int iPower1, iPower2;

    iPower1 = ReturnEvilPowerRating(oEvil1);
    iPower2 = ReturnEvilPowerRating(oEvil2);

    if( iPower1 >= iPower2 )
        oEvil = oEvil1;
    else
        oEvil = oEvil2;

    return oEvil;
}

void DeactivatePCPersistAbility(object oPC)
{
    DeleteLocalInt(oPC, "iActiveAbility");
    DeleteLocalInt(oPC, "iActiveAbilitiesRnd");
    DeleteLocalInt(oPC, "iNumEvilDetected");
}

object FindEquippedItemWithTagFragment(object oPC, string sTagFrag)
{
    object oItem, retVal=OBJECT_INVALID;
    int i;
    string sTag;

    for(i=0;i<15;++i)
    {
        oItem = GetItemInSlot(i,oPC);
        sTag = GetTag(oItem);
        if( FindSubString(GetStringLowerCase(sTag), GetStringLowerCase(sTagFrag)) > -1 )
        {
            retVal = oItem;
            break;
        }
    }

    return retVal;
}

int GetIsPCOfClass(object oPC, int iClassType)
{
    int retVal = FALSE;

    if( GetLevelByClass(iClassType, oPC) > 0 )
        retVal = TRUE;

    return retVal;
}

int ReturnDaysSinceTimeStamp(object oItem)
{
    string sTS, sMonth, sDay, sYear;
    int retVal, iDay, iMonth, iYear;
    int iCDay, iODay;

    sTS = GetLocalString(oItem, "sDTS");

    if( GetStringLength(sTS) < 8 )
        retVal = -1;
    else
    {
        iYear = StringToInt(GetSubString(sTS, 0, 4));
        iMonth = StringToInt(GetSubString(sTS, 4, 2));
        iDay = StringToInt(GetSubString(sTS, 6, 2));
        iODay = 336*iYear + 28*iMonth + iDay;
        iCDay = 336*GetCalendarYear() + 28*GetCalendarMonth() + GetCalendarDay();
        retVal = iCDay - iODay;
    }

    return retVal;
}

string ReturnCardinalDirection(float fFace)
{
    string retVal="";

    if( fFace <= 22.5 || fFace >= 337.5 )
        retVal = "East";
    else if( fFace <=67.5 )
        retVal = "Northeast";
    else if( fFace <= 112.5 )
        retVal = "North";
    else if( fFace <= 157.5 )
        retVal = "Northwest";
    else if( fFace <= 202.5 )
        retVal = "West";
    else if( fFace <= 247.5 )
        retVal = "Southwest";
    else if( fFace <= 292.5 )
        retVal = "South";
    else
        retVal = "Southeast";

    return retVal;
}

string GetRelativeDirectionString(object oTarg, object oSrc)
{
    string retVal="";
    vector vVec;
    float fAngle;

    vVec = GetPosition(oTarg) - GetPosition(oSrc);
    fAngle = VectorToAngle(vVec);
    retVal = ReturnCardinalDirection(fAngle);

    return retVal;
}

string ReturnRacialString(int iRace)
{
    string retVal="";

    if( iRace == RACIAL_TYPE_ABERRATION )
        retVal = "aberration";
    else if( iRace == RACIAL_TYPE_ANIMAL )
        retVal = "animal";
    else if( iRace == RACIAL_TYPE_BEAST )
        retVal = "beast";
    else if( iRace == RACIAL_TYPE_CONSTRUCT )
        retVal = "construct";
    else if( iRace == RACIAL_TYPE_DRAGON )
        retVal = "dragon";
    else if( iRace == RACIAL_TYPE_DWARF  )
        retVal = "dwarf";
    else if( iRace == RACIAL_TYPE_ELEMENTAL )
        retVal = "elemental";
    else if( iRace == RACIAL_TYPE_ELF )
        retVal = "elf";
    else if( iRace == RACIAL_TYPE_FEY )
        retVal = "fey";
    else if( iRace == RACIAL_TYPE_GIANT )
        retVal = "giant";
    else if( iRace == RACIAL_TYPE_GNOME )
        retVal = "gnome";
    else if( iRace == RACIAL_TYPE_HALFELF )
        retVal = "half-elf";
    else if( iRace == RACIAL_TYPE_HALFLING )
        retVal = "halfling";
    else if( iRace == RACIAL_TYPE_HALFORC )
        retVal = "half-orc";
    else if( iRace == RACIAL_TYPE_HUMAN  )
        retVal = "human";
    else if( iRace == RACIAL_TYPE_HUMANOID_GOBLINOID )
        retVal = "goblinoid";
    else if( iRace == RACIAL_TYPE_HUMANOID_MONSTROUS )
        retVal = "monstrous humanoid";
    else if( iRace == RACIAL_TYPE_HUMANOID_ORC )
        retVal = "orc";
    else if( iRace == RACIAL_TYPE_HUMANOID_REPTILIAN )
        retVal = "reptilian";
    else if( iRace == RACIAL_TYPE_MAGICAL_BEAST )
        retVal = "magical beast";
    else if( iRace == RACIAL_TYPE_OUTSIDER )
        retVal = "outsider";
    else if( iRace == RACIAL_TYPE_SHAPECHANGER )
        retVal = "shapechanger";
    else if( iRace == RACIAL_TYPE_UNDEAD )
        retVal = "undead";
    else if( iRace == RACIAL_TYPE_VERMIN )
        retVal = "vermin";
    return retVal;
}

int GetIsFavoredEnemy(object oPC, int iCreature)
{
    int retVal = FALSE;

    if( iCreature == RACIAL_TYPE_ABERRATION  && GetHasFeat(FEAT_FAVORED_ENEMY_ABERRATION, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_ANIMAL && GetHasFeat(FEAT_FAVORED_ENEMY_ANIMAL, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_BEAST && GetHasFeat(FEAT_FAVORED_ENEMY_BEAST, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_CONSTRUCT && GetHasFeat(FEAT_FAVORED_ENEMY_CONSTRUCT, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_DRAGON && GetHasFeat(FEAT_FAVORED_ENEMY_DRAGON, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_DWARF && GetHasFeat(FEAT_FAVORED_ENEMY_DWARF, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_ELEMENTAL && GetHasFeat(FEAT_FAVORED_ENEMY_ELEMENTAL, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_ELF && GetHasFeat(FEAT_FAVORED_ENEMY_ELF, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_FEY && GetHasFeat(FEAT_FAVORED_ENEMY_FEY, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_GIANT && GetHasFeat(FEAT_FAVORED_ENEMY_GIANT, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_GNOME && GetHasFeat(FEAT_FAVORED_ENEMY_GNOME, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HALFELF && GetHasFeat(FEAT_FAVORED_ENEMY_HALFELF, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HALFLING && GetHasFeat(FEAT_FAVORED_ENEMY_HALFLING, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HALFORC && GetHasFeat(FEAT_FAVORED_ENEMY_HALFORC, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HUMAN && GetHasFeat(FEAT_FAVORED_ENEMY_HUMAN, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HUMANOID_GOBLINOID && GetHasFeat(FEAT_FAVORED_ENEMY_GOBLINOID, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HUMANOID_MONSTROUS && GetHasFeat(FEAT_FAVORED_ENEMY_MONSTROUS, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HUMANOID_ORC && GetHasFeat(FEAT_FAVORED_ENEMY_ORC, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_HUMANOID_REPTILIAN && GetHasFeat(FEAT_FAVORED_ENEMY_REPTILIAN, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_MAGICAL_BEAST && GetHasFeat(FEAT_FAVORED_ENEMY_MAGICAL_BEAST, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_OUTSIDER && GetHasFeat(FEAT_FAVORED_ENEMY_OUTSIDER, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_SHAPECHANGER && GetHasFeat(FEAT_FAVORED_ENEMY_SHAPECHANGER, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_UNDEAD && GetHasFeat(FEAT_FAVORED_ENEMY_UNDEAD, oPC) )
        retVal = TRUE;
    else if( iCreature == RACIAL_TYPE_VERMIN && GetHasFeat(FEAT_FAVORED_ENEMY_VERMIN, oPC) )
        retVal = TRUE;

    return retVal;
}

void CheckSimpleTrackSystem(object oPC)
{
    object oCrit;
    int iCtr=1;
    string sRelPos;

    oCrit = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC);

    while( GetIsObjectValid(oCrit) && GetHasFeat(FEAT_TRACKLESS_STEP, oCrit) )
        oCrit = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, ++iCtr);

    if( GetIsObjectValid(oCrit) && !GetHasFeat(FEAT_TRACKLESS_STEP, oCrit) )
    {
        sRelPos = GetRelativeDirectionString(oCrit, oPC);
        SendMessageToPC(oPC, "You are aware of a hostile creature to the "+sRelPos+" of you.");
    }
    else
        SendMessageToPC(oPC, "You sense no creatures nearby.");
}

void SimpleCheckForSwornEnemy(object oPC)
{
    object oCrit;
    int iCtr=1;
    string sRelPos;

    oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC);
    while( GetIsObjectValid(oCrit) && !GetIsFavoredEnemy(oPC, GetRacialType(oCrit)) )
        oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, ++iCtr);

    if( GetIsObjectValid(oCrit) && GetIsFavoredEnemy(oPC, GetRacialType(oCrit)) )
    {
        sRelPos = GetRelativeDirectionString(oCrit, oPC);
        SendMessageToPC(oPC, "You detect the presence of a "+ReturnRacialString(GetRacialType(oCrit))+" to the "+sRelPos+" of you.");
    }

}

void CheckTracksAndReturnResults(object oPC, object oTrack)
{
    object oCrit, oArrow;
    int iDC, iSize, iDays, iRoll, iDiff;
    string sSize="small";
    string sInfo;

    oCrit = GetLocalObject(oTrack, "oMonster");
    iDays = ReturnDaysSinceTimeStamp(oTrack);
    iDC = iDays/10;
    iDC -= GetSkillRank(SKILL_LORE);
    iDC += Random(5);

    oArrow = GetLocalObject(oTrack, "oPointer");
    if( !GetIsObjectValid(oArrow) )
    {
        oArrow = CreateObject(OBJECT_TYPE_PLACEABLE, "trackingarrow", GetLocation(oTrack));
        AssignCommand(oArrow, SetFacing(GetLocalFloat(oTrack, "fMonsterFace")));
        SetLocalObject(oTrack, "oPointer", oArrow);

        if( GetObjectSeen(oArrow, oPC) )
        {
            DestroyObject(oArrow, 90.0);
            iSize = GetCreatureSize(oCrit);
            if( iSize == CREATURE_SIZE_TINY )
                iDC += 2;
            else if( iSize == CREATURE_SIZE_SMALL )
                iDC += 1;
            else if( iSize == CREATURE_SIZE_LARGE )
                iDC -= 1;
            else if( iSize == CREATURE_SIZE_HUGE )
                iDC -= 2;

            iRoll = d20();

            if( iRoll >= iDC )
            {
                SendMessageToPC(oPC, "There are some monster tracks left by "+GetName(oCrit));
                SendMessageToPC(oPC, "The tracks are "+IntToString(ReturnDaysSinceTimeStamp(oTrack))+" days old");
                SendMessageToPC(oPC, "The monster was going "+ ReturnCardinalDirection(GetLocalFloat(oTrack, "fMonsterFace")));
                sInfo = GetName(oCrit)+" left these tracks "+IntToString(ReturnDaysSinceTimeStamp(oTrack))+" days ago.";
            }
            else if( (iDC - iRoll) < 4 )
            {
                iDiff = Random(20);
                if( !Random(2) )
                    iDiff = -1 * iDiff;
                if( !Random(2) )
                    sSize = "large";

                iDays += iDiff;
                if( iDays < 1 )
                    iDays = 2;

                SendMessageToPC(oPC, "You see creature tracks from a "+sSize+" creature approximately "+ IntToString(iDays)+" days old.");
                sInfo = sSize+"-sized creature left these tracks approximately "+ IntToString(iDays)+" ago.";
            }
            else
            {
                SendMessageToPC(oPC, "You see creature tracks");
                sInfo = "These are tracks from an unidentified creature.";
            }
            SetLocalString(oArrow, "sInfo", sInfo);
        }
        else
        {
            SendMessageToPC(oPC, "Unable to locate recent tracks nearby.");
            DestroyObject(oArrow);
        }
    }
    else if( GetObjectSeen(oArrow, oPC) )
        SendMessageToPC(oPC, GetLocalString(oArrow, "sInfo"));
    else
        SendMessageToPC(oPC, "Unable to locate recent tracks nearby.");

}

void CheckForTracks(object oPC)
{
    object oTrack, oCrit;

    if( GetIsPCOfClass(oPC, CLASS_TYPE_RANGER) || GetIsPCOfClass(oPC, CLASS_TYPE_DRUID) )
    {
//        SendMessageToPC(oPC, "You are a druid or ranger.");
        if( GetHasSkill(SKILL_LORE, oPC) )
        {
//            SendMessageToPC(oPC, "You are a tracker");
            oTrack = GetNearestObjectByTag("CRITTER_TRACKS", oPC);
            oCrit = GetLocalObject(oTrack, "oMonster");

            if( GetIsObjectValid(oTrack) && !GetIsObjectValid(oCrit) && !GetLocalInt(oTrack, "iPC") )
            {
                SendMessageToPC(oPC, "Unable to locate recent tracks nearby.");
                DestroyObject(oTrack);
            }
            else if( GetIsObjectValid(oCrit) && GetIsObjectValid(oTrack) && GetDistanceBetween(oPC, oTrack) < 15.0 )
            {
                CheckTracksAndReturnResults(oPC, oTrack);
                oTrack = GetNearestObjectByTag("CRITTER_TRACKS", oTrack);
                if( GetLocalObject(oTrack, "oMonster") != oCrit && GetDistanceBetween(oPC, oTrack) < 10.0 &&
                    GetLocalObject(oTrack, "oMonster") != oPC )
                    CheckTracksAndReturnResults(oPC, oTrack);
            }
            else
            {
                CheckSimpleTrackSystem(oPC);
//                SendMessageToPC(oPC, "Unable to locate recent tracks nearby.");
            }
            if( GetIsPCOfClass(oPC, CLASS_TYPE_RANGER) )
                SimpleCheckForSwornEnemy(oPC);
        }
        else
            SendMessageToPC(oPC, "You need the Lore skill to track.");
    }
    else
        SendMessageToPC(oPC, "Only Rangers and Druids have the ability to track.");
}

void BuildCampfire(object oPC)
{
    object oFire;
    location lPC;

    lPC = GetLocation(oPC);
    oFire = CreateObject(OBJECT_TYPE_PLACEABLE, "usercampfire", lPC);
    SendMessageToPC(oPC, "You build a campfire with available materials.  There's no guarantee it will work");
}

void SpikeDoor(object oPC, object oSpike)
{
    object oDoor;

    oDoor = GetNearestObject(OBJECT_TYPE_DOOR, oPC);
    if( GetIsObjectValid(oDoor) )
    {
        if( GetDistanceBetween(oPC, oDoor) < 3.0 )
        {
            SetLocalInt(oDoor, "iSpiked", TRUE);
            if( GetIsOpen(oDoor) )
                AssignCommand(oDoor, ClearAllActions());
            DestroyObject(oSpike);
            SendMessageToPC(oPC, "You have spiked the door.");
        }
        else
            SendMessageToPC(oPC, "You're not close enough to the door to spike it.");
    }
    else
        SendMessageToPC(oPC, "No door to spike.");
}

void DisableTrap(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank(SKILL_DISABLE_TRAP, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Disable Trap";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void DisciplineCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank(SKILL_DISCIPLINE, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Discipline";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void ListenCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank (SKILL_LISTEN, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Listen";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void LoreCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank (SKILL_LORE, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Lore";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void OpenLockCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank (SKILL_OPEN_LOCK, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Open Lock";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void PursuadeCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank (SKILL_PERSUADE, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Persuade";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void SearchCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank(SKILL_SEARCH, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Search";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void SpellcraftCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank (SKILL_SPELLCRAFT, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="SpellCraft";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void SpotCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetSkillRank (SKILL_SPOT, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Spot";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void PerformCheck(object oPC)
{
   object oPC = GetLastSpeaker();
   int nRoll=d20();
   int nRank=GetSkillRank(SKILL_PERFORM, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sSkill="Perform";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sSkill + " Check, Roll: " + sRoll +
      " Skill Modifier: " + sRank + " = " + sResult));
}

void StrengthCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetAbilityModifier (ABILITY_STRENGTH, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sAbility="Strength";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sAbility+" Check, Roll: "+sRoll+" Modifier: "+sRank+" = "+sResult));

}

void DexterityCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetAbilityModifier (ABILITY_DEXTERITY, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sAbility="Dexterity";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sAbility+" Check, Roll: "+sRoll+" Modifier: "+sRank+" = "+sResult));

}

void ConstitutionCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetAbilityModifier (ABILITY_CONSTITUTION, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sAbility="Constitution";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sAbility+" Check, Roll: "+sRoll+" Modifier: "+sRank+" = "+sResult));

}

void IntelligenceCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetAbilityModifier (ABILITY_INTELLIGENCE, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sAbility="Intelligence";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sAbility+" Check, Roll: "+sRoll+" Modifier: "+sRank+" = "+sResult));

}

void WisdomCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetAbilityModifier (ABILITY_WISDOM, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sAbility="Wisdom";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sAbility+" Check, Roll: "+sRoll+" Modifier: "+sRank+" = "+sResult));

}

void CharismaCheck(object oPC)
{
   int nRoll=d20();
   int nRank=GetAbilityModifier (ABILITY_CHARISMA, oPC);
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   string sAbility="Charisma";
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(sAbility+" Check, Roll: "+sRoll+" Modifier: "+sRank+" = "+sResult));

}

void d4Roll(object oPC)
{
   int nRoll=d4();
   string sName = GetName(oPC);
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolls a d4 and gets a: "+sRoll)));

}

void d6Roll(object oPC)
{
   object oPC = GetLastSpeaker();
   int nRoll=d6();
   string sName = GetName(oPC);
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolls a d6 and gets a: "+sRoll)));

}

void d8Roll(object oPC)
{
   int nRoll=d8();
   string sName = GetName(oPC);
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolls a d8 and gets a: "+sRoll)));

}

void d10Roll(object oPC)
{
   int nRoll=d10();
   string sName = GetName(oPC);
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolls a d10 and gets a: "+sRoll)));

}

void d12Roll(object oPC)
{
   int nRoll=d12();
   string sName = GetName(oPC);
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolls a d12 and gets a: "+sRoll)));

}

void d20Roll(object oPC)
{
   int nRoll=d20();
   string sName = GetName(oPC);
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolls a d20 and gets a: "+sRoll)));

}

void d100Roll(object oPC)
{
   int nRoll=d100();
   string sName = GetName(oPC);
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolls a d100 and gets a: "+sRoll)));

}

void PaladinActivateDetectEvil(object oPC)
{
    int iDuration, iCondition;

    if( GetIsPCOfClass(oPC, CLASS_TYPE_PALADIN) )
    {
        SetLocalInt(oPC, "iActiveAbility", ABILITY_INUSE_DETECTEVIL);
        SetLocalInt(oPC, "iActiveAbilitiesRnd", 1);
        SendMessageToPC(oPC, "As you remain still and focus, you will detect the evil that may lurk around you...");
    }
    else
        SendMessageToPC(oPC, "Only paladins may use this ability.");
}

int DetectEvilMasked(object oEvil, object oPC=OBJECT_INVALID)
{
    int retVal = FALSE;
    object oItem;

    oItem = FindEquippedItemWithTagFragment(oEvil, "ALIGNMASK");

    if( GetIsObjectValid(oItem) )
        retVal = TRUE;

    return retVal;
}

void PaladinDetectEvil(object oPC)
{
    int iRnd, iEPower, iCtr = 1;
    int iECtr=0;
    object oCrit, oEvil;
    effect eEff;
    string sAura="";
    string sRelPos="";

    iRnd = GetLocalInt(oPC, "iActiveAbilitiesRnd");
    if(  iRnd > (GetLevelByClass(CLASS_TYPE_PALADIN, oPC)*100) )
    {
        DeactivatePCPersistAbility(oPC);
        SendMessageToPC(oPC, "Your concentration to detect evil is exhausted.");
        // Consider adding timestamp to prevent it from being used again right away
    }
    else
    {
        if( iRnd == 1 )
        {
            oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC);
            while( GetIsObjectValid(oCrit) && GetDistanceBetween(oPC, oCrit) < 61.0 )
            {
                if( GetAlignmentGoodEvil(oCrit) == ALIGNMENT_EVIL && !DetectEvilMasked(oCrit, oPC))
                {
                    SendMessageToPC(oPC, "You sense the presence of evil nearby...");
                    break;
                }
                oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, ++iCtr);
            }

        }
        else if( iRnd == 2 )
        {
            oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC);
            while( GetIsObjectValid(oCrit) && GetDistanceBetween(oPC, oCrit) < 61.0 )
            {
                if( GetAlignmentGoodEvil(oCrit) == ALIGNMENT_EVIL && !DetectEvilMasked(oCrit, oPC))
                {
                    ++iECtr;
                    oEvil = ReturnGreaterEvil(oCrit, oEvil);
                }
                oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, ++iCtr);
            }

            iEPower = ReturnEvilPowerRating(oEvil);
            if( iEPower > (2*GetLevelByClass(CLASS_TYPE_PALADIN, oPC)) )
            {
                SendMessageToPC(oPC, "You are stunned by a dread sense of overwhelming evil.");
                DeactivatePCPersistAbility(oPC);
                eEff = EffectStunned();
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, ONE_ROUND);
            }
            else if( iECtr > 0 )
                SendMessageToPC(oPC, "You sense at least "+IntToString(iECtr)+" creatures of evil nearby.");
            else
                SendMessageToPC(oPC, "You sense no creatures of evil nearby.");
        }
        else
        {
            oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, (iRnd-2));
            if( GetIsObjectValid(oCrit) && GetDistanceBetween(oPC, oCrit) < 61.0 )
            {
                if( !DetectEvilMasked(oCrit, oPC) && GetAlignmentGoodEvil(oCrit) == ALIGNMENT_EVIL )
                {
                    iEPower = ReturnEvilPowerRating(oCrit);
                    sAura = ReturnAuraString(iEPower);
                    sRelPos = GetRelativeDirectionString(oCrit, oPC);
                    SendMessageToPC(oPC, "You sense an evil aura that is "+sAura+" to the "+sRelPos+" of you.");
                }
                SetLocalInt(oPC, "iNumEvilDetected", (iRnd-2));
            }
            else if( (iRnd-2) > GetLocalInt(oPC, "iNumEvilDetected") )
            {
                oCrit = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, (Random(GetLocalInt(oPC, "iNumEvilDetected")+1)));
                if( GetIsObjectValid(oCrit) && GetDistanceBetween(oPC, oCrit) < 61.0 &&
                    !DetectEvilMasked(oCrit, oPC) && GetAlignmentGoodEvil(oCrit) == ALIGNMENT_EVIL )
                {
                    iEPower = ReturnEvilPowerRating(oCrit);
                    sAura = ReturnAuraString(iEPower);
                    sRelPos = GetRelativeDirectionString(oCrit, oPC);
                    if( GetObjectSeen(oCrit, oPC) )
                        SendMessageToPC(oPC, "You sense the evil of "+GetName(oCrit)+" standing "+IntToString(FloatToInt(GetDistanceBetween(oPC, oCrit)))+" feet to the "+sRelPos+" is "+sAura+".");
                    else
                        SendMessageToPC(oPC, "You sense an evil aura that is "+sAura+" to the "+sRelPos+" of you.");
                }
            }
        }
        SetLocalInt(oPC, "iActiveAbilitiesRnd", ++iRnd);
    }

}

void SetDateTimeStamp(object oItem)
{
    int iDay, iYear, iMonth;
    string sDay, sYear, sMonth, sTS="";

    iDay = GetCalendarDay();
    iYear = GetCalendarYear();
    iMonth = GetCalendarMonth();

    sYear = IntToString(iYear);
    sDay = IntToString(iDay);
    sMonth = IntToString(iMonth);

    if( iDay < 10 )
        sDay = "0"+sDay;
    if( iMonth < 10 )
        sMonth = "0"+sMonth;

    sTS = sYear + sMonth + sDay;

    SetLocalString(oItem, "sDTS", sTS);

}

void ObjectLeaveTracks(object oCrit, int iPC=FALSE)
{
    location lLoc;
    object oTrack;

    if( !GetHasFeat(FEAT_TRACKLESS_STEP, oCrit) )
    {
        lLoc = GetLocation(oCrit);
        oTrack = CreateObject(OBJECT_TYPE_STORE, "crittertracks", lLoc);

        SetLocalFloat(oTrack, "fMonsterFace", GetFacing(oCrit));
        SetDateTimeStamp(oTrack);

        if( iPC )
        {
            SetLocalInt(oTrack, "iPC", iPC);
            SetLocalString(oTrack, "sName", GetName(oCrit));
        }
        else
            SetLocalObject(oTrack, "oMonster", oCrit);
    }

}

void CreatePlayerAgent(object oPC)
{
    object oWP, oPA;
    location lWP;

    oWP = GetObjectByTag("MOD_PC_TRACK_WP");
    lWP = GetLocation(oWP);
    oPA = CreateObject(OBJECT_TYPE_PLACEABLE, "playeragent", lWP);
    SetLocalObject(oPA, "oMyPC", oPC);
    SetLocalObject(oPC, "oMyAgent", oPA);
}


