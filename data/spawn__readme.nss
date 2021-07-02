//
//  
//   NESS
//   Version 8.0
//   Spawn_Readme
//
//
//   Neshke Narovken (Original Author)
//
//   Cereborn (Maintainer)
//
//*******************************************************************
//
// History:
//
// +++ Start Version 7.0
//
//    --/--/--   Neshke            Created
//
//
// +++ Start Version 7.0.1
//
//    12/03/02   Cereborn          Added DanielleB's merchant-based loot tables
//    12/12/02   Cereborn          Added area-wide count of currently spawned
//                                 creatures
//    12/31/02   Cereborn          Added LT subflags A, B, and C for specifying
//                                 percentage chances of receiving 1, 2, or 3
//                                 loot items.
//    01/01/03   Cereborn          Added SX flag for dim returns suppression.
//
// +++ Start Version 7.0.2
//
//    01/07/03   Cereborn          Added NESS_ActivateSpawn(),
//                                 NESS_DeactivateSpawn, NESS_GetSpawnByID(),
//                                 NESS_ActivateSpawnByID(), NESS_ForceProcess()
//                                 NESS_DeactivateSpawnByID() and
//                                 NESS_TrackModuleSpawns().
//                                 Modified so that an activated spawn is processed
//                                 immediately instead of waiting for the next
//                                 process tick when using SPxx
//                                 Moved ReportSpawns and TrackModuleSpawns
//                                 to spawn_functions from spawn_main; modified
//                                 spawn_main to call TrackModuleSpawns() if
//                                 enabled, removing the need for placing
//                                 in each area heartbeat script
//
//    01/08/03   Cereborn          Fixed bug preventing initial flag processing
//                                 when using SPxx.
//                                 Added new deactivate spawn (DS) condition
//                                 (6) which deactivates a spawn whenever spawn
//                                 count reaches spawn number.  This is similar
//                                 to DS1, except that DS1 is based on number
//                                 of children *ever* spawned, so once
//                                 deactivated can never be reactivated, while
//                                 DS6 is based on current child count, allowing
//                                 the spawn to be re-activated if 1 or more of
//                                 it's children have been killed or despawned
//    01/10/03   Cereborn          Prevent despawning creatures when possessed
//                                 by a DM. (the code was attempting to do so
//                                 already but due to a Bioware bug it wasn't
//                                 working)
//    01/11/03   Cereborn          Added I subflag to SU to check each child's
//                                 location individually instead of the spawn's
//                                 location
//    01/17/03   Cereborn          Added force process of spawns when PCs
//                                 re-arrive id deactivated by PC flag
//    01/18/03   Cereborn          Added new type (3) to PL and subflag P
//                                 Added P subflag to SD.
//    01/20/03   Cereborn          Force process on deactivate
//                                 Added NESS_IsModuleSpawnTracking()
//
// +++ Start Version 7.0.3
//
//    01/22/03   Cereborn          Bug fix: Initialize module spawn count to
//                                 0 to fix bug with loading from saved games
//    01/24/03   Cereborn          Added NESS_DumpModuleSpawns() and
//                                 NESS_IsModuleSpawnDumping().  When spawn
//                                 dumping is enabled, each area with active
//                                 spawns reports its spawn count each HB
//
//
// +++ Start Version ALFA 1.0
//
//
//    02/05/03 - 03/21/03
//
//       Added NESS_ProcessDeadCreature().  This can be used to notify NESS that
//       a spawned creature has died (typically from an onDeath event script).
//       This is particularly useful when using larger SPxx values and the CD
//       flag, since without notification it can take a long time for NESS to
//       discover that the spawned creature has died and set up the lootable
//       corpse.
//
//       Added O(ffset) subflag to the SP flag. NESS now processes all spawns on
//       the first heartbeat, and then spawns are be processed on heartbeat
//       1 + offset + (processRate * N). For example, SP3 gets processed on
//       heartbeats 1, 4, 7, 10, etc.... while SP3O1 gets processed on heartbeats
//       1, 5, 8, 11..., and so on. This should be used to spread out heartbeats
//       within an area.
//
//       NESS no longer does any timing based on counted heartbeats.  All timings
//       are now based on the clock.  A new file, spawn_timefuncs, contains
//       functions for converting the game clock to real seconds for use in NESS
//       timings.
//
//       When spawns despawn due to using the PC flag (and if the R subflag is
//       not specified) the despawning creature resrefs and their locations are
//       recorded, and the spawn is restored to it previous state when PCs
//       re-enter the area.  This prevents exploits where players intentionally
//       'pop' a zone, then leave for the PC flag's duration, to effectively
//       clear an area of all obstacles until the spawn delay timer (if any)
//       expires.
//
//       Fixed the bug causing corpses that had been fully looted to not decay.
//
//       Fixed the bug that caused corpses to *never* decay if the decay timer
//       went off when the inventory was open (now a new decay timer is set).
//
//       Flag parsing code cleaned up; fixed a bug that caused the default value
//       for a flag to always be 1 (ignoring what was set up in spawn_cfg_global)
//
//       Items marked no-drop are no longer copied onto the lootable corpses
//
//       All no-drop items are explicitly destroyed (whether the CD flag is used
//       or not) to working around a current Bioware memory leak.
//
//       Added NESS_ReturnHome().  Call to force a NESS spawn to it's home point.
//
//       Added support for RH flag on spawn camps.
//
// +++ Start Version ALFA 1.0 Patch 1  (v1.0.1)
//
//    03/29/03
//
//       A bug where spawn delays were being applied to first time spawns that
//       didn't happen right away (such as triggered spawns, day/night only,
//       etc.) was fixed.
//
//       If a spawn has the RH flag and is respawned after being despawned due
//       to the PC flag, creatures will respawn at their home point instead of
//       where they were when they despawned.
//
//       An errant debug statement was removed.
//
// +++ Start Version ALFA 1.0 Patch 2 (v1.0.2)
//
//    03/30/03
//
//       Fixed a bug where the number of creatures in a spawn was getting
//       confused due to spawns that use the M subflag of the SN flag
//       recalculating their spawn numbers when spawns deactivated due to the
//       PC flag.  This bug fix should eliminate the overpopulating spawns
//       problem.
//
// +++ Start Version ALFA 1.0 Patch 3 (v1.0.3)
//
//    03/31/03
//
//       Fixed a bug where spawn delays could be skipped.
//
// +++ Start Version ALFA 1.0 Patch 4 (v1.0.4)
//
//    04/04/03
//
//       Fixed a bug where spawn delays were ignored on placeables.
//       Fixed P subflag of SD being ignored.
//       Reset spawn delay after RS-failed spawn attempt
//       Set up a new spawn delay when creature killed
//
// +++ Start Version ALFA 1.0 Patch 5 (v1.0.5)
//
//    04/07/03
//
//       Fixed bug in spawn_timefuncs that resulting in incorrect conversions
//       in years other than the Epoch year.
//       Changed the Epoch year to 1340 to conform to the lowest date in
//       the NWN engine.
//
// +++ Start Version ALFA 1.0 Patch 6 (v1.0.6)
//
//    04/08/03
//
//       Fixed bug with corpse decay and death script flags not being available
//       for camp spawns when onDeath notification occurs.
//
// +++ Start Version ALFA 1.0 Patch 7 (v1.0.7)
//
//    04/27/03
//
//       Added debugging for spawn delays and spawn counts that can be
//       independently enabled/disabled for each area from the spawn banner
//       rod.
//
// +++ Start Version ALFA 1.1 (v1.1)
//
//    04/28/03
//
//       Fixed bug in Loot Merchant code.  The original code used 
//       GetNearestObjectByTag() to look up loot merchants, which according to
//       the documentation should never have worked for merchants not in the same
//       area as the creature spawned.  In reality, it stopped working (at least
//       in some cases) after Bioware released version 1.29 of the game.
//
//    05/03/03
//
//       Changed distribution method used for SR flag to evenly distribute
//       spawns in the spawn circle instead.  The old method made the spawns
//       denser near the center and rarer near the circle's edge
//
//       Made SF work (again?) for placeables
//
//       When the SF flag is not specified for a multi-child spawn, a random
//       SF is now calcualated independently for each child
//
//    05/08/03
//
//       Added NL (No Loot) flag.  This suppresses looting of player corpses.
//       Only applies when using ACR 1.14 and higher
//
//    05/25/03
//
//       Fixed overspawning bug caused by changing child counts on spawns that
//       had been 'saved' with potentially different counts
//
//    05/27/03
//
//       Added C (Closest) subflag to the PR (Patrol Route) flag.  If C is 
//       specified, the spawned creature will start at the closest waypoint
//       rather than the first (does not apply to T2 flagged routes(random 
//       traverse)).
//
//    05/30/03
//
//       Added SB (Subdual) flag.  Causes creatures to be spawned in in subdual
//       mode. Only applies when using ACR 1.14 and higher.
//
//
// +++ Start Version ALFA 1.2 (v1.2)
//
//    08/24/03
//
//       Removed LocationToString() function from spawn_functions, as this is
//       now a Bioware function
//
//    08/25/03
//
//       Modified the way the SX flag works.  First, there is now a global flag,
//       nGlobalSuppressDR, in spawn_cfg_global that can be set to determine 
//       whether or not creatures spawn in with DR on or off when no SX flag is
//       specified.  The current default is for DR to *not* be suppressed, i.e.,
//       it will be operational.  Also, the SX flag can now take a value of 0 or 1.
//       If 1, DR is suppressed, if 0 DR is enabled (useful if you've set 
//       nGlobalSuppressDR to 1).  The default if no value is specified (just SX)
//       is 1 (to suppress).  You can also change this default in spawn_cfg_global.
//       If nGlobalSuppressDR is 1 and nSuppressDR is 0, you will get the opposite
//       of the v1.1 functionality; no DR on creatures, except when the SX flag is
//       present.
//
// +++ Start Version ALFA 1.2.1 (v1.2.1)
//
//    09/01/03
//
//       Fixed bug where spawn number was always being set to the number of saved 
//       camp spawns on PC-flag restore instead of the sum of saved camp and 
//       regular spawn counts.
//
// +++ Start Version ALFA 1.2.2 (v1.2.2)
//
//    09/02/03
//
//       Fixed bug introduced by last bug fix that caused overspawning!
//
// +++ Start Version ALFA 1.2.3 (v1.2.3)
//
//    09/21/03
//
//       Added EL - E(ncounter) L(evel) flag
//
// +++ Start Version ALFA 1.2.4 (v1.2.4)
//
//    10/03/03
// 
//       Added I subflag to SL flag.
//
//       Modified ST behavior so that spawned creatures walk to their seats
//       instead of running
//
//    10/18/03
//
//       Check night / day only, day, hour, lifespan and SU before restoring
//       spawns
//
//       Fixed recalculate random spawn number bug where the spawn number could 
//       change before a despawn due to the PC flag was restored, causing the 
//       number of creatures thought to exist to differ from what actually got
//       restored
//
//    10/19/03
//
//       Fixed SD bug; under certain cases (such as a despawn due to CL flag)
//       SD was being ignored.
//
//       Fixed bug where SU|I only worked if RS or SL were in use
//
// +++ Start Version ALFA 1.2.5 (v1.2.5)
//
//    10/25/03
//
//       Do a ClearAllActions() before despawning creatures.  This helps prevent
//       'broken' Bioware chairs caused by despawning creatures using the ST
//       flag.
//
//    10/27/03

//       Modified the spawn_cfg_camp example to use standard BW creatures /
//       placeables for the benefit of non-ALFA users.
//
//  
//    11/02/03
//
//       Added a scaled encounter example. This uses the same basic methodology
//       as Sareena's random wilderness spawns - an SNxx flag is given large 
//       enough for the largest possible spawn and then the actual number (and
//       types) of creatures is determined when the spawn actually takes place.  
//
//
// +++ Start Version 8.0
//
//    Given that NESS is now being supported outside the ALFA umbrella, I've
//    decided to begin version numbering from 8.0 from here out.  Version 8.0
//    is the immediate successor to ALFA version 1.2.5.
//
//    01/19/04
//
//      Fixed problems with naked NPC corpses that had droppable armor /
//      clothing. playable race characters (humans, dwarves, elves, etc.)
//      now keep a copy of whatever is in the chest slot on the original 
//      corpse.
//
//
//    01/21/04
//
//      Added Rn subflag to CD to specify what type of remains are left after
//      corpse decay.  These correspond 1 to 1 to the treasure type field for
//      placeables, except for R7, which causes no loot bag to be left (loot
//      destroyed when corpse decays).  See the specific flag documentation 
//      below for the values/types of each R subflag.
//
//      Added D subflag to CD to cause corpse to drop wielded weapons on the
//      ground. Note that droppable flag on weapon still takes precedence -
//      non-droppable wielded weapons will not be dropped.
//
//      Delete armor/clothing from corpse if looted.
//
//      Added scripts for lootable corpse onOpen, onClosed, onUsed, and
//      onDisturbed events (renamed with a spawn_ prefix).
//     
//      Added a lootable corpse placeable for each remains type;  each has the
//      correct event scripts attached.
//
//   01/22/04
//
//      Initialize global defaults and flags on first area heartbeat, not first
//      heartbeat with PCs present.
//
//      Use DelayCommand(0.0, ...) to give each spawn flag initialization 
//      function its own command queue (allowing many more spawn points before
//      TMIs at initialization occur).
//
//   01/23/04
//
//      Fixed bug with EE flag.  Spawned creature was not walking to spawn point
//      after entrance.
//
//      Fixed bug with spawn in effect when using EE.  Spawn in effect now happens
//      at the entrance point.
//
//      Added support for ALFA-specific flags as Custom Flags (following the CF 
//      flag.  Parsing and processing of custom flags can now be done by
//      modifying spawn_cfg_cusflg.  This file contains 2 functions: 
//      ParseCustomFlags() and SetupCustomFlags().  ParseCustomFlags is called
//      with whatever flags follow the CF_ flag (when flags for the spawn are 
//      being initialized.  Typically, flags are parsed and there values are 
//      written to the spawn object. SetupCustomFlags() is called when a 
//      creature is actually spawned (typically flags are copied from the spawn
//      object to the creature (spawned) object.  The processing of ALFA-specific
//      flags are included in this file as an example.
// 
//

// INCLUDES:
//
//   Do NOT Modify Main Script:
//
//     Spawn:           'spawn_main'
//
//   Do NOT Modify Helper Scripts:
//
//     Information:     'spawn__readme'
//     Functions:       'spawn_functions'
//     Corpse Death:    'spawn_corpse_dth'
//     Corpse Decay:    'spawn_corpse_dcy'
//     Global Defaults: 'spawn_defaults'
//     Flag Parsing:    'spawn_flags'
//
//   Lootable corpse event scripts:

//     Corpse On Open:   'spawn_onopencrp'
//     Corpse On Closed: 'spawn_oncloscrp'
//     Corpse disturbed: 'spawn_dist_corps' 
//     Corpse used:      'spawn_used_corps'               
//
//
// CONFIGURATION:
//
//   Modify Configuration Includes if Needed
//   Only where Specified in Each File:
//
//     Spawn Flags:     'spawn_cfg_flag'
//     Spawn Groups:    'spawn_cfg_group'
//     Loot Tables:     'spawn_cfg_loot'
//     Spawn Camps:     'spawn_cfg_camp'
//     Spawn Effects:   'spawn_cfg_fxsp'
//     Area Effects:    'spawn_cfg_fxae'
//     Object Effects:  'spawn_cfg_fxobj'
//     User Defaults:   'spawn_cfg_global'
//     Custom Flags:    'spawn_cfg_cusflg'
//
//   Modify Check Includes if Needed
//   Only where Specified in each File:
//
//     Check PCs:       'spawn_chk_pcs'
//     Custom Check:    'spawn_chk_custom'
//
//   Modify Scripting Includes if Needed
//   Only where Specified in Each File:
//
//     Spawn/Despawn:   'spawn_sc_spawn'
//     Heartbeat:       'spawn_sc_hbeat'
//     Death:           'spawn_sc_death'
//     Deactivation:    'spawn_sc_deactiv'
//     Camp Trigger:    'spawn_sc_cmptrig'
//     Patrol Stops:    'spawn_sc_patrol'
//
//
// USAGE:
//
//   Add Following to Area Heartbeat:
//
//     Sample Script:   'spawn_sample_hb'
//
//     #include "spawn_main"
//     Spawn();
//
//   Add Spawn Waypoints
//   All Switches Optional
//
//   Waypoint Name:
//     SP_<Spawn Flags>
//
//   Waypoint Tag:
//     Child Object Tag/ResRef
//     Group Designation
//     Camp Designation
//
//   Note:
//     For Custom Creatures
//     You must use the ResRef
//
//   Available Flags:
//     SPnOn_ISnDn_IDn_FTn_SNnMn_SAnMn_SRnMnP_SDnMn_CLnMn
//     _RGnMnCn_RWRn_DYnTn_HRnTn_DOD_NOD_PCnR_SF_SUnIn_FXnDn
//     _PRnTn_PLnTn_EEnRn_EXnRn_SG_CDnTnRnD_LTnAnBnCn_DSnSn_DIn_CMDn
//     _SSnDn_CCn_CPnRn_TRnDn_AEnDn_OEnDn_RSn_FCn
//     _ALnSn_HBn_SLnRnI_RHDn_DTn_HLnE_IT_ST_PT_SM_CF
//     _SXn_NL_SB_ELn
//
//
//   Format:
//     Flag|OptionalFlag
//
//
//   SPn|On
//   : Designates Spawn Waypoint
//   : SP is Required on all Spawn Waypoints
//   : Performs Spawn processing every SP1 to SP99 heartbeats
//   : Default is SP1 Heartbeat : ~6 Seconds
//   : SP00 Defaults to SP01
//   : Optional Flag: On
//   : Offset processing spawn from first process by n heartbeats.
//   : Used to stagger spawn processing within an area
//
//   ISn|Dn
//   : Initial State
//   : Type 0 : Inactive
//   : Type 1 : Default : Active
//   : Optional Flag: D000
//   :   Delay Initial Spawn D000 Minutes
//
//   IDn
//   : SpawnID
//   : Sets LocalInt "SpawnID" to SpawnID
//   : On Spawn Waypoint Object
//
//   FTn
//   : Flag Table
//   : Use Flags from Table FT00
//   : Flags are Defined in 'spawn_cfg_flag'
//
//
//   SNn|Mn
//   : Spawn Number
//   : Maintains a Spawn of SN00 to SN99 Children
//   : Despawns Extra Children
//   : Optional Flag: M00
//   :   Minimum Children
//   :   Will Randomly Spawn between M00 and SN00 Children
//
//   SA|n|Mn
//   : Spawn All at Once
//   : Default is Spawn One Child per Cycle
//   : Optional Flag: 00
//   :   Spawn 00 Children per Cycle
//   : Optional Flag: M00
//   :   Spawn Minimum M00 per Cycle
//
//   SRn|Mn|P
//   : Spawn Radius
//   : Randomly Spawns Children in a
//   : Location SR00 to SR99 Meters from Waypoint
//   : Optional Flag: M00
//   :   Minimum Radius, M00 to SR99 Meters
//   : Optional Flag: P
//   :   Spawn Center is Near a Random PC in Area
//
//   SDn|Mn|P
//   : Spawn Delay
//   : Delay SD00 to SD99 Minutes between Spawns
//   : Optional Flag: M00
//   :   Minimum Delay, M00 to SD99 Minutes
//   : Optional Flag: P
//   :   This flag sets up a spawn period, whereas the default spawn delay
//   :   specifies a spacing between spawns.
//   :   This is particularly useful with PL3 (keep the times the same on
//   :   each) it will cause the placeable to refresh if alive or respawn
//   :   if not on a regular schedule. Note that if the P subflag is used,
//   :   the M subflag is ignored.
//
//
//   CLn|Mn
//   : Child Lifespan
//   : Child will Despawn after CL00 Minutes
//   : Optional Flag: M00
//   :   Child will Despawn after M00 to CL00 Minutes
//
//   DYn|Tn
//   : Spawn Day
//   : Spawn Only on Day DY00 to DY28
//   : Children are Despawned during Invalid Days
//   : Optional Flag: T00
//   :   Spawn from Day DY00 to Day T00
//
//   HRn|Tn
//   : Spawn Hour
//   : Spawn Only during Hour HR00 to HR24
//   : Children are Despawned during Invalid Hours
//   : Optional Flag: T00
//   :  Spawn from Hour HR00 to Hour T00
//
//   DO|D
//   : Day Only
//   : Only Spawns at Day
//   : Optional Flag: D
//   :   Despawn Children at Nightfall
//
//   NO|D
//   : Night Only
//   : Only Spawns at Night
//   : Optional Flag: D
//   :   Despawn Children at Daybreak
//
//   RW|Rn
//   : Random Walk
//   : Children Wander Randomly
//   : Optional Flag: R00
//   :   WARNING:  This is Resource Intensive!!
//   :   Wander Range, R00 to R99 Meters
//
//   PC|n|R
//   : PC Check
//   : Only Spawn Children if PCs are in Area
//   : Children are Despawned if no PCs in Area
//   : Optional Flag: PC00
//   :   Depawn if no PCs in Area for PC00 Minutes
//   : Optional Flag: R
//   :   Reset Spawn Point if no PCs are Present
//
//   RGn|Mn|Cn
//   : Random Gold
//   : Generates Random Amount of Gold on Children
//   : From RG000 to RG999 Gold
//   : Optional Flag: M00
//   :   Minimum Gold Amount
//   : Optional Flag: C00
//   :   Gold Chance C00% to C99%
//   :   Default 100% chance
//
//   SF
//   : Spawn Facing
//   : Set Facing of Children to Match Waypoint
//   : Default Random Facing
//
//   SUn|In
//   : Spawn Unseen
//   : Only Spawn if PCs are not within SU00 to SU99 Meters
//   : Optional flag: I00
//   :   Use the location of each individual child to determine if that
//   :   child can spawn, instead of using to location of the spawn itself.
//   :   If using SR or SL|R, I00 to I99 additional random locations will be
//   :   attempted
//
//   FXn|Dn
//   : Spawn Effect
//   : Spawn in with Effect FX001 to FX999
//   : Effects are Defined in 'spawn_cfg_fxsp'
//   : Optional Flag: D000
//   :   Despawn with Effect D001 to D999
//
//   PRn|Tn|C
//   : Patrol Route
//   : Assign Waypoints Route PR00 to PR99
//   : Optional Flag: T0
//   :   Route Type
//   :   0 - Sequential
//   :   1 - Circular
//   :   2 - Random
//   :   3 - Walk Once/Despawn
//   : Optional Flag C
//   :   Start at closest waypoint. Does not apply to T2 (random)
//   :
//   : Route Name: Variable
//   : Route Tag: PR00_SN00_PS000_RN_FC_DO_NO_SC000
//   :
//   : PR - Route Number 00 to 99
//   : SN - Stop Number 00 to 99
//   : PS - Pause 000 to 999 seconds at Stop
//   : RN - Run to Stop
//   : SF - Face the Waypoint Direction
//   : DO - Only Stop here during the Day
//   : NO - Only Stop here during the Night
//   : SC - Run script 000 to 999
//   :      Scripts are Defined in 'spawn_sc_patrol'
//
//   EEn|Rn
//   : Entrance/Exit
//   : Enter and Exit at Waypoint EE00
//   : Optional Flag: R
//   :   Choose Random Entrance Exit
//   :   from R00 to EE00
//   :
//   : Entrance/Exit Name: Variable
//   : Entrance/Exit Tag: EE00
//
//   EXn|Rn
//   : Exit
//   : Exit at Waypoint EX00
//   : Optional Flag: R
//   :   Choose Random Exit
//   :   from R00 to EX00
//   :
//   : Exit Name: Variable
//   : Exit Tag: EX00
//
//   PLn|Tn|Pn
//   : Placeable Object
//   : Spawns a Placeable Object with Behavior
//   :   Behavior 0: Default Behavior
//   :   Behavior 1: Despawn if Empty
//   :   Behavior 2: Refill if Empty (after spawn delay minutes!)
//   :   Behavior 3: Refresh (despawn/respawn) every P000 minutes; default
//   :   (if no Pn specified) is 60 minutes
//   : Optional Flag: T00
//   :   Trap Disabled Chance
//   :   00% to 99% chance of Trap Disabled
//   :   Trap must already be part of Placeable's Template
//   :   Default 100% Chance Trap is Disabled
//   : Optional Flag: P00
//   :   Refresh period (in minutes)
//
//   SG
//   : Spawn Group
//   : Spawn Children from Group
//   : Waypoint Tag is Defined Group
//   : Groups are Defined in 'spawn_cfg_group'
//
//   CDn|Tn|Rn|D
//   : Corpse Decay
//   : Decay Corpse after CD000 to CD999 Seconds
//   : Default No Corpse, Standard Loot Bag
//   : Optional Flag: T
//   :   Corpse Inventory Type
//   :   Type 0: Inventory Items
//   :   Type 1: Inventory & Equipped Items
//   :   Type 2: Inventory Items, if PC Killed
//   :   Type 3: Inventory & Equipped Items, if PC Killed
//   : Optional Flag: R
//   :   Remains Type
//   :   Type 0: Loot bag
//   :   Type 1: Body
//   :   Type 2: Bones
//   :   Type 3: Potion
//   :   Type 4: Pouch
//   :   Type 5: Scroll
//   :   Type 6: Treasure
//   :   Type 7: None (destroy loot on decay)
//   : Optional Flag: D
//   :   Drop wielded weapons
//
//  LTn|An|Bn|Cn
//   : Loot Table
//   : Spawn Loot on Children from Table LT000 to LT999
//   : Loot Tables are Defined in 'spawn_cfg_loot'
//   : LT500 to LT999 currently reserved for merchant-based
//   : loot tables
//   : Optional Flag: A000
//   :   When using merchant-based loot tables, the percentage chance that
//   :   only 1 item will spawn.  Default is 50%. Values over 100% are truncated
//   :   to 100%
//   : Optional Flag: B000
//   :   When using merchant-based loot tables, the percentage chance that
//   :   2 items will spawn.  Default is 15%. Values over 100% are truncated
//   :   to 100%
//   : Optional Flag: C000
//   :   When using merchant-based loot tables, the percentage chance that
//   :   3 items will spawn.  Default is 05%. Values over 100% are truncated
//   :   to 100%
//
//   DSn|Sn
//   : Deactivate Spawn
//   : Deactivate Spawn based on Condition
//   :   Type 0: Deactivate if all Children are Dead
//   :   Type 1: Deactivate if Spawn Number has been Spawned
//   :   Type 2: Deactive Spawn until all Children are Dead
//   :   Type 3: Deactivate Spawn after DI00 Children
//   :   Type 4: Deactivate Spawn after DI00 Minutes
//   :   Type 5: Deactivate Spawn after DI00 Cycles
//   :   Type 6: Deactivate when Spawn Count == Spawn Number
//   : Optional Flag: S000
//   :   Run Script 000 to 999 when Spawn Deactivated
//   :   Scripts are Defined in 'spawn_sc_deactiv'
//   :
//   : Can Reactivate by Manually Calling:
//   :   SetLocalInt(oSpawn, "SpawnDeactivated", FALSE);
//
//   DIn
//   : Deactivation Information
//
//   CM|Dn
//   : Spawn Camp
//   : Spawns Camp of Creatures and Placeables
//   : Waypoint Tag is Defined Camp
//   : Despawns Camp when all Children Dead
//   : Camps are Defined in 'spawn_cfg_camp'
//   : Optional Flag: D000
//   :   Placeables Decay 000 Seconds after Camp Despawn
//   :
//   : Camp Children Flags:
//   :
//   :   RW       : Random Walk
//   :   SF       : Spawn Facing Camp
//   :   SG       : Spawn Group
//   :   LT00     : Loot Table
//   :   CD000|T0 : Corpse Decay
//   :   PL0|T00  : Placeable Type
//   :             Placeable Trap Disabled
//
//   SSn|Dn
//   : Spawn Script
//   : Run Script 001 to 999 on Spawn
//   : Scripts are Defined in 'spawn_sc_spawn'
//   : Optional Flag: D000
//   :   Run Script 001 to 999 on Despawn
//
//   DTn
//   : Death Script
//   : Run Script 001 to 999 on Death
//   : Scripts are Defined in 'spawn_sc_death'
//
//   CPn|Rn
//   : Spawn Check PCs
//   : Check Custom Code to see if Spawn Proceeds
//   : Custom Code is Defined in 'spawn_chk_pcs'
//   : Optional Flag: R00
//   :   Check all PCs in Radius R00
//   :   Default Check all PCs in Area
//
//   CCn
//   : Spawn Check Custom
//   : Check Custom Code to see if Spawn Proceeds
//   : Custom Code is Defined in 'spawn_chk_custom'
//
//   TRn|Dn
//   : Spawn Trigger
//   : Only Spawns if PC is within 00 Meters
//   : Optional Flag: D00
//   :   Despawns if PC is not within D00 Meters
//
//   AEn|Dn
//   : Spawn Area Effect
//   : Area Effects are Defined in 'spawn_cfg_fxae'
//   : Waypoint Tag can be "AE" to Spawn only Area Effect
//   : Optional Flag: D000
//   :   Area Effect Duration of 000 to 999 Seconds
//   :   Duration of 000 means Permanent Area Effect
//   :   Default Duration is 005 Seconds
//
//   OEn|Dn
//   : Object Effect
//   : Object Effects are Defined in 'spawn_cfg_fxobj'
//   : Optional Flag: D000
//   :   Object Effect Duration of 000 to 999 Seconds
//   :   Duration of 000 means Permanent Object Effect
//   :   Default Duration is Permanent
//
//   RSn
//   : Random Spawn
//   : Percentage Chance Spawn will Occur
//   : Default 100% Chance
//
//   FCn
//   : Spawn Faction
//   : Change Faction of Children:
//   :   Faction 0: COMMONER
//   :   Faction 1: DEFENDER
//   :   Faction 2: MERCHANT
//   :   Faction 3: HOSTILE
//   :   Faction 4: CUSTOM
//   :     Change Faction to Same as Nearest
//   :     Object with Tag 'SpawnFaction'
//
//   ALn|Sn
//   : Spawn Alignment
//   : Shift Alignment of Children
//   :   Alignment 0: Neutral
//   :   Alignment 1: Law
//   :   Alignment 2: Chaos
//   :   Alignment 3: Good
//   :   Alignment 4: Evil
//   :   Alignment 5: All
//   : Optional Flag: S00
//   :   Shift Alignment by S00
//   :   Default Shift by 10
//
//   HBn
//   : Heartbeat Script
//   : Children will Run Script HB000 each Cycle
//   : Scripts are Defined in 'spawn_sc_hbeat'
//
//   SLn|Rn|I
//   : Spawn Location
//   : Spawn Children at Waypoint SL00
//   : Optional Flag: R
//   :   Choose Random Location
//   :   from R00 to SL00
//   : Optional Flag: I
//   :   When spawning multiple children, each child takes the next
//   :   waypoint, In order - (first child spawns at SL00, next at SL01, etc.)
//   :
//   : Location Name: Variable
//   : Location Tag: SL00
//
//   RH|Dn
//   : Return Home
//   : Child will always Return to Home
//   : Optional Flag: D00
//   :   Child will Return to Home
//   :   Only if further than D00 Meters
//
//   HL|n|E
//   : Heal Children if Not in Combat
//   : Optional Value: 00
//   :   Heal 00% per Cycle
//
//   IT
//   : Spawn Item
//   : Spawnpoint Tag is Item Template
//
//   ST
//   : Spawn Sit
//   : Children will Sit in Nearest Unoccupied Sittable
//   : Sittable's Tag must be 'Seat'
//
//   PT
//   : Spawn Plot
//   : Sets Children as Plot
//
//   SM
//   : Spawn Merchant
//   : Spawnpoint Tag is Merchant Template
//
//   CF
//   : Custom Flag
//   : Everything in Spawn Name after CF
//   : Is Stored in LocalString "CustomFlag"
//   : On Each Spawned Child
//
// ALFA Only Flags
//
//   SXn
//   : Suppress XP 
//   : Suppress diminishing returns XP
//   : SX1 turns suppression on (the default, you may just use SX)
//   : SX0 turns suppression off for the spawn if it has been put on 
//   : globally (by setting nGlobalSuppressDR to TRUE in spawn_cfg_global)
//
//   NL
//   : No Loot
//   : Suppress player corpse looting
//
//   SB
//   : SuBdual
//   : Spawn creatures in in subdual mode
//
//   ELn
//   : Encounter Level
//   : Set the encounter level for a spawn
//   : This is used by the ALFA core rules in determining whether or not
//   : an encounter should result in XP to a given level party.  If not 
//   : specified, the CR of the creature killed is used as the EL.
//
//
//
//

//
// Functions for external control.  Please use these when possible instead
// of modifying variables directly in NESS.
//
// object NESS_GetSpawnByID(int nSpawnID, object oArea)
//   : Returns the spawn waypoint in area oArea with ID nSpawnID
//
// void   NESS_ActivateSpawnByID(int nSpawnID, object oArea)
//   : Activates the spawn in area oArea with ID nSpawnID
//
// void   NESS_DeactivateSpawnByID(int nSpawnID, object oArea)
//   : Deactivates the spawn in area oArea with ID nSpawnID
//
// void   NESS_ActivateSpawn(object oSpawn)
//   : Activates spawn oSpawn
//
// void   NESS_DeactivateSpawn(object oSpawn)
//   : Deactivates spawn oSpawn
//
// void   NESS_ForceProcess(object oSpawn)
//   : Force spawn oSpawn to be processed next heartbeat (regardless of
//   : SPxx value)
//
// void   NESS_TrackModuleSpawns(int nFlag=TRUE)
//   :  Enable (nFlag == TRUE) or Disable (nFlag == FALSE) Spawn Tracking
//
// int    NESS_IsModuleSpawnTracking()
//   :  Returns TRUE is spawn tracking is enabled, FALSE otherwise
//
//
// Some Tips and Pointers
// - with Thanks to Eliha for Creating this Section
//
// 1. The .erf script files we import for NWN usually contain .nss and
// .utp files.
//
// 1.1. The .nss files are the Nwn Source Scripts that are in plain text that
// we manipulate in the script editor.
//
// 1.2. The .utp file(s) are objects such as an invisible corpse object that
// automatically gets put in the right column of the toolset where you select
// the creatures, doors, placeables, etc. under the custom button.
//
// 2. After importing the .erf and ignoring that it couldn't find the .ncs files
// you'll need to save your module then reopen it for the new scripts to appear
// in the left column (due to the lack of a refresh button).
//
// 3. When working in the various configuration scripts you only need to save
// them, not compile them. They are just add-ons to the main spawn_sample_hb.nss
// script and attempts to compile them will result in errors. The spawn_sc_xxxx
// files will compile but even they should just be saved like all the other
// spawn_cfg_xxxx scripts.
//
// 4. When finished editing and saving the various configuration scripts you
// will then need to open the spawn_sample_hb script and compile it to integrate
// your new changes into the system. If you customized your scripts, saved them,
// saved the module, then loaded the game and find nothings working....chances are
// you forgot to compile the spawn_sample_hb script after making your changes.
//
// 5. You can usually tell which script needs to be compiled by noticing which
// one needs to be put in an area heartbeat or on an object somewhere, etc.. In
// this case, we are adding the spawn_sample_hb to the area heartbeat so it is the
// main file and requires compiling.
//


//
// Package Header
//
/*
NESS Version 8.0

Cereborn
Legends Of Greyhawk

See 'spawn__readme' for Instructions
Ignore all 'Missing Resource' Errors
See the NWN Forums for More Info

Spawn Package:

 NESS Scripts:
- spawn__readme
- spawn_cfg_camp
- spawn_cfg_flag
- spawn_cfg_fxae
- spawn_cfg_fxobj
- spawn_cfg_fxsp
- spawn_cfg_global
- spawn_cfg_group
- spawn_cfg_loot
- spawn_cfg_cusflg
- spawn_chk_pcs
- spawn_chk_custom
- spawn_corpse_dcy
- spawn_corpse_dth
- spawn_defaults
- spawn_dist_corps
- spawn_flags
- spawn_functions
- spawn_main
- spawn_onopencrp
- spawn_oncloscrp
- spawn_sample_hb
- spawn_sc_cmptrig
- spawn_sc_deactiv
- spawn_sc_death
- spawn_sc_patrol
- spawn_sc_spawn
- spawn_timefuncs
- spawn_used_corps

 NESS Resources:
- invis_corpse_obj
- invis_corpse_bdy
- invis_corpse_bon
- invis_corpse_pot
- invis_corpse_pch
- invis_corpse_ser
- invis_corpse_tre

 Spawn Banner Scripts:
- spawnb_cc_activ
- spawnb_cc_dactiv
- spawnb_cc_dump
- spawnb_cc_nodump
- spawnb_cc_notrck
- spawnb_cc_nsclog
- spawnb_cc_nsdlog
- spawnb_cc_sclog
- spawnb_cc_sdlog
- spawnb_cc_trck
- spawnb_main
- spawnb_sample_ai
- spawnb_sc_activ
- spawnb_sc_dactiv
- spawnb_sc_disp
- spawnb_sc_dump
- spawnb_sc_nodump
- spawnb_sc_notrck
- spawnb_sc_nsdlog
- spawnb_sc_sclog
- spawnb_sc_sdlog
- spawnb_sc_snclog
- spawnb_sc_trck

 Spawn Banner Resources:
- spawn_ban_rod.uti
- spawn_banner.dlg
- spawn_ban_a.utp
- spawn_ban_d.utp


*/
