//::///////////////////////////////////////////////
//:: x0_inc_skills
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This header file is for all the designer
    driven skills.
    KNOWN ISSUE: always takes an entire stack
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int mySKILL_CRAFT_TRAP = 22;

// * custom tokens
int SKILL_TRAP_DCMINOR = 2001;
int SKILL_TRAP_DCAVERAGE = 2002;
int SKILL_TRAP_DCSTRONG = 2003;
int SKILL_TRAP_DCDEADLY = 2004;

// * CONSTANTS

string SKILL_CTRAP_FIRECOMPONENT = "potionoffirebrea";       // potion of firebreath
string SKILL_CTRAP_ELECTRICALCOMPONENT = "scaladarstinger"; // scaladar stinger
string SKILL_CTRAP_TANGLECOMPONENT = "004Spinarette";     // spidersilk gland
string SKILL_CTRAP_SPIKECOMPONENT = "garbage";              // garbage
string SKILL_CTRAP_HOLYCOMPONENT = "NW_IT_MPOTION001";       // CLW potion
string SKILL_CTRAP_GASCOMPONENT = "sewernpoison";        // sewerm poison
string SKILL_CTRAP_FROSTCOMPONENT = "X1_IT_MSMLMISC01";     // coldstone
string SKILL_CTRAP_NEGATIVECOMPONENT = "blackenedheart";  // blackenedheart
string SKILL_CTRAP_SONICCOMPONENT = "X1_WMGRENADE007";      // thunderstone
string SKILL_CTRAP_ACIDCOMPONENT = "potacidbreath";       // acid flask


// just defines for the trap types; also the number of
// components required for each trap type

// * modified February 17 2003 to make more expensive

int SKILL_TRAP_MINOR = 2;
int SKILL_TRAP_AVERAGE = 3;
int SKILL_TRAP_STRONG = 5;
int SKILL_TRAP_DEADLY = 8;

// * DC's of all the different trap types to make the
// * trap kit.
int SKILLDC_TRAP_BASE_TYPE_MINOR_SPIKE          = 5;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_SPIKE        = 20;
int SKILLDC_TRAP_BASE_TYPE_STRONG_SPIKE         = 25;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_SPIKE         = 35;
int SKILLDC_TRAP_BASE_TYPE_MINOR_HOLY           = 15;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_HOLY         = 20;
int SKILLDC_TRAP_BASE_TYPE_STRONG_HOLY          = 25;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_HOLY          = 30;
int SKILLDC_TRAP_BASE_TYPE_MINOR_TANGLE         = 15;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_TANGLE       = 20;
int SKILLDC_TRAP_BASE_TYPE_STRONG_TANGLE        = 25;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_TANGLE        = 30;
int SKILLDC_TRAP_BASE_TYPE_MINOR_ACID           = 15;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_ACID         = 25;
int SKILLDC_TRAP_BASE_TYPE_STRONG_ACID          = 30;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_ACID          = 35;
int SKILLDC_TRAP_BASE_TYPE_MINOR_FIRE           = 25;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_FIRE         = 30;
int SKILLDC_TRAP_BASE_TYPE_STRONG_FIRE          = 35;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_FIRE          = 40;
int SKILLDC_TRAP_BASE_TYPE_MINOR_ELECTRICAL     = 25;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_ELECTRICAL   = 30;
int SKILLDC_TRAP_BASE_TYPE_STRONG_ELECTRICAL    = 35;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_ELECTRICAL    = 40;
int SKILLDC_TRAP_BASE_TYPE_MINOR_GAS            = 20;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_GAS          = 25;
int SKILLDC_TRAP_BASE_TYPE_STRONG_GAS           = 30;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_GAS           = 35;
int SKILLDC_TRAP_BASE_TYPE_MINOR_FROST          = 15;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_FROST        = 20;
int SKILLDC_TRAP_BASE_TYPE_STRONG_FROST         = 25;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_FROST         = 30;
int SKILLDC_TRAP_BASE_TYPE_MINOR_NEGATIVE       = 15;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_NEGATIVE     = 20;
int SKILLDC_TRAP_BASE_TYPE_STRONG_NEGATIVE      = 25;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_NEGATIVE      = 30;
int SKILLDC_TRAP_BASE_TYPE_MINOR_SONIC          = 15;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_SONIC        = 20;
int SKILLDC_TRAP_BASE_TYPE_STRONG_SONIC         = 25;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_SONIC         = 30;
int SKILLDC_TRAP_BASE_TYPE_MINOR_ACID_SPLASH    = 15;
int SKILLDC_TRAP_BASE_TYPE_AVERAGE_ACID_SPLASH  = 20;
int SKILLDC_TRAP_BASE_TYPE_STRONG_ACID_SPLASH   = 25;
int SKILLDC_TRAP_BASE_TYPE_DEADLY_ACID_SPLASH   = 30;


// * FUNCTIONS

int skillCTRAPGetHasComponent(string sComponent, object oPC, int nTrapDifficulty);
void skillCTRAPTakeComponent(string sComponent, object oPC, int nTrapDifficulty);

int skillCTRAPSetCurrentTrapView(string sComponent);
int skillCTRAPGetCurrentTrapViewEquals(string sComponent);

string skillCTRAPGetCurrentTrapView();

// * destroys the indicated number of items
void DestroyNumItems(object oTarget,string sItem,int nNumItems);


void skillCTRAPCreateTrapKit(string sComponent, object oPC, int nTrapDifficulty);

//::///////////////////////////////////////////////
//:: skillGetHasComponent
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the oPC has enough components for
    this type of trap
    sComponents
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On:
//:://////////////////////////////////////////////

int skillCTRAPGetHasComponent(string sComponent, object oPC, int nTrapDifficulty)
{
    object oItem = GetFirstItemInInventory(oPC);
    int nFound = 0;
    while (GetIsObjectValid(oItem) == TRUE)
    {
        if (GetTag(oItem) == sComponent)
        {
            //nFound++;
            //SpeakString("here");
            nFound = nFound + GetNumStackedItems(oItem);
        }
        oItem = GetNextItemInInventory(oPC);
    }

    // * if we have found more than or equal to the number of components
    // * required to build this trap
    if (nFound >= nTrapDifficulty)
    {
        return TRUE;
    }
    return FALSE;
}

void skillCTRAPTakeComponent(string sComponent, object oPC, int nTrapDifficulty)
{
    DestroyNumItems(oPC, sComponent, nTrapDifficulty);
}

//::///////////////////////////////////////////////
//:: skillCTRAPCreateTrapKit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creatures a trap kit and removes the
    appropriate number of reagents.

    Must perform the skill roll and if fail by 5
    or more destroy the reagent

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void ClearTrapMaking()
{

    // * make creature stand up
    ClearAllActions();
}
void skillCTRAPCreateTrapKit(string sComponent, object oPC, int nTrapDifficulty)
{
    string sTrapKit = "";
    int nDifficulty = 20;
    int nDamage = 0;
    int nDamageType = DAMAGE_TYPE_FIRE;
    effect eDamage;
    int nXP = 0;

    if (sComponent == SKILL_CTRAP_FIRECOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_FIRE;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_FIRE;
         sTrapKit = "NW_IT_TRAP017";
         nDamage = d6(5);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_FIRE;
         sTrapKit = "NW_IT_TRAP018";
         nDamage = d6(8);
         nXP = 2;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_FIRE;
         sTrapKit = "NW_IT_TRAP019";
         nDamage = d6(15);
         nXP = 5;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_FIRE;
         sTrapKit = "NW_IT_TRAP020";
         nDamage = d6(25);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_ELECTRICALCOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_ELECTRICAL;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_ELECTRICAL;
         sTrapKit = "NW_IT_TRAP021";
         nDamage = d6(8);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_ELECTRICAL;
         sTrapKit = "NW_IT_TRAP022";
         nDamage = d6(15);
         nXP = 2;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_ELECTRICAL;
         sTrapKit = "NW_IT_TRAP023";
         nDamage = d6(20);
         nXP = 5;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_ELECTRICAL;
         sTrapKit = "NW_IT_TRAP024";
         nDamage = d6(30);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_TANGLECOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_PIERCING;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_TANGLE;
         sTrapKit = "NW_IT_TRAP009";
         nDamage = d6(1);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_TANGLE;
         sTrapKit = "NW_IT_TRAP010";
         nDamage = d6(2);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_TANGLE;
         sTrapKit = "NW_IT_TRAP011";
         nDamage = d6(5);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_TANGLE;
         sTrapKit = "NW_IT_TRAP012";
         nDamage = d6(8);
         nXP = 0;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_SPIKECOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_PIERCING;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_SPIKE;
         sTrapKit = "NW_IT_TRAP001";
         nDamage = d6(2);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_SPIKE;
         sTrapKit = "NW_IT_TRAP002";
         nDamage = d6(3);
         nXP = 1;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_SPIKE;
         sTrapKit = "NW_IT_TRAP003";
         nDamage = d6(5);
         nXP = 3;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_SPIKE;
         sTrapKit = "NW_IT_TRAP004";
         nDamage = d6(25);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_HOLYCOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_DIVINE;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_HOLY;
         sTrapKit = "NW_IT_TRAP005";
         nDamage = d4(2);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_HOLY;
         sTrapKit = "NW_IT_TRAP006";
         nDamage = d4(3);
         nXP = 1;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_HOLY;
         sTrapKit = "NW_IT_TRAP007";
         nDamage = d4(6);
         nXP = 3;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_HOLY;
         sTrapKit = "NW_IT_TRAP008";
         nDamage = d4(8);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_GASCOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_ACID;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_GAS;
         sTrapKit = "NW_IT_TRAP025";
         nDamage = d4(2);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_GAS;
         sTrapKit = "NW_IT_TRAP026";
         nDamage = d4(3);
         nXP = 1;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_GAS;
         sTrapKit = "NW_IT_TRAP027";
         nDamage = d4(5);
         nXP = 3;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_GAS;
         sTrapKit = "NW_IT_TRAP028";
         nDamage = d4(8);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_FROSTCOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_COLD;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_FROST;
         sTrapKit = "NW_IT_TRAP029";
         nDamage = d4(2);
          nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_FROST;
         sTrapKit = "NW_IT_TRAP030";
         nDamage = d4(3);
         nXP = 1;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_FROST;
         sTrapKit = "NW_IT_TRAP031";
         nDamage = d4(5);
         nXP = 3;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_FROST;
         sTrapKit = "NW_IT_TRAP032";
         nDamage = d4(8);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_NEGATIVECOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_NEGATIVE;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_NEGATIVE;
         sTrapKit = "NW_IT_TRAP041";
         nDamage = d6(2);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_NEGATIVE;
         sTrapKit = "NW_IT_TRAP042";
         nDamage = d6(3);
         nXP = 1;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_NEGATIVE;
         sTrapKit = "NW_IT_TRAP043";
         nDamage = d6(5);
         nXP = 3;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_NEGATIVE;
         sTrapKit = "NW_IT_TRAP044";
         nDamage = d6(8);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_SONICCOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_SONIC;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_SONIC;
         sTrapKit = "NW_IT_TRAP037";
         nDamage = d4(2);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_SONIC;
         sTrapKit = "NW_IT_TRAP038";
         nDamage = d4(3);
         nXP = 1;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_SONIC;
         sTrapKit = "NW_IT_TRAP039";
         nDamage = d4(5);
         nXP = 3;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_SONIC;
         sTrapKit = "NW_IT_TRAP040";
         nDamage = d4(8);
         nXP = 10;
        }
    }
    else
    if (sComponent == SKILL_CTRAP_ACIDCOMPONENT)
    {
        nDamageType = DAMAGE_TYPE_ACID;
        if (nTrapDifficulty ==  SKILL_TRAP_MINOR)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_MINOR_ACID;
         sTrapKit = "NW_IT_TRAP033";
         nDamage = d8(2);
         nXP = 0;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_AVERAGE)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_AVERAGE_ACID;
         sTrapKit = "NW_IT_TRAP034";
         nDamage = d8(3);
         nXP = 2;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_STRONG)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_STRONG_ACID;
         sTrapKit = "NW_IT_TRAP035";
         nDamage = d8(5);
         nXP = 5;
        }
        else
        if (nTrapDifficulty ==  SKILL_TRAP_DEADLY)
        {
         nDifficulty = SKILLDC_TRAP_BASE_TYPE_DEADLY_ACID;
         sTrapKit = "NW_IT_TRAP036";
         nDamage = d8(8);
         nXP = 10;
        }
    }

    // * do skill roll
//    SpeakString("UT: MY ROLL: "+ IntToString(GetSkillRank(mySKILL_CRAFT_TRAP)));

    if(d20(2) == 2){
       SendMessageToPC(oPC, "Critical failure!");
       if(ReflexSave(oPC, nDifficulty, SAVING_THROW_TYPE_TRAP)){
           eDamage = EffectDamage(nDamage/2, nDamageType);
           ApplyEffectToObject( DURATION_TYPE_INSTANT,eDamage, oPC);

         }
         else{
           eDamage = EffectDamage(nDamage, nDamageType);
           ApplyEffectToObject( DURATION_TYPE_INSTANT,eDamage, oPC);


         }
         // "UT: Craft Trap Skill Failed. Components lost."
         FloatingTextStrRefOnCreature(2702, oPC);




    }
    else{
      if (GetIsSkillSuccessful(oPC, 22, nDifficulty) == TRUE)
      {
        // * "UT: Craft Trap Skill Success."
        FloatingTextStrRefOnCreature(2700, oPC);
        CreateItemOnObject(sTrapKit, oPC, 1);
        GiveXPToCreature(oPC, nXP);
      }
      else
      // * trap failed
      {
         // * Always lose components

         if(ReflexSave(oPC, nDifficulty, SAVING_THROW_TYPE_TRAP)){
           eDamage = EffectDamage(nDamage/2, nDamageType);
           ApplyEffectToObject( DURATION_TYPE_INSTANT,eDamage, oPC);

         }
         else{
           eDamage = EffectDamage(nDamage, nDamageType);
           ApplyEffectToObject( DURATION_TYPE_INSTANT,eDamage, oPC);


         }
         // "UT: Craft Trap Skill Failed. Components lost."
         FloatingTextStrRefOnCreature(2702, oPC);
      }
    }
    ClearTrapMaking();
    // * removed components if succeeded or failed badly
    skillCTRAPTakeComponent(sComponent, oPC, nTrapDifficulty);

}


//::///////////////////////////////////////////////
//:: skillCTRAPSetCurrentTrapView
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This function is called right before the
    node in dialog where the Trap types and DC's are
    shown.
    Its set the trap custom tokens to appropriate values
    based on the DC constants defined above.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void skillCTRAPSetCurrentTrapView(string sComponent)
{
    SetLocalString(GetPCSpeaker(), "NW_L_TRAPVIEW", sComponent);
    if (sComponent == SKILL_CTRAP_FIRECOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_FIRE;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_FIRE;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_FIRE;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_FIRE;

    }
    else
    if (sComponent == SKILL_CTRAP_ELECTRICALCOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_ELECTRICAL;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_ELECTRICAL;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_ELECTRICAL;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_ELECTRICAL;

    }
    else
    if (sComponent == SKILL_CTRAP_SPIKECOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_SPIKE;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_SPIKE;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_SPIKE;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_SPIKE;

    }
    else
    if (sComponent == SKILL_CTRAP_HOLYCOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_HOLY;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_HOLY;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_HOLY;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_HOLY;

    }
    else
    if (sComponent == SKILL_CTRAP_TANGLECOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_TANGLE;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_TANGLE;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_TANGLE;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_TANGLE;

    }
    else
    if (sComponent == SKILL_CTRAP_GASCOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_GAS;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_GAS;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_GAS;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_GAS;

    }
    else
    if (sComponent == SKILL_CTRAP_FROSTCOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_FROST;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_FROST;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_FROST;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_FROST;

    }
    else
    if (sComponent == SKILL_CTRAP_NEGATIVECOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_NEGATIVE;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_NEGATIVE;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_NEGATIVE;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_NEGATIVE;

    }
    else
    if (sComponent == SKILL_CTRAP_SONICCOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_SONIC;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_SONIC;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_SONIC;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_SONIC;

    }
    else
    if (sComponent == SKILL_CTRAP_ACIDCOMPONENT)
    {
        SKILL_TRAP_DCMINOR = SKILLDC_TRAP_BASE_TYPE_MINOR_ACID;
        SKILL_TRAP_DCAVERAGE = SKILLDC_TRAP_BASE_TYPE_AVERAGE_ACID;
        SKILL_TRAP_DCSTRONG = SKILLDC_TRAP_BASE_TYPE_STRONG_ACID;
        SKILL_TRAP_DCDEADLY = SKILLDC_TRAP_BASE_TYPE_DEADLY_ACID;

    }


    SetCustomToken(2001, IntToString(SKILL_TRAP_DCMINOR));
    SetCustomToken(2002, IntToString(SKILL_TRAP_DCAVERAGE));
    SetCustomToken(2003, IntToString(SKILL_TRAP_DCSTRONG));
    SetCustomToken(2004, IntToString(SKILL_TRAP_DCDEADLY));
}

// returns true if sComponent is equal to the current trap view
int skillCTRAPGetCurrentTrapViewEquals(string sComponent)
{
    if (GetLocalString(GetPCSpeaker(), "NW_L_TRAPVIEW") == sComponent)
    {
        return TRUE;
    }
    return FALSE;
}
// * returns the string of the current trap view
string skillCTRAPGetCurrentTrapView()
{
    return GetLocalString(GetPCSpeaker(), "NW_L_TRAPVIEW");
}

// * destroys the indicated number of items
void DestroyNumItems(object oTarget,string sItem,int nNumItems)
{
    int nCount = 0;
    object oItem = GetFirstItemInInventory(oTarget);

//    SpawnScriptDebugger();

    while (GetIsObjectValid(oItem) == TRUE /*&& nCount < nNumItems*/)
    {
        if (GetTag(oItem) == sItem)
        {
            int nStackSize = GetItemStackSize(oItem);
            // * had more items than needed
            if (nStackSize > nNumItems)
            {
                SetItemStackSize(oItem, nStackSize - nNumItems);
                return; // exit quickly
            }
            else
            if (nStackSize == nNumItems)
            {
                DestroyObject(oItem, 0.1);
                return;
            }
            else
            // * this item did not have enough
            // * stack size. Search for another
            if (nStackSize < nNumItems)
            {            //SpawnScriptDebugger();
                DestroyObject(oItem, 0.1);
                nNumItems = nNumItems - nStackSize;
            }

            nCount++;
        }
        oItem = GetNextItemInInventory(oTarget);
    }

   return;
}
