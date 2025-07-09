
    EC_NOP_00 .segment
      .byte $00
    .endsegment

    ; Identifier : $20
    START_PLAYER_PHASE .segment Flag, Turn
      .byte $01
      .byte \Flag
      .sint \Turn
    .endsegment

    ; Identifier : $01
    CHECK_SEIZING_CASTLE .segment Flag, SeizersFactionSlot, LocationID
      .byte $02
      .byte \Flag
      .word \SeizersFactionSlot
      .word \LocationID
    .endsegment

    ; Identifier : $02
    CHECK_VILLAGE_DESTROYED .segment Flag, DestroyerFactionSlot, LocationID
      ; Unused.
      .byte $03
      .byte \Flag
      .word \DestroyerFactionSlot
      .word \LocationID
    .endsegment

    ; Identifier : $0A
    CHECK_TALK .segment Flag, Initiator, Target, CostsMoneyFlag=-1
      ; If checking for a talk that can be for a child as well as a substitute,
      ; use CHECK_CHILD_TALK instead.
      .byte $04
      .byte \Flag
      .sint \Initiator
      .sint \Target
      .sint int(\CostsMoneyFlag)
    .endsegment

    ; Identifier : $04
    CHECK_ENTERING_HOME_CASTLE .segment Flag, Unit, LocationID
      .byte $05
      .byte \Flag
      .sint \Unit
      .sint \LocationID
    .endsegment

    ; Identifier : $05
    EC_06 .segment Flag, Unknown1, Unknown2
      ; Unused.
      ; No idea where the game sets the bEventActionIdentifier to $05, so idk what this checks.
      .byte $06
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $06
    CHECK_ENTERING_CASTLE_MENU .segment Flag, CharacterID, LocationID
      ; The menu with the 6 options; shop, pawnbroker, arena, etc
      .byte $07
      .byte \Flag
      .sint \CharacterID
      .sint \LocationID
    .endsegment

    ; Identifier : $07
    EC_08 .segment Flag, Unknown1, Unknown2
      ; Unused.
      ; No idea where the game sets the bEventActionIdentifier to $07, so idk what this checks.
      .byte $08
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $08
    EC_09 .segment Flag, CharacterID, LocationID
      ; Unused.
      ; Only checked for in the unused "Visit Town" command?
      .byte $09
      .byte \Flag
      .word \CharacterID
      .word \LocationID
    .endsegment

    ; Identifier : $09
    VISIT_VILLAGE .segment Flag, CharacterID, LocationID
      .byte $0A
      .byte \Flag
      .sint \CharacterID
      .sint \LocationID
    .endsegment

    ; Identifier : $03
    CHECK_UNIT_IN_AREA .segment Flag, CharacterID, TopLeftCorner, BottomRightCorner, FactionSlot=$FF
      .byte $0B
      .byte \Flag
      .sint \CharacterID
      .word \TopLeftCorner
      .word \BottomRightCorner
      .char \FactionSlot
    .endsegment

    ; Identifier : $03
    CHECK_UNITS_WITHIN_DISTANCE .segment Flag, ActiveUnit, Unit2, Distance, ActiveUnitFaction=$FF
      ; Distance is inclusive
      .byte $0C
      .byte \Flag
      .sint \ActiveUnit
      .sint \Unit2
      .byte \Distance
      .char \ActiveUnitFaction
    .endsegment

    ; Identifier : $14
    CHECK_UNITS_FIGHTING .segment Flag, FactionSlot1, CharacterID1, FactionSlot2, CharacterID2
      .byte $0D
      .byte \Flag
      .sint \FactionSlot1
      .sint \CharacterID1
      .sint \FactionSlot2
      .sint \CharacterID2
    .endsegment

    ; Identifier : $14
    CHECK_UNITS_FIGHTING_1TO2RANGE .segment Flag, FactionSlot1, CharacterID1, FactionSlot2, CharacterID2
      ; Same as previous, but wont trigger if the battle distance is 3 or higher.
      .byte $0E
      .byte \Flag
      .sint \FactionSlot1
      .sint \CharacterID1
      .sint \FactionSlot2
      .sint \CharacterID2
    .endsegment

    ; Identifier : $17
    CHECK_UNIT_DIED .segment Flag, CharacterID, FactionSlot=$FFFF
      ; Triggers after a unit died and their map sprite disappeared
      .byte $0F
      .byte \Flag
      .sint \CharacterID
      .sint \FactionSlot
    .endsegment

    ; Identifier : $11
    CHECK_FELL_IN_LOVE .segment Flag, HusbandCharacterID, WifeCharacterID
      ; Unused.
      ; Triggers whenever 2 characters fall in love, be it though events or the start of player phase.
      .byte $10
      .byte \Flag
      .word \HusbandCharacterID
      .word \WifeCharacterID
    .endsegment

    ; Identifier : $06
    EC_11 .segment Flag, CharacterID, LocationID, Gender
      ; Unused.
      ; Same identifier as CHECK_ENTERING_CASTLE_MENU, but parameter 3 is never set,
      ; so this can't event check the gender of the character?
      .byte $11
      .byte \Flag
      .word \CharacterID
      .word \LocationID
      .word \Gender
    .endsegment

    ; Identifier : $0A
    EC_12 .segment Flag, Initiator, Target, InitiatorGender
      ; Unused.
      ; Like CHECK_TALK but also checks gender of initiator?
      .byte $12
      .byte \Flag
      .word \Initiator
      .word \Target
      .word \InitiatorGender
    .endsegment

    ; Identifier : $04
    CHECK_CHILD_ENTERING_HOME_CASTLE .segment Flag, Unit, CastleID
      ; Only for Gen2 units, maps the character IDs of subs 
      ; to those of the original children.
      .byte $13
      .byte \Flag
      .word \Unit
      .word \CastleID
    .endsegment

    ; Identifier : $06
    CHECK_CHILD_ENTERING_CASTLE_MENU .segment Flag, CharacterID, LocationID
      ; Unused.
      .byte $14
      .byte \Flag
      .word \CharacterID
      .word \LocationID
    .endsegment

    ; Identifier : $0A
    EC_15 .segment Flag, Initiator, Target
      ; Unused.
      ; Like CHECK_CHILD_TALK but only maps the initiator to a sub?
      .byte $15
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $0A
    CHECK_CHILD_TALK .segment Flag, Initiator, Target
      ; Only works with CharacterIDs equal/greater than Seliphs
      ; Specified characters get mapped to the substitutes IDs.
      .byte $16
      .byte \Flag
      .word \Initiator
      .word \Target
    .endsegment

    ; Identifier : $17
    CHECK_CHILD_UNIT_DIED .segment Flag, CharacterID
      ; Unused.
      .byte $17
      .byte \Flag
      .word \CharacterID
    .endsegment

    ; Identifier : $11
    CHECK_CHILD_FELL_IN_LOVE .segment Flag, HusbandCharacterID, WifeCharacterID
      ; Unused.
      .byte $18
      .byte \Flag
      .word \HusbandCharacterID
      .word \WifeCharacterID
    .endsegment

    ; Identifier : $14
    CHECK_CHILD_UNITS_FIGHTING .segment Flag, FactionSlot1, CharacterID1, FactionSlot2, CharacterID2
      ; Unused.
      .byte $19
      .byte \Flag
      .word \FactionSlot1
      .word \CharacterID1
      .word \FactionSlot2
      .word \CharacterID2
    .endsegment

    ; Identifier : $18
    CHECK_UNIT_DIED_TO .segment Flag, DeadCharacterID, KillerCharacterID
      .byte $1A
      .byte \Flag
      .sint \DeadCharacterID
      .sint \KillerCharacterID
    .endsegment

    ; Identifier : $18
    CHECK_CHILD_UNIT_DIED_TO .segment Flag, DeadCharacterID, KillerCharacterID
      ; Unused.
      .byte $1B
      .byte \Flag
      .word \DeadCharacterID
      .word \KillerCharacterID
    .endsegment

    ; Identifier : $1A
    RESCUE_CIVILIAN .segment Flag, RescuerCharacterID, FormationID
      .byte $1C
      .byte \Flag
      .sint \RescuerCharacterID
      .word \FormationID + 1
    .endsegment

    ; Identifier : $1B
    CHECK_PLAYER_UNCAPTURED_IF_SEIZING .segment Flag, CharacterID
      ; This gets triggered if you are seizing a castle and any player
      ; character with the PoW skill died in the chapter and got revived.
      .byte $1D
      .byte \Flag
      .sint \CharacterID
    .endsegment

    ; Identifier : $1C
    CHECK_WON_IN_ARENA .segment Flag, PlayerCharacterID, LocationID, TargetCharacterID
      .byte $1E
      .byte \Flag
      .sint \PlayerCharacterID
      .sint \LocationID
      .sint \TargetCharacterID
    .endsegment

    ; Identifier : $1D
    CHECK_SPECIAL_CRIT .segment Flag, CritType, CharacterID
      ; Can catch successful lover, sibling and triangle attack crits
      ; performed by the CharacterID speficied.
      .byte $1F
      .byte \Flag
      .word \CritType
      .sint \CharacterID
    .endsegment

    BREAK_ACTION_EVENT_CHECKS .segment
      ; The event engine goes over any event condition with a command byte less than this one, and checks
      ; if their event can activate. If it does, skip any events that come after it, until it hits this
      ; event command, then continue like usual from here.
      .byte $20
      .word $6666
    .endsegment

    CHECK_TURN_PHASE_AI_ACTOR .segment Turn, FactionSlot, AISetting=$00, CharacterID=$0000
      ; Can run following events if the turn and the FactionSlot match the current state.
      ; First does a cycle with AI and CharacterID ignored. Afterwards for factions other than player, 
      ; can also check when that factions AI group is acting, or if a character is acting.
      .byte $21
      .char \Turn
      .char \FactionSlot
      .char \AISetting
      .sint \CharacterID
    .endsegment

    ; Identifier : $20
    SKIP_IF_START_PLAYER_PHASE .segment
      ; Unused.
      ; If the event engine reads this command while the event identifier is $20 aka at the start of the player phase,
      ; skip any events that come after this until it hits a BREAK_TURN_EVENT_CHECKS.
      .byte $22
    .endsegment

    ; Identifier : $25
    EC_23 .segment
      ; Unused.
      ; Like the last one, but nothing sets the identifier to $25?
      .byte $23
    .endsegment

    ; Identifier : $26
    EC_24 .segment
      ; Unused.
      ; Like the last two, but nothing sets the identifier to $26?
      .byte $24
    .endsegment

    BREAK_TURN_EVENT_CHECKS .segment
      ; The event engine goes over any event condition with a command byte between $21 and $24, and checks
      ; if their event can activate. If it does, skip any events that come after it, until it hits this
      ; event command, then continue like usual from here.
      .byte $25
      .word $6666
    .endsegment

    EC_RUN_ASM .segment RoutinePointer
      ; Unused.
      .byte $26
      .long \RoutinePointer
    .endsegment

    SET_FLAG .segment Flag
      .byte $27
      .byte \Flag
    .endsegment

    UNSET_FLAG .segment Flag
      .byte $28
      .byte \Flag
    .endsegment

    CHECK_FLAG_SET .segment Flag
      .byte $29
      .byte \Flag
    .endsegment

    CHECK_FLAG_UNSET .segment Flag
      .byte $2A
      .byte \Flag
    .endsegment

    EC_JUMP .segment Address
      ; Unused.
      .byte $2B
      .word \Address
    .endsegment

    CHECK_ALL_FLAGS_IN_LIST_SET .segment FlagList
      ; Returns SEC, if all flags in the list are set.
      .byte $2C
      .byte \FlagList, $FF
    .endsegment

    CHECK_FLAG_IN_LIST_SET .segment FlagList
      ; Returns SEC, if at least one flag in the list is set.
      .byte $2D
      .byte \FlagList, $FF
    .endsegment

    BREAK_STATE_CHECKS .segment
      .byte $2E
      .word $6666
    .endsegment

    EC_2F .segment
      ; Unused.
      ; Effectively the same as the previous one?
      .byte $2F
      .word $6666
    .endsegment

    EVENT .segment Flag, EventID
      ; Unlike FE5, this uses an ID instead of an address.
      .byte $30
      .byte \Flag
      .word \EventID
    .endsegment

    SET_BATTLE_OR_DEATH_QUOTE .segment Flag, DialoguePointer, ChangeDeathQuoteFlag
      ; Sets battle quotes by default. If ChangeDeathQuoteFlag is set, changes death quote instead.
      ; Battle quotes only work if the targed isnt asleep or silenced.
      .byte $31
      .byte \Flag
      .long \DialoguePointer
      .byte \ChangeDeathQuoteFlag
    .endsegment

    SET_PRECOMBAT_DIALOGUE .segment Flag, DialoguePointer, SongID
      ; The song ID only reads the lower byte, so IDs above $FF dont work.
      ; Also skips any SET_BATTLE_OR_DEATH_QUOTE afterwards.
      .byte $32
      .byte \Flag
      .long \DialoguePointer
      .word \SongID
    .endsegment

    REMOVE_CURRENT_CHAPTER_STRUCT .segment
      ; Unused.
      .byte $33
    .endsegment

    REMOVE_CHAPTER_STRUCT .segment ChapterID
      ; Run this during the end event of a chapter to clear the RAM struct.
      .byte $34
      .byte \ChapterID
    .endsegment

    EC_35 .segment EventHeaderPointer
      ; Unused.
      ; Runs the opening events of a specified pointer?
      .byte $35
      .long \EventHeaderPointer
    .endsegment

    SET_PERMANENT_FLAG .segment Flag
      .byte $36
      .byte \Flag
    .endsegment

    UNSET_PERMANENT_FLAG .segment Flag
      .byte $37
      .byte \Flag
    .endsegment

    CHECK_PERMANENT_FLAG_SET .segment Flag
      .byte $38
      .byte \Flag
    .endsegment

    CHECK_PERMANENT_FLAG_UNSET .segment Flag
      .byte $39
      .byte \Flag
    .endsegment

    CHECK_ALL_PERMANENT_FLAGS_IN_LIST_SET .segment Flag
      .byte $3A
      .byte \Flag
    .endsegment

    SET_CHAPTER_EVENT_COUNTER .segment CounterID, Value
      ; Sets a value to one of the 2 counters in the chapter RAM struct
      ; ID can be 0 or 1
      .byte $3B
      .byte \CounterID
      .byte \Value
    .endsegment

    ADD_CHAPTER_EVENT_COUNTER .segment CounterID, Value
      .byte $3C
      .byte \CounterID
      .byte \Value
    .endsegment

    INCREMENT_CHAPTER_EVENT_COUNTER .segment CounterID
      .byte $3D
      .byte \CounterID
    .endsegment

    DECREMENT_CHAPTER_EVENT_COUNTER .segment CounterID
      .byte $3E
      .byte \CounterID
    .endsegment

    CHECK_CHAPTER_EVENT_COUNTER_EQUAL .segment CounterID, Value
      .byte $3F
      .byte \CounterID
      .byte \Value
    .endsegment

    CHECK_CHAPTER_EVENT_COUNTER_NOT_EQUAL .segment CounterID, Value
      .byte $40
      .byte \CounterID
      .byte \Value
    .endsegment

    CHECK_IF_IN_HOME_CASTLE .segment CharacterID
      ; Unused.
      .byte $41
      .word \CharacterID
    .endsegment

    CHECK_ITEM_UNOBTAINED .segment PlayerItemID
      ; Unused.
      .byte $42
      .word \PlayerItemID
    .endsegment

    CHECK_NO_CASTLE_DESTROYED .segment
      ; If any castle is destroyed, skips until it hits a BREAK_STATE_CHECKS
      .byte $43
    .endsegment

    CHECK_EVERYONE_IN_FACTION_DEAD .segment FactionSlot
      ; Needs a BREAK_STATE_CHECKS at some point after it.
      .byte $44
      .byte \FactionSlot
    .endsegment

    CHECK_UNITS_MARRIED .segment CharacterID1, CharacterID2
      .byte $45
      .byte \CharacterID1
      .char \CharacterID2
    .endsegment

    CHECK_UNIT_ALIVE .segment CharacterID
      ; If character is dead, skips until it hits a BREAK_STATE_CHECKS
      .byte $46
      .word \CharacterID
    .endsegment

    CHECK_FATHERS_CHILD_ALIVE .segment FatherCharacterID
      ; Based on the given character ID, finds the units with the given
      ; ID as father.
      ; If at least one of them is alive, continue with the event script,
      ; else skip over events until a BREAK_STATE_CHECKS.
      .byte $47
      .word \FatherCharacterID
    .endsegment

    SET_CHAPTER_EVENT_DATA_POINTER .segment EventDataPointer
      ; Unused.
      .byte $48
      .long \EventDataPointer
    .endsegment

    REGISTER_CHARACTER_MAP_SPRITE .segment CharacterID
      .byte $49
      .word \CharacterID
    .endsegment

    REGISTER_UNITGROUP_MAP_SPRITES .segment UNITGroupID
      .byte $4A
      .byte \UNITGroupID
    .endsegment

    LOAD_FACTION_GROUP .segment FactionSlot, FactionGroupID
      .byte $4B
      ; Loads the given FactionGroup into the assigned faction slot
      .byte \FactionSlot
      .byte \FactionGroupID
    .endsegment

    SET_FACTION_GROUP .segment FactionSlot, FactionGroupID
      ; Writes new FactionGroup data over an existing slot.
      .byte $4C
      .byte \FactionSlot
      .byte \FactionGroupID
    .endsegment

    SET_FACTION_HOSTILITY .segment Type, FactionSlots
      .byte $4D
      .byte \Type
      .byte \FactionSlots[1]
      .byte \FactionSlots[0]
    .endsegment

    DEPLOY_UNIT_GROUP .segment UnitGroupID
      ; After loading any units from a unit group, run this to properly
      ; update the deployment table with their values.
      .byte $4E
      .byte \UnitGroupID
    .endsegment

    DEPLOY_UNIT_GROUP_CHILD .segment UnitGroupID
      ; Similar to the last one, but requires additional data after
      ; this command. Takes a byte permanent flag and 2 character words.
      ; Checks the first character word against the units in the UnitGroup
      ; and will replace the matching character with the 2nd one if the
      ; permanent flag is set.
      .byte $4F
      .byte \UnitGroupID
    .endsegment

    SET_UNIT_POSITION .segment CharacterID, CastleID, Coordinates=[0, 0]
      ; If specified Character doesn't exist yet, load them as a player character into RAM.
      ; If the CastleID is set, the coordinates don't matter.
      .byte $50
      .word \CharacterID
      .byte \CastleID
      .byte \Coordinates[0]
      .byte \Coordinates[1]
    .endsegment

    EC_51 .segment CharacterID, FactionSlot, Coordinates, AISetting, GroupLeaderFlag
      ; Unused.
      ; Like the last one, but not locked to the player faction
      .byte $51
      .word \CharacterID
      .byte \FactionSlot
      .byte \Coordinates[0]
      .byte \Coordinates[1]
      .word \(AISetting | int(GroupLeaderFlag) << 7)
    .endsegment

    EC_52 .segment CharacterID, Level, Item1, Item2
      ; Unused.
      ; Like SET_UNIT_POSITION, but puts them into the home castle, autolevels them and can give them 2 items.
      .byte $52
      .word \CharacterID
      .byte \Level
      .byte \Item1
      .byte \Item2
    .endsegment

    CHANGE_UNITS_FACTIONSLOT .segment Character, FactionSlot
      ; Targets EventUnitSlot1 if Character isnt specified.
      .byte $53
      .word \Character
      .byte \FactionSlot
    .endsegment

    ADD_UNIT_MONEY .segment CharacterID, MoneyAmount
      ; Targets EventUnitSlot1 if character isnt specified.
      .byte $54
      .word \CharacterID
      .word \MoneyAmount
    .endsegment

    SUBTRACT_UNIT_MONEY .segment CharacterID, MoneyAmount
      ; Targets EventUnitSlot1 if character isnt specified.
      .byte $55
      .word \CharacterID
      .word \MoneyAmount
    .endsegment

    EC_56 .segment
      ; Unused.
      ; Does nothing.
      .byte $56
    .endsegment

    GIVE_UNIT_PID .segment CharacterID, PlayerItemID
      ; Targets EventUnitSlot1 if CharacterID isnt specified.
      ; If inventory is full, item is not given.
      .byte $57
      .sint \CharacterID
      .byte \PlayerItemID
    .endsegment

    GIVE_UNIT_PID_EQUIP .segment CharacterID, PlayerItemID
      ; Targets EventUnitSlot1 if CharacterID isnt specified.
      ; If inventory is full, item is not given.
      ; Item is automatically equipped.
      .byte $58
      .word \CharacterID
      .byte \PlayerItemID
    .endsegment

    GIVE_CHILD_UNIT_PID .segment CharacterID, PlayerItemID
      ; Unused.
      .byte $59
      .word \CharacterID
      .byte \PlayerItemID
    .endsegment

    SEND_INVENTORY_TO_SUPPLY .segment CharacterID
      ; Targets EventUnitSlot1 if character isnt specified.
      .byte $5A
      .word \CharacterID
    .endsegment

    GIVE_UNIT_PID_FORCED .segment CharacterID, PlayerItemID
      ; Targets EventUnitSlot1 if character isnt specified.
      ; If inventory is full, last item is sent to supply and this item is placed in the inventory.
      .byte $5B
      .word \CharacterID
      .byte \PlayerItemID
    .endsegment

    UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS .segment
      .byte $5C
    .endsegment

    EC_5D .segment EventFlag, Turn, FactionSlot, AISetting, EventID
      ; Unused.
      ; If all conditions are met, run specified event.
      .byte $5D
      .byte \EventFlag
      .word \Turn
      .byte \FactionSlot
      .byte \AISetting
      .word \EventID
    .endsegment

    EC_5E .segment BattleDataPointer
      ; Unused.
      ; Starts a scripted battle?
      ; Points to:
      ; word CharacterID
      ; byte InvenorySlot
      ; word CharacterID
      ; byte ?
      ; long death quote
      ; long battle quote
      ; byte initiator
      .byte $5E
      .long \BattleDataPointer
    .endsegment

    SET_SCRIPTED_ACTION .segment Unit1ID, Coordinates, ActionID, Unit2ID
      .byte $5F
      .word \Unit1ID
      .byte \Coordinates[0]
      .byte \Coordinates[1]
      .byte \ActionID
      .word \Unit2ID
    .endsegment

    MODIFY_LOVE_POINTS .segment FemaleCharacterID, MaleCharacterID, LovePointsAmount
      ; Can increase or decrease love points.
      .byte $60
      .word \FemaleCharacterID
      .word \MaleCharacterID
      .byte \LovePointsAmount
    .endsegment

    SET_UNIT_IN_CASTLE .segment CharacterID, LocationID
      .byte $61
      .word \CharacterID
      .byte \LocationID
    .endsegment

    SET_LOCATION_TAKEOVER .segment FactionSlot, LocationID
      ; Deletes every unit that previously controlled that location
      ; and unloads that FactionSlot.
      .byte $62
      .byte \FactionSlot
      .byte \LocationID
    .endsegment

    DELETE_FACTIONS_AI .segment FactionSlot, AISetting
      ; Deletes units of specified faction that have specified AI setting.
      .byte $63
      .byte \FactionSlot
      .byte \AISetting
    .endsegment

    REVIVE_FACTIONS_AI .segment FactionSlot, AISetting
      .byte $64
      .byte \FactionSlot
      .byte \AISetting
    .endsegment

    REMOVE_UNIT .segment CharacterID
      ; Completely removes a unit from RAM
      .byte $65
      .word \CharacterID
    .endsegment

    UNDEPLOY_UNIT .segment CharacterID
      ; Undeploys a unit so they wont show up on any unit list anymore.
      ; Their data is still in RAM though
      .byte $66
      .word \CharacterID
    .endsegment

    SET_EVENT_UNIT_POINTERS .segment GenerationID1, GenerationID2
      ; Unused.
      .byte $67
      .byte \GenerationID1
      .byte \GenerationID2
    .endsegment

    SET_TALK_TARGET .segment Initiator, Target
      ; Note: This only accepts bytes instead of words.
      .byte $68
      .byte \Initiator
      .byte \Target
    .endsegment

    SET_TALK_TARGET_IF_UNMARRIED .segment Initiator, Target
      .byte $69
      .switch type(\Initiator)
        .case int
          .byte \Initiator
          .byte \Target
          .char -1
          .char -1
        .case list
          .byte \Initiator[0]
          .byte \Target[0]
          .byte \Initiator[1]
          .byte \Target[1]
      .endswitch
    .endsegment

    SET_CHILD_TALK_TARGET .segment Initiator, Target
      .byte $6A
      .byte \Initiator[0]
      .byte \Target[0]
      .byte \Initiator[1]
      .byte \Target[1]
    .endsegment

    SET_TALK_TARGET_IF_MARRIED .segment EventFlag, Initiator, Target
      .byte $6B
      .byte \EventFlag
      .byte \Initiator
      .byte \Target
    .endsegment

    SET_TALK_TARGET_IF_CHILDREN_MARRIED .segment EventFlag, Initiator, Target
      .byte $6C
      .byte \EventFlag ; flag
      .byte \Initiator[0]
      .byte \Target[0]
      .byte \Initiator[1]
      .byte \Target[1]
    .endsegment

    ADD_CASTLE_MONEY .segment
      ; Adds 1000 gold to every player character for each player/npc controlled castle.
      .byte $6D
    .endsegment

    CLOSE_VILLAGE .segment LocationID
      .byte $6E
      .byte \LocationID
    .endsegment

    OPEN_VILLAGE .segment LocationID
      .byte $6F
      .byte \LocationID
    .endsegment

    ADD_UNIT_STAT .segment CharacterID, StatIndex, Value
      ; Targets EventUnitSlot1 if character isnt specified.
      .byte $70
      .char \CharacterID
      .byte structExtendedCharacterDataRAM.\StatIndex
      .byte \Value
    .endsegment

    REMOVE_AREA_RESTRICTION .segment Index
      ; Unlocks the specified no-entry zone.
      .byte $71
      .byte \Index
    .endsegment

    SET_AREA_RESTRICTION .segment Index
      ; Unused.
      .byte $72
      .byte \Index
    .endsegment

    EC_73 .segment
      ; Has something to do with battle animations
      .byte $73
    .endsegment

    COMBATANTS_STAY_ON_MAP .segment
      ; Used so bosses can have events to run/warp away.
      .byte $74
    .endsegment

    SET_UNIT_STATUS .segment CharacterID, Status, StatusDuration
      ; Unused
      .byte $75
      .word \CharacterID
      .byte \Status
      .byte \StatusDuration
    .endsegment

    REPLACE_UNIT .segment Original, Replacement
      .byte $76
      .word \Original
      .word \Replacement
    .endsegment

    CLEAR_TALK_IF_ONE_MARRIED .segment TalkUnitsPointer
      ; Points to a $FFFF terminated list of 2 byte sized CharacterIDs each.
      ; If one of the talk partners is married, clear the talk taget of the other one.
      .byte $77
      .long \TalkUnitsPointer
    .endsegment

    SAVE_CHAPTER_TURNCOUNT .segment
      .byte $78
    .endsegment

    END_CHAPTER_EVENTS .segment
      .word $FFFF
    .endsegment
