#include "alpha_dye_price"
string GetCachedACBonus(string sFile, int iRow);

// Get the Cached Upper limit for a 2DA file.  If not cached, determine the Limit and cache it.
int GetCachedLimit(string sFile);

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);

    int iToModify = GetLocalInt(oPC, "ToModify");
    string s2DAFile = GetLocalString(oPC, "2DAFile");
    FIND_ARMOR_TOTAL(oPC);

    //SendMessageToPC(oPC,"s2DAFile: " + s2DAFile);

    int iNewApp = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, iToModify) - 1;

    string s2DA_ACBonus = GetCachedACBonus(s2DAFile, iNewApp);
    //SendMessageToPC(oPC,"s2DA_ACBonus: " + s2DA_ACBonus);

    while (s2DA_ACBonus == "SKIP" || s2DA_ACBonus == "FAIL") {
        if (s2DA_ACBonus == "FAIL") {
            iNewApp = GetCachedLimit(s2DAFile);
        } else {
            iNewApp--;
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

int GetCachedLimit(string sFile) {
    int iLimit = GetLocalInt(GetModule(), sFile + "Limit");

    if (iLimit == 0) {
        int iCount = 0;

        while (Get2DAString(sFile, "COSTMODIFIER", iCount + 1) != "") {
            iCount++;
        }

        SetLocalInt(GetModule(), sFile + "Limit", iCount);
        iLimit = iCount;
    }

    return iLimit;
}
