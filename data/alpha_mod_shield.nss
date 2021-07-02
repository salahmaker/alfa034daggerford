#include "alpha_dye_price"
void main()
{
    object oPC = GetPCSpeaker();
object oShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
SetLocalObject(oPC, "old_item", oShield);
object oBackup = GetLocalObject(oPC, "alpha_backup");


int nBackApp = GetItemAppearance(oBackup, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);
int nCurrApp = GetItemAppearance(oShield, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);

FIND_SHIELD_TOTAL(oPC, oShield,nBackApp, nCurrApp );
}
