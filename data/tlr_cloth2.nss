#include "tlr_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    int iMaterialToDye = ITEM_APPR_ARMOR_COLOR_CLOTH2;

    SetLocalInt(oPC, "MaterialToDye", iMaterialToDye);
    SetLocalInt(oPC, "eq_slot", INVENTORY_SLOT_CHEST);
    int iColor = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, iMaterialToDye);

    SendMessageToPC(oPC, "Current Color: " + ClothColor(iColor));
}
