void main()
{

SetListening( OBJECT_SELF, TRUE);
SetListenPattern( OBJECT_SELF, "Rename:**",101);
SetListenPattern( OBJECT_SELF, "Description:**",102);
SetListenPattern( OBJECT_SELF, "Appearance:**",103);
SetListenPattern( OBJECT_SELF, "NPCRename:**",104);
SetListenPattern( OBJECT_SELF, "Description+:**",105);
SetListenPattern( OBJECT_SELF, "NPCDesc:**",106);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectUltravision(), OBJECT_SELF, 99999.9);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectTrueSeeing(), OBJECT_SELF, 99999.9);
//ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectParalyze(), OBJECT_SELF, 99999.9);
//ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectInvisibility(INVISIBILITY_TYPE_IMPROVED), OBJECT_SELF, 99999.9);
                                                 }
