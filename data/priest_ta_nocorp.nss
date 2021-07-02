//::///////////////////////////////////////////////
//:: Name priest_ta_nocorp
//:://////////////////////////////////////////////
/*
    Copy of mrg_ta_has_corpse by Modal,
    to check if a PC doesn't have a corpse
*/
//:://////////////////////////////////////////////
//:: Created By: Evaine
//:: Created On: 06/08/2002
//:://////////////////////////////////////////////

#include "mrg_constants"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oCorpseToken;

    oCorpseToken = GetItemPossessedBy( oPC, ALFA_OBJ_PC_CORPSE_TOKEN_TAG );

    if ( oCorpseToken == OBJECT_INVALID )
      return TRUE;

    return FALSE;
}
