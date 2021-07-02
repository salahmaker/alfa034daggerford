#include "sos_include"

int StartingConditional()
{
    if(SOS_GetPersistentString(OBJECT_SELF,"message3") != "")
        return TRUE;
    return FALSE;
}
