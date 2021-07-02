#include "sos_include"

int StartingConditional()
{
    if(SOS_GetPersistentString(OBJECT_SELF,"message7") != "")
        return TRUE;
    return FALSE;
}
