// Golems are stupidly specific in what is needed, therefore I have made it so
// a set of books exlains each golem, and each have a cast spell Activate Item.



#include "x0_i0_spells"
#include "x2_inc_itemprop"
//#include "ginc_item"
//#include "ginc_henchman"

const string sGOLEM_RESREF = "GOLEM_RESREF";
const string sGOLEM_GP = "GOLEM_GP";
const string sGOLEM_XP = "GOLEM_XP";
const string sMAGICTYPE = "GOLEM_MAGIC_TYPE";
const string sCASTERLEVEL = "GOLEM_CASTER_LEVEL";
const string sWONDROUS = "GOLEM_NO_WONDROUS";
const string sCRAFTMAGIC = "GOLEM_NO_CRAFTMAGIC";
const string sSKILL  = "GOLEM_SKILL";
const string sSKILL_DC  = "GOLEM_SKILL_DC";
const string sGOLEMSCROLL = "GOLEM_SCROLL_";
const string sGOLEMITEM = "GOLEM_ITEM_";
const string sGOLEMSCROLLMAX = "GOLEM_SCROLL_MAX";
const string sGOLEMITEMMAX = "GOLEM_ITEM_MAX";

void AddGolemToParty(string sResRef, object oCaster);
void DestroyComponents(object oBook, int bSuccess = FALSE, object oCaster = OBJECT_SELF);
int GetAllItemsFound(object oBook);
int GetArcaneLevel(object oCaster = OBJECT_SELF);
int GetDivineLevel(object oCaster = OBJECT_SELF);
int GetGolemCraft(object oBook, object oContainer, object oCaster = OBJECT_SELF);
int GetHasArcaneCasting(object oCaster = OBJECT_SELF);
int GetHasArcaneOrDivineCasting(object oCaster = OBJECT_SELF);
int GetHasDivineCasting(object oCaster = OBJECT_SELF);
int GetHasGolemItems(object oBook, object oContainer, object oCaster);
int GetIntInVarList(int nID, string sPrefix, object oBook);
void GetItemsList(object oItem, object oBook);
int GetNumberOfStringVariables(string sPrefix, object oBook);
int GetNumberOfIntVariables(string sPrefix, object oBook);
void GetScrollList(object oItem, object oBook);

void main()
{
     object oCaster = GetItemActivator();
     object oContainer = GetItemActivatedTarget();
     object oItem = GetItemActivated();
     string sGolemResRef = GetLocalString(oItem, sGOLEM_RESREF);
     SendMessageToPC(oCaster, "*Begins Crafting...*");
     // Stop errors
     if(GetName(oContainer) != "Golem Crafting Bench"){
        SendMessageToPC(oCaster, "Can only be used on the Golem Crafting Bench.");
        return;


     }

     if ( (!GetIsObjectValid(oCaster)) | (!GetIsObjectValid(oContainer)) | (!GetIsObjectValid(oItem)) | (sGolemResRef == "") )
    {
          SendMessageToPC(oCaster, "Stop error. Caster, Container or Book are invalid or no golem resref set.");
          return;
    }
     int bSuccess = GetGolemCraft(oItem, oContainer, oCaster);
     if (bSuccess)
    {
      //AddGolemToParty(sGolemResRef, oCaster);
     object oGolem = CreateItemOnObject(sGolemResRef, oContainer, 1, sGolemResRef);
     // add it to the roster and party
     //int bAdded = AddRosterMemberByCharacter(sTag, oGolem);
     //int bSelect =  SetIsRosterMemberSelectable(sTag, TRUE);
     //int bPartyAdd = AddRosterMemberToParty(sTag, oCaster);

     effect eVis = EffectVisualEffect(VFX_COM_HIT_SONIC);
     ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oContainer);
     SendMessageToPC(oCaster, "Success!");



    }
     DestroyComponents(oItem, bSuccess, oCaster);
}








// returns all arcane levels
int GetArcaneLevel(object oCaster = OBJECT_SELF)
{
     int nArcane = GetLevelByClass(CLASS_TYPE_WIZARD, oCaster) + GetLevelByClass(CLASS_TYPE_SORCERER, oCaster) + GetLevelByClass(CLASS_TYPE_BARD, oCaster);

     return nArcane;
}







// returns the divine casting levels
int GetDivineLevel(object oCaster = OBJECT_SELF)
{
     int nDivine = GetLevelByClass(CLASS_TYPE_CLERIC, oCaster) + GetLevelByClass(CLASS_TYPE_DRUID, oCaster);

     return nDivine;
}









// Runs through all the local variables (see constants) before returning TRUE
int GetGolemCraft(object oBook, object oContainer, object oCaster = OBJECT_SELF)
{
    // Feat checks
     int nWondrous = GetLocalInt(oBook, sWONDROUS);
     if (nWondrous == 0)
    {
          if  (!GetHasFeat(FEAT_CRAFT_WAND, oCaster))
            {
               FloatingTextStringOnCreature("Craft Wand feat required", oCaster);
               return FALSE;
            }
    }




     // Feat checks
     int nCraftMagic = GetLocalInt(oBook, sCRAFTMAGIC);
     if (nCraftMagic == 0)
    {
          if  (!GetHasFeat(FEAT_CRAFT_HARPER_ITEM, oCaster))
            {
               FloatingTextStringOnCreature("Craft Wondrous Items feat required", oCaster);
               return FALSE;
            }
    }




     // Enough Gold?
     int nGP = GetLocalInt(oBook, sGOLEM_GP);
     if ( (nGP > 0) & (GetGold(oCaster) < nGP) )
    {
          FloatingTextStringOnCreature("You do not the have "+IntToString(nGP)+" gp required", oCaster);
             return FALSE;
    }






     // Enough XP?
     int nXP = GetLocalInt(oBook, sGOLEM_XP);
     if ( (nXP > 0) & (GetXP(oCaster) < nXP) )
    {
          FloatingTextStringOnCreature("You do not the have "+IntToString(nXP)+" xp required", oCaster);
             return FALSE;
    }






     // Has a casting class?
     int bHasCastingLevels = FALSE;
     int nArcane, nDivine, nHarper;
     int nMagicType = GetLocalInt(oBook, sMAGICTYPE);
     int nCasterLvl = GetLocalInt(oBook, sCASTERLEVEL);
     if (nCasterLvl <= 0)
          bHasCastingLevels = TRUE;
     else
    {
          switch (nMagicType)
            {
               case 0: //none
                    bHasCastingLevels = TRUE;
                    break;
               case 1: //both
                    nHarper = GetLevelByClass(CLASS_TYPE_HARPER, oCaster);
                    nArcane = GetArcaneLevel(oCaster);
                    nDivine = GetDivineLevel(oCaster) - nHarper;
                    if ( (nDivine + nArcane) >= nCasterLvl)
                         bHasCastingLevels = TRUE;
                    break;
               case 2: //arcnae
                    nArcane = GetArcaneLevel(oCaster);
                    if ( nArcane >= nCasterLvl)
                         bHasCastingLevels = TRUE;
                    break;
               case 3: //divine
                    nDivine = GetDivineLevel(oCaster);
                    if (nDivine  >= nCasterLvl)
                       bHasCastingLevels = TRUE;
                    break;
            }
    }



     if (!bHasCastingLevels)
    {
          FloatingTextStringOnCreature("You do not the enough casting levels to required", oCaster);
             return FALSE;
    }





     int bHasItems = GetHasGolemItems(oBook, oContainer, oCaster);
     if (!bHasItems)
    {
          FloatingTextStringOnCreature("Insufficient items or scrolls", oCaster);
             return FALSE;
    }



     // Skill is the "core" skill for golems
     int nSkill = GetSkillRank(SKILL_LORE,oCaster,TRUE);
     int nDC = GetLocalInt(oBook, sSKILL_DC);

  //more skill checking fixes needed


    if ( (nSkill < nDC)  )
    {
          FloatingTextStringOnCreature("You do not have enough Lore", oCaster);
          return FALSE;
    }

    nSkill = GetSkillRank(SKILL_SPELLCRAFT,oCaster,TRUE);
    if ( (nSkill < nDC)  )
    {
          FloatingTextStringOnCreature("You do not have enough Spellcraft", oCaster);
          return FALSE;
    }




     return TRUE;
}











// Gets how many local int variable starting with sPrefix exist on oBook
int GetNumberOfIntVariables(string sPrefix, object oBook)
{
     int i = 1;
     int nVariable = GetLocalInt(oBook, sPrefix+IntToString(i));
     while (nVariable > 0)
    {
          i = i + 1;
          nVariable = GetLocalInt(oBook, sPrefix+IntToString(i));
    }

     return (i-1);
}


// Runs through an inventory and checks every item against the listed SCROLL And ITEM local variables
// Returns TRUE if it all expected items list on oBook are found in oContainer
int GetHasGolemItems(object oBook, object oContainer, object oCaster)
{
     int nNumScrolls = GetNumberOfIntVariables(sGOLEMSCROLL, oBook);
     SetLocalInt(oBook, sGOLEMSCROLLMAX, nNumScrolls);
     int nNumItems = GetNumberOfStringVariables(sGOLEMITEM, oBook);
     SetLocalInt(oBook, sGOLEMITEMMAX, nNumItems);
     if ( (nNumScrolls <= 0) & (nNumItems <= 0) )
        return TRUE; // none to count!

     int i;
     int nCnt = 0;
     int bHasItems = FALSE;
     int nBaseType;
     object oItem = GetFirstItemInInventory(oContainer);
     // Cycle through each item
     while (GetIsObjectValid(oItem))
    {// is it a scroll?
          nBaseType = GetBaseItemType(oItem);
          switch (nBaseType)
            {
               case BASE_ITEM_SPELLSCROLL:
               case BASE_ITEM_ENCHANTED_SCROLL:
               case BASE_ITEM_SCROLL:
                    GetScrollList(oItem, oBook);
                  break;
               default:
                    GetItemsList(oItem, oBook);
               break;
            }
          oItem = GetNextItemInInventory(oContainer);
    }

     bHasItems = GetAllItemsFound(oBook);

     return bHasItems;
}




// Checks if the tag of oItem equals one of the GOLEM_ITEM_* string variables
void GetItemsList(object oItem, object oBook)
{
    int nNumItems = GetLocalInt(oBook, sGOLEMITEMMAX);
    string sTag = GetTag(oItem);
    string sItem;
    int i;
    for (i=1;i<=nNumItems;i++)
    {
          sItem = GetLocalString(oBook, sGOLEMITEM+IntToString(i));
          if (sItem == sTag)
            {
               SetLocalObject(oBook, sGOLEMITEM+IntToString(i), oItem);
               i = nNumItems+1;
            }
    }
}







// Gets the number of string variables starting with Prefix are on object oBook
int GetNumberOfStringVariables(string sPrefix, object oBook)
{
     int i = 1;
     string sVariable = GetLocalString(oBook, sPrefix+IntToString(i));
     while (sVariable != "")
    {
          i = i + 1;
          sVariable = GetLocalString(oBook, sPrefix+IntToString(i));
    }

     return (i-1);
}





// Returns which GOLEM_SCROLL_* number has the nID property subtype
int GetIntInVarList(int nID, string sPrefix, object oBook)
{
    int i  = 1;
    int nPos = 0;
    int nMax = GetLocalInt(oBook, sPrefix + "MAX");
    int nScroll = GetLocalInt(oBook, sPrefix+IntToString(i));;
    while ( (nScroll > 0) & (nPos == 0) & (i <= nMax) )
    {
          if (nScroll == nID)
               nPos = i;
          else
            {
               i = i + 1;
               nScroll = GetLocalInt(oBook, sGOLEMSCROLL+IntToString(i));;
            }
    }

     return nPos;
}







// Actually just deletes temporary vars. Only destroys items if craft success.
void DestroyComponents(object oBook, int bSuccess = FALSE, object oCaster = OBJECT_SELF)
{
    int i;
    string sTemp;
    int nTemp;
    object oTemp;
     // take  the gold
     if (bSuccess)
    {
          int nGP = GetLocalInt(oBook, sGOLEM_GP);
          TakeGoldFromCreature(nGP, oCaster, TRUE);
          // take the xp
          int nXP = GetLocalInt(oBook, sGOLEM_XP);
          int nCurr = GetXP(oCaster);
          SetXP(oCaster, (nCurr - nXP));
    }
     // Clean up the added scroll variables and destroy if bSuccess
     int nNumScrolls = GetLocalInt(oBook, sGOLEMSCROLLMAX);
     for (i=1;i<=nNumScrolls;i++)
    {
          nTemp = GetLocalInt(oBook, sGOLEMSCROLL+IntToString(i));
          if (nTemp > 0)
            {
               DeleteLocalInt(oBook, IntToString(nTemp));
               oTemp = GetLocalObject(oBook, sGOLEMSCROLL+IntToString(i));
               if (bSuccess)
                    DestroyObject(oTemp);
               DeleteLocalObject(oBook, sGOLEMSCROLL+IntToString(i));
            }
    }
     DeleteLocalInt(oBook, sGOLEMSCROLLMAX);
     // delete item variables and destroy if bSuccess
     int nNumItems = GetLocalInt(oBook, sGOLEMITEMMAX);
     for (i=1;i<=nNumItems;i++)
    {
          sTemp = GetLocalString(oBook, sGOLEMITEM+IntToString(i));
          if (sTemp != "")
            {
              oTemp = GetLocalObject(oBook, sGOLEMITEM+IntToString(i));
              if (bSuccess)
                   DestroyObject(oTemp);
              DeleteLocalObject(oBook, sGOLEMITEM+IntToString(i));
            }
    }
     DeleteLocalInt(oBook, sGOLEMITEMMAX);

}






// Checks the integer list of scrolls for if any entries have oItem's Cast Spell sub property
void GetScrollList(object oItem, object oBook)
{
    itemproperty ipIP = GetFirstItemProperty(oItem);
    int bFound = FALSE;
     while ( (GetIsItemPropertyValid(ipIP)) & (!bFound) )
    {   // is it cast spell property?
          if (GetItemPropertyType(ipIP) == ITEM_PROPERTY_CAST_SPELL)
            {   // Get its subtype
              int nIPSubType = GetItemPropertySubType(ipIP);
              SendMessageToPC(GetItemActivator(), "Scroll Subtype:"+IntToString(nIPSubType));
              if (nIPSubType > 0) // is it a vaguely vaild sub type number?
                {   // check if I have already found it
                    int nSetSubType = GetLocalInt(oBook, IntToString(nIPSubType));
                    if (nSetSubType != 1)// means it is not set already so I must see if its in the wanted list
                        {
                         int nListPos = GetIntInVarList(nIPSubType, sGOLEMSCROLL,  oBook);
                         if (nListPos > 0)// its in the list
                            {
                              bFound = TRUE;
                              SetLocalInt(oBook, IntToString(nIPSubType), 1);// so I dont check again because I have got it once now
                              SetLocalObject(oBook, sGOLEMSCROLL+IntToString(nListPos), oItem); // I need to point to this so I can destroy it later
                            }
                        }
                    else
                         bFound = TRUE; //I already have this one and do not need this scroll
                }
            }
          ipIP = GetNextItemProperty(oItem);
    }
}







// Checks if oBook has all the required local variables created for each SCROLL and ITEM local variable
int GetAllItemsFound(object oBook)
{
    int bHasItems = FALSE;
    int i;
     int nCnt = 0;
     object oTemp;
     int nIPConst;
    int nScrolls = GetLocalInt(oBook, sGOLEMSCROLLMAX);
    int nItems = GetLocalInt(oBook, sGOLEMITEMMAX);
     for (i=1;i<=nScrolls;i++)
    {
          nIPConst = GetLocalInt(oBook, sGOLEMSCROLL+IntToString(i));
          if (GetLocalInt(oBook, IntToString(nIPConst)) == 1)
               nCnt = nCnt + 1;
    }

     for (i=1;i<=nItems;i++)
    {
          oTemp = GetLocalObject(oBook, sGOLEMITEM+IntToString(i));
          if (GetIsObjectValid(oTemp))
               nCnt = nCnt + 1;
    }

     if (nCnt == (nScrolls + nItems) )
          bHasItems = TRUE;

    return bHasItems;
}









void AddGolemToParty(string sResRef, object oCaster)
{
    // Try to create a unique tag
    int nHour = GetTimeHour();
    int nMin = GetTimeMinute();
    int nSec = GetTimeSecond();
    string sPrefix = IntToString(nHour) + IntToString(nMin) + IntToString(nSec);
    string sTag = sPrefix + GetTag(oCaster);
    object oGolem = CreateItemOnObject(sResRef, GetItemActivatedTarget(), FALSE, sResRef);
     // add it to the roster and party
     //int bAdded = AddRosterMemberByCharacter(sTag, oGolem);
     //int bSelect =  SetIsRosterMemberSelectable(sTag, TRUE);
     //int bPartyAdd = AddRosterMemberToParty(sTag, oCaster);

     effect eVis = EffectVisualEffect(VFX_COM_HIT_SONIC);
     ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemActivatedTarget());
     //SetLocalString(oGolem, "DeathScript", "golem_deathscript");
}
