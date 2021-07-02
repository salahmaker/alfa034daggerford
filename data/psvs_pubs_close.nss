//::///////////////////////////////////////////////
//:: psvs_pubs_close.nss
//:: Persistant Storage and Vault System on Close file
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
//:: Created By: Clayten Gillis (a.k.a DragonsWake)
//:: Created On: December 17, 2002
//:://////////////////////////////////////////////
#include "psvs_pubs_inc"


void main()
{
    int iNumInv = 0;
    int iConCount = 0;
    int I = 0;
    int iIPCount1 = 0;
    int iIPCount2 = 0;
    int iStackAmt = 0;
    int iPubsInvDist = 0;
    float fTime = 0.0;
    object oPC = GetLastClosedBy();
    object oTestItem;
    string sBPName = "";
    string PCKey = GetKey(oPC, 1, 0);
    string sBPRef = "";


    iUnique = 0;

    if ( (! iSingleCamp) && (! iPubsNWNX ) )
    {
        sDataName = PCKey;
    }
    else
    {
        sDataName = sCampName;

    }

    if (! PubsModule )
    {
        sPubsKey = GetKey(OBJECT_SELF, 0, 0);
        if ( ( iPubsNWNX )  && (! iPCGlobal ) )
        {
            sPubsKey += GetKey(oPC, 0, 0);
        }
    }
    else
    {
        sPubsKey = "";

        if ( ( iPubsNWNX ) && (! iPCGlobal ) )
        {
            sPubsKey += GetKey(oPC, 0, 0);
        }
    }

    if ( iPCGlobal )
    {
        sPubsKey += GetKey(oPC, 0, 0);
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
    string UsingPC = GetLocalString(OBJECT_SELF, "PCUsingChest");
    iCurUse = GetTimeMillisecond();
    iLastUse = GetLocalInt(OBJECT_SELF, sPubsEventTime);
    SetLocalInt(OBJECT_SELF, sPubsEventTime, iCurUse);
    if ( (iCurUse == iLastUse))
    {
        ResetBank(OBJECT_SELF);
        return;
    }
    if ( TestStringAgainstPattern(UsingPC, PCKey) == FALSE )
    {
        return;
    }

    // Remove any other PC's that have opened chest except for the first PC so we can close
    //ClearVault(OBJECT_SELF);



    // If Inventory has not been disturbed just delete items in Chest
    if ( ((!iDelGet) || (! iPubsNWNX)) && (!iConvData) )
    {
        iPubsInvDist = GetLocalInt(OBJECT_SELF, sPubsDist);

        if ( iPubsInvDist == 0 )
        {
            if (Debug)
            {
                SendMessageToPC(oPC, "Inventory Not Disturbed" );
            }

            if ( iPubsNWNX )
            {
                iNumInv = GetNWNxInt(oItemID, sPubsKey + sPubsCount, sPubsX);
            }
            else
            {
                iNumInv = GetCampaignInt(sDataName, sPubsKey + sPubsCount, oItemID);
            }

            oCurInvObj = GetFirstItemInInventory(OBJECT_SELF);

            while ( GetIsObjectValid(oCurInvObj) == TRUE )   //Begin Processing Item in Inventory
                {
                DestroyObject(oCurInvObj, fTime);

                //Debug
                if (Debug)
                {
                    SendMessageToPC(oPC, "Item Destroyed" );
                }

                oCurInvObj = GetNextItemInInventory(OBJECT_SELF);
            }

            SetLocalInt(OBJECT_SELF, "ChestNotOpen", 1);
            SetLocked(OBJECT_SELF, TRUE);
            DelayCommand(5.0f,UnlockChest(OBJECT_SELF));
            return;
        }
    }


    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "On CLOSE ROUTINE");
        SendMessageToPC(oPC, sPubsKey);
    }

    oCurInvObj = GetFirstItemInInventory(OBJECT_SELF);

    while ( GetIsObjectValid(oCurInvObj) == TRUE || GetResRef(oCurInvObj) == "nw_it_gold001")   //Begin Processing Item in Inventory
    {

        iNumInv = iNumInv + 1;

        sBPName = GetResRef(oCurInvObj);
        if ( sBPName == "" )
        {

                iUnique = 1;
                sBPName = "UNIQUE";
                if (Debug)
                {
                    SendMessageToPC(oPC, "Item Unique: No ResRef");
                }

        }
        else
        {
            //oTestItem = CreateItemOnObject(sItemName, OBJECT_SELF, 1);
            oTestItem = CreateObject( OBJECT_TYPE_ITEM, sBPName, GetLocation(OBJECT_SELF), FALSE);
            if ( GetIsObjectValid(oTestItem) )
            {
                iUnique = 0;
            }
            else
            {

                iUnique = 1;
                sBPName = "UNIQUE";
                if (Debug)
                {
                    SendMessageToPC(oPC, "Item Unique: ResRef but not ValidObject when recreated");
                }
            }
            if ( ! iUnique )
            {
                iIPCount1 = IPGetNumberOfItemProperties(oCurInvObj);
                iIPCount2 = IPGetNumberOfItemProperties(oTestItem);
                if ( iIPCount1 != iIPCount2 )
                {
                    iUnique = 1;
                    sBPName = "UNIQUE";
                    if (Debug)
                    {
                        SendMessageToPC(oPC, "Item Unique: Has Dynamic Properties");
                        SendMessageToPC(oPC, "iIPCount1: " + IntToString(iIPCount1));
                        SendMessageToPC(oPC, "iIPCount2: " + IntToString(iIPCount2));
                    }
                }
                else
                {

                    iUnique = 0;
                }

            }
            DestroyObject(oTestItem, 0.0f);

        }
        if ( sBPName == "nw_it_gold001")
        {
            iNumInv = EncodeGold(oPC, oCurInvObj, iNumInv, sBPName, sDataName, sPubsKey);

        }
        else
        {
            //Debug
            if (Debug)
            {
                SendMessageToPC(oPC, "----------");
                SendMessageToPC(oPC, "StackNum: "+IntToString(GetNumStackedItems(oCurInvObj)));
                SendMessageToPC(oPC, "----------");
            }

            if (GetHasInventory(oCurInvObj) == TRUE )
            {
                iConCount = EncodeContainer(oPC, oCurInvObj, iNumInv, sBPName, sDataName, sPubsKey, iUnique);

                //Debug
                if (Debug)
                {
                   SendMessageToPC(oPC, "iNumInv: "+IntToString(iNumInv));
                    SendMessageToPC(oPC, "iConCount: "+IntToString(iConCount));
                }

                while ( iNumInv < (iConCount - iHeaderCount) )
                {
                    //Debug
                    if (Debug)
                    {
                        SendMessageToPC(oPC, "iNumInv: "+IntToString(iNumInv));
                    }

                    oCurInvObj = GetNextItemInInventory(OBJECT_SELF);
                    iNumInv = iNumInv + 1;
                }
                iNumInv = iConCount;
            }
            else
            {
                if (GetNumStackedItems(oCurInvObj) > 1)
                {
                    iNumInv = EncodeStackItem(oPC, oCurInvObj, iNumInv, sDataName, sPubsKey, iUnique);
                }
                else
                {
                    if (sBPName != "chestdaemon")
                    {
                        EncodeItem(oPC, oCurInvObj, iNumInv, sBPName, sDataName, sPubsKey, iUnique);
                    }
                }
            }
        }


        oCurInvObj = GetNextItemInInventory(OBJECT_SELF);


    }

    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "PubsCount: "+IntToString(iNumInv) );
    }

    if ( iPubsNWNX )
    {
        SetNWNxInt(oItemID, sPubsKey + sPubsCount, iNumInv, sPubsX);
    }
    else
    {
        SetCampaignInt(sDataName, sPubsKey + sPubsCount, iNumInv, oItemID);
    }

    //AssignCommand(oPC, ActionMoveAwayFromObject(OBJECT_SELF, FALSE, 5.0));
    // Clean UP Items in Bank Chest

    oCurInvObj = GetFirstItemInInventory(OBJECT_SELF);

    while ( GetIsObjectValid(oCurInvObj) == TRUE )   //Begin Processing Item in Inventory
    {
        DestroyObject(oCurInvObj, fTime);

        //Debug
        if (Debug)
        {
            SendMessageToPC(oPC, "Item Destroyed" );
        }

        oCurInvObj = GetNextItemInInventory(OBJECT_SELF);
    }

    SetLocalInt(OBJECT_SELF, "ChestNotOpen", 1);

    SetLocked(OBJECT_SELF, TRUE);
    DelayCommand(5.0f,UnlockChest(OBJECT_SELF));

    //iBankChestNotOpen = 1;
    //sPCUsingChest = "";

}
