#include "x2_inc_craft"
#include "x2_inc_switches"


int TS_GetSpellLevel(int nSpellID)
{
    int nRet = StringToInt(Get2DAString(X2_CI_CRAFTING_SP_2DA, "Level", nSpellID));
    SendMessageToAllDMs("Spell Level Read as: " + IntToString(nRet));

    if(nSpellID > 2000) nRet = 5;

    return nRet;
}




void main()
{

 object oTarget = GetSpellTargetObject();
 int nSpellID = GetSpellId();
 int nCost = 0;




// if (GetResRef(oTarget) == "alfa_spellbook")
//    {
        SetModuleOverrideSpellScriptFinished();
        int iDay = GetLocalInt(OBJECT_SELF, "DAY");
        SendMessageToPC(OBJECT_SELF, "You begin scribing a scroll");
        if(GetCalendarDay() == iDay && GetIsDM(OBJECT_SELF) == FALSE){
          SendMessageToPC(OBJECT_SELF, "You can only scribe one scroll a day.");
          return;
        }
        SetLocalInt(OBJECT_SELF, "DAY", GetCalendarDay());
        if (GetHasFeat(FEAT_SCRIBE_SCROLL, OBJECT_SELF) > 0 || GetIsDM(OBJECT_SELF))
        {

            int nPropID = IPGetIPConstCastSpellFromSpellID(nSpellID);
            nCost = TS_GetSpellLevel(nSpellID) * 25;
            if (nPropID == -1)
            {
                SendMessageToPC(OBJECT_SELF, "For some reason you can't copy this spell. Possibly a bug! Ask!");
            }
            else
            {
                if (GetGold() >= nCost || GetIsDM(OBJECT_SELF))
                {
                    object oScroll = CreateItemOnObject("aay_scroll", OBJECT_SELF);
                    IPRemoveAllItemProperties(oScroll, DURATION_TYPE_PERMANENT);
                    itemproperty iProp = ItemPropertyCastSpell(nPropID, IP_CONST_CASTSPELL_NUMUSES_SINGLE_USE);
                    AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);




                    if(GetLevelByClass(CLASS_TYPE_BARD, OBJECT_SELF) || GetLevelByClass(CLASS_TYPE_WIZARD, OBJECT_SELF) || GetLevelByClass(CLASS_TYPE_SORCERER, OBJECT_SELF)  ){
                      iProp = ItemPropertyLimitUseByClass(IP_CONST_CLASS_WIZARD);
                      AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);
                      iProp = ItemPropertyLimitUseByClass(IP_CONST_CLASS_SORCERER);
                      AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);
                      iProp = ItemPropertyLimitUseByClass(IP_CONST_CLASS_BARD);
                      AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);
                    }
                    if(GetLevelByClass(CLASS_TYPE_CLERIC, OBJECT_SELF) || GetLevelByClass(CLASS_TYPE_DRUID, OBJECT_SELF) || GetLevelByClass(CLASS_TYPE_PALADIN, OBJECT_SELF) || GetLevelByClass(CLASS_TYPE_RANGER, OBJECT_SELF) ) {
                      iProp = ItemPropertyLimitUseByClass(IP_CONST_CLASS_CLERIC);
                      AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);
                      iProp = ItemPropertyLimitUseByClass(IP_CONST_CLASS_DRUID);
                      AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);
                      iProp = ItemPropertyLimitUseByClass(IP_CONST_CLASS_PALADIN);
                      AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);
                      iProp = ItemPropertyLimitUseByClass(IP_CONST_CLASS_RANGER);
                      AddItemProperty(DURATION_TYPE_PERMANENT, iProp, oScroll);


                    }


                    SendMessageToPC(OBJECT_SELF, "You have created a scroll.");
                    TakeGoldFromCreature(nCost, OBJECT_SELF, TRUE);
                    SetXP(OBJECT_SELF, GetXP(OBJECT_SELF) - (nCost/5));
                    SetName(oScroll, GetName(OBJECT_SELF) + "'s Scribed Scroll");
                }
                else SendMessageToPC(OBJECT_SELF, "You don't have enough gold to make a copy!");
            }
        }
        else
        {
                SendMessageToPC(OBJECT_SELF, "You need the scribe scroll feat to use this");
        }
        return;
  //  }
}
