#include "SOS_include"

int StartingConditional()
{
    if(GetName(GetPCSpeaker()) == "Stan Arndt")
        return TRUE;

    return FALSE;
}
