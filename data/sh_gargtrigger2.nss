/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.2

For download info, please visit:
http://www.angelfire.com/space/lilacsoul    */

//Put this OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

object oCaster;
oCaster = GetObjectByTag("GargTwo");

object oTarget;
oTarget = oPC;

//AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_LIGHTNING_BOLT, oTarget, TRUE, 1, TRUE));
AssignCommand(oCaster, ActionCastSpellAtObject (SPELL_NEGATIVE_ENERGY_RAY, oTarget, TRUE, 1, TRUE));
AssignCommand(oCaster, ActionCastSpellAtObject (SPELL_RAY_OF_FROST, oTarget, TRUE, 5, TRUE));
AssignCommand(oCaster, ActionCastSpellAtObject (SPELL_RAY_OF_ENFEEBLEMENT, oTarget, TRUE, 5, TRUE));
}
