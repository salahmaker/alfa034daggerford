#include "sos_include"

int StartingConditional()
{
    if(SOS_GetPersistentString(OBJECT_SELF,"message6") != "")
        return TRUE;
    return FALSE;
}
