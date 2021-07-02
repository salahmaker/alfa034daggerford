#include "SOS_include"

int StartingConditional()
{
    if((GetName(GetPCSpeaker()) == "Menril Swift") && (SOS_GetPersistentInt(GetPCSpeaker(), "thieves_apprentice_quest")== 0))
        return TRUE;

    return FALSE;
}
