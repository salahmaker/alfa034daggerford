#include "alpha_dye_price"
void main()
{
    object oPC = GetPCSpeaker();
object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
SetLocalObject(oPC, "old_item", oArmor);

FIND_ARMOR_PRICE(oPC, oArmor);


}
