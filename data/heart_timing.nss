/// /// /// /// /// /// /// /// /// /// /// ///
/// heart_timing
/// If no one is in the area, this returns
/// immediately.  If a PC is in the area, then
/// set delayed triggers for the timed traps.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///

//this is in a seperate function so it can be called after a delay...
void ApplyDamage(object oSource, int nTrapType){
    int i = 0;
    object oCreature = GetNearestObject(OBJECT_TYPE_CREATURE, oSource, i);
    //Check for anyone standing in the wrong place
    while(GetIsObjectValid(oCreature) && GetDistanceBetween(oSource, oCreature) <= 1.5f) {
        //apply damage based on trap type
        if(nTrapType == 0){
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d4(3),DAMAGE_TYPE_PIERCING), oCreature);
        }else{
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d4(3),DAMAGE_TYPE_FIRE), oCreature);
        }
        i++;
        oCreature = GetNearestObject(OBJECT_TYPE_CREATURE, oSource, i);
    }
}

void main()
{
    if(GetLocalInt(OBJECT_SELF, "nNumEntered")==0)
        return; //no one is in this area

    int nTrapType = 0;
    int i=0;
    float fDelay;
    object oWP = GetObjectByTag("WP_SPIKE",i);
    while(GetIsObjectValid(oWP)){
        if(nTrapType == 0){//check spike traps
            fDelay = IntToFloat(i)*2.f;
            //Delay the visual effect and damage
            DelayCommand(fDelay,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SPIKE_TRAP), GetLocation(oWP)));
            DelayCommand(fDelay,ApplyDamage(oWP,nTrapType));
            //set local int for trigger
            DelayCommand(fDelay,SetLocalInt(oWP,"nTrapArmed",1));
            DelayCommand(fDelay+2.0f,SetLocalInt(oWP,"nTrapArmed",0));

            i++;
            oWP = GetObjectByTag("WP_SPIKE",i);
            if(!GetIsObjectValid(oWP)){ //done with spikes
                i=0;
                nTrapType=1;//switch to fire
                oWP = GetObjectByTag("WP_FIRE",i);
            }
        }else{//check fire traps
            fDelay = IntToFloat(i/2)+0.5f;
            //These fire off in pairs, offset timing from spikes (spreads out the calls to ApplyDamage())
            DelayCommand(fDelay,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), GetLocation(oWP)));
            DelayCommand(fDelay,ApplyDamage(oWP,nTrapType));
            //set local int for trigger
            DelayCommand(fDelay,SetLocalInt(oWP,"nTrapArmed",1));
            DelayCommand(fDelay+1.0f,SetLocalInt(oWP,"nTrapArmed",0));

            i++;
            oWP = GetObjectByTag("WP_FIRE",i);
        }
    }
}
