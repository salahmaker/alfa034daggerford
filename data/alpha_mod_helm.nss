#include "alpha_dye_price"
void main()
{
    object oPC = GetPCSpeaker();

   object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
SetLocalObject(oPC, "old_item", oHelmet);

FIND_HELM_TOTAL(oPC, oHelmet);
}

