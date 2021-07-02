/// /// /// /// /// /// /// /// /// /// /// ///
/// lib_spawn
/// This in an include file.
/// These are some functions to spawn monsters
/// based on the entering PC's levels.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///

//this should be called only once per area, and sets up local variables
//to store the moster tables.  It allows for up to 8 monster varieties per
//group, and can be called multiple times for different monster groups.
void SetMGroup( string sWPname, int nM1roll, string sM1ref, int nM2roll=0, string sM2ref="", int nM3roll=0, string sM3ref="", int nM4roll=0, string sM4ref="", int nM5roll=0, string sM5ref="", int nM6roll=0, string sM6ref="", int nM7roll=0, string sM7ref="", int nM8roll=0, string sM8ref="" ){
    //increase the group count
    int nGroupnum = GetLocalInt(OBJECT_SELF, "nNumMGroups");
    SetLocalInt(OBJECT_SELF, "nNumMGroups", nGroupnum+1);

    //store the tag of the waypoints to search for
    string sGroupnum = "G"+IntToString(nGroupnum);
    SetLocalString(OBJECT_SELF, sGroupnum+"WPname", sWPname);

    //start storing monster resrefs and roll required to spawn
    SetLocalInt(OBJECT_SELF, sGroupnum+"M1roll", nM1roll);
    SetLocalString(OBJECT_SELF, sGroupnum+"M1ref", sM1ref);

    if(nM2roll==0){
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 1);
        return;
    }else{
        SetLocalInt(OBJECT_SELF, sGroupnum+"M2roll", nM2roll);
        SetLocalString(OBJECT_SELF, sGroupnum+"M2ref", sM2ref);
    }

    if(nM3roll==0){
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 2);
        return;
    }else{
        SetLocalInt(OBJECT_SELF, sGroupnum+"M3roll", nM3roll);
        SetLocalString(OBJECT_SELF, sGroupnum+"M3ref", sM3ref);
    }

    if(nM4roll==0){
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 3);
        return;
    }else{
        SetLocalInt(OBJECT_SELF, sGroupnum+"M4roll", nM4roll);
        SetLocalString(OBJECT_SELF, sGroupnum+"M4ref", sM4ref);
    }

    if(nM5roll==0){
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 4);
        return;
    }else{
        SetLocalInt(OBJECT_SELF, sGroupnum+"M5roll", nM5roll);
        SetLocalString(OBJECT_SELF, sGroupnum+"M5ref", sM5ref);
    }

    if(nM6roll==0){
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 5);
        return;
    }else{
        SetLocalInt(OBJECT_SELF, sGroupnum+"M6roll", nM6roll);
        SetLocalString(OBJECT_SELF, sGroupnum+"M6ref", sM6ref);
    }

    if(nM7roll==0){
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 6);
        return;
    }else{
        SetLocalInt(OBJECT_SELF, sGroupnum+"M7roll", nM7roll);
        SetLocalString(OBJECT_SELF, sGroupnum+"M7ref", sM7ref);
    }

    if(nM8roll==0){
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 7);
        return;
    }else{
        SetLocalInt(OBJECT_SELF, sGroupnum+"M8roll", nM8roll);
        SetLocalString(OBJECT_SELF, sGroupnum+"M8ref", sM8ref);
        SetLocalInt(OBJECT_SELF, sGroupnum+"NumRefs", 8);
    }
}

//this creates the individual monster
object CreateMonster(int nGroupnum, int nLevel, location lLoca){
    string sGroupnum = "G"+IntToString(nGroupnum);
    string sMonstnum,sTemplate;
    int nRoll = d20(1)+nLevel; //results from 2-20 to 20-40 based on level
//  int nRoll = Random(20+nLevel)+1; //results from 1-21 to 1-40 based on level
    int i;
    //loop through the list of monsters for this group
    for(i=0;i<GetLocalInt(OBJECT_SELF,sGroupnum+"NumRefs");i++){
        sMonstnum = "M"+IntToString(i);
        //if the roll is less than the number specified for this monster, then spawn this monster
        if(nRoll <= GetLocalInt(OBJECT_SELF,sGroupnum+sMonstnum+"roll")){
            //get the resref
            sTemplate = GetLocalString(OBJECT_SELF,sGroupnum+sMonstnum+"ref");
            object oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            //make sure no PC will see the monster spawn
            if((oNearestPC == OBJECT_INVALID) || (GetDistanceBetweenLocations(GetLocation(oNearestPC),lLoca)>20.f)){
                object oCreature = CreateObject(OBJECT_TYPE_CREATURE, sTemplate,lLoca, TRUE);
                if(GetIsObjectValid(oCreature)){
                    AssignCommand(oCreature,SetIsDestroyable(TRUE,FALSE));
                    //make weaker monsters a little stronger
                    if(nLevel > GetHitDice(oCreature))
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectTemporaryHitpoints(nRoll),oCreature);
                }
                return oCreature;
            }
            else{
            }
        }
    }
    return OBJECT_INVALID;
}

//this is called from the OnEnter area script to spawn a single monster group
//this is used if you want to specify different levels and chance per group
void SpawnMGroup(int nGroupNum, object oPC,int nLevel,int nChance)
{
    string sGroupnum,sWPname;
    location lLoca;
    //check for valid group number
    if(nGroupNum < 0 || nGroupNum >= GetLocalInt(OBJECT_SELF, "nNumMGroups")){
        return;
    }

    string sName = GetPCPlayerName(oPC);;
    object oWaypoint = GetFirstObjectInArea(OBJECT_SELF);
    while(GetIsObjectValid(oWaypoint))
    {
        //find all valid waypoint in the area (limited to area, so other areas
        //can use similar tags for waypoints)
        if(GetObjectType(oWaypoint)==OBJECT_TYPE_WAYPOINT){
                sGroupnum = "G"+IntToString(nGroupNum);
                sWPname = GetLocalString(OBJECT_SELF, sGroupnum+"WPname");
                if(TestStringAgainstPattern(sWPname,GetStringLeft(GetTag(oWaypoint),GetStringLength(sWPname)))){
                    //as I created monsters, the number of objects in the area changes,
                    //so I needed to put local ints on the waypoints so I didn't spawn
                    //more than one monster per waypoint
                    if( GetLocalInt(oWaypoint,sName)==0 ){
                        SetLocalInt(oWaypoint,sName,1);
                        lLoca = GetLocation(oWaypoint);

                        if (d100(1) > (nChance)){
                            CreateMonster(nGroupNum, nLevel, lLoca);
                        }
                        break;
                    }
                }
        }
        oWaypoint = GetNextObjectInArea(OBJECT_SELF);
    }
}

//this is called from the OnEnter area script to spawn all monster groups
//this is used if all groups have the same levels and chance
void SpawnMGroups(object oPC,int nLevel,int nChance)
{
    string sName = GetPCPlayerName(oPC);;
    string sGroupnum,sWPname;
    location lLoca;
    int i;
    object oWaypoint = GetFirstObjectInArea(OBJECT_SELF);

    while(GetIsObjectValid(oWaypoint)){
        if(GetObjectType(oWaypoint)==OBJECT_TYPE_WAYPOINT){
            //loop through all the groups
            for(i=0;i<GetLocalInt(OBJECT_SELF, "nNumMGroups");i++){
                sGroupnum = "G"+IntToString(i);
                sWPname = GetLocalString(OBJECT_SELF, sGroupnum+"WPname");
                if(TestStringAgainstPattern(sWPname,GetStringLeft(GetTag(oWaypoint),GetStringLength(sWPname)))){
                    if( GetLocalInt(oWaypoint,sName)==0 ){
                        SetLocalInt(oWaypoint,sName,1);
                        lLoca = GetLocation(oWaypoint);

                        if (d100(1) > nChance){
                                CreateMonster(i, nLevel, lLoca);
                        }
                        break;
                    }
                }
            }
        }
        oWaypoint = GetNextObjectInArea(OBJECT_SELF);
    }
}

//this will return a value of 1-20 as the PC's level goes from min to max.
//if faction==TRUE, it uses the average faction level instead of the PC's level
int GetLevel(object oPC,int min=1, int max=20, int faction=FALSE){
    int nlvl;
    if(faction){
        nlvl = GetFactionAverageLevel(oPC);
    }else{
        nlvl = GetHitDice(oPC);
    }
    if(nlvl<=min)
        nlvl = 1;
    else if(nlvl>=max)
        nlvl = 20;
    else{
        nlvl = FloatToInt(IntToFloat(nlvl-min+1) * (20.f/IntToFloat(max-min+1)));
        if(nlvl<1)  nlvl = 1;
        if(nlvl>20) nlvl = 20;
    }
    return nlvl;
}

//as level goes from 1-20, the chance of spawn goes from min-max
int GetChance(int level,int min, int max){
    int chance = 100-(FloatToInt(IntToFloat(level)*0.05f*IntToFloat(max-min))+min);
    return chance;
}

//return the total number of faction members (defaults to PC's only)
int GetNumFactionMembers(object oMember, int bPCOnly = TRUE){
    int nCount=0;
    if(GetIsObjectValid(oMember)){
        object oNewMember = GetFirstFactionMember(oMember,bPCOnly);
        //loop though faction members
        while(GetIsObjectValid(oNewMember)){
            nCount++;
            oNewMember = GetNextFactionMember(oMember,bPCOnly);
        }
        //don't forget the PC
        if(bPCOnly==FALSE || GetIsPC(oMember))
            nCount++;
    }
    return nCount;
}
