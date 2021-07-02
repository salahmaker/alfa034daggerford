/// /// /// /// /// /// /// /// /// /// /// ///
/// door_opened
/// After a delay, close and lock the door.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///
void main()
{
    DelayCommand(12.f,ActionCloseDoor(OBJECT_SELF));
    if(GetLockLockable(OBJECT_SELF)){
        DelayCommand(14.f,SetLocked(OBJECT_SELF,TRUE));
    }
}
