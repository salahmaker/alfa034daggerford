
#include "mrg_include"

int StartingConditional()
{
    object oCorpseToken = ALFA_MORGUE_GetPCHasCorpse( GetPCSpeaker() );
    string sCorpseID = GetLocalString( oCorpseToken, ALFA_PC_CORPSE_ID );
    return ALFA_MORGUE_GetCorpseDecayed( sCorpseID );
}
