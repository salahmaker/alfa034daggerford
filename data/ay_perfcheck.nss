#include "sos_include"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if(GetPCPlayerName == "ayergovich") return TRUE;

    int iRep = SOS_GetPersistentInt(oPC,"cmk_performrep");
    int iBarDC = GetLocalInt(OBJECT_SELF,"iBarDC");
    SetLocalInt(oPC, "iBarDC", iBarDC);

    if(iRep >= 100*iBarDC*iBarDC) return TRUE;

    else return FALSE ;

}
