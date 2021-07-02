void main()
{
   DelayCommand(9.0, ActionCloseDoor(OBJECT_SELF));
   SetLocked(OBJECT_SELF, TRUE);
}
