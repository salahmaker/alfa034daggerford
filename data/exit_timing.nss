/// /// /// /// /// /// /// /// /// /// /// ///
/// exit_timing
/// Decrement tally of players in the timing area.
/// When tally reaches 0, heart_timing returns
/// immediately.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///

void main()
{
    object Exiting = GetExitingObject();
    if(GetIsObjectValid(Exiting)){
        if(GetIsPC(Exiting)){
            int nNumEntered = GetLocalInt(OBJECT_SELF,"nNumEntered");
            SetLocalInt(OBJECT_SELF,"nNumEntered",nNumEntered-1);
        }
    }
}
