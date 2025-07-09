
  LoadAsByteFlag = $80
    ; If flag isn't set in a bitpacked data list, load value as word instead.

  structSaveDataEntry .struct

    SaveData .byte ?                        ; $0000
    CurrentChapter .byte ?                  ; $0001
    CurrentTurnLow .byte ?                  ; $0002
    .union 
      LoadedUnitCount .byte ?               ; $0003
        ; %11111110_00000000
      LoadedFactionCount .byte ?            ; $0003
        ; %00000001 11100000
    .endunion
    OptionSettings .word ?                  ; $0004
      ; %00011111 11111111 11100000
    Unknown0006 .byte ?                     ; $0006
      ; %00011111 11100000
    MapXOffset .word ?                      ; $0007
      ; %00011111 11111111 11000000
    MapYOffset .word ?                      ; $0009
      ; %00111111 11111111 10000000
    CursorXOffset .byte ?                   ; $000B
      ; %01111111 10000000
    CursorYOffset .byte ?                   ; $000C
      ; %01111111 10000000
    ChapterActiveMapChanges1 .word ?        ; $000D
      ; %01111111 11111111 10000000
    ChapterActiveMapChanges2 .word ?        ; $000F
      ; %01111111 11111111 10000000
    TotalLevelUpCount .byte ?               ; $0011
      ; %01111111 11110000
    TotalAlivePlayerUnitCount .byte ?       ; $0012
      ; %00001111 11000000
    Unknown0013 .byte ?                     ; $0013
      ; %00111111 11000000
    DestroyedLocationsCount  .byte ?        ; $0014
      ; %00111111
    CurrentTurnHigh .byte ?                 ; $0015
    UnitLosses                              ; $0016
      ; Not sure why its split up like this.
      .byte ? 
        ; %11111111
      .byte ?                               ; $0017
        ; %11111111 11000000
      .byte ?                               ; $0018
        ; %00111111 11000000
      .word ?                               ; $0019
        ; %00111111 11111111 11000000
      .word ?                               ; $001B
        ; %00111111 11111111 11000000
      .union
        .byte ?                             ; $001D
        ; %00111100
        .byte ?                             ; $001D
        ; %00000011 11000000
      .endunion
      .word ?                               ; $001E
        ; %00111111 11111111 10000000
    ChapterTurncountsHigh .long ?           ; $0020
        ; 12 * %11
    .union
      ViewingHomeCastleFlag .byte ?         ; $0023
        ; %01000000
      UnitWinCount .fill 72                 ; $0023
        ; 48 * %0011111111_11
    .endunion
    ChapterTurncountsLow .fill 12           ; $006B
      ; 12 * %00111111_111
    RNArray .fill 49                        ; $0077
      ; 56 * %00111111_1
    UnitJoinOrder .fill 15                  ; $00A8
      ; 24 * %00111110
    .union
      Unknown00B7_1 .byte ?                 ; $00B7
        ; %00111000
      Unknown00B7_2 .byte ?                 ; $00B7
        ; %00000111_11100000
    .endunion
    .union
      Unknown00B8_1 .byte ?                 ; $00B8
        ; %00010000
      Unknown00B8_2 .byte ?                 ; $00B8
        ; %00001100
      FactionHeaderData .fill 28            ; $00B8
        ; 7 *
        ; GroupID          = %00000011_11111100
        ; LocationID       = %00000011_11000000
        ; HostileFactions  = %00111111_10000000
        ; AlliedFactions   = %01111111
        ; UnitCount        = %11111100
    .endunion
    ItemRAMData .fill 450                   ; $00D4
      ; 144 *
      ; Durability       = %00000011_11110000
      ; ItemState        = %00001110
      ; OwnerRAMPointer  = %00000001_11111111
      ; KillCount        = %11111110
    ChapterLocationRAMData .fill 16         ; $0296
      ; 16 * %00000011_11111100
    ChapterLocationMoneyRewards .fill 28    ; $02A6
      ; 16 * %00000011_11111111_11110000
    PermanentFlags .fill 32                 ; $02C2
      ; 32 * %00000011_11111100
    ChapterRAMStructCount .byte ?           ; $02E2
      ; %00000011
    ChapterEventData .fill 25               ; $02E3
      ; 2 *
      ; bits: 5 + 8 + 8 + (5 * 16)
      ; new offset: $00xxxxxx
    UnitRAMStructCount .byte ?              ; $02FC
      ; %00111111_10000000
    UnitData .fill 1215                     ; $02FD
      ; Variable sizes because of different unit types.
    MagicNumber .word ?                     ; $07BC
    Checksum    .word ?                     ; $07BE
    UnitLossesCount .brept 48               ; $07C0
      .byte ?
    .endrept
    GameTimerLow .word ?                    ; $07F0
    GameTimerHigh .word ?                   ; $07F2
    .word ? ; $07F4
    .word ? ; $07F6
    .word ? ; $07F8
    .word ? ; $07FA
    .word ? ; $07FC
  .endstruct
