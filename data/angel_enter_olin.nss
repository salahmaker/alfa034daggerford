#include "spawn_main"
#include "SOS_include"

void main()
{
    if(SOS_GetPersistentInt(GetEnteringObject(), "thieves_task_quest") == 1)
        Spawn();
}
