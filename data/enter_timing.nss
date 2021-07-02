/// /// /// /// /// /// /// /// /// /// /// ///
/// enter_timing
/// Entering timing puzzle. Tally all entering
/// PC's so the heartbeat for this area only
/// updates the traps when someone's in the area.
/// Spawn constructs.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///
#include "lib_spawn"

void main()
{
    object oEntering = GetEnteringObject();
    if(GetIsObjectValid(oEntering)){
        //set local variables once
        if(GetLocalInt(OBJECT_SELF,"nDoOnce")==0){
            SetLocalInt(OBJECT_SELF,"nDoOnce",1);
            SetMGroup("WP_SPAWN1",10,"nw_minogon",20,"nw_golflesh",25,"nw_helmhorr",30,"nw_bathorror",35,"nw_goliron",40,"nw_shguard");
        }

        //for each new player, spawn more creatures...
        if(GetIsPC(oEntering)){
            int nNumEntered = GetLocalInt(OBJECT_SELF,"nNumEntered");
            SetLocalInt(OBJECT_SELF,"nNumEntered",nNumEntered+1);

            string sName = GetPCPlayerName(oEntering);
            if(GetLocalInt(OBJECT_SELF,sName)==0){
                SetLocalInt(OBJECT_SELF,sName,1);
                int nlvl = GetLevel(oEntering,8,15,TRUE);
                int nChance = GetChance(nlvl,80,100);
                nChance += (GetNumFactionMembers(oEntering)-1) * 10;
                SpawnMGroups(oEntering,nlvl,nChance);
            }
        }
    }
}
