/*
    These scripts written & copyright by Moss
    Address questions/comments/modifications to moss@twobugz.com
*/

#include "36_skills_inc"

int BEHAVE_TOURETTE = 201;
int BEHAVE_KLEPTO = 202;
int BEHAVE_BERZERK = 203;
int BEHAVE_TURNEVIL = 204;
int BEHAVE_VISIONS = 205;

struct stCursedItem
{
    int iLevel;
    int iCurseActive;
    int iActLevel;
    int iStuck;
    int iDetectRT;
    int iDetectRange;
    int iAttackRT;
    int iAttEff;
    int iAttEffOpt;
    int iAttEffDelta;
    int iFearRT;
    int iDefendRT;
    int iDefEff;
    int iDefEffOpt;
    int iDefEffDelta;
    int iOnActEff;
    int iFreq;
    int iAlign;
    int iBehave;
    int iBehaveCO;
    int iBehaveDelta;
    int iBehaveOpt;
    int iSave;
    int iSentient;
    float fBehaveDur;
    string sPName;
    string sPKey;
    object oPC;
    object oItem;

};

int IsWeapon(object oItem);
int GetItemCurseLevel(object oItem);
int GetIsItemEquipped(object oPC, object oItem);
int GetIsAgentCreationSuppressed(object oPC);
int GetIsItemCursed(object oItem);
int IsWeapon(object oItem);
int IsAmmo( int nBaseType );
int GetIsInParty(object oPC);
int AgentCreatureFilterMatch(object oNPC, int iFiltType);
int GetAgentItemDC(object oAgent);
int GetIsAgentItemStuckToPC(object oAgent);
int GetObjectHasEffect(int nEffectType, object oTarget = OBJECT_SELF);
int GetIsItemEquippable(object oItem);
int GetIsArmed(object oPC);
object GetAgentItem(object oAgent);
object GetItemAgent(object oItem);
object GetAgentItemPosessor(object oAgent);
struct stCursedItem LoadWeaponStruct(object oAgent);
void SaveWeaponStruct(object oAgent, struct stCursedItem stWeapon);
void SetAgentItemStuck(object oAgent);
void SetAgentItemPC(object oAgent, object oPC);
void AgentApplyItemStaticEffects(object oAgent);
void SuppressAgentCreation(object oPC);
void UnsuppressAgentCreation(object oPC);
void ApplyItemEffectToPlayer(object oPC, int iEffect, int iEffOpt=4, float fEffDur=6.0, int iEffDelta=1, int iSave=20, object oItem=OBJECT_INVALID);
void SetAgentItemUnstuck(object oAgent);
string GetFirstName(object oPC);

//--------------------------------------------------------------
//  Item functions
//--------------------------------------------------------------

void TransferItemToPC(object oItem, object oTarg)
{
    object oNItem;

    oNItem = CopyObject(oItem, GetLocation(oTarg), oTarg);
    DestroyObject(oItem);
    SetLocalInt(oNItem, "iValidCopy", TRUE);
}

void RPTransferItemToPC(object oItem, object oPC, object oTarg)
{
    object oAgent=GetItemAgent(oItem);
    object oContain;
    int iDC;

    if( !GetIsObjectValid(oPC) && GetIsObjectValid(oTarg) && GetIsObjectValid(oAgent) )
    {
        if( GetIsObjectValid(GetItemPossessor(oItem)) )
        {
            oContain = GetItemPossessor(oItem);
            SendMessageToPC(oTarg, "You feel drawn to "+GetName(oContain)+". There's something for you in there.");
        }
        else
        {
            AssignCommand(oTarg, ClearAllActions());
            DelayCommand(1.0, ActionDoCommand(AssignCommand(oTarg, ActionPickUpItem(oItem))));
            DelayCommand(1.5, ActionDoCommand(SetCommandable(FALSE, oTarg)));
            DelayCommand(8.0, ActionDoCommand(SetCommandable(TRUE, oTarg)));
            SetAgentItemPC(oAgent, oTarg);
        }
    }
    else if( GetIsObjectValid(oAgent) && !GetIsInCombat(oPC) && !GetIsInCombat(oTarg) )
    {
        iDC = GetAgentItemDC(oAgent);
        if( !WillSave(oPC, iDC) )
        {
            if( GetIsAgentItemStuckToPC(oAgent) )
                SetAgentItemUnstuck(oAgent);
            SetAgentItemPC(oAgent, oTarg);
            SendMessageToPC(oPC, "You desire to give "+GetName(oTarg)+" a gift.");
            AssignCommand(oPC, ClearAllActions());
            SendMessageToPC(oTarg, "You desire to receive what "+GetName(oPC)+" is about to give you.");
            AssignCommand(oTarg, ClearAllActions());
            AssignCommand(oTarg, ActionMoveToObject(oPC, TRUE));
            DelayCommand(1.0, ActionDoCommand(AssignCommand(oPC, ActionGiveItem(oItem, oTarg))));
            DelayCommand(1.5, ActionDoCommand(SetCommandable(FALSE, oPC)));
            DelayCommand(8.0, ActionDoCommand(SetCommandable(TRUE, oPC)));
        }
        else
        {
            SendMessageToPC(oPC, "You sense a strange sensation of unhappiness by something in your possession.");
            SendMessageToPC(oTarg, "There is something "+GetFirstName(oPC)+" possesses that should be yours.");
        }
    }
}

void SetItemPersistentStuckToPC(object oPC, object oItem)
{
    //
    // Change from SetLocalInt to ALFA persistent var!
    //
    SetLocalInt(oPC, (GetResRef(oItem)+"_STUCK"), TRUE);
    SetDroppableFlag(oItem, FALSE);
}

void RemoveItemPersistentStuckToPC(object oPC, object oItem)
{
    SetDroppableFlag(oItem, TRUE);
    DeleteLocalInt(oPC, (GetResRef(oItem)+"_STUCK")); //May have to delete from dbase too
}

int GetIsItemPersistentStuckToPC(object oItem, object oPC=OBJECT_INVALID)
{
    string sRef;
    int retVal=FALSE;

    if( GetIsObjectValid(oPC) && GetIsObjectValid(oItem) )
    {
        sRef = GetResRef(oItem)+"_STUCK";

        if( GetLocalInt(oPC, sRef) || !GetDroppableFlag(oItem) ) //Note: will probably have to do persistent query in future
            retVal = TRUE;
    }
    else if( GetIsObjectValid(oItem) )
    {
        if( !GetDroppableFlag(oItem) )
            retVal = TRUE;
    }

    return retVal;
}

void SetItemStuckToPC(object oPC, object oItem)
{
    object oAgent=GetItemAgent(oItem);

    if( GetIsObjectValid(oAgent) )
    {
        SetAgentItemStuck(oAgent);
        SetItemPersistentStuckToPC(oPC, oItem);
    }
}

int GetItemCurseLevel(object oItem)
{
    int i, retVal = 0;
    string sCLevel;

    i = FindSubString(GetStringLowerCase(GetTag(oItem)), "_crs");
    if( i > - 1 )
        retVal = StringToInt(GetSubString(GetTag(oItem), i+4, 1));

    return retVal;
}

object GetItemAgent(object oItem)
{
    return GetLocalObject(oItem, "oMyAgent");
}

int GetItemCurseActivateLevel(object oItem)
{
    int i, retVal = 0;
    string sCLevel;

    i = FindSubString(GetStringLowerCase(GetTag(oItem)), "_ca");
    retVal = StringToInt(GetSubString(GetTag(oItem), i+3, 1));

    return retVal;
}

int GetIsItemCursed(object oItem)
{
    int retVal = FALSE;

    if( GetIsObjectValid(oItem) )
    {
        if( FindSubString(GetStringLowerCase(GetTag(oItem)), "_crs") > -1 )
            retVal = TRUE;
    }

    return retVal;
}


//--------------------------------------------------------------
//  Item Agent Functions
//--------------------------------------------------------------

object GetAgentItem(object oAgent)
{
    return GetLocalObject(oAgent, "oItem");
}

int GetAgentItemCurseLevel(object oAgent)
{
    return GetLocalInt(oAgent, "iLevel");
}

int GetAgentItemActivationLevel(object oAgent)
{
    return GetLocalInt(oAgent, "iActLevel");
}

int GetIsAgentItemStuckToPC(object oAgent)
{
    return GetLocalInt(oAgent, "iStuck");
}

void SetAgentItemStuck(object oAgent)
{
    SetLocalInt(oAgent, "iStuck", TRUE);
}

void SetAgentItemUnstuck(object oAgent)
{
    SetLocalInt(oAgent, "iStuck", FALSE);
    RemoveItemPersistentStuckToPC(GetAgentItemPosessor(oAgent), GetAgentItem(oAgent));
}

void SetAgentItem(object oAgent, object oItem)
{
    SetLocalObject(oAgent, "oItem", oItem);
}

void SetAgentToItem(object oAgent, object oItem)
{
    SetAgentItemPC(oAgent, oItem);
    SetLocalObject(oItem, "oMyAgent", oAgent);
}

void ReplaceAgentItem(object oItem, object oAgent)
{
    SetLocalObject(oItem, "oMyAgent", oAgent);
    SetLocalObject(oAgent, "oItem", oItem);
}

int GetDoesAgentItemHaveAlign(object oAgent)
{
    int retVal=FALSE;

    if( GetLocalInt(oAgent, "iAlign") > -1 )
        retVal = TRUE;

    return retVal;
}

int GetAgentItemAlign(object oAgent)
{
    return GetLocalInt(oAgent, "iAlign");
}

int GetDoesAgentAlignMatchPC(object oAgent, object oPC)
{
    int iAlign, iIAlign, retVal=FALSE;

    iAlign = StringToInt(IntToString(GetAlignmentLawChaos(oPC)) + IntToString(GetAlignmentGoodEvil(oPC)));
    iIAlign = GetAgentItemAlign(oAgent);

    if( iIAlign < 11 && iIAlign > 0 )
    {
        if( GetAlignmentLawChaos(oPC) == iIAlign || GetAlignmentGoodEvil(oPC) == iIAlign )
            retVal = TRUE;
    }
    else if( (iIAlign == iAlign) || GetAgentItemAlign(oAgent) < 1 ) //If item doesn't have alignment, always return TRUE
        retVal = TRUE;

    return retVal;
}

int GetAgentItemDC(object oAgent)
{
    return GetLocalInt(oAgent, "iSave");
}

int GetIsAgentItemSentient(object oAgent)
{
    return GetLocalInt(oAgent, "iSentient");
}

void CheckAgentItemImmediateEffects(object oAgent, object oPC=OBJECT_INVALID)
{
    object oItem=GetAgentItem(oAgent);
    effect eEff;
    struct stCursedItem stItem=LoadWeaponStruct(oAgent);

    if( !GetIsObjectValid(oPC) )
        oPC = stItem.oPC;

    if( GetDoesAgentItemHaveAlign(oAgent) && !GetDoesAgentAlignMatchPC(oAgent, oPC ) )
    {
        if( !GetObjectHasEffect(EFFECT_TYPE_NEGATIVELEVEL, oPC) )
        {
            SendMessageToPC(oPC, "You feel a disharmony with "+GetName(oItem)+" that drains some of your strength.");
            eEff = EffectNegativeLevel(1);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, HoursToSeconds(1));
        }
    }
    if( AgentCreatureFilterMatch(oPC, stItem.iAttackRT) )
    {
        if( FortitudeSave(oPC, stItem.iSave) == 0 )
        {
            SendMessageToPC(oPC, "You feel the pain of the malice "+GetName(oItem)+" has for you.");
            eEff = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEff, oPC);
            eEff = EffectDamage(Random(2)+1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEff, oPC);
        }
    }
}

int DetermineIfAgentItemStuck(object oPC, object oAgent, object oItem=OBJECT_INVALID)
{
    int iALevel=-1;
    int iCLevel=-1;
    int retVal=FALSE;

    if( GetIsObjectValid(oPC) && GetIsObjectValid(oAgent) && GetIsObjectValid(oItem) )
    {
        iALevel = GetItemCurseActivateLevel(oItem);
        iCLevel = GetItemCurseLevel(oItem);
    }
    else if( GetIsObjectValid(oPC) && GetIsObjectValid(oAgent) )
    {
        iALevel = GetAgentItemActivationLevel(oAgent);
        iCLevel = GetAgentItemActivationLevel(oAgent);
        oItem = GetAgentItem(oAgent);
    }

    if( GetIsItemPersistentStuckToPC(oItem, oPC) ) //Note: will probably have to do persistent query in future
        retVal = TRUE;
    else if( iCLevel > 0 && GetIsObjectValid(oItem) )
    {
        if( iALevel == 0 )   // Level 2 can only really be done via the OnActivate event
        {
            if( GetIsItemEquipped(oPC, oItem) )
            {
                SetAgentItemStuck(oAgent);
                SetItemPersistentStuckToPC(oPC, oItem);
                retVal = TRUE;
            }
        }
        else if( iALevel == 1 )
        {
            if( GetItemPossessor(oItem) == oPC )
            {
//                SendMessageToPC(oPC, GetName(oItem)+" is now stuck.");
                SetAgentItemStuck(oAgent);
                SetItemPersistentStuckToPC(oPC, oItem);
                retVal = TRUE;
            }
        }
    }
    return retVal;
}

void SetAgentItemPC(object oAgent, object oPC)
{
    SetLocalObject(oAgent, "oPC", oPC);
}

object GetAgentItemPosessor(object oAgent)
{
    return GetLocalObject(oAgent, "oPC");
}

void TransferAgentItem(object oAgent, object oPC)
{
    SetAgentItemUnstuck(oAgent);
    SetAgentItemPC(oAgent, oPC);
    DetermineIfAgentItemStuck(oPC, oAgent);
}

void SaveWeaponStruct(object oAgent, struct stCursedItem stWeapon)
{   //These will need to be persistent at some point

    SetLocalObject(oAgent, "oPC", stWeapon.oPC);
    SetLocalObject(oAgent, "oItem", stWeapon.oItem);
    SetLocalInt(oAgent, "iLevel", stWeapon.iLevel);
    SetLocalInt(oAgent, "iActLevel", stWeapon.iActLevel);
    SetLocalInt(oAgent, "iStuck", stWeapon.iStuck);
    SetLocalInt(oAgent, "iDetectRT", stWeapon.iDetectRT);
    SetLocalInt(oAgent, "iDetectRange", stWeapon.iDetectRange);
    SetLocalInt(oAgent, "iAttackRT", stWeapon.iAttackRT);
    SetLocalInt(oAgent, "iAttEff", stWeapon.iAttEff);
    SetLocalInt(oAgent, "iAttEffOpt", stWeapon.iAttEffOpt);
    SetLocalInt(oAgent, "iAttEffDelta", stWeapon.iAttEffDelta);
    SetLocalInt(oAgent, "iFearRT", stWeapon.iFearRT);
    SetLocalInt(oAgent, "iDefendRT", stWeapon.iDefendRT);
    SetLocalInt(oAgent, "iDefEff", stWeapon.iDefEff);
    SetLocalInt(oAgent, "iDefEffOpt", stWeapon.iDefEffOpt);
    SetLocalInt(oAgent, "iDefEffDelta", stWeapon.iDefEffDelta);
    SetLocalInt(oAgent, "iOnActEff", stWeapon.iOnActEff);

    SetLocalInt(oAgent, "iFreq", stWeapon.iFreq);
    SetLocalInt(oAgent, "iAlign", stWeapon.iAlign);
    SetLocalInt(oAgent, "iBehave", stWeapon.iBehave);
    SetLocalInt(oAgent, "iBehaveCO", stWeapon.iBehaveCO);
    SetLocalInt(oAgent, "iBehaveDelta", stWeapon.iBehaveDelta);
    SetLocalInt(oAgent, "iBehaveOpt", stWeapon.iBehaveOpt);
    SetLocalInt(oAgent, "iSave", stWeapon.iSave);
    SetLocalInt(oAgent, "iSentient", stWeapon.iSentient);
    SetLocalFloat(oAgent, "fBehaveDur", stWeapon.fBehaveDur);
    SetLocalString(oAgent, "sPName", stWeapon.sPName);
    SetLocalString(oAgent, "sPKey", stWeapon.sPKey);
}

struct stCursedItem LoadWeaponStruct(object oAgent)
{
    struct stCursedItem stWeapon;

    stWeapon.oPC = GetLocalObject(oAgent, "oPC");
    stWeapon.oItem = GetLocalObject(oAgent, "oItem");
    stWeapon.iLevel = GetLocalInt(oAgent, "iLevel");
    stWeapon.sPName = GetLocalString(oAgent, "sPName");
    stWeapon.sPKey = GetLocalString(oAgent, "sPKey");
    stWeapon.iLevel = GetLocalInt(oAgent, "iLevel");
    stWeapon.iActLevel = GetLocalInt(oAgent, "iActLevel");
    stWeapon.iStuck = GetLocalInt(oAgent, "iStuck");

    stWeapon.iDetectRT = GetLocalInt(oAgent, "iDetectRT");
    stWeapon.iDetectRange = GetLocalInt(oAgent, "iDetectRange");
    stWeapon.iAttackRT = GetLocalInt(oAgent, "iAttackRT");
    stWeapon.iAttEff = GetLocalInt(oAgent, "iAttEff");
    stWeapon.iAttEffOpt = GetLocalInt(oAgent, "iAttEffOpt");
    stWeapon.iAttEffDelta = GetLocalInt(oAgent, "iAttEffDelta");
    stWeapon.iFearRT = GetLocalInt(oAgent, "iFearRT");
    stWeapon.iDefendRT = GetLocalInt(oAgent, "iDefendRT");
    stWeapon.iDefEff = GetLocalInt(oAgent, "iDefEff");
    stWeapon.iDefEffOpt = GetLocalInt(oAgent, "iDefEffOpt");
    stWeapon.iDefEffDelta = GetLocalInt(oAgent, "iDefEffDelta");

    stWeapon.iFreq = GetLocalInt(oAgent, "iFreq");
    stWeapon.iAlign = GetLocalInt(oAgent, "iAlign");
    stWeapon.iBehave = GetLocalInt(oAgent, "iBehave");
    stWeapon.iBehaveCO = GetLocalInt(oAgent, "iBehaveEffectCO");
    stWeapon.iBehaveDelta = GetLocalInt(oAgent, "iBehaveDelta");
    stWeapon.iBehaveOpt = GetLocalInt(oAgent, "iBehaveOpt");
    stWeapon.iSave = GetLocalInt(oAgent, "iSave");
    stWeapon.iSentient = GetLocalInt(oAgent, "iSentient");
    stWeapon.fBehaveDur = GetLocalFloat(oAgent, "fBehaveDur");

    return stWeapon;
}

struct stCursedItem LoadCursedItemPCAbilities(struct stCursedItem stItem)
{
    int i, j, iTleng, iStat, iRace, ii;
    int iOff=0;
    string sTag, sChar, sFrag="";

    sTag = GetTag(stItem.oItem);
//  We're only using the tag string right of the _crs so we don't inadvertently pick up extraneous description stuff

    i = FindSubString(GetStringLowerCase(sTag), "_crs");
    sTag = GetStringRight(sTag, (GetStringLength(sTag)-i-5));
//    SendMessageToPC(stItem.oPC, "The string I'm working with is "+sTag);
    iTleng = GetStringLength(sTag);

//  Look for enemies to detect
    i = FindSubString(GetStringLowerCase(sTag),"_de");

    if( i > -1 )
    {
        stItem.iDetectRT = StringToInt(GetSubString(sTag, i+3,3));
        if( stItem.iDetectRT > 99 )
            stItem.iDetectRange = StringToInt(GetSubString(sTag, i+7,2));
        else if( stItem.iDetectRT > 9 )
            stItem.iDetectRange = StringToInt(GetSubString(sTag, i+6,2));
        else
            stItem.iDetectRange = StringToInt(GetSubString(sTag, i+5,2));
        if( stItem.iDetectRange < 1 )
            stItem.iDetectRange = 20;

//        SendMessageToPC(stItem.oPC, "Your items detects "+IntToString(stItem.iDetectRT));
//        SendMessageToPC(stItem.oPC, "The range is "+IntToString(stItem.iDetectRange));
    }
//  Determine racial type to force attack
    i = FindSubString(GetStringLowerCase(sTag),"_fa");

    if( i > -1 )
    {
        stItem.iAttackRT = StringToInt(GetSubString(sTag, i+3,3));
        sFrag = GetStringRight(sTag, (iTleng-i-1));
        ii = FindSubString(GetStringLowerCase(sFrag),"_");
        if( ii > -1 )
            sFrag = GetStringLeft(sFrag, ii);
        ii = FindSubString(GetStringLowerCase(sFrag),"e");
        if( ii > -1 )
            stItem.iAttEff = StringToInt(GetSubString(sFrag, ii+1,2));

        ii = FindSubString(GetStringLowerCase(sFrag),"o");
        if( ii > -1 )
            stItem.iAttEffOpt = StringToInt(GetSubString(sFrag, ii+1,2));

        ii = FindSubString(GetStringLowerCase(sFrag),"a");
        if( ii > -1 )
            stItem.iAttEffDelta = StringToInt(GetSubString(sFrag, ii+1,1));

//        SendMessageToPC(stItem.oPC, "Item attack effect is "+IntToString(stItem.iAttEff)+" opt is "+IntToString(stItem.iAttEffOpt)+" from string "+sFrag);
    }

//  Determine racial type to defend
    i = FindSubString(GetStringLowerCase(sTag),"_df");

    if( i > -1 )
    {
        stItem.iDefendRT = StringToInt(GetSubString(sTag, i+3,3));
        sFrag = GetStringRight(sTag, (iTleng-i-1));
        ii = FindSubString(GetStringLowerCase(sFrag),"_");
        if( ii > -1 )
            sFrag = GetStringLeft(sFrag, ii);
        ii = FindSubString(GetStringLowerCase(sFrag),"e");
        if( ii > -1 )
            stItem.iDefEff = StringToInt(GetSubString(sFrag, ii+1,2));

        ii = FindSubString(GetStringLowerCase(sFrag),"o");
        if( ii > -1 )
            stItem.iDefEffOpt = StringToInt(GetSubString(sFrag, ii+1,2));
        ii = FindSubString(GetStringLowerCase(sFrag),"a");
        if( ii > -1 )
            stItem.iDefEffDelta = StringToInt(GetSubString(sFrag, ii+1,1));

//        SendMessageToPC(stItem.oPC, "Def Eff is "+IntToString(stItem.iDefEff)+" defopt is "+IntToString(stItem.iDefEffOpt));
    }
//  Determine racial types to fear
    i = FindSubString(GetStringLowerCase(sTag),"_mf");

    if( i > -1 )
        stItem.iFearRT = StringToInt(GetSubString(sTag, i+3,3));

//  Find if DC for Will Save is present
    i = FindSubString(GetStringLowerCase(sTag),"_dc");

    if( i > -1 )
    {
        stItem.iSave = StringToInt(GetSubString(sTag, i+3,2));
    }

//  On Activate effects
    i = FindSubString(GetStringLowerCase(sTag),"_oa");

    if( i > -1 )
    {
        stItem.iOnActEff = StringToInt(GetSubString(sTag, i+3,2));
    }

//  Determine alignment
    i = FindSubString(GetStringLowerCase(sTag),"_al");

    if( i > -1 )
        stItem.iAlign = StringToInt(GetSubString(sTag, i+3,2));

//  Determine if item is sentient (seeks a certain player type)
    i = FindSubString(GetStringLowerCase(sTag),"_st");

    if( i > -1 )
        stItem.iSentient = TRUE;

//  Determine frequency of random behavior checks
    i = FindSubString(GetStringLowerCase(sTag),"_fr");

    if( i > -1 )
        stItem.iFreq = StringToInt(GetSubString(sTag, i+3,2));

    i = FindSubString(GetStringLowerCase(sTag),"_bk");

    if( i > -1 )
        stItem.iBehave = BEHAVE_KLEPTO;

    i = FindSubString(GetStringLowerCase(sTag),"_hv");

    if( i > -1 )
        stItem.iBehave = BEHAVE_VISIONS;

    i = FindSubString(GetStringLowerCase(sTag),"_bt");

    if( i > -1 )
        stItem.iBehave = BEHAVE_TOURETTE;

    i = FindSubString(GetStringLowerCase(sTag),"_bz");

    if( i > -1 )
        stItem.iBehave = BEHAVE_BERZERK;

//  Find if turn evil flag is present
    i = FindSubString(GetStringLowerCase(sTag),"_te");

    if( i > -1 )
        stItem.iBehave = BEHAVE_TURNEVIL;

    i = FindSubString(GetStringLowerCase(sTag),"_be");

    if( i > -1 )
    {
        stItem.iBehave = StringToInt(GetSubString(sTag, i+3,2));
        if( stItem.iBehave > 9 )
            iOff = 1;

        for( ii=i+4+iOff;ii<=iTleng;++ii)
        {
            sChar = GetStringLowerCase(GetSubString(sTag, ii,1));

            if( sChar == "c" )
                stItem.iBehaveCO = TRUE;
            else if( sChar == "a" )
                stItem.iBehaveDelta = StringToInt(GetSubString(sTag, ii+1,2));
            else if( sChar == "o" )
                stItem.iBehaveOpt = StringToInt(GetSubString(sTag, ii+1,2));
            else if( sChar == "d" )
                stItem.fBehaveDur = StringToFloat(GetSubString(sTag, ii+1,2))*6.0;
            else if( sChar == "_" )
                break;
        }
        if( stItem.iBehave > 0 && stItem.iBehaveDelta < 1 )
            stItem.iBehaveDelta = 1;
//        SendMessageToPC(stItem.oPC, "Effect "+IntToString(stItem.iBehave)+" delta "+IntToString(stItem.iBehaveDelta)+" and opt "+IntToString(stItem.iBehaveOpt));
    }

//  Normalize & set to defaults if we have bad values.
    if( stItem.iBehave < 1 )
        stItem.iBehave = -1;
    if( stItem.fBehaveDur < 1.0 )
        stItem.fBehaveDur = 6.0;    //right now i'm hard-coding it but it may change later
    if( stItem.iBehaveOpt < 0 || stItem.iBehaveOpt > 99 )
        stItem.iBehaveOpt = 4;
    if( stItem.iBehaveDelta < 1 || stItem.iBehaveDelta > 99 )
        stItem.iBehaveDelta = 1;
    if( stItem.iSave < 1 || stItem.iSave > 99 )
        stItem.iSave = 20;
    if( stItem.iFreq < 1 || stItem.iFreq > 99 )
        stItem.iFreq = 10;
    if( stItem.iAlign < 1 || stItem.iAlign > 35 )
        stItem.iAlign = -1;
    if( stItem.iDefEffOpt < 0 || stItem.iDefEffOpt > 99 )
        stItem.iDefEffOpt = 4;

    return stItem;
}

void InitializeWeaponAgent(object oItem, object oAgent, object oPC=OBJECT_INVALID)
{
    struct stCursedItem stWeapon;
    string sTag="";

    stWeapon.oPC = oPC;
    stWeapon.iLevel = GetItemCurseLevel(oItem);
    stWeapon.sPName = GetName(oPC);
    stWeapon.sPKey = GetPCPublicCDKey(oPC);
    stWeapon.oItem = oItem;
    stWeapon.iActLevel = GetItemCurseActivateLevel(oItem);
    stWeapon.iStuck = DetermineIfAgentItemStuck(oPC, oAgent, oItem);
    stWeapon.iDetectRT = -1;
    stWeapon.iAttackRT = -1;
    stWeapon.iAttEff = -1;
    stWeapon.iDefendRT = -1;
    stWeapon.iDefEff = -1;
    stWeapon.iFearRT = -1;
    stWeapon.iBehave = -1;
    stWeapon.iAlign = -1;
    stWeapon.iSentient = FALSE;
    stWeapon.iBehaveCO = FALSE;
    stWeapon = LoadCursedItemPCAbilities(stWeapon);

    SaveWeaponStruct(oAgent, stWeapon);
    SetLocalObject(oItem, "oMyAgent", oAgent);

    CheckAgentItemImmediateEffects(oAgent);

//    SendMessageToPC(oPC, "You now have cursed weapon "+GetTag(oItem)+" with curse level "+IntToString(stWeapon.iLevel));
}

void CreatePlayerItemAgent(object oPC, object oItem)
{
    object oAgent, oWP;

    if( !GetIsObjectValid(GetItemAgent(oItem)) && !GetIsDM(oPC) )
    {
//        SendMessageToPC(oPC, "Creating new item agent.");
        oWP = GetObjectByTag("WEAPON_AGENT_WP");
        oAgent = CreateObject(OBJECT_TYPE_PLACEABLE, "weaponagent", GetLocation(oWP));
        if( GetIsObjectValid(oAgent) )
            InitializeWeaponAgent(oItem, oAgent, oPC);
    }
    else if( GetIsObjectValid(GetItemAgent(oItem)) && !GetIsDM(oPC) && GetIsPC(oPC) )
    {
        DetermineIfAgentItemStuck(oPC,GetItemAgent(oItem), oItem);
        CheckAgentItemImmediateEffects(GetItemAgent(oItem), oPC);
    }
}

void ScanPCForCursedItems(object oPC)
{
    object oItem, oInv;
    int i;

    for(i=0;i<15;++i)
    {
        oItem = GetItemInSlot(i,oPC);
        if( GetIsItemCursed(oItem) )
            CreatePlayerItemAgent(oPC, oItem);
    }

    oItem = GetFirstItemInInventory(oPC);

    while( GetIsObjectValid(oItem) )
    {
        if( GetIsItemCursed(oItem) )
            CreatePlayerItemAgent(oPC, oItem);
        if( GetHasInventory(oItem) )
        {
            oInv = GetFirstItemInInventory(oItem);
            while( GetIsObjectValid(oInv) )
            {
                if( GetIsItemCursed(oInv) )
                    CreatePlayerItemAgent(oPC, oInv);
                oInv = GetNextItemInInventory(oItem);
            }
        }
        oItem = GetNextItemInInventory(oPC);
    }

}

//--------------------------------------------------------------
//  Various item functions
//--------------------------------------------------------------

int DetermineIfItemMayTransfer(object oItem, object oSrc, object oTarg)
{
    int retVal=FALSE;
    object oAgent=GetItemAgent(oItem);
    effect eEff;
    struct stCursedItem stItem=LoadWeaponStruct(GetItemAgent(oItem));

    if( GetItemCurseLevel(oItem) == 3 && GetIsAgentItemStuckToPC(GetItemAgent(oItem)) )     //Can't xfer these under any circumstances
        retVal = FALSE;
    else if( GetIsDM(oTarg) || !GetIsPC(oTarg) )  //No fun to give object to DM or NPC!
        retVal = FALSE;
    else if( GetDoesAgentItemHaveAlign(oAgent) )
    {
        if( GetDoesAgentAlignMatchPC(GetItemAgent(oItem), oTarg) )
        {
            if( !GetDoesAgentAlignMatchPC(GetItemAgent(oItem), oSrc) || GetHitDice(oTarg) > GetHitDice(oSrc) )
                retVal = TRUE;
        }
    }
    else if( GetItemCurseLevel(oItem) == 0 && !stItem.iSentient )    //Can transfer these any time unless it's sentient, where it will have to make other checks
        retVal = TRUE;
    else
    {
        if( AgentCreatureFilterMatch(oSrc, stItem.iAttackRT) && !AgentCreatureFilterMatch(oTarg, stItem.iAttackRT) )
            retVal = TRUE;
    }

    if( AgentCreatureFilterMatch(oTarg, stItem.iAttackRT) )
        retVal = FALSE;

    return retVal;
}

void CursedItemSearchForNewHost(object oItem, object oPC=OBJECT_INVALID)
{
    object oNPC;

    if( !GetIsObjectValid(oPC) )
        oPC = GetItemPossessor(oItem);

    if( GetIsObjectValid(oPC) )
    {
        oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oPC);
        if( GetIsObjectValid(oNPC) && oNPC != oPC && GetObjectSeen(oNPC, oPC) )
        {
            if( DetermineIfItemMayTransfer(oItem, oPC, oNPC) )
                RPTransferItemToPC(oItem, oPC, oNPC);
//              In the future may wish to add actions that make rp more interesting...
        }
    }
    else
    {
        oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oItem);
        if( GetIsObjectValid(oNPC) )
        {
            if( DetermineIfItemMayTransfer(oItem, OBJECT_INVALID, oNPC) )
                RPTransferItemToPC(oItem, OBJECT_INVALID, oNPC);
//              In the future may wish to add actions that make rp more interesting...
        }
    }
}

void HandlePCAttemptToDumpCurse(object oPC, object oItem)
{
    object oNPC, oNItem, oAgent=GetItemAgent(oItem);
    int iValue;
    float fValue;

    oNPC = GetItemPossessor(oItem);
    if( GetIsAgentItemStuckToPC(GetItemAgent(oItem)) )
    {
        if( GetObjectType(oNPC) == OBJECT_TYPE_STORE ) //The bugger tried to sell it!
        {
            TransferItemToPC(oItem, oPC);
            SendMessageToPC(oPC, "The merchant thinks better of it and returns it to you.");
            fValue = IntToFloat(GetGoldPieceValue(oItem))*0.15;
            iValue = FloatToInt(fValue);
            if( !iValue )
                iValue = 1;
//            SendMessageToPC(oPC, "Taking "+IntToString(iValue)+" gold back.");
            AssignCommand(oPC, TakeGoldFromCreature(iValue, oPC, TRUE));
        }
        else if( GetObjectType(oNPC) == OBJECT_TYPE_PLACEABLE && GetItemPossessor(oNPC) != oPC ) //The bugger tried to stuff it in a chest!
            TransferItemToPC(oItem, oPC);
        else if( GetArea(oNPC) == GetArea(oPC) || GetArea(oItem) == GetArea(oPC) )
        {
            if( !GetIsObjectValid(oNPC) )// player laid it down
            {
                AssignCommand(oPC, ClearAllActions());
                AssignCommand(oPC, ActionPickUpItem(oItem));
                DelayCommand(0.5, ActionDoCommand(SetCommandable(FALSE,oPC)));
                DelayCommand(3.0, ActionDoCommand(SetCommandable(TRUE, oPC)));
                SendMessageToPC(oPC, "A strange force compels you to keep it.");
            }
            else if( GetIsPC(oNPC) )
            {
                CheckAgentItemImmediateEffects(oAgent, oNPC);

    //            SendMessageToPC(oPC, "Possessor is "+GetTag(oNPC));
                if( !DetermineIfItemMayTransfer(oItem, oPC, oNPC) )
                {
                    AssignCommand(oNPC, ClearAllActions());
                    AssignCommand(oNPC, ActionGiveItem(oItem, oPC));
                    AssignCommand(oNPC, SpeakString("I don't feel like I can keep this."));
                    DelayCommand(0.5, ActionDoCommand(SetCommandable(FALSE, oNPC)));
                    DelayCommand(3.0, ActionDoCommand(SetCommandable(TRUE, oNPC)));
                    DelayCommand(1.0, AssignCommand(oPC, SpeakString("Thanks... I don't know what I was thinking.")));
                }
                else
                    TransferAgentItem(oAgent, oNPC);
            }
        }
        else
            TransferItemToPC(oItem, oPC);
    }
    else if( !GetIsAgentItemStuckToPC(oAgent) )
    {
        if( GetIsPC(oNPC) )
        {
            SetAgentItemPC(oNPC, oAgent);
            DetermineIfAgentItemStuck(oNPC, oAgent);
        }
        else if( !GetIsObjectValid(oNPC) && !GetIsAgentItemSentient(oAgent) )
        {
            DestroyObject(GetItemAgent(oItem)); //Might need to change this for special cases so it isn't destroyed
        }
    }
}


//---------------------------------------------------------------
// Misc. functions
//---------------------------------------------------------------

object GetFirstStuckItemOnPC(object oPC, int iminLvl=0, int imaxLvl=3)
{
    object oItem, oInv;
    int i;
    for(i=0;i<15;++i)
    {
        oItem = GetItemInSlot(i,oPC);
        if( GetIsItemCursed(oItem) && GetItemCurseLevel(oItem) >= iminLvl &&
            GetItemCurseLevel(oItem) <= imaxLvl && GetIsAgentItemStuckToPC(GetItemAgent(oItem)) )
            return oItem;
    }

    oItem = GetFirstItemInInventory(oPC);

    while( GetIsObjectValid(oItem) )
    {
        if( GetIsItemCursed(oItem) && GetItemCurseLevel(oItem) >= iminLvl &&
            GetItemCurseLevel(oItem) <= imaxLvl && GetIsAgentItemStuckToPC(GetItemAgent(oItem)) )
            return oItem;
        if( GetHasInventory(oItem) )
        {
            oInv = GetFirstItemInInventory(oItem);
            while( GetIsObjectValid(oInv) )
            {
                if( GetIsItemCursed(oInv) && GetItemCurseLevel(oInv) >= iminLvl &&
                    GetItemCurseLevel(oInv) <= imaxLvl && GetIsAgentItemStuckToPC(GetItemAgent(oInv)) )
                    return oInv;
                oInv = GetNextItemInInventory(oItem);
            }
        }
        oItem = GetNextItemInInventory(oPC);
    }

    return OBJECT_INVALID;
}

int CasterRemoveStuckItem(object oPC, object oCaster, int iminLvl=0, int imaxLvl=3)
{
    int iLevel, retVal=FALSE;
    object oItem=GetFirstStuckItemOnPC(oPC, iminLvl, imaxLvl);

    if( GetIsObjectValid(oItem) )
    {
        iLevel = GetItemCurseLevel(oItem);

        if( GetIsPC(oCaster) )
        {
            if( iLevel == 1 )
            {
                retVal = TRUE;
                SetAgentItemUnstuck(GetItemAgent(oItem));
                DestroyObject(oItem);
            }
        }
        else    //we assume if it's NPC, then it's a priest in a temple
        {
            if( iLevel == 1 || iLevel == 2 )
            {
                retVal = TRUE;
                SetAgentItemUnstuck(GetItemAgent(oItem));
                DestroyObject(oItem);
            }
        }
//        SendMessageToPC(oPC, "retVal is "+IntToString(retVal)+" item is "+GetName(oItem));
    }
    return retVal;
}

void CasterRemoveAllStuckItems(object oPC, object oCaster, int iminLvl=0, int imaxLvl=3)
{
    int i=FALSE;

    do
    {
        i = CasterRemoveStuckItem(oPC, oCaster, iminLvl, imaxLvl);
    }while( i == TRUE ) ;

}

void SuppressAgentCreation(object oPC)
{
    SetLocalInt(oPC, "iDontMakeNewAgent", TRUE);
}

void UnsuppressAgentCreation(object oPC)
{
    DeleteLocalInt(oPC, "iDontMakeNewAgent");
}

int GetIsAgentCreationSuppressed(object oPC)
{
    return GetLocalInt(oPC, "iDontMakeNewAgent");
}

int GetIsItemEquipped(object oPC, object oItem)
{
    int retVal=FALSE;
    int i;
    object oObj;

    for(i=0;i<15;++i)
    {
        oObj = GetItemInSlot(i,oPC);
        if( oObj == oItem )
        {
            retVal = TRUE;
            break;
        }
    }

    return retVal;
}

void ForcePCToEquipItem(object oPC, object oItem)
{
    int iSlot, iType;

    iType = GetBaseItemType(oItem);
//    SendMessageToPC(oPC, "In ForcePCToEquipItem. iType="+IntToString(iType)+" armor is "+IntToString(BASE_ITEM_ARMOR));
    if( GetObjectType(oItem) == OBJECT_TYPE_ITEM )
    {
        if( IsWeapon(oItem) && GetIsInCombat(oPC) && GetIsObjectValid(GetAttackTarget(oPC)) )
        {
            SendMessageToPC(oPC, "With this weapon securely in your grip you know you can defeat a "+GetName(GetAttackTarget(oPC)));
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTHAND));
        }
        else if( iType == BASE_ITEM_RING )
        {
            SendMessageToPC(oPC, "You feel strangely compelled to put the ring back on.");
            if( !Random(2) )
                AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_LEFTRING));
            else
                AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTRING));
        }
        else if( iType == BASE_ITEM_BOOTS )
        {
            SendMessageToPC(oPC, "Your feet are rejeuvenated to be back in these boots again.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_BOOTS));
        }
        else if( iType == BASE_ITEM_AMULET )
        {
            SendMessageToPC(oPC, "The amulet feels like it belongs around your neck.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_NECK));
        }
        else if( iType == BASE_ITEM_BELT )
        {
            SendMessageToPC(oPC, "The belt makes you feel secure fastened on your waist.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_BELT));
        }
        else if( iType == BASE_ITEM_ARMOR )
        {
            SendMessageToPC(oPC, "It feels good to be back in the armor again.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST));
        }
        else if( iType == BASE_ITEM_GLOVES )
        {
            SendMessageToPC(oPC, "You feel power surging through you hands as you put the gloves back on.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_ARMS));
        }
        else if( iType == BASE_ITEM_HELMET )
        {
            SendMessageToPC(oPC, "Putting the helm back on makes you feel invulnerable.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_HEAD));
        }
        else if( iType == BASE_ITEM_CLOAK )
        {
            SendMessageToPC(oPC, "You feel the warmth returning to your body with the cloak on again.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_CLOAK));
        }
        else if( IsAmmo(iType) )
        {
            SendMessageToPC(oPC, "You feel like you could take out anything with the proper ammunition.");
            AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_ARROWS));
        }
    }

}

object FilterItemCreatureDetect(object oPC, int iType)
{
    object oCrit;

    if( iType < 100 )
        oCrit = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, iType, oPC);
    else if( iType < 200 )
        oCrit = GetNearestCreature(CREATURE_TYPE_CLASS, (iType-100), oPC);

    return oCrit;
}

int AgentCreatureFilterMatch(object oNPC, int iFiltType)
{
    int retVal=FALSE;

    if( iFiltType < 100 )
    {
        if( GetRacialType(oNPC) == iFiltType )
            retVal = TRUE;
    }
    else if( iFiltType < 200 )
    {
        if( GetLevelByClass((iFiltType-100), oNPC) > 0 )
            retVal = TRUE;
    }

    return retVal;
}

void CheckCursedItemAutoBehaviors(struct stCursedItem stItem)
{
    object oCrit, oTarg;
//    int iCtr=0;
    int iWillSave=GetWillSavingThrow(stItem.oPC);
    effect eEff;

    if( IsWeapon(stItem.oItem) && GetIsInCombat(stItem.oPC) && stItem.iStuck )
    {
        if( !GetIsItemEquipped(stItem.oPC, stItem.oItem) )
        {
            AssignCommand(stItem.oPC, ClearAllActions());
            AssignCommand(stItem.oPC, ActionEquipItem(stItem.oItem, INVENTORY_SLOT_RIGHTHAND));
        }
    }

    if( stItem.iDefendRT > -1 && (stItem.iStuck || GetIsItemEquipped(stItem.oPC, stItem.oItem) || !GetIsItemEquippable(stItem.oItem)) )
    {
        if( GetIsInCombat(stItem.oPC) && AgentCreatureFilterMatch(GetAttackTarget(stItem.oPC), stItem.iDefendRT) )
        {
            if( GetAttackTarget(GetAttackTarget(stItem.oPC)) == stItem.oPC )
                AssignCommand(GetAttackTarget(stItem.oPC), ClearAllActions());
            SendMessageToPC(stItem.oPC, "You feel as if you should protect "+GetName(GetAttackTarget(stItem.oPC))+", not harm it.");
            SetIsTemporaryFriend(stItem.oPC, oCrit, FALSE);
            eEff = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEff, stItem.oPC);
            eEff = EffectDamage(Random(4)+1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEff, stItem.oPC);
            AssignCommand(stItem.oPC, ClearAllActions());
            AssignCommand(stItem.oPC, ActionMoveAwayFromLocation(GetLocation(stItem.oPC), TRUE, 7.0));
        }
        else if( GetIsObjectValid(GetAttackTarget(stItem.oPC)) )
        {
            oCrit = FilterItemCreatureDetect(stItem.oPC, stItem.iDefendRT);
//            SendMessageToPC(stItem.oPC, "Nearby is "+GetName(oCrit));
            if( GetIsObjectValid(oCrit) && GetIsEnemy(GetAttackTarget(stItem.oPC), oCrit) )
            {
                if( stItem.iDefEff > -1 )
                    ApplyItemEffectToPlayer(stItem.oPC, stItem.iDefEff, stItem.iDefEffOpt, 8.0, stItem.iDefEffDelta, stItem.iSave, stItem.oItem);
            }
        }
        else
        {
            oCrit = FilterItemCreatureDetect(stItem.oPC, stItem.iDefendRT);
            if( GetIsObjectValid(oCrit) )
            {
                if( GetAttackTarget(oCrit) == stItem.oPC )
                    AssignCommand(oCrit, ClearAllActions());
                if( GetIsEnemy(stItem.oPC, oCrit) )
                    SetIsTemporaryFriend(stItem.oPC, oCrit, FALSE);
                if( GetObjectSeen(oCrit, stItem.oPC) && GetIsInCombat(oCrit) )
                {
                    oTarg = GetAttackTarget(oCrit);
                    if( GetIsObjectValid(oTarg) )
                    {
                        if( !WillSave(stItem.oPC, stItem.iSave) )
                        {
                            SendMessageToPC(stItem.oPC, "You feel you must defend "+GetName(oCrit));
                            eEff=EffectVisualEffect(VFX_IMP_DOMINATE_S );
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEff, stItem.oPC);
                            AssignCommand(stItem.oPC, ClearAllActions());
                            if( GetIsItemEquippable(stItem.oItem) )
                                AssignCommand(stItem.oPC, ActionEquipItem(stItem.oItem, INVENTORY_SLOT_RIGHTHAND));
                            if( !GetIsArmed(stItem.oPC) && !IsWeapon(stItem.oItem) )
                                AssignCommand(stItem.oPC, ActionEquipMostDamagingRanged(stItem.oPC));
                            if( stItem.iDefEff > -1 )
                                ApplyItemEffectToPlayer(stItem.oPC, stItem.iDefEff, stItem.iDefEffOpt, 8.0, stItem.iDefEffDelta, stItem.iSave, stItem.oItem);
                            DelayCommand(1.0, ActionDoCommand(AssignCommand(stItem.oPC, ActionAttack(oTarg))));
                            DelayCommand(1.5, ActionDoCommand(SetCommandable(FALSE, stItem.oPC)));
                            DelayCommand(12.0, ActionDoCommand(SetCommandable(TRUE, stItem.oPC)));
                        }
                    }
                }
            }
        }
    }

    if( stItem.iAttackRT > -1 && (stItem.iStuck || GetIsItemEquipped(stItem.oPC, stItem.oItem) || !GetIsItemEquippable(stItem.oItem)) )
    {
        if( GetIsObjectValid(GetAttackTarget(stItem.oPC)) && AgentCreatureFilterMatch(GetAttackTarget(stItem.oPC), stItem.iAttackRT) )
        {
            if( stItem.iAttEff > -1 )
                ApplyItemEffectToPlayer(stItem.oPC, stItem.iAttEff, stItem.iAttEffOpt, 8.0, stItem.iAttEffDelta, stItem.iSave, stItem.oItem);
        }
        else
        {
//        SendMessageToPC(stItem.oPC, "Humans are "+IntToString(RACIAL_TYPE_HUMAN)+" and you attack "+IntToString(stItem.iAttackRT));
            oCrit = FilterItemCreatureDetect(stItem.oPC, stItem.iAttackRT);
            if( GetIsObjectValid(oCrit) )
            {
    //            SendMessageToPC(stItem.oPC, "Item has bead on "+GetName(oCrit));
                if( !GetIsObjectValid(GetAttackTarget(stItem.oPC)) || (GetIsInCombat(stItem.oPC) && GetRacialType(GetAttackTarget(stItem.oPC)) != stItem.iAttackRT) )
                {
                    if( GetObjectSeen(oCrit, stItem.oPC) )
                    {
                        if( !WillSave(stItem.oPC, stItem.iSave) )
                        {
                            SendMessageToPC(stItem.oPC, "You find yourself driven to attack "+GetName(oCrit));
                            eEff=EffectVisualEffect(VFX_IMP_DOMINATE_S );
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEff, stItem.oPC);
                            AssignCommand(stItem.oPC, ClearAllActions());
                            if( stItem.iAttEff > -1 )
                                ApplyItemEffectToPlayer(stItem.oPC, stItem.iAttEff, stItem.iAttEffOpt, 8.0, stItem.iAttEffDelta, stItem.iSave, stItem.oItem);
                            if( GetIsItemEquippable(stItem.oItem) )
                                AssignCommand(stItem.oPC, ActionEquipItem(stItem.oItem, INVENTORY_SLOT_RIGHTHAND));
                            if( !GetIsArmed(stItem.oPC) && !IsWeapon(stItem.oItem) )
                                AssignCommand(stItem.oPC, ActionEquipMostDamagingRanged(stItem.oPC));
                            DelayCommand(1.0, ActionDoCommand(AssignCommand(stItem.oPC, ActionAttack(oCrit))));
                            DelayCommand(1.5, ActionDoCommand(SetCommandable(FALSE, stItem.oPC)));
                            DelayCommand(12.0, ActionDoCommand(SetCommandable(TRUE, stItem.oPC)));
                        }
                    }
                }
            }
        }
    }
    if( stItem.iDetectRT > -1 && (stItem.iStuck || GetIsItemEquipped(stItem.oPC, stItem.oItem) || !GetIsItemEquippable(stItem.oItem)) )
    {
        oCrit = FilterItemCreatureDetect(stItem.oPC, stItem.iDetectRT);
        if( GetIsObjectValid(oCrit) )
        {
            if( GetDistanceBetween(oCrit, stItem.oPC) <= IntToFloat(stItem.iDetectRange) )
            {
                if( GetIsItemEquipped(stItem.oPC, stItem.oItem) || !GetIsItemEquippable(stItem.oItem) )//&& IsWeapon(GetBaseItemType(stItem.oItem)) )
                {
                    eEff=EffectVisualEffect(VFX_DUR_PARALYZED);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, stItem.oPC, 6.0);
                    if( !Random(2) )
                        SendMessageToPC(stItem.oPC, "You feel heat coming from "+GetName(stItem.oItem));
                }
            }
        }
    }

    if( stItem.iFearRT > -1 && (stItem.iStuck || GetIsItemEquipped(stItem.oPC, stItem.oItem) || !GetIsItemEquippable(stItem.oItem)) )
    {
        oCrit = FilterItemCreatureDetect(stItem.oPC, stItem.iFearRT);
        if( GetIsObjectValid(oCrit) )
        {
            if( GetObjectSeen(oCrit, stItem.oPC) )
            {
                if( !WillSave(stItem.oPC, stItem.iSave) )
                {
                    eEff = EffectVisualEffect(VFX_IMP_DOMINATE_S);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, stItem.oPC, 6.0);
                    AssignCommand(stItem.oPC, ClearAllActions());
                    AssignCommand(stItem.oPC, ActionMoveAwayFromObject(oCrit, TRUE, 50.0));
                    DelayCommand(0.5, ActionDoCommand(SetCommandable(FALSE, stItem.oPC)));
                    SendMessageToPC(stItem.oPC, "When you see the "+ReturnRacialString(stItem.iFearRT)+" an irrational fear grips you and you must get away!");
                    DelayCommand(6.0, ActionDoCommand(SetCommandable(TRUE, stItem.oPC)));
                }
            }
        }
    }

}

void CheckCursedItemRandomBehaviors(struct stCursedItem stItem)
{

//    SendMessageToPC(stItem.oPC, "In CheckCursedItemRandomBehaviors behave "+IntToString(stItem.iBehave));
    ApplyItemEffectToPlayer(stItem.oPC, stItem.iBehave, stItem.iBehaveOpt, stItem.fBehaveDur, stItem.iBehaveDelta, stItem.iSave, stItem.oItem);
    if( stItem.iSentient )
        CursedItemSearchForNewHost(stItem.oItem, stItem.oPC);
}

void ApplyItemEffectToPlayer(object oPC, int iEffect, int iEffOpt=4, float fEffDur=6.0, int iEffDelta=1, int iSave=20, object oItem=OBJECT_INVALID)
{
    object oNPC;
    effect eEff;

    switch(iEffect)
    {
        case 0:   //default
            break;
        case 1: // damage resistence
            eEff = EffectDamageResistance(iEffOpt, iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 3: //
            eEff = EffectRegenerate(iEffDelta, fEffDur);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 7: //
//            eEff = EffectDamageReduction(iEffDelta, iEffOpt);
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 9: //
            eEff = EffectTemporaryHitpoints(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 11: //
            eEff = EffectEntangle();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 12: // Invulnerability
//            eEff =
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 13: //
            eEff = EffectDeaf();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 15: //
/*            SendMessageToPC(oPC, "Immunity to ability dec is "+IntToString(IMMUNITY_TYPE_ABILITY_DECREASE));
            SendMessageToPC(oPC, "Immunity to disease is "+IntToString(IMMUNITY_TYPE_DISEASE));
            SendMessageToPC(oPC, "Immunity to fear is "+IntToString(IMMUNITY_TYPE_FEAR));
            SendMessageToPC(oPC, "Immunity to paralysis is "+IntToString(IMMUNITY_TYPE_PARALYSIS));
            SendMessageToPC(oPC, "Immunity to stun is "+IntToString(IMMUNITY_TYPE_STUN));*/
//            eEff = EffectImmunity();;
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 17: //
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 23: //
            eEff = EffectCharmed();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 24: // confused
            eEff = EffectConfused();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 25: //
            eEff = EffectFrightened();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 27: //
            eEff = EffectParalyze();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 28: //
            eEff = EffectDazed();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 29: // Stunned
            eEff = EffectStunned();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 30: //
            eEff = EffectSleep();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 31: //
            eEff = EffectPoison(iEffOpt);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 32: //
            eEff = EffectDisease(iEffOpt);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 33: // curse
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 34: //
            eEff = EffectSilence();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 36: //
            eEff = EffectHaste();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 37: //
            eEff = EffectSlow();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 38: //
            eEff = EffectAbilityIncrease(iEffOpt, iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 39: //
            eEff = EffectAbilityDecrease(iEffOpt, iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 40: //
            eEff = EffectAttackIncrease(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 41: //
            eEff = EffectAttackDecrease(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 42: //
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 43: //
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 44: //
            eEff = EffectDamageImmunityIncrease(iEffOpt, iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 45: //
            eEff = EffectDamageImmunityDecrease(iEffOpt, iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 46: //
            eEff = EffectACIncrease(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 47: //
            eEff = EffectACDecrease(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 48: //
            eEff = EffectMovementSpeedIncrease(iEffDelta*100);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 49: //
            eEff = EffectMovementSpeedDecrease(iEffDelta*100);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 50: //
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 51: //
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 52: //
            eEff = EffectSpellResistanceIncrease(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 53: //
            eEff = EffectSpellResistanceDecrease(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 56: //
            eEff = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 57: //
            eEff = EffectInvisibility(INVISIBILITY_TYPE_IMPROVED);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 58: //
            eEff = EffectDarkness();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 62: //
            eEff = EffectPolymorph(iEffOpt);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 63: //
            eEff = EffectSanctuary(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 64: //
            eEff = EffectTrueSeeing();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 65: //
            eEff = EffectSeeInvisible();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 66: //
            eEff = EffectTimeStop();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 67: //
            eEff = EffectBlindness();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 68: //
            eEff = EffectSpellLevelAbsorption(iEffDelta, 0, iEffOpt);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 70: //
            eEff = EffectUltravision();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 71: //
            eEff = EffectMissChance(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 72: //
            eEff = EffectConcealment(iEffDelta);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 73: //
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, fEffDur);
            break;
        case 201:   //Tourett
        {
            if( GetIsInParty(oPC) )
                ExecuteScript("36_cursed_talk", oPC);
            break;
        }
        case 202:   //Klepto
        {
            oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oPC);
            if( !GetIsObjectValid(oNPC) || (GetDistanceBetween(oPC, oNPC) > 8.0 || GetDistanceBetween(oPC, oNPC) < 0.1) )
                oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, oPC);
            if( GetIsObjectValid(oNPC) && GetDistanceBetween(oPC, oNPC) <= 8.0 && GetDistanceBetween(oPC, oNPC) > 0.0 )
            {
                if( !WillSave(oPC, iSave) )
                {
                    AssignCommand(oPC, ClearAllActions());
                    AssignCommand(oPC, ActionUseSkill(SKILL_PICK_POCKET, oNPC));
                    DelayCommand(0.5, ActionDoCommand(SetCommandable(FALSE, oPC)));
                    DelayCommand(4.0, ActionDoCommand(SetCommandable(TRUE, oPC)));
                }
            }
            break;
        }
        case 203:   //Berzerk
        {
            oNPC = GetNearestCreature(CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN, oPC);
            if( GetIsObjectValid(oNPC) )
            {
                if( !WillSave(oPC, iSave) )
                {
                    SendMessageToPC(oPC, "A sudden rage burns in your heart.");
                    eEff = EffectVisualEffect(VFX_DUR_PARALYZED);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEff, oPC, 6.0);
                    AssignCommand(oPC, ClearAllActions());
                    if( IsWeapon(oItem) )
                        AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTHAND));
                    DelayCommand(1.0, ActionDoCommand(AssignCommand(oPC, ActionAttack(oNPC))));
                    DelayCommand(1.5, ActionDoCommand(SetCommandable(FALSE, oPC)));
                    DelayCommand(12.0, ActionDoCommand(SetCommandable(TRUE, oPC)));
                }
            }
            break;
        }
        case 204:   //Turn evil
        {
            if( !WillSave(oPC, iSave) )
            {
                eEff = EffectVisualEffect(VFX_IMP_DOOM);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eEff, oPC);
                AdjustAlignment(oPC, ALIGNMENT_EVIL, 1);
                SendMessageToPC(oPC, "You feel yourself sinking into darkness...");
            }
            break;
        }
        case 205:   //Haunting visions
        {
/*            if( GetIsNight() || GetIsResting(oPC) )
            {
                SendMessageToPC(oPC, "Calling conv talk.");
                SetLocalInt(oPC, "iVision", TRUE);
                ExecuteScript("36_cursed_talk", oPC);
            } */
            break;
        }
        default:
            break;
    }
}

int IsWeapon(object oItem)
{
    int retVal = FALSE;
    int nBaseType = GetBaseItemType(oItem);

    switch (nBaseType)
    {
        case BASE_ITEM_BASTARDSWORD :
        case BASE_ITEM_BATTLEAXE :
        case BASE_ITEM_CBLUDGWEAPON :
        case BASE_ITEM_CLUB :
        case BASE_ITEM_DAGGER :
        case BASE_ITEM_DART :
        case BASE_ITEM_DIREMACE :
        case BASE_ITEM_DOUBLEAXE :
        case BASE_ITEM_GREATAXE :
        case BASE_ITEM_GREATSWORD :
        case BASE_ITEM_HALBERD :
        case BASE_ITEM_HANDAXE :
        case BASE_ITEM_HEAVYCROSSBOW :
        case BASE_ITEM_HEAVYFLAIL :
        case BASE_ITEM_KAMA :
        case BASE_ITEM_KATANA :
        case BASE_ITEM_KUKRI :
        case BASE_ITEM_LIGHTCROSSBOW :
        case BASE_ITEM_LIGHTFLAIL :
        case BASE_ITEM_LIGHTHAMMER :
        case BASE_ITEM_LIGHTMACE :
        case BASE_ITEM_LONGBOW :
        case BASE_ITEM_LONGSWORD :
        case BASE_ITEM_MAGICROD :
        case BASE_ITEM_MAGICSTAFF :
        case BASE_ITEM_MAGICWAND :
        case BASE_ITEM_MORNINGSTAR :
        case BASE_ITEM_QUARTERSTAFF :
        case BASE_ITEM_RAPIER :
        case BASE_ITEM_SCIMITAR :
        case BASE_ITEM_SCYTHE :
        case BASE_ITEM_SHORTBOW :
        case BASE_ITEM_SHORTSPEAR :
        case BASE_ITEM_SHORTSWORD :
        case BASE_ITEM_SHURIKEN :
        case BASE_ITEM_SICKLE :
        case BASE_ITEM_SLING :
        case BASE_ITEM_THROWINGAXE :
        case BASE_ITEM_TWOBLADEDSWORD :
        case BASE_ITEM_WARHAMMER : retVal = TRUE;
        break;
    }
    return retVal;
}

int IsAmmo( int nBaseType )
{
    int retVal = FALSE;

    switch (nBaseType)
    {
        case BASE_ITEM_ARROW :
        case BASE_ITEM_BULLET :
        case BASE_ITEM_DART :
        case BASE_ITEM_THROWINGAXE :
        case BASE_ITEM_SHURIKEN :
        case BASE_ITEM_BOLT : retVal = TRUE;
        break;
    }

    return retVal;
}

int GetIsInParty(object oPC)
{
    object oFact;
    int retVal=FALSE;

    oFact = GetFirstFactionMember(oPC);
    while( oFact == oPC && GetIsObjectValid(oFact) )
    {
        oFact = GetNextFactionMember(oPC);
    }

    if( GetIsObjectValid(oFact) && oFact != oPC )
        retVal = TRUE;

    return retVal;
}

int GetIsPCImprisoned(object oPC)
{
    return GetLocalInt(oPC, "iDetained");
}

string GetFirstName(object oPC)
{
    string sFull, sTmp, retVal;
    int i, iLen, iMark=-1;

    retVal = "";
    sFull = GetName(oPC);

    iMark = FindSubString(sFull, " ");
    if( iMark > -1 )
        retVal = GetSubString(sFull, 0, iMark);
    else
        retVal = sFull;

    return retVal;
}

int GetIsOppositeSex(object oRef, object oTarg)
{
    int retVal = FALSE;
    int iRGen, iTGen;

    iRGen = GetGender(oRef);
    iTGen = GetGender(oTarg);

    if( iRGen == GENDER_FEMALE && iTGen == GENDER_MALE )
        retVal = TRUE;
    else if( iRGen == GENDER_MALE && iTGen == GENDER_FEMALE )
        retVal = TRUE;

    return retVal;
}

int GetObjectHasEffect(int nEffectType, object oTarget = OBJECT_SELF)
{
    effect eCheck = GetFirstEffect(oTarget);
    int retVal = FALSE;

/*    SendMessageToPC(oTarget, "Testing for effect.");
    if( GetIsEffectValid(eCheck) )
        SendMessageToPC(oTarget, "There is at least one effect.");*/

    while(GetIsEffectValid(eCheck) )
    {
        if(GetEffectType(eCheck) == nEffectType)
        {
//            SendMessageToPC(oTarget, "You have the effect we're looking for.");
            retVal = TRUE;
            break;
        }
        eCheck = GetNextEffect(oTarget);
    }
    return retVal;
}

int GetIsItemEquippable(object oItem)
{
    int retVal=TRUE;
    int iType = GetBaseItemType(oItem);

    switch(iType)
    {
        case BASE_ITEM_BOOK :
        case BASE_ITEM_GEM :
        case BASE_ITEM_GOLD :
        case BASE_ITEM_HEALERSKIT :
        case BASE_ITEM_INVALID :
        case BASE_ITEM_KEY :
        case BASE_ITEM_MISCLARGE :
        case BASE_ITEM_MISCMEDIUM :
        case BASE_ITEM_MISCSMALL :
        case BASE_ITEM_MISCTALL :
        case BASE_ITEM_MISCTHIN :
        case BASE_ITEM_MISCWIDE :
        case BASE_ITEM_POTIONS :
        case BASE_ITEM_SCROLL :
        case BASE_ITEM_THIEVESTOOLS :
        case BASE_ITEM_SPELLSCROLL :
        case BASE_ITEM_TRAPKIT :
        case BASE_ITEM_LARGEBOX : retVal = FALSE;
        break;
    }

    return retVal;
}

int GetIsArmed(object oPC)
{
    int retVal = FALSE;

    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
    object oItem2 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);

    if (IsWeapon(oItem) == TRUE || IsWeapon(oItem2) == TRUE)
        retVal = TRUE;

    return retVal;
}

int GetIsPCInArea(object oArea)
{
    object oPC, oLoc;
    int retVal = FALSE;

    oPC = GetFirstPC();

    while( GetIsObjectValid(oPC) )
    {
        oLoc = GetArea(oPC);
        if( oLoc == oArea )
        {
            retVal = TRUE;
            break;
        }
        else
            oPC = GetNextPC();
    }

    return retVal;
}

