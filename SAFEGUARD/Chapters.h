
  LocationFactionSlotOwnerMask  = $07

  LocationDestroyed             = $08
  VillageClosed                 = $20
  LocationState40               = $40
  CastleGuarded                 = $80

  LocationTypeCastle    = 0
  LocationTypeVillage   = 2


  structChapterEventHeader .struct
    Chapter         .word ? ; $00
    OpeningEvents   .long ? ; $02
    MapEvents       .long ? ; $05
  .endstruct

  structChapterEventRAMEntry .struct
    Chapter               .word ? ; $00
    EventPointer          .long ? ; $02
    Counter1              .byte ? ; $05
    Counter2              .byte ? ; $06
    TemporaryEventFlags   .fill len(bytes(%1 x 80)) ; $07
  .endstruct

  structChapterEventData .struct LocationDataPointer, MapChangesPointer, Unknown1, TalkEventsPointer, Unknown3
    LocationDataPointer .word <>\LocationDataPointer  ; $00
    MapChangesPointer   .word <>\MapChangesPointer    ; $02
    Unknown1            .word <>\Unknown1             ; $04
    TalkEventsPointer   .word <>\TalkEventsPointer    ; $06
    Unknown3            .word <>\Unknown3             ; $08
  .endstruct

  structChapterLocationEntry .struct ID, NameID, Type, Coordinates
    .if (\ID === ?)
      ID          .byte ?
      NameID      .byte ?
      Type        .byte ?
      XPosition   .byte ?
      YPosition   .byte ?
    .else
      ID          .byte \ID             ; $00
      NameID      .byte \NameID         ; $01
      Type        .byte \Type           ; $02
      XPosition   .byte \Coordinates[0] ; $03
      YPosition   .byte \Coordinates[1] ; $04
    .endif
  .endstruct

  ; Castle coordinates are the guarding spot
  structChapterCastleLocationEntry .struct ID, NameID, Coordinates, Unknown, ShopDataPointer
    .dstruct structChapterLocationEntry, \ID, \NameID, LocationTypeCastle, \Coordinates ; $00 - $04
    Unknown           .byte \Unknown            ; $05
    ShopDataPointer   .word <>\ShopDataPointer  ; $06
  .endstruct

  ; Village coordinates are the visitable tile
  structChapterVillageLocationEntry .struct ID, Coordinates
    .dstruct structChapterLocationEntry, \ID, 0, LocationTypeVillage, \Coordinates ; $00 - $04
  .endstruct

  structEventLocationType .struct BaseMoney, OriginOffset, ModificationOffset, InteractionOffset, DestoyedTileData
    .if (\BaseMoney === ?)
      BaseMoney           .word ?
      OriginXOffset       .char ?
      OriginYOffset       .char ?
      ModificationXOffset .char ?
      ModificationYOffset .char ?
      InteractionXOffset  .char ?
      InteractionYOffset  .char ?
      DestoyedTileData    .word ?
    .else
      BaseMoney           .word \BaseMoney                ; $00
      OriginXOffset       .char \OriginOffset[0]          ; $02
      OriginYOffset       .char \OriginOffset[1]          ; $03
      ModificationXOffset .char \ModificationOffset[0]    ; $04
      ModificationYOffset .char \ModificationOffset[1]    ; $05
      InteractionXOffset  .char \InteractionOffset[0]     ; $06
      InteractionYOffset  .char \InteractionOffset[1]     ; $07
      DestoyedTileData    .word <>\DestoyedTileData       ; $08
    .endif
  .endstruct

  structChapterMapChangeEntry .struct ChapterID, Flag, Coordinates, MapChangeData
    .if (\ChapterID === ?)
      ChapterID       .word ?
      Flag            .byte ?
      XPosition       .byte ?
      YPosition       .byte ?
      MapChangeData   .word ?
    .else
      ChapterID       .word \ChapterID       ; $00
      Flag            .byte \Flag            ; $02
      XPosition       .byte \Coordinates[0]  ; $03
      YPosition       .byte \Coordinates[1]  ; $04
      MapChangeData   .word <>\MapChangeData ; $05
    .endif
  .endstruct

  structChapterTalkEventEntry .struct Chapter, Flag, ActiveUnit, TargetUnit, CostsMoneyFlag=false
    Chapter         .word \Chapter              ; $00
    Flag            .byte \Flag                 ; $02
    ActiveUnit      .sint \ActiveUnit           ; $03
    TargetUnit      .sint \TargetUnit           ; $05
    CostsMoneyFlag  .byte int(\CostsMoneyFlag)  ; $07
    ; This is actually an jsr table index but it only has 2 entries
    ; If its 0, the talk always works, if its 1, it only works with 10k+ gold
  .endstruct
