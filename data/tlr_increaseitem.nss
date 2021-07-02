#include "alpha_dye_price"
string GetCachedACBonus(string sFile, int iRow);

void main()
{
    object oPC = GetPCSpeaker();
 object oItem = GetLocalObject(oPC, "old_item");
    int iToModify = GetLocalInt(oPC, "ToModify");
    string s2DAFile = GetLocalString(oPC, "2DAFile");
    FIND_ARMOR_TOTAL(oPC);

    //SendMessageToPC(oPC,"s2DAFile: " + s2DAFile);

    int iNewApp = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, iToModify) + 1;

    string s2DA_ACBonus = GetCachedACBonus(s2DAFile, iNewApp);
    //SendMessageToPC(oPC,"s2DA_ACBonus: " + s2DA_ACBonus);

    while (s2DA_ACBonus == "SKIP" || s2DA_ACBonus == "FAIL") {
        if (s2DA_ACBonus == "FAIL") {
            iNewApp = 1 ;
        } else {
            iNewApp++;
        }

        s2DA_ACBonus = GetCachedACBonus(s2DAFile, iNewApp);
        //SendMessageToPC(oPC,"s2DA_ACBonus: " + s2DA_ACBonus);
    }

    object oNewItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, iToModify, iNewApp, TRUE);
    SetLocalObject(oPC, "old_item",oNewItem );

    DestroyObject(oItem);
    SendMessageToPC(oPC, "New Appearance: " + IntToString(iNewApp));

    AssignCommand(oPC, ActionEquipItem(oNewItem, INVENTORY_SLOT_CHEST));
}

string GetCachedACBonus(string sFile, int iRow) {
    string sACBonus = GetLocalString(GetModule(), sFile + IntToString(iRow));

    if (sACBonus == "") {
        sACBonus = Get2DAString(sFile, "ACBONUS", iRow);

        if (sACBonus == "") {
            sACBonus = "SKIP";

            string sCost = Get2DAString(sFile, "COSTMODIFIER", iRow);
            if (sCost == "" ) sACBonus = "FAIL";
        }

        SetLocalString(GetModule(), sFile + IntToString(iRow), sACBonus);
    }

    return sACBonus;
}
