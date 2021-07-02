/// /// /// /// /// /// /// /// /// /// /// ///
/// trap_rand
/// Placed in OnTrapTriggered, this will create
/// a random trap effect. Some are good, most
/// are bad, but the effects don't last too long.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///
void main()
{
    object oTrapped = GetEnteringObject();
    int nRoll = d20(1);
    float fDuration = RoundsToSeconds(d3(1)+1);//2-4 rounds
    effect eTrapEffect;
    switch(nRoll){
    case 1: //lucky!
        SetTrapDisabled(OBJECT_SELF);
        return;
    case 2: //blind
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectBlindness()),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_BLINDDEAF),GetLocation(oTrapped));
        return;
    case 3: //curse
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectCurse()),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_HEAD_EVIL),GetLocation(oTrapped),fDuration);
        return;
    case 4: //-AC
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectACDecrease(d4())),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_HEAD_ODD),GetLocation(oTrapped),fDuration);
        return;
    case 5: //+tohit
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectAttackIncrease(d4())),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_HEAD_HOLY),GetLocation(oTrapped),fDuration);
        return;
    case 6: //confused
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectConfused()),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_CONFUSION_S),GetLocation(oTrapped),fDuration);
        return;
    case 7: //electric damage
    case 8:
        ApplyEffectToObject(DURATION_TYPE_INSTANT,VersusTrapEffect(EffectDamage(d4(3),DAMAGE_TYPE_ELECTRICAL)),oTrapped);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_S),GetLocation(oTrapped));
        return;
    case 9: //cold damage
    case 10:
        ApplyEffectToObject(DURATION_TYPE_INSTANT,VersusTrapEffect(EffectDamage(d4(2),DAMAGE_TYPE_COLD)),oTrapped);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FROST_S),GetLocation(oTrapped));
        return;
    case 11: //fire damage
    case 12:
        ApplyEffectToObject(DURATION_TYPE_INSTANT,VersusTrapEffect(EffectDamage(d6()+1,DAMAGE_TYPE_FIRE)),oTrapped);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_M),GetLocation(oTrapped));
        return;
    case 13: //deaf
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectDeaf()),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_BLIND_DEAF_M),GetLocation(oTrapped));
        return;
    case 14: //heal
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectHeal(d8()+1)),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_HEALING_S),GetLocation(oTrapped));
        return;
    case 15: //knockdown
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectKnockdown()),oTrapped,3.f);
        return;
    case 16: //-level
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectNegativeLevel(1)),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY),GetLocation(oTrapped));
        return;
    case 17: //silence
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectSilence()),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_SILENCE),GetLocation(oTrapped));
        return;
    case 18: //slow
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,VersusTrapEffect(EffectSlow()),oTrapped,fDuration);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_SLOW),GetLocation(oTrapped));
        return;
    //case 19-20 nothing happens
    }
}
