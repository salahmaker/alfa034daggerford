
#include "omega_include"
void main()
{
effect eEffect = EffectPoison(POISON_BLOODROOT);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oMyTarget);
}


