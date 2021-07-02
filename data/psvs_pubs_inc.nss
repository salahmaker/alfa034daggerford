//::///////////////////////////////////////////////
//:: psvs_pubs_inc.nss
//:: Persistant Storage and Vault System
//:: Version 2.0
//:://////////////////////////////////////////////
/*

    Include Functions for programs used in storing and retreiving
    items in a NWN module.

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

#include "nw_o0_itemmaker"
#include "x2_inc_itemprop"
#include "psvs_nwnx_inc"



// Variable Declarations

// Debug:
// Print Debug Statements.  Set to '1' to Print Debug statements to PC
// Relocated to "psvs_nwnx_inc"
//int Debug = 1;

// PubsModule:
// Set PubsModule = 1 for Module wide Storage. Set Module = 0 for Local Storage.
const int PubsModule = 1;

// iStorageLimit:
// Storage Limit for Bank Chest.  This limits how many items per PC that can be stored.
const int iStorageLimit = 20;

// sCampName:
// Campaign Name for Public Vault.  Default is PubsVault
const string sCampName = "PubsVault"; // Stores object Data
const string sObjectID = "ObjectIDs"; // Stores object ID's
const string sPubsX = "vault";  // Name of Table to use in NWNX database to store objects.
const string sPubsXOID = "objectid"; // Name of Table to use in NWNX database to object ID's.

// iSingleCamp:
// Single Campaign Database.  If set to 1 it will open a single Database called
// "PubsVault".  If set to 0 it will open a database for each individual PC.
// For Bioware DB Only.
const int iSingleCamp = 1;

// iPCGlobal:
// Set Value for Global Indentifier on Bank Chest.
// 0 = Uses PC Player Name and PC Name for ID. Most unique solution. Each PC created
// by player has his/her own Vault space
// 1 = Uses PC Player Name or PC Public CD Key only for ID.  Each PC created by Player shares a single
// Vault space
const int iPCGlobal = 0;

// iCDKey:
// Specify if you want to use 1 = Public CD Key or 0 = PC Player Name.
const int iCDKey = 0;

// iPubsDoHash:
// Specify if you want to calculate a hash for GetKey or use a Database Sequence Number
const int iPubsDoHash = 0;

// iPubsUnique:
// Specify if you want to store "Unique" items via Store/Retrieve CampaignObject
// 1 = Allow Unique Item Storage
// 0 = Do not allow Unique Item Storage
const int iPubsUnique = 1;

// iPubsNWNX:
// Specify if you want to use Bioware DB or NWNX
// 1 = Use NWNX
// 0 = Use Bioware DB
const int iPubsNWNX = 1;

// iConvData:
// Convert data from 1.9b to 2.0
// 1 = Check for 1.9b records and convert
// 0 = Do not check for 1.9b records.
const int iConvData = 0;


// Set the Chest to being opened for the first time (Do Not Modify)
int iPubsFirstTime = 0;
int iCurUse;
int iLastUse;


// Internal Identifiers of storage variables. (Do Not Modify)


string sSeqNum = "SequenceNumber";

string sPubsBP = "PubsItemBP";
string sPubsUQ = "PubsItemUQ";
string sPubsItemID = "PubsItemID";
string sPubsGold = "PubsGold";
string sPubsStack = "PubsStkAmt";
string sPubsFirst = "PubsFrist";
string sPubsCount = "PubsItemCount";
string sPubsDist = "PubsDist";

int iHeaderCount = 0;
int iStackAmt = 0;
object oCurInvObj;
object oItemID;
string sDataName = "";
string sPubsKey = "";
string sPubsEventTime = "PubsEvent";
int iUnique = 0;
int iTotalLen;
int iAscii;
int iHashCount;
int iMasque = 1;
const string HASH_INDEX = "#i!j$k%l{&M/n(o)p=q?r^Xs`Tu'v]AwBxCyDzE1F2-G3t;4I}5Y:J6_K7+Z[Lm9N\ l0kOjPhQ,gRfSeHdU8cVbWa.";
const int HASH_PRIME = 3021377;
string sHashTable = " ! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}";

// 1.9b conversion storage variables. (Do Not Modify)
string sCampConv = "BankVault";
string sBankBP = "BankItemBP";
string sBankUQ = "BankItemUQ";
string sBankItemID = "BankItemID";
string sBankGold = "BankGold";
string sBankStack = "BankStkAmt";
string sBankFirst = "BankFrist";
string sBankKey = "";
string sConvName = "";



// Return either a mathmatical hash or a sequence number based
// on data provide by GetKey();
int HashID(string sIDString, object oTarget);

// Return a unique string vaule (Key) based on object provided
string GetKey(object oTarget, int iOpenTest, int iConvert);

// Take Gold and encode it into a retrievable Gold database record
int EncodeGold (object oPC, object oCurItem, int iItemCount, string sItemName, string sDBName, string sAreaKey);

// Take an Item object and encode it into a retrievable Item database record
void EncodeItem (object oPC, object oCurItem, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq);

// Take a Stackable Item and encode it into a retrievable Stackable Item database record
int EncodeStackItem (object oPC, object oCurItem, int iItemCount, string sDBName, string sAreaKey, int iItemUnq);

// Process a container with X items and encode the container as a Container database
// record and use EncodeItem() to encode the items int he container.
int EncodeContainer (object oPC, object oCurItem, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq);

// Take a Gold database record and decode it into Gold.
void DecodeGold (object oPC, object oCurContainer, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iDoConv);

// Take an Item database record and decode it into an Item Object
object DecodeItem (object oPC, object oCurContainer, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq, int iDoConv);

// Take a Stackable Item database record and decode it into a Stackable Object
int DecodeStackItem (object oPC, object oCurContainer, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq, int iDoConv);

// Take a Container database record a decode it into a Container Object.  Then
// decode the Item databases records for that container using DecodeItem().
int DecodeContainer (object oPC, object oCurContainer, string sItemName, int iItemCount, string sDBName, string sAreaKey, int iItemUnq, int iDoConv);

// depreciated.  Reset the Storage Chest
void ResetBank (object oBank);

// depreciated.  Clear a Vault.
void ClearVault (object oChest);

// Unlock a Storage Chest
void UnlockChest(object oChest);

// 1.9b Hash Function
int HashIDOld(string sIDString);

// *********
// Functions
// *********

int HashIDOld(string sIDString)
{
    int iHash = 1299827;
    iHashCount = 0;
    iTotalLen = GetStringLength(sIDString);
    while ( iHashCount != iTotalLen )
    {
        iHashCount++;
        iAscii = 31 + FindSubString(sHashTable, GetSubString(sIDString, iHashCount, 1));
        iHash += iAscii << (8 * ((iHashCount - 1) & iMasque));

    }
    return iHash;
}


int HashID(string sIDString, object oTarget)
{
    int iHashcode = 0;
    int iSeqNum = 0;
    int i;
    int iChar;
    int iLen;


    if (iPubsDoHash)  // Calculate Hash as Key
    {

        iLen = GetStringLength(sIDString);

        for(i=0;i<iLen;i++)
        {
            iChar = FindSubString(HASH_INDEX, GetSubString(sIDString,i,1));
            if(iChar == -1) return -1;
            iHashcode = ((iHashcode<<5) ^ (iHashcode>>27)) ^ iChar;
        }

    }
    else // Generate Sequence Number for Key
    {

        if ( iPubsNWNX )
        {
            iHashcode = GetNWNxKey(oTarget, sPubsXOID, FALSE, iPCGlobal, iCDKey);
        }
        else
        {
            iHashcode = GetCampaignInt(sObjectID, sIDString, OBJECT_SELF);

            if ( iHashcode == 0 )
            {
                iSeqNum = GetCampaignInt(sObjectID, sSeqNum, OBJECT_SELF);

                if ( iSeqNum == 0 ) // If Sequence Number Doesn't exist.  Initialize.
                {
                    iSeqNum = 10001;
                    SetCampaignInt(sObjectID, sSeqNum, iSeqNum, OBJECT_SELF);

                }
                else
                {
                    iSeqNum++;
                    SetCampaignInt(sObjectID, sSeqNum, iSeqNum, OBJECT_SELF);
                }

                SetCampaignInt(sObjectID, sIDString, iSeqNum, OBJECT_SELF);
            }
        }
    }
    if (Debug)
    {
        SendMessageToPC(oTarget, "Hashcode: " + IntToString(iHashcode));
        SendMessageToPC(oTarget, "SeqNum: " + IntToString(iSeqNum));

    }
    return iHashcode;

}


// GetKey() Taken from PWDB Include written by Valerio Santinelli - tanis@mediacom.it
// Determine an Object's key. Modified by Dragonswake.

string GetKey(object oTarget, int iOpenTest, int iConvert)
{
    string sKey = "";
    string sLookup = "";
    string sTmp1 = "";
    string sTmp2 = "";
    int iStrLen1;
    int iStrLen2;
    int iStrLen3;
    int iSeqNum;
    int iSeqID;



    if (iOpenTest)
    {
        sKey = GetPCPlayerName(oTarget)+ GetName(oTarget);
        return sKey;
    }

// Key for version 1.9b
    if ( iConvert )
    {

        if (GetIsPC(oTarget))
        {
            if ( iPCGlobal == 0 )
            {
                sKey = GetPCPlayerName(oTarget) + "_" + GetName(oTarget);
            }
            else
            {
                if ( iCDKey == 0 )
                {
                    sKey = GetPCPlayerName(oTarget);
                    SendMessageToPC(oTarget, "Key1: "+sKey);
                }
                else
                {
                    if ( iCDKey == 1 )
                    {
                        sKey = GetPCPublicCDKey(oTarget);
                        SendMessageToPC(oTarget, "Key2: "+sKey);
                    }
                }
            }
            if (iOpenTest)
            {
                sKey = GetPCPlayerName(oTarget) + "_" + GetName(oTarget);
            }

        }
        else
        {
            //location lLoc = GetLocation(oTarget);
            //vector vLoc = GetPositionFromLocation(lLoc);
            //int iVec1 = FloatToInt(vLoc.x);
            //int iVec2 = FloatToInt(vLoc.y);
            //int iVec3 = FloatToInt(vLoc.z);
            object oArea = GetArea(oTarget);
            string sAreaName = GetName(oArea);
            //string sLoc = IntToString(iVec1) + IntToString(iVec2) + IntToString(iVec3);
            sKey = GetTag(oTarget) + sAreaName;
    //       + GetName(oTarget)
        }
        return sKey;

    }

// Key for version 2.0

    if ( (iPubsNWNX) && (! iPubsDoHash) )
    {
        sKey = IntToString(HashID( sLookup, oTarget));
        return sKey;

    }

    if (GetIsPC(oTarget))
    {
        if ( iPCGlobal == 0 )
        {
            sTmp1 = GetPCPlayerName(oTarget);
            sTmp2 = GetName(oTarget);

            if (iPubsDoHash == 0 )
            {

                iStrLen1 = GetStringLength(sTmp1);
                iStrLen2 = GetStringLength(sTmp2);

                if ( iStrLen1 > 16)
                {
                    sLookup = GetStringLeft(sTmp1, 16);
                }
                else
                {
                    sLookup = GetStringLeft(sTmp1, iStrLen1);
                }

                iStrLen3 = GetStringLength(sLookup);

                if ( ( iStrLen3 + iStrLen2) > 32 )
                {
                    sLookup += GetStringLeft(sTmp2, (32 - iStrLen1));
                }
                else
                {
                    sLookup += sTmp2;
                }
            }
            else
            {
                sLookup = sTmp2 + "#" + sTmp2;
            }


            sKey = IntToString( HashID(sLookup, oTarget));
            if (Debug)
            {
                DebugSpeak("GKey: "+sKey);
            }
        }
        else
        {
            if ( iCDKey == 0 )
            {
                sKey = IntToString( HashID(GetPCPlayerName(oTarget), oTarget) );
                if (Debug)
                {
                    DebugSpeak("Key1: "+sKey);
                }
            }
            else
            {
                if ( iCDKey == 1 )
                {
                    sKey = IntToString( HashID(GetPCPublicCDKey(oTarget), oTarget) );
                    if (Debug)
                    {
                        DebugSpeak("Key2: "+sKey);
                    }
                }
            }
        }


    }
    else
    {
        //location lLoc = GetLocation(oTarget);
        //vector vLoc = GetPositionFromLocation(lLoc);
        //int iVec1 = FloatToInt(vLoc.x);
        //int iVec2 = FloatToInt(vLoc.y);
        //int iVec3 = FloatToInt(vLoc.z);
        object oArea = GetArea(oTarget);

        sTmp1 = GetName(oArea);  // was GetName
        sTmp2 = GetTag(oTarget);

        if (iPubsDoHash == 0 )
        {
            iStrLen1 = GetStringLength(sTmp1);
            iStrLen2 = GetStringLength(sTmp2);

            if ( iStrLen1 > 16)
            {
                sLookup = GetStringLeft(sTmp1, 16);
            }
            else
            {
                sLookup = GetStringLeft(sTmp1, iStrLen1);
            }

            iStrLen3 = GetStringLength(sLookup);

            if ( ( iStrLen3 + iStrLen2) > 32 )
            {
                sLookup += GetStringLeft(sTmp2, (32 - iStrLen1));
            }
            else
            {
                sLookup += sTmp2;
            }
        }
        else
        {
            sLookup = sTmp1 + "#" + sTmp2;
        }
        sKey = IntToString( HashID(sLookup, oTarget));
        if (Debug)
        {
            DebugSpeak("GKey: "+sKey);
        }
        //string sLoc = IntToString(iVec1) + IntToString(iVec2) + IntToString(iVec3);
        //sKey = GetTag(oTarget) + sAreaName;
//       + GetName(oTarget)
    }
    if (Debug)
    {
       DebugSpeak("HashStr: "+sLookup);
    }
    return sKey;
}

int EncodeGold (object oPC, object oCurItem, int iItemCount, string sItemName, string sDBName, string sAreaKey)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    iStackAmt = GetNumStackedItems(oCurItem);
    if (iStackAmt > 50000)
    {
        int i;
        int iDivision = iStackAmt / 50000;
        int iModulo = iStackAmt % 50000;
        for (i = 0; i < iDivision; i++)
        {

            if ( iPubsNWNX )
            {
                SetNWNxInt(oItemID, sAreaKey + sPubsGold + IntToString(iItemCount), 50000, sPubsX);
                SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, sPubsX);
            }
            else
            {
                SetCampaignInt(sDBName, sAreaKey + sPubsGold + IntToString(iItemCount), 50000, oItemID);
                SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, oItemID);
            }
            iItemCount = iItemCount + 1;

            if (Debug)
            {
                SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
                SendMessageToPC(oPC, "This is Gold. StackSize "+IntToString(50000));
                SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
                SendMessageToPC(oPC, "ResRef: "+sItemName);
                SendMessageToPC(oPC, "----------");
            }
        }

        if ( iPubsNWNX )
        {
            SetNWNxInt(oItemID, sAreaKey + sPubsGold + IntToString(iItemCount), iModulo, sPubsX);
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, sPubsX);
        }
        else
        {
            SetCampaignInt(sDBName, sAreaKey + sPubsGold + IntToString(iItemCount), iModulo, oItemID);
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, oItemID);
        }

        if (Debug)
        {
            SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
            SendMessageToPC(oPC, "This is Gold. StackSize "+IntToString(iModulo));
            SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
            SendMessageToPC(oPC, "ResRef: "+sItemName);
            SendMessageToPC(oPC, "----------");
        }

    }
    else
    {
        if ( iPubsNWNX )
        {
            SetNWNxInt(oItemID, sAreaKey + sPubsGold + IntToString(iItemCount), iStackAmt, sPubsX);
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, sPubsX);
        }
        else
        {
            SetCampaignInt(sDBName, sAreaKey + sPubsGold + IntToString(iItemCount), iStackAmt, oItemID);
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, oItemID);
        }

    // Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This is Gold. StackSize "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "----------");
    }
    }
    return iItemCount;
}

void EncodeItem (object oPC, object oCurItem, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }



    if ( iPubsNWNX )
    {
        SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, sPubsX);
    }
    else
    {
        SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, oItemID);
    }

    if ( GetIdentified(oCurItem) )
    {
        if ( iPubsNWNX )
        {
            SetNWNxInt(oItemID, sAreaKey + sPubsItemID + IntToString(iItemCount), 1, sPubsX);
        }
        else
        {
            SetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), 1, oItemID);
        }
    }
    else
    {
        if ( iPubsNWNX )
        {
            SetNWNxInt(oItemID, sAreaKey + sPubsItemID + IntToString(iItemCount), 0, sPubsX);
        }
        else
        {
            SetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), 0, oItemID);
        }
    }

    if (iItemUnq)
    {
        StoreCampaignObject(sDBName, sAreaKey + sPubsUQ + IntToString(iItemCount), oCurItem, oItemID);
    }
    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This is an Item.");
        SendMessageToPC(oPC, "Valid Object: " + IntToString(GetIsObjectValid(oCurItem)) );
        if ( !iItemUnq )
        {
            SendMessageToPC(oPC, "ResRef: "+sItemName);
        }
        else
        {
            SendMessageToPC(oPC, "ResRef: Unique");
        }
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetIdentified(oCurItem)));
        SendMessageToPC(oPC, "----------");
    }

    return;
}

int EncodeStackItem (object oPC, object oCurItem, int iItemCount, string sDBName, string sAreaKey, int iItemUnq)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }

    string sItemName;

    if (! iItemUnq )
    {
        iStackAmt = GetNumStackedItems(oCurItem);

        if ( iPubsNWNX )
        {
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), "STACK", sPubsX);
            iItemCount = iItemCount + 1;
            SetNWNxInt(oItemID, sAreaKey + sPubsStack + IntToString(iItemCount), iStackAmt, sPubsX);
        }
        else
        {
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), "STACK", oItemID);
            iItemCount = iItemCount + 1;
            SetCampaignInt(sDBName, sAreaKey + sPubsStack + IntToString(iItemCount), iStackAmt, oItemID);
        }
        string sItemName = GetResRef(oCurItem);

        if ( sItemName == "" )
        {
            sItemName = GetTag(oCurItem);
        }

        if ( iPubsNWNX )
        {
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, sPubsX);
        }
        else
        {
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, oItemID);
        }

        if ( GetIdentified(oCurItem) )
        {
            if ( iPubsNWNX )
            {
                SetNWNxInt(oItemID, sAreaKey + sPubsItemID + IntToString(iItemCount), 1, sPubsX);
            }
            else
            {
                SetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), 1, oItemID);
            }
        }
        else
        {
            if ( iPubsNWNX )
            {
                SetNWNxInt(oItemID, sAreaKey + sPubsItemID + IntToString(iItemCount), 0, sPubsX);
            }
            else
            {
                SetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), 0, oItemID);
            }
        }

    }
    else
    {
        if ( iPubsNWNX )
        {
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), "STACKUNQ", sPubsX);
        }
        else
        {
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), "STACKUNQ", oItemID);
        }
        iItemCount = iItemCount + 1;
        sItemName = "UNIQUE";
        if ( iPubsNWNX )
        {
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, sPubsX);
        }
        else
        {
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), sItemName, oItemID);
        }

        StoreCampaignObject(sDBName, sAreaKey + sPubsUQ + IntToString(iItemCount), oCurItem, oItemID);
    }



    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "Stack Item. StackSize: "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+ sItemName );
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetIdentified(oCurItem)));
        SendMessageToPC(oPC, "----------");
    }

    return iItemCount;
}

int EncodeContainer (object oPC, object oCurItem, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq)
{
    iHeaderCount = 0;
    int iIPCount1 = 0;
    int iIPCount2 = 0;
    object oTestItem;

    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "Encode Container ROUTINE");
    }

    if (!iItemUnq)
    {
        if ( iPubsNWNX )
        {
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), "CONTAIN", sPubsX);
        }
        else
        {
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), "CONTAIN", oItemID);
        }
    }
    else
    {
        if ( iPubsNWNX )
        {
            SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), "CONTAINUNQ", sPubsX);
        }
        else
        {
            SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), "CONTAINUNQ", oItemID);
        }
    }
    iHeaderCount = iHeaderCount + 1;

    iItemCount = iItemCount + 1;

    EncodeItem(oPC, oCurItem, iItemCount, sItemName, sDBName, sAreaKey, iItemUnq);

    oCurInvObj = GetFirstItemInInventory(oCurItem);

    while ( GetIsObjectValid(oCurInvObj) == TRUE || GetResRef(oCurInvObj) == "nw_it_gold001")   //Begin Processing Item in Inventory
    {

        iItemCount = iItemCount + 1;

        sItemName = GetResRef(oCurInvObj);
        if ( sItemName == "" )
        {
            //sItemName = GetTag(oCurInvObj);
            //if (sItemName == "")
            //{
                iUnique = 1;
                sItemName = "UNIQUE";
                if (Debug)
                {
                    SendMessageToPC(oPC, "Item Unique: No ResRef");
                }
            //}
            //else
            //{
            //    iUnique = 0;
            //}
        }
        else
        {
            oTestItem = CreateObject( OBJECT_TYPE_ITEM, sItemName, GetLocation(OBJECT_SELF), FALSE);
            if ( GetIsObjectValid(oTestItem) )
            {

                iUnique = 0;


            }
            else
            {
                iUnique = 1;
                sItemName = "UNIQUE";
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
                    sItemName = "UNIQUE";
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
        if ( sItemName == "nw_it_gold001")
        {
            EncodeGold(oPC, oCurInvObj, iItemCount, sItemName, sDBName, sAreaKey);

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
                iItemCount = EncodeContainer(oPC, oCurInvObj, iItemCount, sItemName, sDBName, sAreaKey, iUnique);
            }
            else if (GetNumStackedItems(oCurInvObj) > 1)
                {
                    iHeaderCount = iHeaderCount + 1;
                    iItemCount = EncodeStackItem( oPC, oCurInvObj, iItemCount, sDBName, sAreaKey, iUnique);
                }
                else
                {
                    EncodeItem(oPC, oCurInvObj, iItemCount, sItemName, sDBName, sAreaKey, iUnique);
                }
        }


        oCurInvObj = GetNextItemInInventory(oCurItem);


    }
    iItemCount = iItemCount + 1;

    if ( iPubsNWNX )
    {
        SetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), "END", sPubsX);
    }
    else
    {
        SetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), "END", oItemID);
    }
    iHeaderCount = iHeaderCount + 1;

    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "END Encode Container ROUTINE");
    }


    return iItemCount;
}


void DecodeGold (object oPC, object oCurContainer, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iDoConv)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }

    if ( iPubsNWNX )
    {
        iStackAmt = GetNWNxInt(oItemID, sAreaKey + sPubsGold + IntToString(iItemCount), sPubsX);
    }
    else
    {
        if (! iDoConv)
        {
            iStackAmt = GetCampaignInt(sDBName, sAreaKey + sPubsGold + IntToString(iItemCount), oItemID);
        }
        else
        {
            iStackAmt = GetCampaignInt(sDBName, IntToString(HashIDOld(sBankGold + IntToString(iItemCount) + sAreaKey)), oItemID);
        }
    }
    object oCurItem = CreateItemOnObject(sItemName, oCurContainer, iStackAmt);

    // Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This Gold. StackSize "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "----------");
    }

    return;
}

object DecodeItem (object oPC, object oCurContainer, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq, int iDoConv)
{
    int iID;

    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    object oCurItem;
    if (!iItemUnq)
    {
        oCurItem = CreateItemOnObject(sItemName, oCurContainer, 1);

        if ( iPubsNWNX )
        {
            iID = GetNWNxInt(oItemID, sAreaKey + sPubsItemID + IntToString(iItemCount), sPubsX);
        }
        else
        {
            if (! iDoConv )
            {
                iID = GetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), oItemID);
            }
            else
            {
                iID = GetCampaignInt(sDBName, IntToString(HashIDOld(sBankItemID + IntToString(iItemCount) + sAreaKey)), oItemID);
            }
        }


        if ( iID )
        {
            SetIdentified(oCurItem, TRUE);
        }
        else
        {
            SetIdentified(oCurItem, FALSE);
        }

    }
    else
    {
        if (! iDoConv)
        {
            oCurItem = RetrieveCampaignObject(sDBName, sAreaKey + sPubsUQ + IntToString(iItemCount),  GetLocation(OBJECT_SELF), OBJECT_SELF, oItemID);  //,
        }
        else
        {
            oCurItem = RetrieveCampaignObject(sDBName, IntToString(HashIDOld(sBankUQ + IntToString(iItemCount) + sAreaKey)),  GetLocation(OBJECT_SELF), OBJECT_SELF, oItemID);  //,
        }
        if (Debug)
        {
            SendMessageToPC(oPC, "Retrieving Unique Item");
        }
    }


    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This is an Item.");
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), oItemID)) );
        SendMessageToPC(oPC, "----------");
    }

    //DeletePersistentInt(oPC, sPubsItemID + IntToString(iItemCount) );

    return oCurItem;
}

int DecodeStackItem (object oPC, object oCurContainer, int iItemCount, string sItemName, string sDBName, string sAreaKey, int iItemUnq, int iDoConv)
{
    int iID;

    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    object oCurItem;
    //DeletePersistentString(oPC, sPubsBP + IntToString(iItemCount) );
    iItemCount = iItemCount + 1;
    if (!iItemUnq)
    {

        if ( iPubsNWNX )
        {
            iStackAmt = GetNWNxInt(oItemID, sAreaKey + sPubsStack + IntToString(iItemCount), sPubsX);
            sItemName = GetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sPubsX);
        }
        else
        {
            if (! iDoConv)
            {
                iStackAmt = GetCampaignInt(sDBName, sAreaKey + sPubsStack + IntToString(iItemCount), oItemID);
                sItemName = GetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), oItemID);
            }
            else
            {
                iStackAmt = GetCampaignInt(sDBName, IntToString(HashIDOld(sBankStack + IntToString(iItemCount) + sAreaKey)), oItemID);
                sItemName = GetCampaignString(sDBName, IntToString(HashIDOld(sBankBP + IntToString(iItemCount) + sAreaKey)), oItemID);
            }
        }


        oCurItem = CreateItemOnObject(sItemName, oCurContainer, iStackAmt);

        if ( iPubsNWNX )
        {
            iID = GetNWNxInt(oItemID, sAreaKey + sPubsItemID + IntToString(iItemCount), sPubsX);
        }
        else
        {
            if (!iDoConv)
            {
                iID = GetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), oItemID);
            }
            else
            {
                iID = GetCampaignInt(sDBName, IntToString(HashIDOld(sBankItemID + IntToString(iItemCount) + sAreaKey)), oItemID);
            }
        }

        if ( iID )
        {
            SetIdentified(oCurItem, TRUE);
        }
        else
        {
            SetIdentified(oCurItem, FALSE);
        }

    }
    else
    {
        if (! iDoConv)
        {
            oCurItem = RetrieveCampaignObject(sDBName, sAreaKey + sPubsUQ + IntToString(iItemCount), GetLocation(OBJECT_SELF), OBJECT_SELF, oItemID);      //,
        }
        else
        {
            oCurItem = RetrieveCampaignObject(sDBName, IntToString(HashIDOld(sBankUQ + IntToString(iItemCount) + sAreaKey)), GetLocation(OBJECT_SELF), OBJECT_SELF, oItemID);      //,
        }
        if (Debug)
        {
            SendMessageToPC(oPC, "Retrieving Unique Stack Item");
        }
    }



    //DeletePersistentInt(oPC, sPubsStack + IntToString(iItemCount) );
    //DeletePersistentInt(oPC, sPubsItemID + IntToString(iItemCount) );

    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "Stack Item. StackSize: "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetCampaignInt(sDBName, sAreaKey + sPubsItemID + IntToString(iItemCount), oItemID)) );
        SendMessageToPC(oPC, "----------");
    }

    return iItemCount;
}

int DecodeContainer (object oPC, object oCurContainer, string sItemName, int iItemCount, string sDBName, string sAreaKey, int iItemUnq, int iDoConv)
{
    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "Decode Container ROUTINE");
    }
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
   // DeletePersistentString(oPC, sPubsBP + IntToString(iItemCount) );
    iItemCount = iItemCount +1;

    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount) );
    }

    if ( iPubsNWNX )
    {
        sItemName = GetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sPubsX);
    }
    else
    {
        if (!iDoConv)
        {
            sItemName = GetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), oItemID );
        }
        else
        {
            sItemName = GetCampaignString(sDBName, IntToString(HashIDOld(sBankBP + IntToString(iItemCount) + sAreaKey)), oItemID );
        }
    }

    oCurContainer = DecodeItem(oPC, OBJECT_SELF, iItemCount, sItemName, sDBName, sAreaKey, iItemUnq, iDoConv);

    if ( iPubsNWNX )
    {
        sItemName = GetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount + 1), sPubsX);
    }
    else
    {
        if (!iDoConv)
        {
            sItemName = GetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount + 1), oItemID );
        }
        else
        {
            sItemName = GetCampaignString(sDBName, IntToString(HashIDOld(sBankBP + IntToString(iItemCount + 1) + sAreaKey)), oItemID );
        }
    }

    while ( sItemName != "END")
        {
            iItemCount = iItemCount + 1;
            //Debug
            if (Debug)
            {
                SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount) );
            }

            if ( iPubsNWNX )
            {
                sItemName = GetNWNxString(oItemID, sAreaKey + sPubsBP + IntToString(iItemCount), sPubsX);
            }
            else
            {
                if (!iDoConv)
                {
                    sItemName = GetCampaignString(sDBName, sAreaKey + sPubsBP + IntToString(iItemCount), oItemID );
                }
                else
                {
                    sItemName = GetCampaignString(sDBName, IntToString(HashIDOld(sBankBP + IntToString(iItemCount) + sAreaKey)), oItemID );
                }
            }


            if ( sItemName != "nw_it_gold001" )
            {

                    if ( sItemName == "STACK")
                    {
                        iItemCount = DecodeStackItem(oPC, oCurContainer, iItemCount, sItemName, sDBName, sAreaKey, 0, iDoConv);
                    }
                    else
                    {
                        if ( sItemName == "STACKUNQ")
                        {
                            iItemCount = DecodeStackItem(oPC, oCurContainer, iItemCount, sItemName, sDBName, sAreaKey, 1, iDoConv);
                        }
                        else
                        {
                            if ( sItemName == "UNIQUE" )
                            {
                                DecodeItem(oPC, oCurContainer, iItemCount, sItemName, sDBName, sAreaKey, 1, iDoConv);
                            }
                            else
                            {
                                DecodeItem(oPC, oCurContainer, iItemCount, sItemName, sDBName, sAreaKey, 0, iDoConv);
                            }
                        }

                    }


            }
            else
            {

                DecodeGold(oPC, oCurContainer, iItemCount, sItemName, sDBName, sAreaKey, iDoConv);
              //  DeletePersistentInt(oPC, sPubsGold );


            }
          //  DeletePersistentString(oPC, sPubsBP + IntToString(iItemCount) );


        }

    return iItemCount;
}

void ResetBank (object oBank)
{
    DestroyObject(oBank);
    CreateObject(GetObjectType(oBank),GetResRef(oBank),GetLocation(oBank));
    return;
}

void ClearVault (object oChest)
{
    int iClearMaxCount = 10;
    int iClearCount = 0;
    float fMaxDistance = 5.0;
    object oPCClear;
    float fDistance;
    string sUsingPC = GetLocalString(OBJECT_SELF, "PCUsingChest");
    string sCurPC;

    while ( iClearCount < iClearMaxCount )
    {
        iClearCount++;
        oPCClear = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC, oChest, iClearCount);
        if ( GetIsPC(oPCClear) )
        {
            sCurPC = GetKey(oPCClear, 1, 0);
            if (TestStringAgainstPattern(sUsingPC, sCurPC) == FALSE )
            {
                fDistance = GetDistanceBetween(oChest, oPCClear);
                if ( fDistance <= fMaxDistance )
                {
                    AssignCommand(oPCClear, ActionMoveAwayFromObject(oChest, TRUE, 5.0));
                }
            }
        }
        else
        {
            iClearCount = iClearMaxCount;
        }


    }
    return;

}

void UnlockChest(object oChest)
{
    SetLocked(oChest, FALSE);
}
