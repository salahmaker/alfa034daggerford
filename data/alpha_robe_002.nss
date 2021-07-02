#include "alpha_dye_price"
void main()
{
object oNew;
int nMode, nSlot;
object oNPC = OBJECT_SELF;
object oPC = GetPCSpeaker();
SetLocalObject(oPC, "PC_target", oNPC);
object oItem = GetLocalObject(oPC, "old_item");
int iBase  =  GetBaseItemType(oItem);
int nCurrApp = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_ROBE);



       oNew = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_ROBE, 4, TRUE);
       nSlot = INVENTORY_SLOT_CHEST;
       DestroyObject(oItem);
       oItem = oNew;
       SetLocalObject(oPC, "old_item",oNew );
       FIND_ARMOR_TOTAL(oPC);
       AssignCommand(oPC, ClearAllActions(TRUE));
       AssignCommand(oPC, ActionEquipItem(oItem, nSlot));
     float fArmorModCost = (GetGoldPieceValue(oNew) * 0.05);
    SetLocalInt(oPC, "robe_cost", FloatToInt(fArmorModCost));
    }

