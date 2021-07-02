
void main()
{
    object oPC = GetPCSpeaker();
object oBackup = GetLocalObject(oPC,"alpha_backup");
int iGold = GetLocalInt(oPC, "price");
TakeGoldFromCreature(iGold,oPC,TRUE);

  effect eLight = EffectVisualEffect( VFX_DUR_LIGHT_WHITE_20);
  effect eImmob = EffectCutsceneImmobilize();
  eImmob = ExtraordinaryEffect(eImmob);

            RemoveEffect(oPC,eImmob);

DeleteLocalObject(oPC,"alpha_backup");
DeleteLocalObject(oPC,"ck_price");
DeleteLocalInt(oPC, "price");
DestroyObject(oBackup);

}

