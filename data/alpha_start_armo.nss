#include "x2_inc_itemprop"
void main()
{
object oPC = GetPCSpeaker();
object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
object oBackup = CopyItem(oItem,IPGetIPWorkContainer());

SetLocalObject(GetPCSpeaker(),"alpha_backup",oBackup);
SetCustomToken(69100, "0");
 AssignCommand(oPC, ActionStartConversation(OBJECT_SELF, "lp_alpha_armor", TRUE, FALSE));
}
