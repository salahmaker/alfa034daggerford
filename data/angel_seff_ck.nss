#include "SOS_include"

int StartingConditional()
{
    if((GetName(GetPCSpeaker()) == "Seff of Kriegsmount") && (SOS_GetPersistentInt(GetPCSpeaker(), "Guild_Keys")== 0))
        return TRUE;

    return FALSE;
}
