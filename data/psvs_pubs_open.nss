//::///////////////////////////////////////////////
//:: psvs_pubs_open.nss
//:: Persistant Storage and Vault System on Open file
//:: Version 2.0
//:://////////////////////////////////////////////
/*
  1.0 Orginal Version
  1.1 Fixed problem with multiple opens where items from
      First opener where assign to Second, third, etc PC.
      OnDisturb checks to see if PC Adding/Removing items
      is the orginal Opener.  Returns items if not.
  1.2 Made workaround for Blank Template Problem.  OnDistrub returns
      any items or Containers that have or contain a blank Template
      returned by GetResRef() function back to original PC.
      Made workaround for Multiple PC problem.  Any PC opening Chest
      other then original PC will be teleported to the closest waypoint
      (WP_BankLobby) and told to wait their turn. :)
  1.3 Fixed Blank Template Bug.  Items that are split or bought from
      Merchants can now be placed into the Bank Vault.
      Fixed problem where item were being listed as unidentified even though
      they were list as ID when placed into Bank Vault.
  1.4 Added a Storage Limit variable to limit items per PC that can be stored
      into Bank Chest.  Currently set to 20.  Change the iStorageLimit variable
      in the bank_inc.nss file to increase/decrease.
  1.5 Fixed problem where gold was duplicating or dissapearing when adding more
      then 50000 gold pieces to the Bank Chest.  Changed Bank Chest so that you
      don't need a WayPoint to transport any additonal PC's trying to access chest
      after the first.
  1.6 Added the ability to switch the Bank Chest(s) to be either Module wide Chests
      (the same items appear no matter what Area you are in the Module), or Local
      Chests (Items are stored in a Area can only be retrieved in that Area).  These
      options are controled by the "BankModule" variable in the Bank_inc.nss file.
      Added a switch that will store all PC Bank Vault data into a single database,
      (default "BankVault"), or create a seperate database for each Players's PC.
      This should help in Persistent Worlds with cleaningup character data.
      This is controlled with the "iSingleCamp" variable in the Bank_inc.nss file.
  1.7 Added ablility to store unique objects that are not in the Module Pallette (aka no ResRef).
      PC's can now store items from other modules into the BankVault.  Added a
      Anti-spam fixed to prevent users from duplicating items in BankVault.
  1.8 Added Hash code for Database tag names to break 32 character barrier in both Bank Vault
      and Personal Vault.  NOTE: This makes version 1.8 uncompatible with any previous versions
      of Bank Vault.  NEW: Personal Storage Vaults with Access Control.  You can now
      assign a Vault to a indiviual owner.  This owner can specify his own set of friends
      that can access his/her Vault all in game and real time.  See instructions.
  1.9 Added the ability to switch the Bank Chest(s) to either have a seperate Vault
      for each Player's PC or to have a single Vault Space shared by every PC a Player
      creates. This is controlled with the "iPCGlobal" variable in the Bank_inc.nss file.
      Added the ability for the user to identify the Player by either his/her Player Name
      or by his/her Public CD Key.  This is controlled with the "iCDKey" variable in the
      Bank_inc.nss file.  This ability is only valid if you are using a single Vault Space.
      Fixed a duping exploit.
*/
//:://////////////////////////////////////////////
//:: Created By: Clayten Gillis (a.k.a. DragonsWake)
//:: Created On: December 17, 2002
//:://////////////////////////////////////////////
#include "psvs_pubs_inc"

void main()
{
    int iInvCount = 0;
    int iID;
    int I = 0;
    int iPubsCount = 0;
    int iPause = 0;
    object oPC = GetLastOpenedBy();   // Get Last Opened by PC
    string sPCName = GetKey(oPC, 1, 0);
    string sBPRef;
    int iPubsInvDist = 0;
    int iDoConv = 0;
    iCurUse = GetTimeMillisecond();
    iLastUse = GetLocalInt(OBJECT_SELF, sPubsEventTime);
    SetLocalInt(OBJECT_SELF, sPubsEventTime, iCurUse);

        if ( (! iSingleCamp) && (! iPubsNWNX ) )
        {
            sDataName = sPCName;
            if ( iConvData )
            {
                sConvName = sPCName;
            }
        }
        else
        {
            sDataName = sCampName;
            if ( iConvData )
            {
                sConvName = sCampConv;
            }
        }

        if ( ! PubsModule )
        {
            sPubsKey = GetKey(OBJECT_SELF, 0, 0);
            if ( ( iPubsNWNX )  && (! iPCGlobal ) )
            {
                sPubsKey += GetKey(oPC, 0, 0);
            }

            if ( iConvData )
            {
                sBankKey = GetKey(OBJECT_SELF, 0, iConvData);
            }
        }
        else
        {
            sPubsKey = "";
            if ( ( iPubsNWNX) && (! iPCGlobal ) )
            {
                sPubsKey += GetKey(oPC, 0, 0);
            }
            if ( iConvData )
            {
                sBankKey = "";
            }
        }

        if ( iPCGlobal == 1 )
        {
            sPubsKey += GetKey(oPC, 0, 0);
            if ( iConvData )
            {
                sBankKey += GetKey(oPC, 0, iConvData);
            }

        }

        if (Debug)
        {
            SendMessageToPC(oPC, "sPubsKey: "+sPubsKey);
        }
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }

    if ( (iCurUse == iLastUse) )
    {
        ResetBank(OBJECT_SELF);
        return;
    }

    iPubsFirstTime = GetLocalInt(OBJECT_SELF, sPubsFirst);

    if (Debug)
    {
        SendMessageToPC(oPC, "FirstTime1: "+IntToString(iPubsFirstTime));
    }

    if ( iPubsFirstTime == FALSE )
    {
        //SetCampaignInt(sCampName, IntToString(HashID("ChestNotOpen"+sPubsKey)), 1, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "ChestNotOpen", 1);
        //SetLocked(OBJECT_SELF, FALSE);
        SetLocalInt(OBJECT_SELF, sPubsFirst, 1);
    }

    if (Debug)
    {
        SendMessageToPC(oPC, "FirstTime2: "+IntToString(iPubsFirstTime));
    }


    //int iChestNotOpen = GetCampaignInt(sCampName, IntToString(HashID("ChestNotOpen"+sPubsKey)), OBJECT_SELF);
    int iChestNotOpen = GetLocalInt(OBJECT_SELF, "ChestNotOpen");

    if (Debug)
    {
        SendMessageToPC(oPC, "ChestNotOpen: "+IntToString(iChestNotOpen));
    }

    if ( iChestNotOpen == FALSE )
    {
        object oPC = GetLastOpenedBy();   // Get Last Opened by PC
        AssignCommand(oPC, ActionMoveAwayFromObject(OBJECT_SELF, FALSE, 5.0));
        //object oTransport = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, 1);
        //location lLoc = GetLocation(oTransport);
        //AssignCommand(oPC,JumpToLocation(lLoc));
        SendMessageToPC(oPC, "This Bank Vault is in use.  Please wait your turn.");
        return;
    }


        SetLocalInt(OBJECT_SELF, sPubsDist, iPubsInvDist);
        SetLocalInt(OBJECT_SELF, "ChestNotOpen", 0);

        SetLocalString(OBJECT_SELF, "PCUsingChest", sPCName);

        //iBankChestNotOpen = 0;
        //sPCUsingChest = GetKey(oPC);


        if ( iPubsNWNX )
        {
            iPubsCount = GetNWNxInt(oItemID, sPubsKey + sPubsCount, sPubsX);
        }
        else
        {
            iPubsCount = GetCampaignInt(sDataName, sPubsKey + sPubsCount, oItemID);
            if ( iConvData )
            {
                if ( iPubsCount == 0 )
                {
                    sDataName = sCampConv;
                    sPubsKey = sBankKey;
                    iPubsCount = GetCampaignInt(sDataName, IntToString(HashIDOld("BankCount" + sBankKey)), oItemID);
                    if ( iPubsCount != 0 )
                    {
                            iDoConv = 1;


                    }
                }
            }
        }

        //Debug
        if (Debug)
        {
            SendMessageToPC(oPC, "On OPEN ROUTINE");
            SendMessageToPC(oPC, "PubsCount: "+ IntToString(iPubsCount) );
            SendMessageToPC(oPC, "PubsKey: "+sPubsKey);
        }

        //Warning Message
        //SendMessageToPC(oPC,"WARNING!: Do NOT press the 'I' Key while this Chest is open.");

        if ( iPubsCount != 0)
        {
            while ( I != iPubsCount)
            {
                I++;


                if ( iPubsNWNX )
                {
                    sBPRef = GetNWNxString(oItemID, sPubsKey + sPubsBP + IntToString(I), sPubsX);
                }
                else
                {
                    if ( (iConvData && iDoConv) )
                    {
                        sBPRef = GetCampaignString(sDataName, IntToString(HashIDOld(sBankBP + IntToString(I)+ sBankKey)), oItemID );
                    }
                    else
                    {
                        sBPRef = GetCampaignString(sDataName, sPubsKey + sPubsBP + IntToString(I), oItemID );
                    }
                }

                //Debug
                if (Debug)
                {
                    SendMessageToPC(oPC, "Item#: "+IntToString(I) );
                    SendMessageToPC(oPC, "ResRef: "+sBPRef);
                }


                if ( sBPRef != "nw_it_gold001" )
                {
                    if (sBPRef == "CONTAIN")
                    {
                        I = DecodeContainer(oPC, OBJECT_SELF, sBPRef, I, sDataName, sPubsKey, 0, iDoConv);

                    }
                    else
                    {
                        if (sBPRef == "CONTAINUNQ")
                        {
                            I = DecodeContainer(oPC, OBJECT_SELF, sBPRef, I, sDataName, sPubsKey, 1, iDoConv);

                        }
                        else
                        {
                            if ( sBPRef == "STACK")
                            {
                                I = DecodeStackItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sPubsKey, 0, iDoConv);
                            }
                            else
                            {
                                if ( sBPRef == "STACKUNQ")
                                {
                                    I = DecodeStackItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sPubsKey, 1, iDoConv);
                                }
                                else
                                {
                                    if ( sBPRef == "UNIQUE")
                                    {
                                        oCurInvObj = DecodeItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sPubsKey, 1, iDoConv);
                                    }
                                    else
                                    {
                                        oCurInvObj = DecodeItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sPubsKey, 0, iDoConv);
                                    }
                                }
                            }
                        }
                    }


                }
                else
                {

                    DecodeGold(oPC, OBJECT_SELF, I, sBPRef, sDataName, sPubsKey, iDoConv);
                  //  DeletePersistentInt(oPC, sBankGold );


                }

             //   DeletePersistentString(oPC, sBankBP + IntToString(I) );

            }

        }


}
