
    YIELD .segment
      .byte $FD
    .endsegment

    END_EVENT .segment
      .word $FFFF
    .endsegment

    EVENT_DUMMY .segment
      .word $FEFE
    .endsegment



    JUMP .segment Address
      .byte $02
      .addr \Address
    .endsegment

    JUMP_TRUE .segment Address
      ; Jumps if wEventEngineTruthFlag is set.
      .byte $03
      .addr \Address
    .endsegment

    JUMP_FALSE .segment Address
      ; Jumps if wEventEngineTruthFlag is unset.
      .byte $04
      .addr \Address
    .endsegment

    JUMP_RELATIVE_TRUE .segment Address
      ; Modifies the distance if wEventEngineTruthFlag is set.
      ; The distance is measured from the beginning of the command.
      .byte $05
      .sint (\Address) - *
    .endsegment

    JUMP_RELATIVE_FALSE .segment Address
      ; Modifies the distance if wEventEngineTruthFlag is unset.
      ; The distance is measured from the beginning of the command.
      .byte $06
      .sint (\Address) - *
    .endsegment

    CHECK_PERMANENT_FLAG_SET .segment EventFlag
      .byte $07
      .byte \EventFlag
    .endsegment

    TEST_FLAG_IN_CHAPTER_SET .segment ChapterID, EventFlag
      ; Sets wEventEngineTruthFlag if flag is set in chapter.
      ; Only works if specified chapter is the current one.
      .byte $08
      .byte \ChapterID
      .byte \EventFlag
    .endsegment


    DIALOGUE .segment DialoguePointer
      .byte $0C
      .long \DialoguePointer
    .endsegment

    CASTLE_NAME .segment NamePointer, Color, Duration
      .byte $0D
      .long \NamePointer
      .byte \Color
      .byte \Duration
    .endsegment

    PLAY_SONG .segment SongID
      .byte $0E
      .byte \SongID
    .endsegment


    PLAY_SFX_BYTE .segment SoundID
      .byte $11
      .byte \SoundID
    .endsegment

    PLAY_SFX_WORD .segment SoundID
      .byte $12
      .word \SoundID
    .endsegment

    RESTORE_PHASE_MUSIC .segment
      .byte $13
    .endsegment

    DIALOGUE_WITH_BG .segment DialoguePointer, BackgroundID, DialogueType, FadeTimer
      .byte $14
      .long \DialoguePointer
      .byte \BackgroundID
      .byte \DialogueType
      .byte \FadeTimer
    .endsegment

    BERSERK_CAST .segment Coordinates
      .byte $17
      .byte \Coordinates[0]
      .byte \Coordinates[1]
    .endsegment


    MOVE_TEMPORARY_TO_COORDS .segment CharacterID, StartCoordinates, DestinationCoordinates, MovementSpeed, UnitSlot, SpriteColor, DisappearOffscreenFlag=false, UnknownFlag=false
      ; Has to target either wEventUnitSlot1 or 2.
      ; The unit specified does not need to be loaded, and wont be loaded via this.
      ; This is purely visual.
      .byte $22
      .word \CharacterID
      .char \StartCoordinates[0]
      .char \StartCoordinates[1]
      .byte \DestinationCoordinates[0]
      .byte \DestinationCoordinates[1]
      .byte (\MovementSpeed & $0F | int(\DisappearOffscreenFlag) << 4 | (\UnitSlot & $03) << 5 | int(\UnknownFlag)<<7)
      .byte \SpriteColor
    .endsegment

    LOAD_UNIT_BY_GROUP .segment UnitGroupID, IDInGroup, StartCoordinates, MovementSpeed, SpriteColor
      ; Loads a unit specified in UNITGroupData.
      .byte $23
      .byte \UnitGroupID
      .word \IDInGroup
      .byte \StartCoordinates[0]
      .byte \StartCoordinates[1]
      .byte \MovementSpeed ; 0 - 7
      .byte \SpriteColor
    .endsegment

    LOAD_UNIT_DIRECT .segment CharacterID, FactionSlot, StartCoordinates, DestinationCoordinates, MovementSpeed, SpriteColor, GroupLeaderFlag=false, AISetting=0
      ; Loads a unit outside UNITGroupData.
      .byte $24
      .word \CharacterID
      .byte \FactionSlot
      .byte \StartCoordinates[0]
      .byte \StartCoordinates[1]
      .byte \DestinationCoordinates[0]
      .byte \DestinationCoordinates[1]
      .byte \MovementSpeed
      .byte \SpriteColor
      .byte int(\GroupLeaderFlag) << 7 | \AISetting & $0F
    .endsegment

    MOVE_TEMPORARY_TO_COORDS_FOLLOW .segment CharacterID, StartCoordinates, DestinationCoordinates, MovementSpeed, UnitSlot, SpriteColor
      ; Has to target either wEventUnitSlot1 or 2.
      ; The unit specified does not need to be loaded, and wont be loaded via this.
      ; This is purely visual.
      ; Camera will follow unit if they get too close to the screen edge.
      .byte $25
      .word \CharacterID
      .char \StartCoordinates[0]
      .char \StartCoordinates[1]
      .byte \DestinationCoordinates[0]
      .byte \DestinationCoordinates[1]
      .byte (\MovementSpeed & $0F | (\UnitSlot & $03) << 5)
      .byte \SpriteColor
    .endsegment

    MOVE_TEMPORARY_BY_SCRIPT .segment CharacterID, StartCoordinates, MovementSpeed, SpriteColor, MovementScriptPointer, DisappearOffscreenFlag=false
      ; The unit specified does not need to be loaded, and wont be loaded via this.
      ; This is purely visual.
      .byte $27
      .word \CharacterID
      .byte \StartCoordinates[0]
      .byte \StartCoordinates[1]
      .byte (\MovementSpeed & $0F | int(\DisappearOffscreenFlag) << 4)
      .byte \SpriteColor
      .long \MovementScriptPointer
    .endsegment

    LOAD_UNIT_BY_GROUP_SILENT .segment UnitGroupID, IDInGroup
      .byte $28
      .byte \UnitGroupID
      .word \IDInGroup
    .endsegment

    WAIT_UNIT_SPRITE_DECOMPRESSED .segment
      ; Also waits until aMovingMapSprites.wState is free
      .byte $29
    .endsegment

    WAIT_UNTIL_MAP_SPRITES_HALTING .segment
      ; Waits until every map sprite finished moving or until
      ; everyone executed a MS_HALT command, then continues with
      ; event execution.
      .byte $2A
    .endsegment

    CONTINUE_FORM_MAP_SPRITE_HALT .segment
      ; This is the counterpart to the previous command and
      ; continues with map sprite movement that was halted before.
      .byte $2B
    .endsegment



    PAUSE .segment Timer
      .byte $34
      .word \Timer
    .endsegment

    SET_CAMERA_TO_EVENT_UNIT_SLOT_1 .segment
      .byte $39
    .endsegment

    SET_CAMERA_POSITION .segment Coordinates
      .byte $3A
      .byte \Coordinates[0]
      .byte \Coordinates[1]
    .endsegment

    EVENT_3B .segment Unknown
      .byte $3B
      .byte \Unknown
    .endsegment


    SCRIPTED_MAP_SCROLL .segment ScriptPointer, ScrollSpeed
      .byte $3F
      .long \ScriptPointer
      .byte \ScrollSpeed
    .endsegment

    MAP_SCROLL .segment Coordinates, ScrollSpeed
      .byte $40
      .byte \Coordinates[0]
      .byte \Coordinates[1]
      .byte \ScrollSpeed
    .endsegment

    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 .segment ScrollSpeed
      .byte $41
      .byte \ScrollSpeed
    .endsegment

    FILL_EVENT_UNIT_SLOT .segment CharacterID, Slot
      .byte $42
      .word \CharacterID
      .byte \Slot >> 1
    .endsegment

    EVENT_43 .segment Unknown1, Unknown2, Unknown3
      .byte $43
      .byte \Unknown1
      .byte \Unknown2
      .byte \Unknown3
    .endsegment


    FACTION_UNIT_DEATH .segment FactionSlot, AISetting=$FF, CharacterID=$FFFF
      ; Handles the flickering of units on the map, simulating their death.
      ; Basically what seizing a castle does to remaining units of a faction, but on demand.
      .byte $44
      .byte \FactionSlot
      .byte \AISetting
      .word \CharacterID
    .endsegment

    RUN_ASM .segment Address
      .byte $45
      .long \Address
    .endsegment


    FADE_IN_BY_TIMER .segment Timer
      .byte $46
      .byte \Timer
    .endsegment

    FADE_OUT_BY_TIMER .segment Timer
      .byte $47
      .byte \Timer
    .endsegment




    RUN_EVENT_CONDITION .segment
      .byte $4A
    .endsegment

    SET_FLAG_IF_IN_CHAPTER .segment Chapter, EventFlag
      ; If the specified chapter matches the current one, set the
      ; specified event flag.
      .byte $4B
      .byte \Chapter
      .byte \EventFlag
    .endsegment

    UNSET_FLAG_IF_IN_CHAPTER .segment Chapter, EventFlag
      ; If the specified chapter matches the current one, unset the
      ; specified event flag.
      .byte $4C
      .byte \Chapter
      .byte \EventFlag
    .endsegment



    RUN_EVENT_CONDITION_UNSKIPPABLE .segment
      ; This calls RUN_EVENT_CONDITION, but also sets up a proc
      ; that waits until the $0001 flag in bUnknown000E7B is cleared.
      .byte $4D
    .endsegment




    ; Looks like only world map commands from here on out so they will all start with WM_

    EVENT_4F .segment
      ; Fade to world map?
      .byte $4F
    .endsegment

    EVENT_50 .segment
      ; End world map?
      .byte $50
    .endsegment

    WM_SCROLL .segment Coordinates
      .byte $51
      .word \Coordinates[0]
      .word \Coordinates[1]
    .endsegment

    WM_MARKER .segment Coordinates, Slot, Type
      .byte $52
      .byte \Coordinates[0]
      .byte \Coordinates[1]
      .byte \Slot
      .byte \Type
    .endsegment

    WM_CLEAR_MARKER .segment Slot
      .byte $53
      .byte \Slot
    .endsegment

    WM_LOAD_PORTRAIT .segment Slot, Portrait
      .byte $54
      .byte \Slot
      .word \Portrait
    .endsegment

    WM_FADE_IN_PORTRAIT .segment Slot, Coordinates
      .byte $55
      .byte \Slot
      .byte \Coordinates[0]
      .byte \Coordinates[1]
    .endsegment

    WM_FADE_OUT_PORTRAIT .segment Slot
      .byte $56
      .byte \Slot
    .endsegment

    WM_MOVE_PORTRAIT .segment Slot, Coordinates
      .byte $57
      .byte \Slot
      .byte \Coordinates[0]
      .byte \Coordinates[1]
    .endsegment

    WM_DIALOGUE .segment DialoguePointer
      ; start world map dialogue?
      .byte $58
      .long \DialoguePointer
    .endsegment



    EVENT_5A .segment
      ; pause world map dialogue?, very likely required for map scroll
      .byte $5A
    .endsegment

    WM_HIGHLIGHT .segment Part
      .byte $5B
      .byte \Part
    .endsegment

    WM_CLEAR_HIGHLIGHT .segment
      .byte $5C
    .endsegment






