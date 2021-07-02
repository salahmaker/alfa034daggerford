#include "sos_include"

void main()
{
    SetCustomToken(5000,SOS_GetPersistentString(OBJECT_SELF,"message1"));
    SetCustomToken(5001,SOS_GetPersistentString(OBJECT_SELF,"message2"));
    SetCustomToken(5002,SOS_GetPersistentString(OBJECT_SELF,"message3"));
    SetCustomToken(5003,SOS_GetPersistentString(OBJECT_SELF,"message4"));
    SetCustomToken(5004,SOS_GetPersistentString(OBJECT_SELF,"message5"));
    SetCustomToken(5005,SOS_GetPersistentString(OBJECT_SELF,"message6"));
    SetCustomToken(5006,SOS_GetPersistentString(OBJECT_SELF,"message7"));
    SetCustomToken(5007,SOS_GetPersistentString(OBJECT_SELF,"message8"));
    SetCustomToken(5008,SOS_GetPersistentString(OBJECT_SELF,"message9"));
    SetCustomToken(5009,SOS_GetPersistentString(OBJECT_SELF,"message10"));
}
