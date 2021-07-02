////////////////////////////////////////////////////////////////////////////////
//
//  System Name : BW function overrides
//     Filename : alfa_overrides_i
//      Version : 1.0
//         Date : 5/11/06
//       Author : Ronan
//
//  Local Variable Prefix = None
//
//  Description
//  This file is where ALFA's overrides of NWN's functions should go.
//
//  Revision History
//  1.0:
//      Added GetIsSkillSuccessful(), to correct the bug introduced in 1.67
//      with the use of that function on a linux server (it always returns
//      false).
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// Returns true if 1d20 roll + skill rank is greater than or equal to difficulty
// - oTarget: the creature using the skill
// - nSkill: the skill being used
// - nDifficulty: Difficulty class of skill
// NOTE: This is a function overriden by ALFA to correct for a bug introduced
// in 1.67 on linux servers.
int GetIsSkillSuccessful(object oTarget, int nSkill, int nDifficulty);

// Format and send a "Skill Roll" message to oPC.
void SendSkillRollMessageToPC(object oPC, int nSkill, int nSkillRank, int nSkillRoll, int nDC, int nResult);

// Replace <CUSTOMX> in sOrig by sReplaceWith where X is nNum
string ReplaceCustomToken(string sOrig, int nNum, string sReplaceWith);

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

int GetIsSkillSuccessful(object oTarget, int nSkill, int nDifficulty) {
  int nSkillRank, nSkillRoll;

  /* Sanity checks */
  if (!GetIsObjectValid(oTarget) ||
       nSkill < 0 || nDifficulty < 0)
    return FALSE; /* Invalid arguments, silent auto-fail. */
  /* Get skill rank/roll */
  nSkillRank = GetSkillRank(nSkill, oTarget);
  nSkillRoll = d20();
  /* Is success possible? */
  if (nSkillRank + 20 < nDifficulty) {
    SendSkillRollMessageToPC(oTarget, nSkill, nSkillRank, nSkillRoll, nDifficulty, -1);
    return FALSE; /* Success not possible */
  }
  /* Is skill check a failure? */
  if (nSkillRank + nSkillRoll < nDifficulty) {
    SendSkillRollMessageToPC(oTarget, nSkill, nSkillRank, nSkillRoll, nDifficulty, 0);
    return FALSE; /* Failure */
  }
  SendSkillRollMessageToPC(oTarget, nSkill, nSkillRank, nSkillRoll, nDifficulty, 1);
  return TRUE; /* Success */
}

void SendSkillRollMessageToPC(object oPC, int nSkill, int nSkillRank, int nSkillRoll, int nDC, int nResult) {
  string sMsg, sSkillName, sResult;
  /* Note: Should have no language-related issues with this. */
  /* StrRef 10484:
   * <CUSTOM0> : <CUSTOM1> : *<CUSTOM2>* : (<CUSTOM3> <CUSTOM4> <CUSTOM5> = <CUSTOM6> vs. DC: <CUSTOM7>)
   * <Name> : <Skill Name> : *<Result>* : (<Roll> <+-> <Rank> = <Total> vs. <DC>) */
  sMsg = GetStringByStrRef(10484);
  /* Skill Name */
  sSkillName = Get2DAString("skills", "Name", nSkill);
  sSkillName = (sSkillName == "" ? "???" : GetStringByStrRef(StringToInt(sSkillName)));
  /* Result */
  if (nResult == 0)
    sResult = GetStringByStrRef(5353); /* failure */
  else if (nResult == 1)
    sResult = GetStringByStrRef(5352); /* success */
  else
    sResult = GetStringByStrRef(8101); /* success not possible */
  /* Replace tokens */
  sMsg = ReplaceCustomToken(sMsg, 0, "<cPþþ>" + GetName(oPC) + "<c fþ>"); /* Light+Dark blue */
  sMsg = ReplaceCustomToken(sMsg, 1, sSkillName);
  sMsg = ReplaceCustomToken(sMsg, 2, sResult);
  sMsg = ReplaceCustomToken(sMsg, 3, IntToString(nSkillRoll));
  sMsg = ReplaceCustomToken(sMsg, 4, (nSkillRank >= 0 ? "+" : "-"));
  sMsg = ReplaceCustomToken(sMsg, 5, IntToString(abs(nSkillRank)));
  sMsg = ReplaceCustomToken(sMsg, 6, IntToString(nSkillRoll + nSkillRank));
  sMsg = ReplaceCustomToken(sMsg, 7, IntToString(nDC));
  /* Send messages */
  FloatingTextStringOnCreature(sSkillName + ": *" + sResult + "*", oPC, FALSE);
  SendMessageToPC(oPC, sMsg);
}

string ReplaceCustomToken(string sOrig, int nNum, string sReplaceWith) {
  int nPos;
  string sToken;
  sToken = "<CUSTOM" + IntToString(nNum) + ">";
  nPos = FindSubString(sOrig, sToken);
  if (nPos < 0)
    return sOrig;
  return
    GetStringLeft(sOrig, nPos) +
    sReplaceWith +
    GetStringRight(
      sOrig,
      GetStringLength(sOrig) - nPos - GetStringLength(sToken)
    );
}
