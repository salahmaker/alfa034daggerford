void main()
{
if(GetLocalInt(OBJECT_SELF, "NW_DO_ONCE") !=1)
{
effect eAppear = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);

location lWay = GetLocation(GetNearestObjectByTag("MummySpawn", OBJECT_SELF));
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eAppear, lWay, 0.0);
CreateObject(OBJECT_TYPE_CREATURE, "mumfight001", lWay, TRUE);

location l2Way = GetLocation(GetNearestObjectByTag("RevenantSpawn", OBJECT_SELF));
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eAppear, l2Way, 0.0);
CreateObject(OBJECT_TYPE_CREATURE, "revenant002", l2Way, TRUE);

location l3Way = GetLocation(GetNearestObjectByTag("SkeletonSpawn", OBJECT_SELF));
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eAppear, l3Way, 0.0);
CreateObject(OBJECT_TYPE_CREATURE, "skelwarr003", l3Way, TRUE);

SetLocalInt(OBJECT_SELF, "NW_DO_ONCE", 1);
    }
}

