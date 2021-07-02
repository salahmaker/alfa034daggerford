void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
        SpeakString("You feel the healing of Eldath!");
        ActionCastSpellAtObject(SPELL_HEAL, oPC);
    }
}
