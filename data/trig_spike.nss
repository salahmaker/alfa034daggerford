/// /// /// /// /// /// /// /// /// /// /// ///
/// trig_fire
/// This detects if you've walked into a timed
/// trap that is currently firing.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///

void main()
{
    object oEntering = GetEnteringObject();

    object oWP = GetNearestObjectByTag("WP_SPIKE");
    if(GetIsObjectValid(oWP)){
        if(GetLocalInt(oWP,"nTrapArmed")){
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d4(3),DAMAGE_TYPE_PIERCING), oEntering);
        }
    }
}
