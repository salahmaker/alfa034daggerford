#include "x2_inc_itemprop"
void main()
{
object oPC = GetPCSpeaker();
object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
object oBackup = CopyItem(oItem,IPGetIPWorkContainer());
int  nCurrApp = GetItemAppearance(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);

SetLocalInt(oPC, "Alpha_OldModcheck", nCurrApp);
SetLocalObject(GetPCSpeaker(),"alpha_backup",oBackup);
SetCustomToken(69100, "0");
SetCustomToken(90404, "Undefined groop");

 AssignCommand(oPC, ActionStartConversation(OBJECT_SELF, "lp_alpha_shield", TRUE, FALSE));
}

