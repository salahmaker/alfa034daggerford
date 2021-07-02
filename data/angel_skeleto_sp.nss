void main()
{
if(GetLocalInt(OBJECT_SELF, "NW_DO_ONCE") !=1)
{
effect eAppear = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
location lWay = GetLocation(GetNearestObjectByTag("SkeletonSpawn", OBJECT_SELF));
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eAppear, lWay, 0.0);
CreateObject(OBJECT_TYPE_CREATURE, "skelwarr003", lWay, TRUE);
SetLocalInt(OBJECT_SELF, "NW_DO_ONCE", 1);
    }
}

