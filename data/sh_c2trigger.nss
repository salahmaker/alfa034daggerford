#include "nw_i0_generic"
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.2

For download info, please visit:
http://www.angelfire.com/space/lilacsoul    */

//Put this OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int DoOnce = GetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF));

if (DoOnce==TRUE) return;

SetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF), TRUE);

object oTarget;
object oSpawn;
oTarget = GetWaypointByTag("ShadowOne");

oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "shrineshadow", GetLocation(oTarget));

oTarget = oSpawn;

SetIsTemporaryEnemy(oPC, oTarget);

AssignCommand(oTarget, ActionAttack(oPC));

AssignCommand(oTarget, DetermineCombatRound(oPC));

oTarget = GetWaypointByTag("ShadowTwo");

oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "shrineshadow", GetLocation(oTarget));

oTarget = oSpawn;

SetIsTemporaryEnemy(oPC, oTarget);

AssignCommand(oTarget, ActionAttack(oPC));

AssignCommand(oTarget, DetermineCombatRound(oPC));

oTarget = GetWaypointByTag("ShadowThree");

oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "shrineshadow", GetLocation(oTarget));

oTarget = oSpawn;

SetIsTemporaryEnemy(oPC, oTarget);

AssignCommand(oTarget, ActionAttack(oPC));

AssignCommand(oTarget, DetermineCombatRound(oPC));

oTarget = GetWaypointByTag("ShadowFour");

oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "shrineshadow", GetLocation(oTarget));

oTarget = oSpawn;

SetIsTemporaryEnemy(oPC, oTarget);

AssignCommand(oTarget, ActionAttack(oPC));

AssignCommand(oTarget, DetermineCombatRound(oPC));

object oCaster;
oCaster = GetObjectByTag("C2Lever");

oTarget = GetObjectByTag("ShadowOne");

AssignCommand(oCaster, ActionCastSpellAtLocation(SPELL_DARKNESS, GetLocation(oTarget), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

oTarget = GetObjectByTag("ShadowTwo");

AssignCommand(oCaster, ActionCastSpellAtLocation(SPELL_DARKNESS, GetLocation(oTarget), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
oTarget = GetObjectByTag("ShadowThree");

AssignCommand(oCaster, ActionCastSpellAtLocation(SPELL_DARKNESS, GetLocation(oTarget), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
oTarget = GetObjectByTag("ShadowFour");

AssignCommand(oCaster, ActionCastSpellAtLocation(SPELL_DARKNESS, GetLocation(oTarget), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

}

