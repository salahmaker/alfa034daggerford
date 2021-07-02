
#include "SOS_include"

void main()
{
   object oPC = GetExitingObject();
   object oDoor = GetNearestObjectByTag("KryptgardenInsideDoor", oPC);
   SOS_SetPersistentInt(oPC, "KryptgardeBooks", 0);
   SetLocked(oDoor, FALSE);

}
