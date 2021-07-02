//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
        int nItemChance = Random(100) + 1;

        if (nItemChance > 75 && nItemChance < 85 )
        {
             CreateItemOnObject("silverweddingban", OBJECT_SELF);

        }

        if (nItemChance > 50 && nItemChance < 76  )
        {
             CreateItemOnObject("oldnoblefamil001", OBJECT_SELF);
        }

        if (nItemChance > 25 && nItemChance < 51  )
        {
             CreateItemOnObject("oldnoblefamilysi", OBJECT_SELF);
        }
        if (nItemChance > 86 )
        {
             CreateItemOnObject("goldweddingba001", OBJECT_SELF);
        }



    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
