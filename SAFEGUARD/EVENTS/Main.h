
    YIELD .segment
      .byte $FD
    .endsegment

    END_EVENT .segment
      .word $FFFF
    .endsegment

    EVENT_DUMMY .segment
      .word $FEFE
    .endsegment

    EVENT_00 .segment Length
      ; Unused.
      ; Calls a proc "NP" that does nothing anymore.
      .byte $00
      .byte \Length
    .endsegment

    EVENT_01 .segment
      ; Unused.
      ; Writes 2 to wUnknown00171C.
      .byte $01
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

    TEST_PERMANENT_FLAG_SET .segment EventFlag
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

    CHANGE_PALETTE_PROC .segment PalettePointer, ChangeData
      ; Unused.
      ; Kind of janky command to write a bunch of colors to
      ; the aBGPaletteBuffer.
      ; First pointer points to several color words.
      ; Second pointer points to:
      ; - A byte for the aBGPaletteBuffer color ID.
      ; - A byte for the palette count to copy.
      ; - A byte for the color offset for the first pointer.
      ; - A byte for a timer thats pretty much useless as the proc code consists of one HALT.
      ; - A 2nd version of the previous 2 bytes that have priority if the timer isn't 0.
      .byte $09
      .long PalettePointer
      .long ChangeData
    .endsegment

    EVENT_0A .segment
      ; Unused except for one debug event.
      ; Resets the Dialogue engine and a bunch of registers around $0516?
      .byte $0A
    .endsegment

    EVENT_0B .segment
      ; Unused.
      ; Resets bit $80 of $0521?
      ; May prevent BG3 tilemap modification?
      .byte $0B
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

    ; $0F and $10 are the same

    EVENT_0F .segment SoundID
      ; Unused.
      ; Played if $04EA doesnt have $0001 set
      .byte $0F
      .byte \SoundID
    .endsegment

    EVENT_10 .segment SoundID
      ; Unused.
      ; Played if $04EA doesnt have $0001 set
      .byte $10
      .byte \SoundID
    .endsegment

    PLAY_SFX_BYTE .segment SoundID
      ; Played if $04EA doesnt have $0004 set
      .byte $11
      .byte \SoundID
    .endsegment

    PLAY_SFX_WORD .segment SoundID
      ; JP notes say adjust volume?
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

    EVENT_15 .segment DialoguePointer, BackgroundID, DialogueType, FadeTimer
      ; Unused.
      ; Essentially identical to DIALOGUE_WITH_BG. This one tries to set the DialogueType
      ; to 1 instead of 0 before getting overwritten with the value specified in the segment.
      .byte $15
      .long \DialoguePointer
      .byte \BackgroundID
      .byte \DialogueType
      .byte \FadeTimer
    .endsegment

    LOVER_HOME_CASTLE .segment
      ; Unused.
      ; Forcibly triggers the talk convo when a lover enters
      ; the home castle while the other is already there.
      ; Requires the selected unit to have a lover, and that one
      ; has to be within the home castle and be alive.
      .byte $16
    .endsegment

    BERSERK_CAST .segment Coordinates
      .byte $17
      .byte \Coordinates[0]
      .byte \Coordinates[1]
    .endsegment

    ; Command $18 doesn't exist

    EVENT_19 .segment UnknownPointer, UnknownValue
      ; Unused.
      ; Sets up dialogue values, but then calls a routine that does nothing.
      .byte $19
      .long \UnknownPointer
      .long \UnknownValue
    .endsegment

    EVENT_1A .segment
      ; Unused.
      ; DMA's dialogue data set up by EVENT_1B.
      .byte $1A
    .endsegment

    EVENT_1B .segment UnknownPointer
      ; Unused.
      ; Sets the pointer for EVENT_1A to DMA.
      .byte $1B
      .long \UnknownPointer
    .endsegment

    CHANGE_DIALOGUE .segment DialoguePointer
      ; Unused.
      ; Overwrites the active dialogue pointer.
      .byte $1C
      .long \DialoguePointer
    .endsegment

    EVENT_1D .segment
      ; Unused.
      ; Clears currently moving map sprites?
      .byte $1D
    .endsegment

    ; Command $1E doesn't exist.

    CREATE_HDMA .segment HDMAPointer
      ; Unused.
      .byte $1F
      .long \HDMAPointer
    .endsegment

    EVENT_20 .segment DMAPointer, Destination, Size
      ; Unused.
      ; Resets sprite engine and then DMA's data.
      .byte $20
      .long \DMAPointer
      .word \Destination
      .word \Size
    .endsegment

    CREATE_SPRITE .segment SpritePointer, Unknown1, Unknown2
      ; Unused.
      .byte $21
      .long \SpritePointer
      .word \Unknown1
      .word \Unknown2
    .endsegment

    MOVE_TEMPORARY_TO_COORDS .segment CharacterID, StartCoordinates, DestinationCoordinates, MovementSpeed, UnitSlot, SpriteColor, DisappearOffscreenFlag=false, UnknownFlag=false
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

    MOVE_TEMPORARY_TO_COORDS_CLASS .segment CharacterID, StartCoordinates, DestinationCoordinates, MovementSpeed, SpriteColor, FactionSlot, MapSprite=0
      ; Unused.
      ; If a map sprite is specified, use that instead of the characters regualar sprite
      .byte $26
      .word \CharacterID
      .byte \StartCoordinates[0]
      .byte \StartCoordinates[1]
      .byte \DestinationCoordinates[0]
      .byte \DestinationCoordinates[1]
      .byte (\MovementSpeed $0F | int(\DisappearOffscreenFlag) << 4)
      .byte \SpriteColor
      .byte \FactionSlot
      .word \MapSprite
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

    EVENT_2C .segment
      ; Unused.
      ; Clears all moving map sprites?
      .byte $2C
    .endsegment

    CHANGE_PALETTE .segment SourcePointer, PaletteID, PaletteCount
      ; Unused.
      ; PaletteID 0 writes to aBGPaletteBuffer.aPalette0, ID1 to aPalette1 and so on.
      .byte $2D
      .long \SourcePointer
      .byte \PaletteID
      .byte \PaletteCount
    .endsegment

    PALETTE_SWAP .segment FirstPalettePointer, SecondPalettePointer, Timer, ColorOffset, Size
      ; Unused.
      .byte $2E
      .long \FirstPalettePointer
      .long \SecondPalettePointer
      .byte \Timer
      .word \ColorOffset
      .word \Size
    .endsegment

    STORE_WORD .segment Address, Value
      ; Unused.
      .byte $2F
      .long \Address
      .word \Value
    .endsegment

    EVENT_30 .segment EventPointer, CycleCounter
      ; Unused.
      ; EventPointer needs to be in the same bank this command was called from.
      ; First word needs to be a short pointer to ASMC in bank $91.
      ; Only runs for X many specified cycles.
      ; If CycleCounter = -1, keep running until event ends.
      .byte $30
      .long \EventPointer
      .byte \CycleCounter
    .endsegment

    EVENT_31 .segment
      ; Unused.
      ; Does nothing.
      .byte $31
    .endsegment

    EVENT_32 .segment
      ; Unused.
      ; Does nothing.
      .byte $32
    .endsegment

    RESET_SPRITE_ENGINE .segment
      ; Unused.
      ; Just resets the active sprite engine.
      .byte $33
    .endsegment

    PAUSE .segment Timer
      .byte $34
      .word \Timer
    .endsegment

    EVENT_35 .segment
      ; Unused.
      ; Creates a proc that exists until A, B, X or Y is pressed.
      .byte $35
    .endsegment

    EVENT_36 .segment Timer
      ; Unused.
      ; Like EVENT_35, but also gets cleared when the timer hits 0.
      .byte $36
      .word \Timer
    .endsegment

    EVENT_37 .segment
      ; Unused.
      ; Sets up some background registers?
      .byte $37
    .endsegment

    EVENT_38 .segment
      ; Unused.
      ; Sets up some background registers?
      .byte $38
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

    EVENT_3C .segment
      ; Unused.
      ; Background stuff?
      .byte $3C
    .endsegment

    EVENT_3D .segment
      ; Unused.
      ; Background stuff?
      .byte $3D
    .endsegment

    EVENT_3E .segment Unknown1, Unknown2
      ; Unused.
      ; ?
      .byte $3E
      .word \Unknown1
      .byte \Unknown2
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

    FILL_EVENT_UNIT_SLOT_BY_COORDS .segment Coordinates, Slot
      .byte $43
      .byte \Coordinates[0]
      .byte \Coordinates[1]
      .byte \Slot >> 1
    .endsegment

    FACTION_UNIT_DEATH .segment FactionSlot, AISetting=$FF, CharacterID=$FFFF
      ; Handles the flickering of units on the map, simulating their death.
      ; Basically what seizing a castle does to remaining units of a faction, but on demand.
      .byte $44
      .byte \FactionSlot
      .char \AISetting
      .sint \CharacterID
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

    EVENT_48 .segment Unknown1, Unknown2
      ; Unused.
      ; Tries to create a map menu?
      .byte $48
      .byte \Unknown1
      .long \Unknown2
    .endsegment

    EVENT_49 .segment Unknown
      ; Unused.
      ; Tries to load created menu by EVENT_48?
      .byte $49
      .byte \Unknown
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

    EVENT_4E .segment DialoguePointer
      ; Unused.
      ; Uses the same proc as WM_DIALOGUE but does something slightly different?
      .byte $4E
      .long \DialoguePointer
    .endsegment

    WM_FADE_IN .segment
      .byte $4F
    .endsegment

    WM_FADE_OUT .segment
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
      .byte $58
      .long \DialoguePointer
    .endsegment

    EVENT_59 .segment
      ; Unused.
      ; Does nothing.
      .byte $59
    .endsegment

    WM_CLEAR_DIALOGUE .segment
      ; Clears WM_DIALOGUE proc and the BG2 buffer (Used for the fading, glowing location indicators).
      .byte $5A
    .endsegment

    WM_HIGHLIGHT .segment Part
      .byte $5B
      .byte \Part
    .endsegment

    WM_CLEAR_HIGHLIGHT .segment
      .byte $5C
    .endsegment
