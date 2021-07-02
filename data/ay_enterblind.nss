void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

object oTarget;
oTarget = oPC;

ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDarkness(), oTarget, 60.0f);

}

