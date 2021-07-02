//::///////////////////////////////////////////////
//:: psvs_nwnx_inc.nss
//:: Persistant Storage and Vault System
//:: Version 1.0
//:://////////////////////////////////////////////
/*
  Contains functions to read and write Campaign
  variables using NWNX2 functions.

  1.0 Orginal Version


*/
//:://////////////////////////////////////////////
//:: Created By: Clayten Gillis (a.k.a. DragonsWake)
//:: Created On: September 7, 2004
//:://////////////////////////////////////////////

#include "aps_include"
#include "nw_i0_plot"


// Debug:
// Turn on Debug Statements:

const int Debug = 0;

//****************************
// Database performance tweaks
//****************************

// iDelGet:  1=Delete after GetNWNxString, 0=Don't delete after GetNWNxString
// Delete the database record after after a successful GetNWNxString Call.
// If this is set then each record is deleted after read saving database space.
// Check for Inventory Disturbance is Disabled forcing recreation of records on
// every On_close.
const int iDelGet = 0;

// Set persistent string variable sVarName to sValue
void SetNWNxString(object oObject, string sVarName, string sValue, string sTable);

// Set persistent string variable sVarName to sValue
void SetNWNxStringPart(object oObject, string sVarName, string sValue, string sTable, string sPartVal);

// Set persistent integer variable sVarName to iValue
void SetNWNxInt(object oObject, string sVarName, int iValue, string sTable);

// Set persistent integer variable sVarName to iValue
void SetNWNxIntPart(object oObject, string sVarName, int iValue, string sTable, string sPartVal);


// Set oObject's Sequence Number Key of an PC or object.
int SetNWNxKey(object oObject, string sTable, int iGetLoc, int iPCGlobal, int iCDKey);


// Get persistent string variable sVarName
// * Return value on error: ""
string GetNWNxString(object oObject, string sVarName, string sTable);

// Get persistent string variable sVarName
// * Return value on error: ""
string GetNWNxStringPart(object oObject, string sVarName, string sTable, string sPartVal);

// Get persistent integer variable sVarName
// * Return value on error: 0
int GetNWNxInt(object oObject, string sVarName, string sTable);

// Get persistent integer variable sVarName
// * Return value on error: 0
int GetNWNxIntPart(object oObject, string sVarName, string sTable, string sPartVal);

// Get oObject's Sequnce Number Key for a PC or object.
int GetNWNxKey (object oObject, string sTable, int iGetLoc, int iPCGlobal, int iCDKey);


// Delete persistent variable sVarName stored on oObject
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
void DeleteNWNxVariable(object oObject, string sVarName, string sTable);

// Delete persistent variable sVarName stored on oObject
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
void DeleteNWNxVariablePart(object oObject, string sVarName, string sTable, string sPartVal);


/************************************/
/* Implementation                   */
/************************************/


// These functions are responsible for transporting the various data types back
// and forth to the database.

void SetNWNxString(object oObject, string sVarName, string sValue, string sTable)
{

//    string sPlayer;
//    string sTag;

//    if (GetIsPC(oObject))
//    {
//        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
//        sTag = SQLEncodeSpecialChars(GetName(oObject));
//    }
//    else
//    {
//        sPlayer = "~";
//        sTag = GetTag(oObject);
//    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    sValue = SQLEncodeSpecialChars(sValue);

    string sSQL = "SELECT keyid FROM " + sTable + " WHERE keyid='" + sVarName + "'";
    SQLExecDirect(sSQL);
    if (Debug)
    {
        DebugSpeak("SetString Get KeyId:" + sSQL);
    }

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val='" + sValue +
            "' WHERE keyid='" + sVarName + "'";
        SQLExecDirect(sSQL);
        if (Debug)
        {
            DebugSpeak("SetString Update KeyId:" + sSQL);
        }
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (keyid,val) VALUES" +
            "('" + sVarName + "','" + sValue + "')";
        SQLExecDirect(sSQL);
        if (Debug)
        {
            DebugSpeak("SetString Insert KeyId:" + sSQL);
        }
    }
}

void SetNWNxStringPart(object oObject, string sVarName, string sValue, string sTable, string sPartVal)
{

//    string sPlayer;
//    string sTag;

//    if (GetIsPC(oObject))
//    {
//        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
//        sTag = SQLEncodeSpecialChars(GetName(oObject));
//    }
//    else
//    {
//        sPlayer = "~";
//        sTag = GetTag(oObject);
//    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    sValue = SQLEncodeSpecialChars(sValue);
    sPartVal = SQLEncodeSpecialChars(sPartVal);

    string sSQL = "SELECT keyid FROM " + sTable + " WHERE keyid='" + sVarName +
    "' AND val LIKE '" + sPartVal + "%'";
    SQLExecDirect(sSQL);
    if (Debug)
    {
        DebugSpeak("SetString Get KeyId:" + sSQL);
    }

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val='" + sValue +
            "' WHERE keyid='" + sVarName + "' AND val LIKE '" + sPartVal + "%'";
        SQLExecDirect(sSQL);
        if (Debug)
        {
            DebugSpeak("SetString Update KeyId:" + sSQL);
        }
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (keyid,val) VALUES" +
            "('" + sVarName + "','" + sValue + "')";
        SQLExecDirect(sSQL);
        if (Debug)
        {
            DebugSpeak("SetString Insert KeyId:" + sSQL);
        }
    }
}



string GetNWNxString(object oObject, string sVarName, string sTable)
{
/*    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }
*/
    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE keyid='" + sVarName + "'";
    SQLExecDirect(sSQL);
    if (Debug)
    {
        DebugSpeak("GetString Get Val:" + sSQL);
    }

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        if ( iDelGet )
        {
            DeleteNWNxVariable(oObject, sVarName, sTable);
        }
        return SQLDecodeSpecialChars(SQLGetData(1));
    }
    else
    {
        return "";
        // If you want to convert your existing persistent data to APS, this
        // would be the place to do it. The requested variable was not found
        // in the database, you should
        // 1) query it's value using your existing persistence functions
        // 2) save the value to the database using SetPersistentString()
        // 3) return the string value here.
    }
}

string GetNWNxStringPart(object oObject, string sVarName, string sTable, string sPartVal)
{
/*    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }
*/
    sVarName = SQLEncodeSpecialChars(sVarName);
    sPartVal = SQLEncodeSpecialChars(sPartVal);

    string sSQL = "SELECT val FROM " + sTable + " WHERE keyid='" + sVarName +
        "' AND val LIKE '" + sPartVal + "%'";
    SQLExecDirect(sSQL);
    if (Debug)
    {
        DebugSpeak("GetString Get Val:" + sSQL);
    }

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        /*
        if ( iDelGet )
        {
            DeleteNWNxVariable(oObject, sVarName, sTable);
        }
        */

        return SQLDecodeSpecialChars(SQLGetData(1));
    }
    else
    {
        return "";
        // If you want to convert your existing persistent data to APS, this
        // would be the place to do it. The requested variable was not found
        // in the database, you should
        // 1) query it's value using your existing persistence functions
        // 2) save the value to the database using SetPersistentString()
        // 3) return the string value here.
    }
}



void SetNWNxInt(object oObject, string sVarName, int iValue, string sTable)
{
    SetNWNxString(oObject, sVarName, IntToString(iValue), sTable);
}

void SetNWNxIntPart(object oObject, string sVarName, int iValue, string sTable, string sPartVal)
{
    SetNWNxStringPart(oObject, sVarName, IntToString(iValue), sTable, sPartVal);
}

int GetNWNxInt(object oObject, string sVarName, string sTable)
{
    return StringToInt(GetNWNxString(oObject, sVarName, sTable));
}

int GetNWNxIntPart(object oObject, string sVarName, string sTable, string sPartVal)
{
    return StringToInt(GetNWNxStringPart(oObject, sVarName, sTable, sPartVal));
}


void DeleteNWNxVariable(object oObject, string sVarName, string sTable)
{

/*
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }
*/
    //sVarName = SQLEncodeSpecialChars(sVarName);
    string sSQL = "DELETE FROM " + sTable + " WHERE keyid='" + sVarName + "'";
    SQLExecDirect(sSQL);
}

void DeleteNWNxVariablePart(object oObject, string sVarName, string sTable, string sPartVal)
{

/*
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }
*/
    sVarName = SQLEncodeSpecialChars(sVarName);
    sPartVal = SQLEncodeSpecialChars(sPartVal);
    string sSQL = "DELETE FROM " + sTable + " WHERE keyid='" + sVarName +
        "' AND val LIKE '" + sPartVal + "%'";
    SQLExecDirect(sSQL);
}

int SetNWNxKey(object oObject, string sTable, int iUseLoc, int iPCGlobal, int iCDKey)
{

    string sPlayer;
    string sTag;
    string sLoc = "NONE";
    string sTmpName;
    int iVec1;
    int iVec2;
    int iVec3;
    int iSeqNum;
    location lLoc;
    vector vLoc;
    object oArea;
    object oModule = GetModule();


//  Get Current Sequence Number


    sPlayer = "~";
    sTag = SQLEncodeSpecialChars(GetName(oModule));

    string sSQL = "SELECT seqnum FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND loc='" + sLoc + "'";
    SQLExecDirect(sSQL);

    if (Debug)
    {
        DebugSpeak("SetKey Get SeqNum:" + sSQL);
    }

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        // row exists
        iSeqNum = StringToInt(SQLGetData(1));
        iSeqNum++;
        sSQL = "UPDATE " + sTable + " SET seqnum='" + IntToString(iSeqNum) +
            "' WHERE player='" + sPlayer + "' AND tag='" + sTag +
            "' AND loc='" + sLoc + "'";
        SQLExecDirect(sSQL);
        if (Debug)
        {
            DebugSpeak("SetKey Update SeqNum:" + sSQL);
        }
    }
    else
    {
        // row doesn't exist, initialize sequece numbers.
        sSQL = "INSERT INTO " + sTable + " (player,tag,loc,seqnum) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sLoc + "'," + IntToString(10001) + ")";
        SQLExecDirect(sSQL);
        if (Debug)
        {
            DebugSpeak("SetKey Insert SeqNum:" + sSQL);
        }
        iSeqNum = 10001;
    }


    if (GetIsPC(oObject))
    {

        if ( iPCGlobal )
        {
            if ( iCDKey )
            {
                sPlayer = SQLEncodeSpecialChars(GetPCPublicCDKey(oObject));
                sTag = "~";
                sLoc = "NONE";
            }
            else
            {
                sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
                sTag = "~";
                sLoc = "NONE";
            }
        }
        else
        {
            sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
            sTag = SQLEncodeSpecialChars(GetName(oObject));
            sLoc = "NONE";
        }
    }
    else
    {
        lLoc = GetLocation(oObject);
        vLoc = GetPositionFromLocation(lLoc);
        iVec1 = FloatToInt(vLoc.x);
        iVec2 = FloatToInt(vLoc.y);
        iVec3 = FloatToInt(vLoc.z);
        oArea = GetArea(oObject);

        if (iUseLoc)
        {
            sLoc = IntToString(iVec1) + IntToString(iVec2) + IntToString(iVec3);
        }
        else
        {
            sLoc = "NONE";
        }

        sPlayer = SQLEncodeSpecialChars(GetName(oArea));
        sTag = SQLEncodeSpecialChars(GetTag(oObject));
    }

    //sVarName = SQLEncodeSpecialChars(sVarName);
    //sValue = SQLEncodeSpecialChars(sValue);

    sSQL = "SELECT seqnum FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND loc='" + sLoc + "'";
    SQLExecDirect(sSQL);
    if (Debug)
    {
        DebugSpeak("SetKey Get ObjectID:" + sSQL);
    }

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        // row exists, do nothing.  Should not happen.
        //sSQL = "UPDATE " + sTable + " SET val='" + sValue +
        //    "' WHERE keyid='" + sVarName + "'";
        //SQLExecDirect(sSQL);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,loc,seqnum) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sLoc + "'," + IntToString(iSeqNum) + ")";
        SQLExecDirect(sSQL);
        if (Debug)
        {
            DebugSpeak("SetKey Insert ObjectID:" + sSQL);
        }
    }
    return iSeqNum;
}


int GetNWNxKey(object oObject, string sTable, int iUseLoc, int iPCGlobal, int iCDKey)
{

    string sPlayer;
    string sTag;
    string sLoc = "NONE";
    string sTmpName;
    int iVec1;
    int iVec2;
    int iVec3;
    int iKey;
    location lLoc;
    vector vLoc;
    object oArea;
    object oModule = GetModule();


    if (GetIsPC(oObject))
    {
        if ( iPCGlobal )
        {
            if ( iCDKey )
            {
                sPlayer = SQLEncodeSpecialChars(GetPCPublicCDKey(oObject));
                sTag = "~";
                sLoc = "NONE";
            }
            else
            {
                sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
                sTag = "~";
                sLoc = "NONE";
            }
        }
        else
        {
            sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
            sTag = SQLEncodeSpecialChars(GetName(oObject));
            sLoc = "NONE";
        }
    }
    else
    {
        lLoc = GetLocation(oObject);
        vLoc = GetPositionFromLocation(lLoc);
        iVec1 = FloatToInt(vLoc.x);
        iVec2 = FloatToInt(vLoc.y);
        iVec3 = FloatToInt(vLoc.z);
        oArea = GetArea(oObject);

        if (iUseLoc)
        {
            sLoc = IntToString(iVec1) + IntToString(iVec2) + IntToString(iVec3);
        }
        else
        {
            sLoc = "NONE";
        }

        sPlayer = SQLEncodeSpecialChars(GetName(oArea));
        sTag = SQLEncodeSpecialChars(GetTag(oObject));
    }

    //sVarName = SQLEncodeSpecialChars(sVarName);
    //sValue = SQLEncodeSpecialChars(sValue);

    string sSQL = "SELECT seqnum FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND loc='" + sLoc + "'";
    SQLExecDirect(sSQL);
    if (Debug)
    {
        DebugSpeak("GetKey Get ObjectID:" + sSQL);
    }

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        // row exists, do nothing.  Should not happen.
        iKey = StringToInt(SQLDecodeSpecialChars(SQLGetData(1)));
    }
    else
    {
        // row doesn't exist.  Set key on Object.
        iKey = SetNWNxKey(oObject, sTable, iUseLoc, iPCGlobal, iCDKey);
    }
    return iKey;
}



