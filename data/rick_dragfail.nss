#include "NW_I0_GENERIC"
#include "sos_include"
#include "subraces"

int StartingConditional()
{
    int iHits = SOS_GetPersistentInt(GetPCSpeaker(),"rick_dragonhits");
    if (iHits < 10) return TRUE;

    return FALSE;
}
