
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
    EC_03 .segment Flag, Unknown1, Unknown2
      .byte $03
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $0A
    CHECK_TALK .segment Flag, Initiator, Target, CostsMoneyFlag=$FFFF
      .byte $04
      .byte \Flag
      .sint \Initiator
      .sint \Target
      .word int(\CostsMoneyFlag)
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
      .byte $08
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $08
    EC_09 .segment Flag, Unknown1, Unknown2
      .byte $09
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $09
    VISIT_VILLAGE .segment Flag, CharacterID, LocationID
      .byte $0A
      .byte \Flag
      .sint \CharacterID
      .sint \LocationID
    .endsegment

    ; Identifier : $03
    CHECK_UNIT_IN_AREA .segment Flag, CharacterID, TopLeftCorner, BottomRightCorner, FactionSlot
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
    EC_10 .segment Flag, Unknown1, Unknown2
      .byte $10
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $06
    EC_11 .segment Flag, Unknown1, Unknown2, Unknown3
      .byte $11
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
      .word \Unknown3
    .endsegment

    ; Identifier : $0A
    EC_12 .segment Flag, Unknown1, Unknown2, Unknown3
      .byte $12
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
      .word \Unknown3
    .endsegment

    ; Identifier : $04
    EC_13 .segment Flag, Unit, CastleID
      ; Only for Gen2 units, maps the character IDs of subs 
      ; to those of the original children.
      .byte $13
      .byte \Flag
      .word \Unit
      .word \CastleID
    .endsegment

    ; Identifier : $06
    EC_14 .segment Flag, Unknown1, Unknown2
      .byte $14
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $0A
    EC_15 .segment Flag, Unknown1, Unknown2
      .byte $15
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $0A
    EC_16 .segment Flag, Unknown1, Unknown2
      .byte $16
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
    .endsegment

    ; Identifier : $17
    EC_17 .segment Flag, Unknown1
      .byte $17
      .byte \Flag
      .word \Unknown1
    .endsegment

    ; Identifier : $11
    EC_18 .segment Flag, Unknown1
      .byte $18
      .byte \Flag
      .word \Unknown1
    .endsegment

    ; Identifier : $14
    EC_19 .segment Flag, Unknown1, Unknown2, Unknown3, Unknown4
      .byte $19
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
      .word \Unknown3
      .word \Unknown4
    .endsegment

    ; Identifier : $18
    CHECK_UNIT_DIED_TO .segment Flag, DeadCharacterID, KillerCharacterID
      .byte $1A
      .byte \Flag
      .sint \DeadCharacterID
      .sint \KillerCharacterID
    .endsegment

    ; Identifier : $18
    EC_1B .segment Flag, Unknown1, Unknown2
      .byte $1B
      .byte \Flag
      .word \Unknown1
      .word \Unknown2
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
      .byte \AISetting
      .sint \CharacterID
    .endsegment

    ; Identifier : $20
    EC_22 .segment Unknown1 ; unsure about the argument
      .byte $22
      .byte \Unknown1
    .endsegment

    ; Identifier : $25
    EC_23 .segment
      .byte $23
    .endsegment

    ; Identifier : $26
    EC_24 .segment Unknown1 ; unsure about the argument
      .byte $24
      .byte \Unknown1
    .endsegment

    BREAK_TURN_EVENT_CHECKS .segment
      ; The event engine goes over any event condition with a command byte between $21 and $24, and checks
      ; if their event can activate. If it does, skip any events that come after it, until it hits this
      ; event command, then continue like usual from here.
      .byte $25
      .word $6666
    .endsegment

    EC_26 .segment Unknown1
      .byte $26
      .long \Unknown1
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

    EC_2B .segment Unknown1
      .byte $2B
      .byte \Unknown1
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

    EC_2F .segment ; END_PERM_FLAG_CHECKS ?
      .byte $2F
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

    EC_33 .segment Unknown1
      .byte $33
      .byte \Unknown1
    .endsegment

    REMOVE_CHAPTER_STRUCT .segment ChapterID
      ; Run this during the end event of a chapter to clear the RAM struct.
      .byte $34
      .byte \ChapterID
    .endsegment

    EC_35 .segment EventHeaderPointer
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

    EC_38 .segment Flag
      .byte $38
      .byte \Flag
    .endsegment

    EC_39 .segment Flag
      .byte $39
      .byte \Flag
    .endsegment

    EC_3A .segment Flag
      .byte $3A
      .byte \Flag
    .endsegment

    EC_3B .segment Unknown1, Unknown2
      .byte $3B
      .byte \Unknown1
      .byte \Unknown2
    .endsegment

    EC_3C .segment Unknown1, Unknown2
      .byte $3C
      .byte \Unknown1
      .byte \Unknown2
    .endsegment

    EC_3D .segment Unknown1
      .byte $3D
      .byte \Unknown1
    .endsegment

    EC_3E .segment Unknown1
      .byte $3E
      .byte \Unknown1
    .endsegment

    EC_3F .segment Unknown1, Unknown2
      .byte $3F
      .byte \Unknown1
      .byte \Unknown2
    .endsegment

    EC_40 .segment Unknown1, Unknown2
      .byte $40
      .byte \Unknown1
      .byte \Unknown2
    .endsegment

    EC_41 .segment Unknown1
      .byte $41
      .word \Unknown1
    .endsegment

    EC_42 .segment Unknown1
      .byte $42
      .word \Unknown1
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

    EC_47 .segment Unknown1
      .byte $47
      .word \Unknown1
    .endsegment

    EC_48 .segment Unknown1
      .byte $48
      .long \Unknown1
    .endsegment

    REGISTER_CHARACTER_MAP_SPRITE .segment CharacterID
      .byte $49
      .word \CharacterID
    .endsegment

    REGISTER_UNITGROUP_MAP_SPRITES .segment UNITGroupID
      .byte $4A
      .byte \UNITGroupID
    .endsegment

    LOAD_FACTION_GROUP .segment FactionID, FactionGroupID
      .byte $4B
      ; Loads the given FactionGroup into the assigned faction slot
      .byte \FactionID
      .byte \FactionGroupID
    .endsegment

    EC_4C .segment Unknown1, Unknown2
      .byte $4C
      .byte \Unknown1
      .byte \Unknown2
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

    EC_4F .segment Unknown1
      .byte $4F
      .byte \Unknown1
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

    EC_51 .segment Unknown1, Unknown2, Unknown3
      .byte $51
      .word \Unknown1
      .byte \Unknown2
      .word \Unknown3
    .endsegment

    EC_52 .segment Unknown1, Unknown2, Unknown3, Unknown4
      .byte $52
      .word \Unknown1
      .byte \Unknown2
      .byte \Unknown3
      .byte \Unknown4
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

    EC_NOP_56 .segment
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

    EC_59 .segment Unknown1, Unknown2
      .byte $59
      .word \Unknown1
      .byte \Unknown2
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

    EC_5D .segment Unknown1, Unknown2, Unknown3, Unknown4, Unknown5
      .byte $5D
      .byte \Unknown1
      .word \Unknown2
      .byte \Unknown3
      .byte \Unknown4
      .word \Unknown5
    .endsegment

    EC_5E .segment Unknown1
      .byte $5E
      .long \Unknown1
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

    EC_64 .segment Unknown1, Unknown2
      .byte $64
      .byte \Unknown1
      .byte \Unknown2
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

    EC_67 .segment Unknown1
      .byte $67
      .byte \Unknown1
    .endsegment

    SET_TALK_TARGET .segment Initiator, Target
      ; Note: This only accepts bytes instead of words.
      .byte $68
      .byte \Initiator
      .byte \Target
    .endsegment

    SET_TALK_TARGET_IF_UNMARRIED .segment Initiator, Target, Unknown1=$FF, Unknown2=$FF
      .byte $69
      .byte \Initiator
      .byte \Target
      .byte \Unknown1
      .byte \Unknown2
    .endsegment

    EC_6A .segment Unknown1, Unknown2, Unknown3, Unknown4
      .byte $6A
      .byte \Unknown1
      .byte \Unknown2
      .byte \Unknown3
      .byte \Unknown4
    .endsegment

    SET_TALK_TARGET_IF_MARRIED .segment EventFlag, Initiator, Target
      .byte $6B
      .byte \EventFlag
      .byte \Initiator
      .byte \Target
    .endsegment

    EC_6C .segment Unknown1, Unknown2, Unknown3, Unknown4, Unknown5
      .byte $6C
      .byte \Unknown1
      .byte \Unknown2
      .byte \Unknown3
      .byte \Unknown4
      .byte \Unknown5
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
      .byte \CharacterID
      .byte structExtendedPersonalCharacterDataRAM.\StatIndex
      .byte \Value
    .endsegment

    REMOVE_AREA_RESTRICTION .segment Index
      ; Unlocks the specified no-entry zone.
      .byte $71
      .byte \Index
    .endsegment

    EC_72 .segment Unknown1
      .byte $72
      .byte \Unknown1
    .endsegment

    EC_73 .segment
      ; Has something to do with battle animations
      .byte $73
    .endsegment

    COMBATANTS_STAY_ON_MAP .segment
      ; Used so bosses can have events to run/warp away.
      .byte $74
    .endsegment

    EC_75 .segment Unknown1, Unknown2, Unknown3
      .byte $75
      .word \Unknown1
      .byte \Unknown2
      .byte \Unknown3
    .endsegment

    EC_76 .segment Unknown1, Unknown2
      .byte $76
      .word \Unknown1
      .word \Unknown2
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
