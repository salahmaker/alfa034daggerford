#include "x2_inc_itemprop"
void main()
{
object oPC = GetPCSpeaker();
object oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
object oBackup = CopyItem(oItem,IPGetIPWorkContainer());
int  nCurrApp = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, 0);

SetLocalInt(GetPCSpeaker(), "Alpha_OldModcheck", nCurrApp);
SetLocalObject(GetPCSpeaker(),"alpha_backup",oBackup);
SetCustomToken(69100, "0");
 AssignCommand(GetPCSpeaker(), ActionStartConversation(OBJECT_SELF, "lp_alpha_helm", TRUE, FALSE));
}
