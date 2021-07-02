void main()
{

object oPC = GetExitingObject();

if (!GetIsPC(oPC)) return;

object oTarget = oPC;
effect eEffect = GetFirstEffect(oTarget);
while (GetIsEffectValid(eEffect))
                {
                    if (GetEffectType(eEffect) == EFFECT_TYPE_DARKNESS)
                        RemoveEffect(oTarget, eEffect);

                    eEffect = GetNextEffect(oTarget);
                }

//RemoveEffect(oPC, EffectDarkness());

}

