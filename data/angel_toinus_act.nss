void main()
{
ActionSit( GetNearestObjectByTag( "Chair"));
     effect eSnore = EffectVisualEffect (VFX_IMP_SLEEP);
     ApplyEffectToObject (DURATION_TYPE_PERMANENT, eSnore, OBJECT_SELF);
 }
