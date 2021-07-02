#include "NW_I0_GENERIC"
#include "sos_include"
#include "subraces"

int StartingConditional()
{
    int iHits = SOS_GetPersistentInt(GetPCSpeaker(),"rick_dummyhits");
    if ((iHits >= 20) && (iHits < 25)) return TRUE;

    return FALSE;
}
