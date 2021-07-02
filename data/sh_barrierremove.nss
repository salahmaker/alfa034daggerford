void main()
{
 object oStone = GetObjectByTag("CA3Key");
int iNth;
iNth = 1;
object oDemon = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_OUTSIDER);
object oDestroy = GetNearestObjectByTag("Barrier", OBJECT_SELF, iNth);
    while(oDestroy != OBJECT_INVALID)
    {
    iNth = iNth + 1;
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1), oDestroy);
        DestroyObject(oDestroy);
        oDestroy = GetNearestObjectByTag("Barrier", OBJECT_SELF, iNth);
    }
    DestroyObject(oStone,1.0);
    DestroyObject(oDemon,1.5);
}
