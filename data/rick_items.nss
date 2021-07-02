/******************************************************************
 * Name: rick_items
 * Type: OnActivateItem
 ******************************************************************/
void main()
{
    object oItem = GetItemActivated();
    object oTarget = GetItemActivatedTarget();
    string sItem = GetTag(oItem);
    string sName = GetName(oItem);
    location lLoc = GetItemActivatedTargetLocation();
    string sRef = GetResRef(oItem);
    object oOwner = GetItemPossessor(oItem);
                              //ActionSpeakString("zzzzzzzz");
    if(sItem == "034FOOD")
       ActionSpeakString("*Eats " + sName + "*");
    else if(sItem == "034DRINK")
       ActionSpeakString("*Drinks " + sName + "*");

    if(sItem == "goodberryjam")
    {
       int iHealingPts = Random(3) + 1;
       AssignCommand(OBJECT_SELF,ActionSpeakString("*Applies " + sName + " to the wounded area*"));
       ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(iHealingPts), oOwner);
    }

    if(sItem == "034HERBGoodBerry")
    {
       int iHealingPts = Random(3) + 1;
       AssignCommand(OBJECT_SELF,ActionSpeakString("*Eats " + sName + "*"));
       ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(iHealingPts), oOwner);
    }

    if(sItem == "034Map")
    {
        AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_FIREFORGET_READ));
        ExploreAreaForPlayer(GetArea(GetObjectByTag("DagNW_OUT")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("DagNE_OUT")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("DagSE_OUT")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("DaggerfordSW_OUT")), OBJECT_SELF);
    }

/*    if((sItem == "004Food") || (sItem == "004Deathcheese"))
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Eats " + sName + "*"));
    }
    else if((sItem == "004Drink") || (sItem == "004Evermead"))
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Drinks " + sName + "*"));
    }
    else if(sItem == "004SealedNote")
    {
        CreateItemOnObject("note",OBJECT_SELF);
    }
    else if(sItem == "004Coffee")
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Drinks coffee*"));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_SPOT,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_LISTEN,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_SEARCH,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_CONCENTRATION,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillDecrease(SKILL_DISCIPLINE,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillDecrease(SKILL_MOVE_SILENTLY,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillDecrease(SKILL_OPEN_LOCK,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillDecrease(SKILL_DISABLE_TRAP,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillDecrease(SKILL_HIDE,1),OBJECT_SELF,RoundsToSeconds(15));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillDecrease(SKILL_SET_TRAP,1),OBJECT_SELF,RoundsToSeconds(15));
    }
    else if(sItem == "004PotionofGlibness")
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_PERSUADE,30),OBJECT_SELF,HoursToSeconds(1));
    }
    else if(sItem == "004PotionofHeroism")
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_ALL_SKILLS,2),OBJECT_SELF,HoursToSeconds(1));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSavingThrowIncrease(SAVING_THROW_ALL,2),OBJECT_SELF,HoursToSeconds(1));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectAttackIncrease(2,ATTACK_BONUS_MISC),OBJECT_SELF,HoursToSeconds(1));
    }
    else if(sItem == "004PotionofSneaking")
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_MOVE_SILENTLY,10),OBJECT_SELF,HoursToSeconds(1));
    }
    else if(sItem == "004PotionofHiding")
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_HIDE,10),OBJECT_SELF,HoursToSeconds(1));
    }
    else if(sItem == "004PotionofVision")
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_SEARCH,10),OBJECT_SELF,HoursToSeconds(1));
    }
    else if(sItem == "004SysStout")
    {
        int iDur = d6();
        effect eDumb = EffectAbilityDecrease(ABILITY_INTELLIGENCE, 4);
        FloatingTextStringOnCreature("*That* was a strong drink.",OBJECT_SELF,FALSE);
        if(!FortitudeSave(OBJECT_SELF,16))
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectKnockdown(),OBJECT_SELF,RoundsToSeconds(iDur));
        }
        else
        {
            if (Random(100) + 1 < 40)
                AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING));
            else
                AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK));
        }
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDumb, oTarget, 60.0);
    }
    else if(sItem == "004RosinandPowder")
    {
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_NATURE),oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_PICK_POCKET,1),oTarget,24.0);
            DestroyObject(oItem);
    }
    else if(sItem == "004Incense")
    {
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE),oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_LISTEN,1),oTarget,24.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSkillIncrease(SKILL_SPOT,1),oTarget,24.0);
             DestroyObject(oItem);
    }
    else if(sItem == "004Poison")
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Drinks poison*"));
        int iHP = GetCurrentHitPoints(OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(iHP+3,DAMAGE_TYPE_ACID,DAMAGE_POWER_PLUS_FIVE),OBJECT_SELF);
        DelayCommand(24.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(iHP+3-GetCurrentHitPoints(OBJECT_SELF)),OBJECT_SELF));
    }
    else if(sItem == "004Broom")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Sweeps the area with a broom*"));
    else if(sItem == "004Plate")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gets out a plate*"));
    else if(sItem == "004Bowl")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gets out a bowl*"));
    else if(sItem == "004Top")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Spins a wooden top*"));
    else if(sItem == "004Doll")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Plays with a rag doll*"));
    else if(sItem == "004Skinlotion")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Applies some skin lotion*"));
    else if(sItem == "004Marbles")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Plays a game with some marbles*"));
    else if(sItem == "004Canteen")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Takes a swig from a canteen*"));
    else if(sItem == "004Goblet")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Sips from a goblet*"));
    else if(sItem == "004Utensils")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gets out some eating utensils*"));
    else if(sItem == "004Mug")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Takes a swig from a mug*"));
    else if(sItem == "004Flowers")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Sniffs some flowers*"));
    else if(sItem == "004Inkpot")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gets out an inkpot*"));
    else if(sItem == "004Hoe")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Tills the ground with a hoe*"));
    else if(sItem == "004Shovel")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Digs at the ground with a shovel*"));
    else if(sItem == "004Pen")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gets out a quill pen*"));
    else if(sItem == "004Ball")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Plays around with a ball*"));
    else if(sItem == "004Lookingglass")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Peers through a looking-glass*"));
    else if(sItem == "004Paper")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gets out a piece of paper*"));
    else if(sItem == "004Mirror")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gazes into a mirror*"));
    else if(sItem == "004Paint")
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Gets out some paint*"));
    else if(sItem == "004Clock")
        AssignCommand(OBJECT_SELF,ActionSpeakString("Hour " + IntToString(GetTimeHour()) + ", Minute " + IntToString(GetTimeMinute())));
    else if(sItem == "004Garotte")
    {
        if(OBJECT_SELF != oTarget)
        {
            if((GetDistanceBetween(OBJECT_SELF,oTarget) < 2.0) && (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE))
            {
                AssignCommand(oTarget,SetFacing(GetFacing(OBJECT_SELF)));
                SetIsTemporaryEnemy(oTarget,OBJECT_SELF,TRUE,300.0);
                SetIsTemporaryEnemy(OBJECT_SELF,oTarget,TRUE,300.0);
                if(TouchAttackMelee(oTarget,TRUE))
                {
                    if((!FortitudeSave(oTarget,10,SAVING_THROW_TYPE_DEATH)) && (GetHitDice(oTarget) < 3))
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),oTarget);
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(d3(),DAMAGE_TYPE_PIERCING),oTarget);
                    }
                }
                int iRand = d4();
                if(iRand == 1)
                {
                    DestroyObject(oItem);
                    FloatingTextStringOnCreature("The garotte broke.",OBJECT_SELF,FALSE);
                }
            }
            else
            {
                FloatingTextStringOnCreature("You need to get closer.",OBJECT_SELF,FALSE);
            }
        }
        else
            FloatingTextStringOnCreature("You don't want to kill yourself.",OBJECT_SELF,FALSE);
    }
    else if(sItem == "004Perfume")
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE),OBJECT_SELF);
        if(GetAbilityScore(OBJECT_SELF,ABILITY_CHARISMA) < GetGoldPieceValue(oItem))
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectAbilityIncrease(ABILITY_CHARISMA,1),OBJECT_SELF,TurnsToSeconds(3));
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Applies " + GetName(oItem) + "*"));
    }
    else if(sItem == "004Pipeweed")
    {
        object oPipe = GetItemPossessedBy(OBJECT_SELF,"004Pipe");
        int iSmokes = GetLocalInt(OBJECT_SELF,"cmk_smokes");
        if((oPipe != OBJECT_INVALID) && (iSmokes == 0))
        {
            AssignCommand(OBJECT_SELF,ActionSpeakString("*Stuffs a pipe with " + GetName(oItem) + "*"));
            SetLocalInt(OBJECT_SELF,"cmk_smokes",1);
        }
        else if(oPipe == OBJECT_INVALID)
        {
            AssignCommand(OBJECT_SELF,ActionSpeakString("*Produces some pipeweed... but has no pipe."));
        }
        else if(iSmokes > 0)
        {
            AssignCommand(OBJECT_SELF,ActionSpeakString("*Produces some pipeweed... but the pipe is full.*"));
        }
    }
    else if(sItem == "004Pipe")
    {
        int iSmokes = GetLocalInt(OBJECT_SELF,"cmk_smokes");
        int iFX = GetLocalInt(OBJECT_SELF,"cmk_smokefx");
        if(iSmokes > 0)
        {
            SmokePipe(OBJECT_SELF);
            SetLocalInt(OBJECT_SELF,"cmk_smokes",0);
        }
        else
        {
            AssignCommand(OBJECT_SELF,ActionSpeakString("*Tries to smoke an empty pipe*"));
        }
    }
    else if(sItem == "004Ettin")
    {
        object oMonster = CreateObject(OBJECT_TYPE_CREATURE,"nw_ettin",lLoc,TRUE);
        AssignCommand(oMonster,ActionAttack(OBJECT_SELF));
    }
    else if(sItem == "004PhaseSpider")
    {
        object oMonster = CreateObject(OBJECT_TYPE_CREATURE,"nw_spidphase",lLoc,TRUE);
        AssignCommand(oMonster,ActionAttack(OBJECT_SELF));
    }
    else if(sItem == "004Quasit")
    {
        object oMonster = CreateObject(OBJECT_TYPE_CREATURE,"nw_dmquasit",lLoc,TRUE);
        AssignCommand(oMonster,ActionAttack(OBJECT_SELF));
    }
    else if(sItem == "004Yuanti")
    {
        object oMonster = CreateObject(OBJECT_TYPE_CREATURE,"nw_yuan_ti001",lLoc,TRUE);
        AssignCommand(oMonster,ActionAttack(OBJECT_SELF));
    }
    else if(sItem == "004Troll")
    {
        object oMonster = CreateObject(OBJECT_TYPE_CREATURE,"nw_troll",lLoc,TRUE);
        AssignCommand(oMonster,ActionAttack(OBJECT_SELF));
    }
    else if(sItem == "004Lute")
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Plays a lute*"));
        if(d2() == 1)
            AssignCommand(OBJECT_SELF,PlaySound("as_cv_lute1"));
        else
            AssignCommand(OBJECT_SELF,PlaySound("as_cv_lute1b"));
    }
    else if(sItem == "004Harp")
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Plays a harp*"));
        AssignCommand(OBJECT_SELF,PlaySound("sdr_bardsong"));
    }
    else if(sItem == "004Flute")
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Plays a flute*"));
        if(d2() == 1)
            AssignCommand(OBJECT_SELF,PlaySound("as_cv_flute1"));
        else
            AssignCommand(OBJECT_SELF,PlaySound("as_cv_flute2"));
    }
    else if(sItem == "004Reedpipe")
    {
        AssignCommand(OBJECT_SELF,ActionSpeakString("*Plays a reed pipe*"));
        if(d2() == 1)
            AssignCommand(OBJECT_SELF,PlaySound("as_cv_eulpipe1"));
        else
            AssignCommand(OBJECT_SELF,PlaySound("as_cv_eulpipe2"));
    }
    else if(sItem == "004Map")
    {
        AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_FIREFORGET_READ));
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3E")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3F")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2H")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2E")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2F")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2G")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2L")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2M")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2N")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2R")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2S")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2T")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2X")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2Y")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2Z")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3D")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3L")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2P")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2U")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3B")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2V")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3E")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3F")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2H")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3M")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3N")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3O")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3W")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3X")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep4G")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2O")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1Q")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1R")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1V")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1W")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1X")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2B")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2C")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2D")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2I")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2J")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1G")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1H")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1I")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1J")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1M")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1N")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1O")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1P")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1S")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1T")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1U")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1Y")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep1Z")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2A")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3P")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3Y")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3Z")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("SouthernWard4HSE")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3a")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3G")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3H")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2U")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep3B")), OBJECT_SELF);
        ExploreAreaForPlayer(GetArea(GetObjectByTag("Waterdeep2O")), OBJECT_SELF);
    }
    else if(GetStringLeft(sItem,6) == "004INV")
    {
        ExecuteScript("cmk_gnomish",OBJECT_SELF);
    }
    else if(sItem == "004CranialDrill")
    {
        if(oTarget == OBJECT_SELF)
            FloatingTextStringOnCreature("You can't use it on yourself.",OBJECT_SELF,FALSE);
        else if(GetDistanceBetween(OBJECT_SELF,oTarget) < 3.0)
        {
            if(GetIsFriend(OBJECT_SELF,oTarget))
            {
                int iDrill = d100() + GetSkillRank(SKILL_HEAL,OBJECT_SELF);
                if(iDrill <= 10)
                {
                    FloatingTextStringOnCreature("You drilled too far!",OBJECT_SELF,TRUE);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(TRUE,FALSE),oTarget);
                }
                else if((iDrill > 10) && (iDrill <= 40))
                {
                    FloatingTextStringOnCreature("You caused brain damage!",OBJECT_SELF,TRUE);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectAbilityDecrease(ABILITY_INTELLIGENCE,2),oTarget);
                }
                else if((iDrill > 40) && (iDrill <= 70))
                {
                    FloatingTextStringOnCreature("You caused brain damage!",OBJECT_SELF,TRUE);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectAbilityDecrease(ABILITY_INTELLIGENCE,1),oTarget);
                }
                else if((iDrill > 70) && (iDrill <= 95))
                {
                    FloatingTextStringOnCreature("It didn't seem to help.",OBJECT_SELF,TRUE);
                }
                else if(iDrill > 95)
                {
                    FloatingTextStringOnCreature("It worked!",OBJECT_SELF,TRUE);
                    effect eEffect = GetFirstEffect(oTarget);
                    while (GetIsEffectValid(eEffect))
                    {
                        if (GetEffectType(eEffect) == EFFECT_TYPE_CONFUSED)
                            RemoveEffect(oTarget, eEffect);
                        else if (GetEffectType(eEffect) == EFFECT_TYPE_CHARMED)
                            RemoveEffect(oTarget, eEffect);
                        else if (GetEffectType(eEffect) == EFFECT_TYPE_DOMINATED)
                            RemoveEffect(oTarget, eEffect);
                        else if (GetEffectType(eEffect) == EFFECT_TYPE_FRIGHTENED)
                            RemoveEffect(oTarget, eEffect);
                        eEffect = GetNextEffect(oTarget);
                    }
                }
            }
            else
                FloatingTextStringOnCreature("You can only use it on a willing target.",OBJECT_SELF,FALSE);
        }
        else
            FloatingTextStringOnCreature("You're too far away.",OBJECT_SELF,FALSE);
    }
    else if(sItem == "004Jarofleeches")
    {
        if(GetDistanceBetween(OBJECT_SELF,oTarget) <= 3.0)
        {
            int iLeech = d100();
            if(iLeech >= 90)
            {
                FloatingTextStringOnCreature("They worked!",OBJECT_SELF,TRUE);
                effect eEffect = GetFirstEffect(oTarget);
                while (GetIsEffectValid(eEffect))
                {
                    if (GetEffectType(eEffect) == EFFECT_TYPE_DISEASE)
                        RemoveEffect(oTarget, eEffect);
                    else if (GetEffectType(eEffect) == EFFECT_TYPE_POISON)
                        RemoveEffect(oTarget, eEffect);
                    eEffect = GetNextEffect(oTarget);
                }
            }
            else
            {
                FloatingTextStringOnCreature("They didn't seem to help.",OBJECT_SELF,TRUE);
                if(iLeech <= 25)
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(1,DAMAGE_TYPE_PIERCING),oTarget);
            }
        }
        else
            FloatingTextStringOnCreature("You dropped a leech on the ground.  You need to get closer.",OBJECT_SELF,FALSE);
    }
    else if(sItem == "004Balm")
    {
        if(GetDistanceBetween(OBJECT_SELF,oTarget) <= 3.0)
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(1),oTarget);
        else
            FloatingTextStringOnCreature("You poured it on the ground.  You need to get closer.",OBJECT_SELF,FALSE);
    }
    else if(sItem == "004GoodBerry")
    {
        if(GetDistanceBetween(OBJECT_SELF,oTarget) <= 3.0)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(1),oTarget);
            AssignCommand(oTarget,ActionSpeakString("*Eats a Goodberry*"));
            DestroyObject(oItem);
        }
        else
            FloatingTextStringOnCreature("You need to get closer.",OBJECT_SELF,FALSE);
    }
    else if(sItem == "004Surgicaltools")
    {
        if(oTarget == OBJECT_SELF)
            FloatingTextStringOnCreature("You can't use it on yourself.",OBJECT_SELF,FALSE);
        else if((GetDistanceBetween(OBJECT_SELF,oTarget) <= 3.0))
        {
            if(GetIsFriend(OBJECT_SELF,oTarget))
            {
                int iCut = d100() + GetSkillRank(SKILL_HEAL,OBJECT_SELF);
                if(iCut <= 20)
                {
                    FloatingTextStringOnCreature("You cut something important!",OBJECT_SELF,TRUE);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(TRUE,FALSE),oTarget);
                }
                else if(20 < iCut <= 70)
                {
                    FloatingTextStringOnCreature("You did something wrong.",OBJECT_SELF,TRUE);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(d10(),DAMAGE_TYPE_PIERCING),oTarget);
                }
                else if(70 < iCut <= 80)
                {
                    FloatingTextStringOnCreature("You helped a little.",OBJECT_SELF,TRUE);
                    effect eEffect = GetFirstEffect(oTarget);
                    while (GetIsEffectValid(eEffect))
                    {
                        if (GetEffectType(eEffect) == EFFECT_TYPE_DISEASE)
                            RemoveEffect(oTarget, eEffect);
                        else if (GetEffectType(eEffect) == EFFECT_TYPE_POISON)
                            RemoveEffect(oTarget, eEffect);
                        eEffect = GetNextEffect(oTarget);
                    }
                }
                else if(80 < iCut <= 95)
                {
                    FloatingTextStringOnCreature("Not a bad job.",OBJECT_SELF,TRUE);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(d10()),oTarget);
                    effect eEffect = GetFirstEffect(oTarget);
                    while (GetIsEffectValid(eEffect))
                    {
                        if (GetEffectType(eEffect) == EFFECT_TYPE_DISEASE)
                            RemoveEffect(oTarget, eEffect);
                        else if (GetEffectType(eEffect) == EFFECT_TYPE_POISON)
                            RemoveEffect(oTarget, eEffect);
                        eEffect = GetNextEffect(oTarget);
                    }
                }
                else if(iCut > 95)
                {
                    FloatingTextStringOnCreature("An outstanding job.",OBJECT_SELF,TRUE);
                    effect eEffect = GetFirstEffect(oTarget);
                    while (GetIsEffectValid(eEffect))
                    {
                        if (GetEffectType(eEffect) == EFFECT_TYPE_DISEASE)
                            RemoveEffect(oTarget, eEffect);
                        else if (GetEffectType(eEffect) == EFFECT_TYPE_POISON)
                            RemoveEffect(oTarget, eEffect);
                        eEffect = GetNextEffect(oTarget);
                    }
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oTarget)-GetCurrentHitPoints(oTarget)),oTarget);
                }
            }
            else
                FloatingTextStringOnCreature("You can only use it on a willing target.",OBJECT_SELF,FALSE);
        }
        else
            FloatingTextStringOnCreature("You're too far away.",OBJECT_SELF,FALSE);
    }
    else if (sItem == "TrackingKit")
    {
        ExecuteScript("ranger_tracking", OBJECT_SELF);
    }
    else if(sItem == "DragontoHuman")
    {
        if(GetTag(oTarget) == "Jalanvaloss")
        {
            CreateObject(OBJECT_TYPE_CREATURE,"jalanvaloss001",GetLocation(oTarget));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_POLYMORPH),GetLocation(oTarget));
            DestroyObject(oTarget);
        }
        else if(GetTag(oTarget) == "Kessia")
        {
            CreateObject(OBJECT_TYPE_CREATURE,"jalanvaloss",GetLocation(oTarget));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_POLYMORPH),GetLocation(oTarget));
            DestroyObject(oTarget);
        }
    }
    else if(sItem == "004Copier")
    {
        if(GetLocalInt(GetModule(),"cmk_copyphase") == 0)
        {
            SetLocalObject(GetModule(),"cmk_todestroy",oTarget);
            SetLocalInt(GetModule(),"cmk_copyphase",1);
        }
        else if(GetLocalInt(GetModule(),"cmk_copyphase") == 1)
        {
            object oOld = GetLocalObject(GetModule(),"cmk_todestroy");
            object oDoppelganger = CopyObject(oTarget,GetLocation(oOld),OBJECT_INVALID,"Doppelganger");
            if(!GetIsPC(oOld))
            {
                DestroyObject(oOld);
            }
            DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_POLYMORPH),oDoppelganger));
            DelayCommand(1.0,ChangeFaction(oDoppelganger,GetObjectByTag("SourceDoppelganger")));
            object oDopItem = GetFirstItemInInventory(oDoppelganger);
            while(oDopItem != OBJECT_INVALID)
            {
                DestroyObject(oDopItem);
                oDopItem = GetNextItemInInventory(oDoppelganger);
            }
            TakeGoldFromCreature(GetGold(oDoppelganger),oDoppelganger,TRUE);
            SetLocalObject(GetModule(),"cmk_todestroy",OBJECT_INVALID);
            SetLocalInt(GetModule(),"cmk_copyphase",0);
        }
    }
    else if (sItem == "PagerWand")
    {
        DMAware_DMResponse(OBJECT_SELF);
    }
   else if(sItem =="AutoFollow")
   {
      if(GetIsObjectValid(oTarget))
      {
         AssignCommand ( oOwner, ActionForceFollowObject(oTarget));
      }
      return;
    }
    else if(sItem == "EmoteWand")
    {
        AssignCommand(oOwner, ActionStartConversation(oOwner, "emotewand", TRUE));
    }

    else if(sItem == "WandOfFX")
    {

       // get the wand's activator and target, put target info into local vars on activator
       SetLocalObject(oOwner, "FXWandTarget", oTarget);
       SetLocalLocation(oOwner, "FXWandLoc", lLoc);

       object oTest=GetFirstPC();
       string sTestName = GetPCPlayerName(OBJECT_SELF);
       // Test to make sure the activator is a DM, or is a DM
       // controlling a creature.

       while (GetIsObjectValid(oTest) == TRUE)
       {
          if (GetPCPlayerName(oTest) == sTestName && GetIsDM(oTest) == FALSE)
          {
              DestroyObject(oItem);
              SendMessageToPC(oOwner,"You are mortal and this is not yours!");
              return;
          }
          oTest=GetNextPC();
       }

      //Make the activator start a conversation with itself
      AssignCommand(oOwner, ActionStartConversation(OBJECT_SELF, "fxwand", TRUE));
      return;
    }
    else if(GetStringLowerCase(GetStringLeft(sItem,7)) == "004herb")
        ExecuteScript("cmk_herbs",OBJECT_SELF);
    else if(GetStringLowerCase(GetStringLeft(sItem,7)) == "004gren")
        ExecuteScript("cmk_grenades",OBJECT_SELF);

    ExecuteScript("cmk_pets",GetItemActivator());
*/
}


  /*****************************************************/

