#include "nw_i0_plot"

void main()
{
    object oPC = GetLastUsedBy();

    if (HasItem(oPC, "alfa_pcskin"))
    {
        SendMessageToPC(oPC, "You have the Animation skin already.");
    }
    else
    {
        SendMessageToPC(oPC, "You have been given the Animation skin.");
        object oItem = CreateItemOnObject("alfa_pcskin", oPC, 1);
        AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_CARMOUR));
    }
}
