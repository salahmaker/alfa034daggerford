void main()
{
object oTarget;
oTarget = OBJECT_SELF;
effect eEffect;
eEffect = EffectPetrify();

int i = 0;


DelayCommand(1.0, SetPlotFlag(OBJECT_SELF, TRUE));

for(i=0; i<10; i++){
ActionWait(1.0);


}


ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);

eEffect = EffectVisualEffect(VFX_DUR_ICESKIN);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);

 }

