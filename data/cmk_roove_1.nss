#include "sos_include"

int StartingConditional()
{
    if(SOS_GetPersistentString(OBJECT_SELF,"message1") != "")
        return TRUE;
    return FALSE;
}
