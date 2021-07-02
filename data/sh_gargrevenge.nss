void main()
{

object oPC = GetLastDamager();

if (!GetIsPC(oPC)) return;

object oCaster;
oCaster = GetObjectByTag("GargOne");

object oTarget;
oTarget = oPC;

AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_BESTOW_CURSE, oTarget, TRUE, 5,TRUE));

}

