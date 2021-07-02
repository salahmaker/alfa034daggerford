#include "sos_include"

void main()
{
  SOS_SetPersistentInt(GetPCSpeaker(), "Dlg_Init_" + GetTag(OBJECT_SELF), TRUE);
}

