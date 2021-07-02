//::///////////////////////////////////////////////
//:: Name  PRIEST
//:://////////////////////////////////////////////
/*
    Include file for priests.
    Contains stuff you may wan to customize
*/
//:://////////////////////////////////////////////
//:: Created By: Evaine
//:: Created On:
//:://////////////////////////////////////////////

//////////////////////////////////////////////////
//Constants
//////////////////////////////////////////////////

// This string is used when the player asks for a spell he can't pay for
string NOT_ENOUGH_GOLD  = "I'm sorry, you do not possess the gold required";

// Multiplier when the church gives a discount
float DISCOUNT = 0.8f;

//////////////////////////////////////////////////
// Functions declarations
//////////////////////////////////////////////////

//:://////////////////////////////////////////////
//:: Created By: Evaine
//:: Created On: 06/08/2002
//:://////////////////////////////////////////////
//  Determines who are allies, this function could
//   be changed to match your needs. Allies get a
//   discount.
//:://////////////////////////////////////////////
int Priest_IsAlly( object oPC );

//:://////////////////////////////////////////////
//:: Created By: Evaine
//:: Created On: 06/08/2002
//:://////////////////////////////////////////////
//  Determines who are enemies of the church. The church
//   does not aid enemies. You'll want to customizes this
//   for your module.
//:://////////////////////////////////////////////
int Priest_IsEnemy( object oPC );

//:://////////////////////////////////////////////
//:: Created By: Evaine
//:: Created On: 06/08/2002
//:://////////////////////////////////////////////
//  Computes the cost of healing, as per DMG
//    iSpellLevel: level of the spell purchased
//    bGiveDiscount: give the discount specified above or not
//    oCaster: who will cast the spell, his level alse determines cost
//  Change this function to apply different prices
//:://////////////////////////////////////////////
int Priest_ComputeCost( int iSpellLevel, int bGiveDiscount, object oCaster = OBJECT_SELF );

//////////////////////////////////////////////////
// Function implementations
//////////////////////////////////////////////////

int Priest_IsAlly( object oPC )
{
    string sDeity = GetStringLowerCase(GetDeity(OBJECT_SELF));
    string sDeity2 = GetStringLowerCase(GetDeity(oPC));

    if(sDeity == sDeity2)
        return TRUE;

    if(sDeity == "akadi")
    {
        if(sDeity2 == "shaundakul")
            return TRUE;
        if(sDeity2 == "aerdrie faenya")
            return TRUE;
    }
    if(sDeity == "azuth")
    {
        if(sDeity2 == "mystra")
            return TRUE;
    }
    if(sDeity == "bane")
    {
        if(sDeity2 == "loviatar")
            return TRUE;
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "malar")
            return TRUE;
    }
    if(sDeity == "chauntea")
    {
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "silvanus")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "shiallia")
            return TRUE;
        if(sDeity2 == "lurue")
            return TRUE;
        if(sDeity2 == "mielikki")
            return TRUE;
        if(sDeity2 == "nobanion")
            return TRUE;
    }
    if(sDeity == "gond")
    {
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "waukeen")
            return TRUE;
        if(sDeity2 == "tempus")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
    }
    if(sDeity == "grumbar")
    {
        if(sDeity2 == "geb")
            return TRUE;
        if(sDeity2 == "garl glittergold")
            return TRUE;
        if(sDeity2 == "dumathoin")
            return TRUE;
        if(sDeity2 == "laduguer")
            return TRUE;
        if(sDeity2 == "urogalan")
            return TRUE;
    }
    if(sDeity == "helm")
    {
        if(sDeity2 == "torm")
            return TRUE;
        if(sDeity2 == "tyr")
            return TRUE;
        if(sDeity2 == "ilmater")
            return TRUE;
    }
    if(sDeity == "ilmater")
    {
        if(sDeity2 == "torm")
            return TRUE;
        if(sDeity2 == "tyr")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "helm")
            return TRUE;
    }
    if(sDeity == "istishia")
    {
        if(sDeity2 == "deep sashelas")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "valkur")
            return TRUE;
        if(sDeity2 == "umberlee")
            return TRUE;
    }
    if(sDeity == "kelemvor")
    {
        if(sDeity2 == "mystra")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "jergal")
            return TRUE;
    }
    if(sDeity == "lathander")
    {
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "lliira")
            return TRUE;
        if(sDeity2 == "oghma")
            return TRUE;
        if(sDeity2 == "milil")
            return TRUE;
        if(sDeity2 == "gond")
            return TRUE;
        if(sDeity2 == "kelemvor")
            return TRUE;
        if(sDeity2 == "chauntea")
            return TRUE;
        if(sDeity2 == "mielikki")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "ilmater")
            return TRUE;
        if(sDeity2 == "torm")
            return TRUE;
    }
    if(sDeity == "lliira")
    {
        if(sDeity2 == "milil")
            return TRUE;
        if(sDeity2 == "waukeen")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "sharess")
            return TRUE;
    }
    if(sDeity == "loviatar")
    {
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "lolth")
            return TRUE;
    }
    if(sDeity == "malar")
    {
        if(sDeity2 == "lolth")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "umberlee")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "loviatar")
            return TRUE;
    }
    if(sDeity == "mielikki")
    {
        if(sDeity2 == "silvanus")
            return TRUE;
        if(sDeity2 == "gwaeron windstrom")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "shiallia")
            return TRUE;
        if(sDeity2 == "lurue")
            return TRUE;
        if(sDeity2 == "shaundakul")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "chauntea")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "nobanion")
            return TRUE;
    }
    if(sDeity == "milil")
    {
        if(sDeity2 == "lliira")
            return TRUE;
        if(sDeity2 == "deneir")
            return TRUE;
        if(sDeity2 == "oghma")
            return TRUE;
        if(sDeity2 == "mystra")
            return TRUE;
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "sharess")
            return TRUE;
    }
    if(sDeity == "mystra")
    {
        if(sDeity2 == "azuth")
            return TRUE;
        if(sDeity2 == "kelemvor")
            return TRUE;
        if(sDeity2 == "oghma")
            return TRUE;
        if(sDeity2 == "deneir")
            return TRUE;
        if(sDeity2 == "milil")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "corellon larethian")
            return TRUE;
        if(sDeity2 == "isis")
            return TRUE;
        if(sDeity2 == "thoth")
            return TRUE;
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "torm")
            return TRUE;
        if(sDeity2 == "eilistraee")
            return TRUE;
    }
    if(sDeity == "oghma")
    {
        if(sDeity2 == "deneir")
            return TRUE;
        if(sDeity2 == "milil")
            return TRUE;
        if(sDeity2 == "gond")
            return TRUE;
        if(sDeity2 == "mystra")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "torm")
            return TRUE;
    }
    if(sDeity == "selune")
    {
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "mystra")
            return TRUE;
        if(sDeity2 == "lliira")
            return TRUE;
        if(sDeity2 == "eilistraee")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "shaundakul")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "finder")
            return TRUE;
        if(sDeity2 == "finder wyvernspur")
            return TRUE;
        if(sDeity2 == "lurue")
            return TRUE;
        if(sDeity2 == "sharess")
            return TRUE;
    }
    if(sDeity == "shar")
    {
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "ibrandul")
            return TRUE;
        if(sDeity2 == "loviatar")
            return TRUE;
    }
    if(sDeity == "shaundakul")
    {
        if(sDeity2 == "akadi")
            return TRUE;
        if(sDeity2 == "mielikki")
            return TRUE;
        if(sDeity2 == "tymora")
            return TRUE;
        if(sDeity2 == "gwaeron windstrom")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "waukeen")
            return TRUE;
    }
    if(sDeity == "silvanus")
    {
        if(sDeity2 == "mielikki")
            return TRUE;
        if(sDeity2 == "chauntea")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "gwaeron windstrom")
            return TRUE;
        if(sDeity2 == "lurue")
            return TRUE;
        if(sDeity2 == "shiallia")
            return TRUE;
        if(sDeity2 == "nobanion")
            return TRUE;
    }
    if(sDeity == "sune")
    {
        if(sDeity2 == "milil")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "lliira")
            return TRUE;
        if(sDeity2 == "sharess")
            return TRUE;
        if(sDeity2 == "hanali celanil")
            return TRUE;
        if(sDeity2 == "mystra")
            return TRUE;
    }
    if(sDeity == "talos")
    {
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "umberlee")
            return TRUE;
        if(sDeity2 == "auril")
            return TRUE;
    }
    if(sDeity == "tempus")
    {
        if(sDeity2 == "red knight")
            return TRUE;
        if(sDeity2 == "nobanion")
            return TRUE;
        if(sDeity2 == "gond")
            return TRUE;
        if(sDeity2 == "valkur")
            return TRUE;
        if(sDeity2 == "uthgar")
            return TRUE;
    }
    if(sDeity == "torm")
    {
        if(sDeity2 == "tyr")
            return TRUE;
        if(sDeity2 == "ilmater")
            return TRUE;
        if(sDeity2 == "helm")
            return TRUE;
        if(sDeity2 == "red knight")
            return TRUE;
        if(sDeity2 == "the red knight")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "oghma")
            return TRUE;
        if(sDeity2 == "mystra")
            return TRUE;
        if(sDeity2 == "nobanion")
            return TRUE;
    }
    if(sDeity == "tymora")
    {
        if(sDeity2 == "brandobaris")
            return TRUE;
        if(sDeity2 == "shaundakul")
            return TRUE;
        if(sDeity2 == "finder")
            return TRUE;
        if(sDeity2 == "finder wyvernspur")
            return TRUE;
    }
    if(sDeity == "tyr")
    {
        if(sDeity2 == "ilmater")
            return TRUE;
        if(sDeity2 == "torm")
            return TRUE;
        if(sDeity2 == "nobanion")
            return TRUE;
        if(sDeity2 == "helm")
            return TRUE;
    }
    if(sDeity == "umberlee")
    {
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "auril")
            return TRUE;
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "istishia")
            return TRUE;
    }
    if(sDeity == "waukeen")
    {
        if(sDeity2 == "lliira")
            return TRUE;
        if(sDeity2 == "gond")
            return TRUE;
        if(sDeity2 == "shaundakul")
            return TRUE;
    }

    return FALSE;

}

int Priest_IsEnemy( object oPC )
{
    string sDeity = GetStringLowerCase(GetDeity(OBJECT_SELF));
    string sDeity2 = GetStringLowerCase(GetDeity(oPC));

    if(sDeity == "akadi")
    {
        if(sDeity2 == "grumbar")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "azuth")
    {
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "bane")
    {
        if(!Priest_IsAlly( oPC ))
            return TRUE;
    }
    if(sDeity == "chauntea")
    {
        if(sDeity2 == "auril")
            return TRUE;
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "umberlee")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
    }
    if(sDeity == "cyric")
    {
        if(sDeity2 != "cyric")
            return TRUE;
    }
    if(sDeity == "gond")
    {
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
    }
    if(sDeity == "grumbar")
    {
        if(sDeity2 == "akadi")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "helm")
    {
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "garagos")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "uthgar")
            return TRUE;
    }
    if(sDeity == "ilmater")
    {
        if(sDeity2 == "loviatar")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "garagos")
            return TRUE;
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "uthgar")
            return TRUE;
        if(sDeity2 == "tiamat")
            return TRUE;
    }
    if(sDeity == "istishia")
    {
        if(sDeity2 == "kossuth")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "kelemvor")
    {
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "velsharoon")
            return TRUE;
    }
    if(sDeity == "kossuth")
    {
        if(sDeity2 == "istishia")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "lathander")
    {
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "loviatar")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "lliira")
    {
        if(sDeity2 == "loviatar")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
    }
    if(sDeity == "loviatar")
    {
        if(sDeity2 == "lliira")
            return TRUE;
        if(sDeity2 == "ilmater")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "sharess")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "gargauth")
            return TRUE;
    }
    if(sDeity == "malar")
    {
        if(sDeity2 == "chauntea")
            return TRUE;
        if(sDeity2 == "ilmater")
            return TRUE;
        if(sDeity2 == "mielikki")
            return TRUE;
        if(sDeity2 == "silvanus")
            return TRUE;
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "uthgar")
            return TRUE;
        if(sDeity2 == "auril")
            return TRUE;
        if(sDeity2 == "deneir")
            return TRUE;
        if(sDeity2 == "gwaeron windstrom")
            return TRUE;
        if(sDeity2 == "nobanion")
            return TRUE;
        if(sDeity2 == "lurue")
            return TRUE;
        if(sDeity2 == "shiallia")
            return TRUE;
        if(sDeity2 == "valkur")
            return TRUE;
    }
    if(sDeity == "mask")
    {
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "waukeen")
            return TRUE;
        if(sDeity2 == "helm")
            return TRUE;
        if(sDeity2 == "deneir")
            return TRUE;
        if(sDeity2 == "oghma")
            return TRUE;
        if(sDeity2 == "torm")
            return TRUE;
        if(sDeity2 == "tyr")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
    }
    if(sDeity == "mielikki")
    {
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
    }
    if(sDeity == "milil")
    {
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "mystra")
    {
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity == "talos")
            return TRUE;
    }
    if(sDeity == "oghma")
    {
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
    }
    if(sDeity == "selune")
    {
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "umberlee")
            return TRUE;
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
    }
    if(sDeity == "shar")
    {
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "hoar")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "deneir")
            return TRUE;
        if(sDeity2 == "savras")
            return TRUE;
        if(sDeity2 == "sharess")
            return TRUE;
        if(sDeity2 == "gargauth")
            return TRUE;
    }
    if(sDeity == "shaundakul")
    {
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "beshaba")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
    }
    if(sDeity == "silvanus")
    {
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
    }
    if(sDeity == "sune")
    {
        if(sDeity2 == "auril")
            return TRUE;
        if(sDeity2 == "malar")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "umberlee")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "tempus")
            return TRUE;
        if(sDeity2 == "shar")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
    }
    if(sDeity == "talos")
    {
        if(sDeity2 == "chauntea")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "ilmater")
            return TRUE;
        if(sDeity2 == "lathander")
            return TRUE;
        if(sDeity2 == "mystra")
            return TRUE;
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "deneir")
            return TRUE;
        if(sDeity2 == "gond")
            return TRUE;
        if(sDeity2 == "helm")
            return TRUE;
        if(sDeity2 == "mielikki")
            return TRUE;
        if(sDeity2 == "oghma")
            return TRUE;
        if(sDeity2 == "shiallia")
            return TRUE;
        if(sDeity2 == "silvanus")
            return TRUE;
        if(sDeity2 == "tyr")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "valkur")
            return TRUE;
    }
    if(sDeity == "tempus")
    {
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "garagos")
            return TRUE;
        if(sDeity2 == "eldath")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
    }
    if(sDeity == "torm")
    {
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "uthgar")
            return TRUE;
    }
    if(sDeity == "tymora")
    {
        if(sDeity2 == "beshaba")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
    }
    if(sDeity == "tyr")
    {
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "talona")
            return TRUE;
        if(sDeity2 == "talos")
            return TRUE;
        if(sDeity2 == "uthgar")
            return TRUE;
    }
    if(sDeity == "umberlee")
    {
        if(sDeity2 == "valkur")
            return TRUE;
        if(sDeity2 == "chauntea")
            return TRUE;
        if(sDeity2 == "sune")
            return TRUE;
        if(sDeity2 == "selune")
            return TRUE;
        if(sDeity2 == "selûne")
            return TRUE;
        if(sDeity2 == "cyric")
            return TRUE;
        if(sDeity2 == "bane")
            return TRUE;
        if(sDeity2 == "deneir")
            return TRUE;
    }
    if(sDeity == "waukeen")
    {
        if(sDeity2 == "mask")
            return TRUE;
        if(sDeity2 == "graz'zt")
            return TRUE;
        if(sDeity2 == "grazzt")
            return TRUE;
    }

    return FALSE;

}

int Priest_ComputeCost( int iSpellLevel, int bGiveDiscount, object oCaster = OBJECT_SELF )
{
    int iLevel = GetLevelByClass( CLASS_TYPE_CLERIC, oCaster );
    int iCost = (iSpellLevel*10)* iLevel;
    if ( bGiveDiscount )
    {
        iCost = FloatToInt( iCost * DISCOUNT );
    }
    return iCost;
}
