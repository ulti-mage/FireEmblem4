
  .virtual $000000

    wR0  .word ? ; $000000
    wR1  .word ? ; $000002
    wR2  .word ? ; $000004
    wR3  .word ? ; $000006
    wR4  .word ? ; $000008
    wR5  .word ? ; $00000A
    wR6  .word ? ; $00000C
    wR7  .word ? ; $00000E
    wR8  .word ? ; $000010
    wR9  .word ? ; $000012
    wR10 .word ? ; $000014
    wR11 .word ? ; $000016
    wR12 .word ? ; $000018
    wR13 .word ? ; $00001A
    wR14 .word ? ; $00001C
    wR15 .word ? ; $00001E
    wR16 .word ? ; $000020
    wR17 .word ? ; $000022

    lR18 .long ? ; $000024
    lR19 .long ? ; $000027
    lR20 .long ? ; $00002A
    lR21 .long ? ; $00002D
    lR22 .long ? ; $000030
    lR23 .long ? ; $000033
    lR24 .long ? ; $000036
    lR25 .long ? ; $000039

    wR26 .word ? ; $00003C
    wR27 .word ? ; $00003E
    wR28 .word ? ; $000040
    wR29 .word ? ; $000042
    wR30 .word ? ; $000044
    wR31 .word ? ; $000046
    wR32 .word ? ; $000048
    wR33 .word ? ; $00004A
    wR34 .word ? ; $00004C
    wR35 .word ? ; $00004E
    wR36 .word ? ; $000050
    wR37 .word ? ; $000052

    lR38 .long ? ; $000054
    lR39 .long ? ; $000057

    wR40 .word ? ; $00005A
    wR41 .word ? ; $00005C
    wR42 .word ? ; $00005E
    wR43 .word ? ; $000060

    lR44 .long ? ; $000062
    lR45 .long ? ; $000065

    wR46 .word ? ; $000068

    lR47 .long ? ; $00006A
    lR48 .long ? ; $00006D

    bBufferINIDISP    .byte ? ; $000070
    bBufferOBSEL      .byte ? ; $000071
    wBufferOAMADD     .word ? ; $000072
    bBufferBGMODE     .byte ? ; $000074
    bBufferMOSAIC     .byte ? ; $000075
    bBufferBG1SC      .byte ? ; $000076
    bBufferBG2SC      .byte ? ; $000077
    bBufferBG3SC      .byte ? ; $000078
    bBufferBG4SC      .byte ? ; $000079
    bBufferBG12NBA    .byte ? ; $00007A
    bBufferBG34NBA    .byte ? ; $00007B
    bBufferM7SEL      .byte ? ; $00007C
    bBufferW12SEL     .byte ? ; $00007D
    bBufferW34SEL     .byte ? ; $00007E
    wBufferBG1HOFS    .word ? ; $00007F
    wBufferBG1VOFS    .word ? ; $000081
    wBufferBG2HOFS    .word ? ; $000083
    wBufferBG2VOFS    .word ? ; $000085
    wBufferBG3HOFS    .word ? ; $000087
    wBufferBG3VOFS    .word ? ; $000089
    wBufferBG4HOFS    .word ? ; $00008B
    wBufferBG4VOFS    .word ? ; $00008D
    bBufferWOBJSEL    .byte ? ; $00008F
    bBufferWH0        .byte ? ; $000090
    bBufferWH1        .byte ? ; $000091
    bBufferWH2        .byte ? ; $000092
    bBufferWH3        .byte ? ; $000093
    bBufferWBGLOG     .byte ? ; $000094
    bBufferWOBJLOG    .byte ? ; $000095
    bBufferTM         .byte ? ; $000096
    bBufferTS         .byte ? ; $000097
    bBufferTMW        .byte ? ; $000098
    bBufferTSW        .byte ? ; $000099
    bBufferCGWSEL     .byte ? ; $00009A
    bBufferCGADSUB    .byte ? ; $00009B
    bBufferCOLDATA_0  .byte ? ; $00009C
    bBufferCOLDATA_1  .byte ? ; $00009D
    bBufferCOLDATA_2  .byte ? ; $00009E
    bBufferCOLDATA_3  .byte ? ; $00009F
    bBufferSETINI     .byte ? ; $0000A0

  .endvirtual

  .virtual $0000B1

    bBufferNMITIMEN   .byte ? ; $0000B1
    bBufferVTIMEL     .byte ? ; $0000B2
    bBufferVTIMEH     .byte ? ; $0000B3
    bBufferHTIMEL     .byte ? ; $0000B4
    bBufferHTIMEH     .byte ? ; $0000B5
    bBufferHDMAEN     .byte ? ; $0000B6
    bBufferMEMSEL     .byte ? ; $0000B7

  .endvirtual


  .virtual $0000C8

    DecompressionVariables .block ; $0000C8
      lSource .long ?             ; $0000C8
      .union
        lDest .long ?             ; $0000CB
        .struct
          bVar0 .byte ?           ; $0000CB
          bVar1 .byte ?           ; $0000CC
          bMethodCount .byte ?    ; $0000CD
        .endstruct
      .endunion
      lTemp .long ?               ; $0000CE
      bCount .byte ?              ; $0000D1
      bFlag .byte ?               ; $0000D2
    .endblock

    wVBlankPointer            .word ? ; $0000D3
    wIRQPointer               .word ? ; $0000D5
    wMainLoopPointer          .word ? ; $0000D7
    wVBlankFlag               .word ? ; $0000D9
    wVBlankEnabledFramecount  .word ? ; $0000DB
    wVBlankDisabledFramecount .word ? ; $0000DD

  .endvirtual

  .virtual $0000E0

    wJoyRepeatDelay    .word ? ; $0000E0
      ; This is the time before
      ; an input is set to automatically
      ; repeat.
    wJoyRepeatInterval .word ? ; $0000E2
      ; This is the time between
      ; automatically-repeated inputs.
    wJoy1Input         .word ? ; $0000E4
    wJoy2Input         .word ? ; $0000E6
      ; These are the inputs
      ; being read from the joypads.
    wJoy1New           .word ? ; $0000E8
    wJoy2New           .word ? ; $0000EA
      ; These are the strictly-new
      ; button presses this frame.
    wJoy1Repeated      .word ? ; $0000EC
    wJoy2Repeated      .word ? ; $0000EE
      ; These are the buttons that
      ; are being automatically
      ; repeated.
    wJoy1Old           .word ? ; $0000F0
      ; This is the previous frame's
      ; inputs for joypad 1.
                       .fill 4 ; $0000F2
    wJoy1RepeatTimer   .word ? ; $0000F6
      ; This timer is decremented
      ; every frame while a button
      ; combination is held. Starts
      ; at wJoyRepeatDelay and is
      ; reset to wJoyRepeatInterval
      ; when it reaches 0.
    wJoy2Old           .word ? ; $0000F8
      ; This is the previous frame's
      ; inputs for joypad 2.
                       .fill 4 ; $0000FA
    wJoy2RepeatTimer   .word ? ; $0000FE
      ; This timer is decremented
      ; every frame while a button
      ; combination is held. Starts
      ; at wJoyRepeatDelay and is
      ; reset to wJoyRepeatInterval
      ; when it reaches 0.

    aBGPaletteBuffer .block      ; $000100 0.01
      aPalette0 .dstruct Palette ; $000100 0.01
      aPalette1 .dstruct Palette ; $000120 0.01
      aPalette2 .dstruct Palette ; $000140 0.01
      aPalette3 .dstruct Palette ; $000160 0.01
      aPalette4 .dstruct Palette ; $000180 0.01
      aPalette5 .dstruct Palette ; $0001A0 0.01
      aPalette6 .dstruct Palette ; $0001C0 0.01
      aPalette7 .dstruct Palette ; $0001E0 0.01
    .endblock

    aOAMPaletteBuffer .block     ; $000200 0.01
      aPalette0 .dstruct Palette ; $000200 0.01
      aPalette1 .dstruct Palette ; $000220 0.01
      aPalette2 .dstruct Palette ; $000240 0.01
      aPalette3 .dstruct Palette ; $000260 0.01
      aPalette4 .dstruct Palette ; $000280 0.01
      aPalette5 .dstruct Palette ; $0002A0 0.01
      aPalette6 .dstruct Palette ; $0002C0 0.01
      aPalette7 .dstruct Palette ; $0002E0 0.01
    .endblock

  .endvirtual



  .virtual $000339

    wScreenFadingTimeIncrement .word ?  ; $000339
    wScreenFadingTimer         .word ?  ; $00033B
    wScreenFadingFlag          .word ?  ; $00033D
    wScreenFadingProcInput     .word ?  ; $00033F
    bDMAPendingChannels        .byte ?  ; $000341
    bHDMAPendingChannels       .byte ?  ; $000342
    wDMAArrayPosition .word ?           ; $000343
    bDMAArrayFlag .byte ?               ; $000345
    aDMAArray .fill $100                ; $000346
    wDecompressionArrayPosition .word ? ; $000446
    bDecompressionArrayFlag .byte ?     ; $000448
    aDecompressionArray .fill $20       ; $000449
    bFrameCounterByOnes .byte ?         ; $000469
    bFrameCounterByThrees .byte ?       ; $00046A
    aRNArray .fill 55                   ; $00046B
    wRNIndex .word ?                    ; $0004A2

  .endvirtual


  .virtual $0004A6

    lBlockCopySource .long ?      ; $0004A6
    lBlockCopyDestination .long ? ; $0004A9
    wBlockCopySize .word ?        ; $0004AC
    rsBlockCopyMVNRAM .block      ; $0004AE
      mvn #$00,#$00
      rts
    .endblock
    rsBlockCopyMVPRAM .block      ; $0004B2
      mvp #$00,#$00
      rts
    .endblock

  .endvirtual


  ; .word ? ; $0004BA - song ID to play ?





  ; .word ? ; $000500 ?

  ; .word ? ; $000508 ?



  .virtual $000521

    bUnknown000521 .byte ?        ; $000521
      ; Bitfield
    lUnknown000522 .long ?        ; $000522
    ; $000525

  .endvirtual


  .virtual $00052A

    wUnknown00052A .word ?                  ; $00052A
    wUnknown00052C .word ?                  ; $00052C
    lMapMenuRAMEntryPointer .long ?         ; $00052E
    lMapMenuTilemapRAMEntryPointer .long ?  ; $000531
    .word ?                                 ; $000534
    bUnknown0536 .byte ?                    ; $000536
      ; Bitfield
      ; $0001 = busy decompressing
      ; $0002 = busy dma-ing
    lUnknown0537 .long ?                    ; $000537

    aCurrentTilemapInfo .block 
      wBaseTile .word ?                     ; $00053A
    .bend
    wUnknown053C .word ?                    ; $00053C
    wUnknown053E .word ?                    ; $00053E
    lUnknown0540 .long ?                    ; $000540

  .endvirtual




  .virtual $00054A

    lStructPointer1 .word ?       ; $00054A
    ; For saving, this is the data source.
    ; For loading, this is the destination.

  .endvirtual

  .virtual $000550

    wStructIndex .word ?          ; $000550
    ; Is 1 indexed instead of 0 indexed.

  .endvirtual



  .virtual $000554

    wStructSize .word ?           ; $000554
    wStructIndexAlternate .word ? ; $000556

  .endvirtual

  .virtual $00055C

    lStructPointer2 .word ?       ; $00055C
    ; For saving, this is the destination.
    ; For loading, this is the data source.

  .endvirtual


  .virtual $000565

    lRAMAreaPointer .long ?             ; $000565
    lRAMAreaPointerBuffer .long ?       ; $000568
    wUnknown00056B .word ?              ; $00056B
    wLoadedUnitCount .word ?            ; $00056D
    wSelectedUnitDataRAMPointer .word ? ; $00056F
    lRoutineVariable .long ?            ; $000571
    wRoutineVariable1 .word ?           ; $000574
      ; Used for basically everything
    wRoutineVariable2 .word ?           ; $000576
    wRoutineVariable3 .word ?           ; $000578
    wCurrentClassDataROMPointer .word ? ; $00057A
    .word ? ; $00057C
    wSelectedInventorySlot .word ?      ; $00057E

  .endvirtual

  ; .word ? ; $000580 - castle location data entry?

  .virtual $000583

    wCurrentItemDataROMPointer .word ?  ; $000583
    .word ? ; $000585
    wCurrentItemDataRAMPointer .word ?  ; $000587
    wLoadedFactionCount .word ?         ; $000589
    wDeployedUnitsCount .word ?         ; $00058B
    lRAMBufferPointer .long ?           ; $00058D
    wEventLocationEntry .word ?         ; $000590

  .endvirtual

  .virtual $000596

    wUnknown000596 .word ?    ; $000596
    ; A mask for the IDs inside aMapData?
    wMapScrollXPixels .word ? ; $000598
    wMapScrollYPixels .word ? ; $00059A

  .endvirtual






  .virtual $000726

    wMapScrollSpeed .word ?                 ; $000726
    wMapPixelScrollDistance .word ?         ; $000728
    wUnknown00072A .word ?                  ; $00072A
    wUnknown00072C .word ?                  ; $00072C
    wUnknown00072E .word ?                  ; $00072E
    wUnknown000730 .word ?                  ; $000730 ; X tile?
    wUnknown000732 .word ?                  ; $000732
    wUnknown000734 .word ?                  ; $000734
    wUnknown000736 .word ?                  ; $000736
    wMapScrollCurrentPixelDistance .word ?  ; $000738
    wUnknown00073A .word ?                  ; $00073A
    wMapEnableXScrollFlag .word ?           ; $00073C
    wMapEnableYScrollFlag .word ?           ; $00073E
    wMapMinXScroll .word ?                  ; $000740
    wMapMaxXScroll .word ?                  ; $000742
    wMapMinYScroll .word ?                  ; $000744
    wMapMaxYScroll .word ?                  ; $000746
    ; $000748

  .endvirtual


  .virtual $000750

    wMapScrollDirectionIdentifier .word ? ; $000750
    .word ? ; $000752
    .word ? ; $000754
    .word ? ; $000756
    wUnknown000758 .word ?    ; $000758
    wUnknown00075A .word ?    ; $00075A
    wUnknown00075C .word ?    ; $00075C
    .word ? ; $00075E
    wMapXOffset .word ?       ; $000760
    wMapYOffset .word ?       ; $000762
    .word ? ; $000764
    wUnknown000766 .word ?    ; $000766
    ; A flag for something
    wCursorXOffset .word ?    ; $000768
    wCursorYOffset .word ?    ; $00076A
    wUnknown00076C .word ?    ; $00076C
    wUnknown00076E .word ?    ; $00076E
    wUnknown000770 .word ?    ; $000770

  .endvirtual





  ; .word ? ; $000772 - deployment offset?

  ; .word ? ; $000778 ?
  ; .word ? ; $00077A ?

  ; .word ? ; $000784 ?

  ; .word ? ; $000788 bitfield

  ; .word ? ; $00078C portrait ID ?
  ; .word ? ; $00078E ?


  .virtual $0007D4

    wMapScrollScriptOffset .word ?  ; $0007D4
    .word ? ; $0007D6
    wUnknown0007D8 .word ?          ; $0007D8

  .endvirtual




  .virtual $0007E2

    wUnknown0007E2 .word ? ; $0007E2

  .endvirtual












  .virtual $000867

    aMovingMapSpritesMapSprites .fill (size(word) * 4) ; $000867
      ; If bit $8000 is set, its a tall sprite.
    ; $00086F

  .endvirtual

  ; .word ? ; $00086F - unit moving on map flag
  ; .word ? ; $000871 - active unit 1 deployment offset?
  ; .word ? ; $000873 - active unit 2 deployment offset?

  ; .word ? ; $000875 - animation destination X pixel coord?
  ; .word ? ; $000877 - animation destination Y pixel coord?
  ; .word ? ; $000879 - action ID



  .virtual $0008F1

    wUnknown0008F1 .fill (size(word) * 4) ; $0008F1
    .fill (size(word) * 4)                ; $0008F9
    wUnknown000901 .fill (size(word) * 4) ; $000901
    .fill (size(word) * 4)                ; $000909
    wUnknown000911 .fill (size(word) * 4) ; $000911
      ; Holds movement direction of a map sprite
    .fill (size(word) * 4)                ; $000919
    wUnknown000921 .word ?                ; $000921
      ; Is a bitfield

  .endvirtual





  .virtual $000D6A

    wCurrentChapter .word ?             ; $000D6A
    lChapterEventDataPointer .long ?    ; $000D6C
    wOptionSettings .word ?             ; $000D6F
      ; 0001 = autocursor off
      ; 0002 = terrain window off
      ; 0004 = unit window off
      ; 0008 / 0010 / 0020 = text speed
      ; 0040 = enemies fast
      ; 0080 = mono audio
      ; 0100 = audio off
      ; 0200 = autosave enabled
      ; 0400 / 0800 = autosave slot ID
      ; 1000 = clever mode enabled
      ; 2000 = animations off
      ; 4000 = animations by unit
      ; 8000 = not used?
    wAreaRestrictionBitfield .word ?  ; $000D71
    wDestroyedLocationsCount .word ?  ; $000D73

  .endvirtual



  .virtual $000D79

    wUnknown000D79 .word ?        ; $000D79
      ; Bitfield:
      ; $0001 = set during dialogue, set when building tilemap?
      ; $0002 = set during dialogue
      ; $0004 = unit state changed? awoke from sleep, enable canto, ungray unit, unhide unit
      ; $0010 = checked for when someone died
      ; $0020 = ViewingHomeCastleFlag
      ; $0040 = checked in rlUnknown84CAA9, checked in rescue staff effect
      ; $0080 = tested for to enable AI cycle, set in cycle 4, unset in cycle 6
      ; $0200 = ?
      ; $0400 = ?
      ; $1000 = PlayerActedFlag, used to disable the map save command
      ; $2000
      ; $4000 = set when changing faction song?
      ; $8000 = checked for during map scroll, reset after running location events

  .endvirtual  



    ; - $0004 update deployment status?
    ; - $0400 turncount saved?


    ; .word ? ; $000D7B copy of event engine cycle?

  .virtual $000D7F

    wUnknownDeploymentOffset000D7F .word ? ; $000D7F

  .endvirtual  

    ; .word ? ; $000D81
    ; .word ? ; $000D83

  .virtual $000D85

    wDefeatedUnitDeploymentOffset .word ? ; $000D85

  .endvirtual  

    ; .word ? ; $000D87 bitfield
    ; .word ? ; $000D89 ?

    ; .word ? ; $000D8B ? 
    ; .word ? ; $000D8D ?

  .virtual $000D8F

    wCurrentTurn .word ?    ; $000D8F
    wActiveFactionSlot .word ?  ; $000D91
    aChapterTurncounts .fill 12 * size(word) ; $000D93

  .endvirtual  

    ; .word ? ; $000DAB - phase music?
    ; .word ? ; $000DAD ? 






  .virtual $000E7B

    bUnknown000E7B .byte ?            ; $000E7B
      ; $01 ?
      ; $02 ?
      ; $10 set at the beginning of AI cycles?
      ; $20 set before evaluating if an AI cycle should happen?
      ; $40 required for AI cycle?
      ; $80 skips AI cycle?
    wAIEngineCycleType .word ?        ; $000E7C
    wAIActiveFaction .word ?          ; $000E7E
    wAICurrentAISetting .word ?         ; $000E80
    wAISelectedAIUnitOffset .word ?   ; $000E82
    wAISelectedAITargetOffset .word ? ; $000E84
    wAICurrentAIUnitCounter .word ?   ; $000E86
    wAITargetXPosition .word ?        ; $000E88
    wAITargetYPosition .word ?        ; $000E8A
    wAIUnknown000E8C .word ?          ; $000E8C
    wAIUnknown000E8E .word ?          ; $000E8E
    lAITemp000E90 .long ?             ; $000E90
    lAITemp000E93 .long ?             ; $000E93
    wAITemp000E96 .word ?             ; $000E96
      ; Sometimes target x coord, sometimes a counter
    wAITemp000E98 .word ?             ; $000E98
      ; Sometimes target y coord, sometimes a counter
    wAITemp000E9A .word ?             ; $000E9A
      ; infliced damage
    wAITemp000E9C .word ?             ; $000E9C
      ; battle defense
    wAITemp000E9E .word ?             ; $000E9E
      ; battle hit
    wAITemp000EA0 .word ?             ; $000EA0
      ; weapon triangle bonus
    wAITemp000EA2 .word ?             ; $000EA2
      ; field movement / item effectiveness
    wAITemp000EA4 .word ?             ; $000EA4
      ; Item min+max range

    bEventStatus .byte ?                          ; $000EA6
      ; $0001 = runs opening events?
      ; $0002 = runs other events?
    wEventUnit1Pointer .word ?                    ; $000EA7
    wEventUnit2Pointer .word ?                    ; $000EA9
    lEventPointer .long ?                         ; $000EAB
    wEventEngineParameter1 .word ?                ; $000EAE
    wEventEngineParameter2 .word ?                ; $000EB0
    wEventEngineParameter3 .word ?                ; $000EB2
    wEventEngineParameter4 .word ?                ; $000EB4
    wEventCommandLength .word ?                   ; $000EB6
    wEventEngineGen2CharacterID1 .word ?          ; $000EB8
    wEventEngineGen2CharacterID2 .word ?          ; $000EBA
    bEventActionIdentifier .byte ?                ; $000EBC
    wEventEngineArgument1 .word ?                 ; $000EBD
    wEventEngineArgument2 .word ?                 ; $000EBF
    wEventEngineArgument3 .word ?                 ; $000EC1
    wEventEngineArgument4 .word ?                 ; $000EC3
    lChapterEventRAMDataEntryPointer .long ?      ; $000EC5

    aProcSystem .block                            ; $000EC8
      wFlag .word ?                               ; $000EC8
      wOffset .word ?                             ; $000ECA
      lPointer .long ?                            ; $000ECC
      wInput0 .word ?                             ; $000ECF
      wInput1 .word ?                             ; $000ED1
      wInput2 .word ?                             ; $000ED3
      wInput3 .word ?                             ; $000ED5
      aHeaderTypeOffset .fill (size(word) * 16)   ; $000ED7
      aHeaderTypeBank .fill (size(word) * 16)     ; $000EF7
      aHeaderName .fill (size(word) * 16)         ; $000F17
      aHeaderBitfield .fill (size(word) * 16)     ; $000F37
      aHeaderOnCycle .fill (size(word) * 16)      ; $000F57
      aHeaderCodeOffset .fill (size(word) * 16)   ; $000F77
      aHeaderSleepTimer .fill (size(word) * 16)   ; $000F97
      aHeaderUnknownTimer .fill (size(word) * 16) ; $000FB7
      aBody0 .fill (size(word) * 16)              ; $000FD7
      aBody1 .fill (size(word) * 16)              ; $000FF7
      aBody2 .fill (size(word) * 16)              ; $001017
      aBody3 .fill (size(word) * 16)              ; $001037
      aBody4 .fill (size(word) * 16)              ; $001057
      aBody5 .fill (size(word) * 16)              ; $001077
      aBody6 .fill (size(word) * 16)              ; $001097
      aBody7 .fill (size(word) * 16)              ; $0010B7
      aUnknownBitfield .fill (size(word) * 16)    ; $0010D7
    .endblock

    aActiveSpriteSystem .block
      wFlag .word ?                           ; $0010F7
      wOffset .word ?                         ; $0010F9
      .word ?                                 ; $0010FB
      lPointer .long ?                        ; $0010FD
      aTypeOffset     .fill (size(word) * 16) ; $001100
      aBanks          .fill (size(word) * 16) ; $001120
      aUpdater        .fill (size(word) * 16) ; $001140
      aOnCycle        .fill (size(word) * 16) ; $001160
      aFrameTimer     .fill (size(word) * 16) ; $001180
      aCodeOffset     .fill (size(word) * 16) ; $0011A0
      aFrameOffset    .fill (size(word) * 16) ; $0011C0
      aUnknown0011E0  .fill (size(word) * 16) ; $0011E0
      aUnknown001200  .fill (size(word) * 16) ; $001200
      aUnknown001220  .fill (size(word) * 16) ; $001220
      aUnknown001240  .fill (size(word) * 16) ; $001240
      aUnknown001260  .fill (size(word) * 16) ; $001260
      aUnknown001280  .fill (size(word) * 16) ; $001280
      aUnknown0012A0  .fill (size(word) * 16) ; $0012A0
      aUnknown0012C0  .fill (size(word) * 16) ; $0012C0 ; holds mover index
      aUnknown0012E0  .fill (size(word) * 16) ; $0012E0
      aUnknown001300  .fill (size(word) * 16) ; $001300 ; holds movement direction
      aUnknown001320  .fill (size(word) * 16) ; $001320
      aUnknown001340  .fill (size(word) * 16) ; $001340
      aUnknown001360  .fill (size(word) * 16) ; $001360
      aUnknown001380  .fill (size(word) * 16) ; $001380
      aUnknown0013A0  .fill (size(word) * 16) ; $0013A0
      aUnknown0013C0  .fill (size(word) * 16) ; $0013C0
      aUnknown0013E0  .fill (size(word) * 16) ; $0013E0

    .bend

    ; $001400

  .endvirtual






  .virtual $0015E7

    aHDMASystem .block                   ; $0015E7
      wFlag .word ?                      ; $0015E7
      wOffset .word ?                    ; $0015E9
      lPointer .long ?                   ; $0015EB
      bPendingChannels .byte ?           ; $0015EE
      aTypeOffset .fill (size(word) * 8) ; $0015EF
      aTypeBank .fill (size(word) * 8)   ; $0015FF
      aBitfield .fill (size(word) * 8)   ; $00160F
      aOnCycle .fill (size(word) * 8)    ; $00161F
      aCodeOffset .fill (size(word) * 8) ; $00162F
      aSleepTimer .fill (size(word) * 8) ; $00163F
      aTimer .fill (size(word) * 8)      ; $00164F
      aOffset .fill (size(word) * 8)     ; $00165F
      aBankAndBBADx .brept 8             ; $00166F
        bBank .byte ?                    ; $00166F
        bBBADx .byte ?                   ; $001670
      .endrept
      aDMAPxAndIndirectBank .brept 8     ; $00167F
        bDMAPx .byte ?                   ; $00167F
        bIndirectBank .byte ?            ; $001680
      .endrept
    .bend

  .endvirtual































  .virtual $00171A

    wUnknown00171A .word ? ; $00171A
      ; Bitfield
    wUnknown00171C .word ? ; $00171C
    wUnknown00171E .word ? ; $00171E
    wMapCurrentlyScrollingFlag .word ? ; $001720
    wEventUnitSlot1ID .word ? ; $001722
    wEventUnitSlot2ID .word ? ; $001724
    wEventUnitSlot1XCoordinate .word ? ; $001726
    wEventUnitSlot1YCoordinate .word ? ; $001728
    wEventUnitSlot2XCoordinate .word ? ; $00172A
    wEventUnitSlot2YCoordinate .word ? ; $00172C
    wEventEngineTruthFlag      .word ? ; $00172E
    wUnknown001730 .word ? ; $001730
    wUnknown001732 .word ? ; $001732

  .endvirtual


  .virtual $001736

    wActiveEventOffset  .word ?       ; $001736
    lActiveEventPointer .long ?       ; $001738
    wActiveEventLength  .word ?       ; $00173B
    .byte ?                           ; $00173D
    wEventMapScrollScript .long ?     ; $00173E
    wEventMapScrollSpeed .word ?      ; $001741

  .endvirtual

  .virtual $001745

    aEpilogue .block
      wCurrentEpilogueID .word ?        ; $001745
      wNextEpilogueID .word ?           ; $001747
        ; When current epilogue ID = this value, end dialogue
        ; and let the event code call the next epilogue dialogue.
      .union
        wRegionID .word ?               ; $001749
        wRegionEpilogueCounter .word ?  ; $001749
        ; Lower byte region ID, high byte counter for how many
        ; units of that region displayed their epilogue.
      .endunion
      wUnknown00174B .word ?            ; $00174B
      wUnknown00174D .word ?            ; $00174D
      wUnknown00174F .word ?            ; $00174F
      wChosenDialogueID .word ?         ; $001751
    .bend

  .endvirtual

  .virtual $00176D

    wEventProcOffsets .fill (size(word) * 16) ; $00176D
    wEventProcBanks   .fill (size(word) * 16) ; $00178D
    ; $0017AD

  .endvirtual

  .virtual $0017BE

    aMovingMapSprites .block  ; $0017BE

      wOffset .word ?  ; $0017BE
      wUnknown0017C0 .word ?      ; $0017C0 ; map sprite ID, if 0 use characters map sprite
      wUnknown0017C2 .word ?      ; $0017C2 ; $10 = DisappearOffscreenFlag
      wActiveSpriteOffset .fill (size(word) * 4)    ; $0017C4
      wUnknown0017CC .fill (size(word) * 4)         ; $0017CC
      wXPixelPosition .fill (size(word) * 4)        ; $0017D4
      wYPixelPosition .fill (size(word) * 4)        ; $0017DC
      wPathScriptAddress .fill (size(word) * 4)     ; $0017E4
      wPathScriptBank .fill (size(word) * 4)        ; $0017EC
      wPathScriptOffset .fill (size(word) * 4)      ; $0017F4
      wSpeed .fill (size(word) * 4)                 ; $0017FC
      wUnknown001804 .fill (size(word) * 4)         ; $001804
        ; Sprite color
      wMovingSound .fill (size(word) * 4)           ; $00180C
        ; Low byte is sound ID, high byte is volume?
      wUnknown001814 .fill (size(word) * 4)         ; $001814
      wUnknown00181C .word ?                        ; $00181C
      wState .word ?                                ; $00181E
        ; 0 = nothing to do
        ; 1 = movement queued
        ; 2 = movement script done
      wEntryIndex    .word ?                        ; $001820
      wUnknown001822 .word ?                        ; $001822
      wUnknown001824 .word ?                        ; $001824
      wCharacterID   .word ?                        ; $001826
      wSpawnXCoordinate .word ?                     ; $001828
      wSpawnYCoordinate .word ?                     ; $00182A
      wDestinationXCoordinate .word ?               ; $00182C
      wDestinationYCoordinate .word ?               ; $00182E
      wUnknown001830 .word ?                        ; $001830 
        ; 0 or 1?

    .bend

      .word ?                                       ; $001832
    aEventScriptBuffer .fill $22                    ; $001834
      ; May be bigger

  .endvirtual





  .virtual $001868

    aDialogue .block ; $001868

      wSlotOffset               .word ? ; $001868
      lActivePointer            .long ? ; $00186A
      lActivePointerStack1      .long ? ; $00186D
      lActivePointerStack2      .long ? ; $001870
      lActivePointerStack3      .long ? ; $001873
      lActivePointerStack4      .long ? ; $001876
      lActivePointerStack5      .long ? ; $001879
      lActivePointerStack6      .long ? ; $00187C
        ; Some commands can change the active pointer temporarily
        ; and the original one is then pushed into the next slot.
        ; This can be done up to 6 times before the dialogue system
        ; skips commands that change the pointer further.
      lUnknown00187F            .long ? ; $00187F
      wStatus                   .word ? ; $001882
      wCommandCycle             .word ? ; $001884
      wUnknown001886            .word ? ; $001886
      wTextSpeed                .word ? ; $001888
      wPauseTimer               .word ? ; $00188A
      wUnknown00188C            .word ? ; $00188C
      wUnknown00188E            .word ? ; $00188E
      wUnknown001890            .word ? ; $001890
      wUnknown001892            .word ? ; $001892
      bFontPage                 .byte ? ; $001894
      wCurrentCharacter         .word ? ; $001895
      wGraphicBufferPixelOffset .word ? ; $001897
        ; Gets adjusted to 0-7 pixel range
      wStringPixelLength        .word ? ; $001899
      wTextSound                .word ? ; $00189B
      wClearTile                .word ? ; $00189D
      wBaseTile                 .word ? ; $00189F ; X indexed?
      wFreeHDMATable            .word ? ; $0018A1
      wUnknown0018A3            .word ? ; $0018A3
      wUnknown0018A5            .word ? ; $0018A5
      wUnknown0018A7            .word ? ; $0018A7
      wUnit1                    .word ? ; $0018A9
      wUnit2                    .word ? ; $0018AB
      wNumber1                  .word ? ; $0018AD
      wNumber2                  .word ? ; $0018AF
      wItemID                   .word ? ; $0018B1
      wClassID                  .word ? ; $0018B3

      .fill $0018C3 - *

      lFontGraphics             .long ? ; $0018C3
      lFontWidthTable           .long ? ; $0018C6
      wUnknown0018C9            .word ? ; $0018C9 ; current size to copy to VRAM
      wUnknown0018CB            .word ? ; $0018CB ; current VRAM destination
      lHDMARoutine              .long ? ; $0018CD
      wUnknown0018D0            .word ? ; $0018D0 ; dialogue type? 1 = BG, 2 = no BG?

      _Slot .brept 2

        wUnknown0018D2        .word ? ; $0018D2 ; handled a character flag?
        lBGBufferPosition     .long ? ; $0018D4
        wVRAMAddress          .word ? ; $0018D7
        wUnknown0018D9        .word ? ; $0018D9
        .union
          wDisplayArea        .word ? ; $0018DB
          .struct
            bDisplayWidth     .byte ? ; $0018DB
            bDisplayHeight    .byte ? ; $0018DC
          .endstruct
        .endunion
        wBGBufferOffset       .word ? ; $0018DD
        wVRAMTileOffset       .word ? ; $0018DF
        wUnknown0018E1        .word ? ; $0018E1
        wUnknown0018E3        .word ? ; $0018E3
        wPortraitID           .word ? ; $0018E5 ; can also be portrait RAM address?
        wUnknown0018E7        .word ? ; $0018E7
        wUnknown0018E9        .word ? ; $0018E9

      .endrept

      .fill $001907 - * ; $001904

      aCharacterGraphicsBuffer .fill $200 ; $001907
      ; $001B07

    .bend

  .endvirtual


  .virtual $001B09

    aSave .block
      wUnknown001B09 .word ?            ; $001B09
      wMenuOperation .word ?            ; $001B0B
        ; 1 indexed
        ; $8000 flag set = load, else save
      wActiveSlot .word ?               ; $001B0D
      wActiveSaveData .word ?           ; $001B0F
        ; $00000111 = save ID
        ; $01111000 = completion count
      aSlotDataBuffer .brept 4          ; $001B11
        .word ?
      .endrept
      wGameTimerLow .word ?             ; $001B19
      wGameTimerHigh .word ?            ; $001B1B
      wCharacterID .word ?              ; $001B1D
      wCharacterDeploymentState .word ? ; $001B1F
      wCharacterXPosition .word ?       ; $001B21
      wCharacterYPosition .word ?       ; $001B23
      wStructIndex .word ?              ; $001B25
      wStructCount .word ?              ; $001B27
      .word ?                           ; $001B29
      aFactionEntryOffsets .brept 7     ; $001B2B
        .word ?
      .endrept
      .word ?                           ; $001B39
      wCurrentBitOffset .word ?         ; $001B3B
      wAvtiveSaveSlotOffset .word ?     ; $001B3D
      wDataBitLength .word ?            ; $001B3F
    .bend

    aPaletteFading .block
      wMaxSteps .word ?                   ; $001B41
      wDesiredColor .word ?               ; $001B43
      wCurrentStep .word ?                ; $001B45
      wCurrentPaletteBufferOffset .word ? ; $001B47
    .bend

  .endvirtual


  .virtual $001C00

    aSpriteBuffer .fill (128 * size(structPPUOAMEntry)) ; $001C00
    aSpriteExtBuffer .fill ((128 * 2) / 8)              ; $001E00
    wNextFreeSpriteOffset .word ?                       ; $001E20

  .endvirtual






  .virtual $7E2000

    wSonCharacterROMPointer .word ?       ; $7E2000
    wDaughterCharacterROMPointer .word ?  ; $7E2002

  .endvirtual


  .virtual $7E2000 ; some general use ram

    wDebugMenuSkillCounter .word ? ; $7E2000
    aDebugMenuSkillFlags .block    ; $7E2002
      bUnknown1     .byte ?
      bCanto        .byte ?
      bPavise       .byte ?
      bWrath        .byte ?
      bPursuit      .byte ?
      bAdept        .byte ?
      bSteal        .byte ?
      bUnknown2     .byte ?
      bDance        .byte ?
      bUnknown3     .byte ?
      bUnknown4     .byte ?
      bUnknown5     .byte ?
      bCharm        .byte ?
      bUnknown6     .byte ?
      bNihil        .byte ?
      bMiracle      .byte ?
      bCritical     .byte ?
      bVantage      .byte ?
      bAccost       .byte ?
      bAstra        .byte ?
      bLuna         .byte ?
      bSol          .byte ?
      bHoly         .byte ?
      bDarkness     .byte ?
      bRenewal      .byte ?
      bParagon      .byte ?
      bUnknown7     .byte ?
      bUnknown8     .byte ?
      bBargain      .byte ?
      bUnknown9     .byte ?
    .bend
  .endvirtual




  ; $7E2000 - some table for unit RAM pointers indexed by unit number?




  ; AI:

  .virtual $7E2000

    wAIUnknownBitfield7E2000 .word ?        ; $7E2000
    ; $0001 = finished with targeting cycle?
    ; $0004 = any foe in groups threat range
    ; $0008 = group leader dead
    ; $0010 = group leader is guarding castle
    ; $0020 = group has a target tile?
    ; $0040 = group leader fielded
    ; $0080 = ?
    ; $0100 = ?
    ; $0200 = ?
    wAIUnknown7E2002 .word ?                ; $7E2002
      ; 4 and 5 skip filling targets range map
    wAIFormationType .word ?                ; $7E2004
    wAIFormationDirection .word ?           ; $7E2006
    wAIGroupLeaderFieldMovement .word ?     ; $7E2008
    wAIGroupHighestItemRange .word ?        ; $7E200A
    wAIGroupLeaderXPosition .word ?         ; $7E200C
    wAIGroupLeaderYPosition .word ?         ; $7E200E
    wAIUnknown7E2010 .word ?                ; $7E2010
    wAIUnknown7E2012 .word ?                ; $7E2012
    wAIUnknown7E2014 .word ?                ; $7E2014
    wAIUnknown7E2016 .word ?                ; $7E2016
    wAIUnknown7E2018 .word ?                ; $7E2018 ; Target value?
    wAIUnknown7E201A .word ?                ; $7E201A ; some ID, action, for aUnknown86B1E6
    wAIUnknown7E201C .word ?                ; $7E201C
    wAIIgnoredGenerationID .word ?          ; $7E201E
    wAIGroupLeaderDeploymentOffset .word ?  ; $7E2020
    wAIUnitCounter .word ?                  ; $7E2022
    aAIUnitList .brept 24                   ; $7E2024
      .structAIUnitEntry
    .endrept
    ; $7E2174
  .endvirtual







  .virtual $7E2180
    aFactionArea .fill 195                  ; $7E2180
      ; Has 7 FactionSlot offsets (+the free space offset), each offset with its own structFactionHeader and then short pointers to unit RAM data
      ; The size is weird

    aUnitRAMPointers .block                 ; $7E2243
      _Header .structRAMStructHeader
      _Entry .brept 72                      ; $7E2247
        .word ?
      .endrept
    .bend

    aUnitRAMArea .block                     ; $7E22D7
      _Header .structRAMAreaHeader
      _Entry .brept 72
        .structRAMAreaEntryHeader
        .structCharacterDataRAM
      .endrept
    .bend

    aStaticUnitRAMArea .block               ; $7E29E7
      _Header .structRAMAreaHeader
      _Entry .brept 24
        .structRAMAreaEntryHeader
        .structPersonalCharacterDataRAM
        .structExtendedCharacterDataRAM
      .endrept
    .bend

    aDynamicUnitRAMArea .block              ; $7E2D4F
      _Header .structRAMAreaHeader
      _Entry .brept 17
        .structRAMAreaEntryHeader
        .structPersonalCharacterDataRAM
        .structExtendedCharacterDataRAM
        .structCharacterConstantData
      .endrept
    .bend

    aHolyAndEnemyRAMArea .block             ; $7E3131
      _Header .structRAMAreaHeader
      _Entry .brept 63
        .structRAMAreaEntryHeader
        .structPersonalCharacterDataRAM
      .endrept
    .bend

    aInventoryRAMArea .block               ; $7E3664
      _Header .structRAMAreaHeader
      _Entry .brept 72+1
        .structRAMAreaEntryHeader
        .structInventoryDataRAM
      .endrept
    .bend

    aLoverRAMArea .block                    ; $7E3BD7
      _Header .structRAMAreaHeader
      _Entry .brept 9
        .structLoverDataRAM
      .endrept
      .fill 9 * 6
    .bend

    aUnitWinCounts .block               ; $7E3D23
      _Gen1 .brept 24
        .word ?
      .endrept
      _Gen2 .brept 24                   ; $7E3D53
        .word ?
      .endrept
    .bend

    wTotalLevelUpCount .word ?          ; $7E3D83
    wTotalAlivePlayerUnitCount .word ?  ; $7E3D85
    aItemRAMData .block
      _Header .structRAMStructHeader    ; $7E3D87
      _Entry .brept 256
        .structItemRAMEntry
      .endrept
    .bend

    aDeploymentTable .block
      _State .fill (size(word) * 72)              ; $7E438B
      _XTilePosition .fill (size(word) * 72)      ; $7E441B
      _YTilePosition .fill (size(word) * 72)      ; $7E44AB
      _XPixelPosition .fill (size(word) * 72)     ; $7E453B
      _YPixelPosition .fill (size(word) * 72)     ; $7E45CB
      _DeploymentOffsets .fill (size(word) * 72)  ; $7E465B
      _UnitRAMPointer .fill (size(word) * 72)     ; $7E46EB
      _FactionSlot .fill (size(word) * 72)        ; $7E477B
      _MapSpriteID .fill (size(word) * 72)        ; $7E480B
      _StateBuffer .fill (size(word) * 72)        ; $7E489B
    .bend

    ; .word ? ; 7E492B
    ; .word ? ; 7E492D

    ; 7E492F


  .endvirtual


  .virtual $7E4E45

    aChapterLocationRAMData .fill 16 * size(byte)               ; $7E4E45
    aChapterLocationMoneyRewards .fill 16 * size(word)          ; $7E4E55
    aDeadPlayerCharacterList .fill 24 * size(word)              ; $7E4E75
    aChapterActiveMapChanges .fill 8                            ; $7E4EA5
      ; Unsure about the size

  .endvirtual

  .virtual $7E4EA9

    aScriptedUnitMapAction .fill 26 ; $7E4EA9

    ; $7E4EC3

  .endvirtual

  .virtual $7E4EA9

    wBattleType .byte ? ; $7E4EA9
      ; 0 = normal
      ; 1 = arena
      ; 2 = ? (forced anims on?)
      ; 3 = ?
    wBattleStatus   .byte ? ; $7E4EAA
      ; $40 - battle anim off
      ; $20 - ?
      ; $10 - ?
      ; $08 - siege offense (guard attacks)
      ; $04 - siege defense (guard defends)
      ; $01 - enemy initiator
      ; $00 - player initiator

    wBattleDistance .word ? ; $7E4EAB
    wBattleQuotePointer .long ? ; $7E4EAD
    wDeathQuotePointer  .long ? ; $7E4EB0
    wBattleSong .word ? ; $7E4EB3

    aActionStructUnit1 .structActionStructEntry ; $7E4EB5
    aActionStructUnit2 .structActionStructEntry ; $7E4F15

    wBattleCriticalType .word ? ; $7E4F75
      ; $8000 actually critting
      ; 0 = natural crit
      ; 1 = sibling crit
      ; 2 = lover crit
      ; 3 = triangle attack

    .word ? ; 7E4F77
    .word ? ; 7E4F79
    .word ? ; 7E4F7B
    .word ? ; 7E4F7D
    .word ? ; 7E4F7F

    aBattleRoundsData .block
      _Header .structRAMStructHeader  ; $7E4F81
      _Entry .brept 40 *2
        .word ?
      .endrept
    .bend

    wAITargetCounter .word ?          ; $7E5025
    aAITargetList .brept 48           ; $7E5027
      .structAITargetEntry
    .endrept

    aPermanentEventFlags .fill len(bytes(%1 x 256)) ; $7E5297

    aChapterEventRAMData .block                     ; $7E52B7
      _Header .structRAMStructHeader
      _Entry .brept 3
        .structChapterEventRAMEntry
      .endrept
    .bend

    ; 7E52EE

  .endvirtual



  .virtual $7E4EC5

    ; This overlaps with aActionStructUnit1

    aChildAverageLevelStats .block
      HP          .word ? ; 7E4EC5
      Strength    .word ? ; 7E4EC7
      Magic       .word ? ; 7E4EC9
      Skill       .word ? ; 7E4ECB
      Speed       .word ? ; 7E4ECD
      Defense     .word ? ; 7E4ECF
      Resistance  .word ? ; 7E4ED1
      Luck        .word ? ; 7E4ED3
    .bend

  .endvirtual

  .virtual $7E5315

    wUnknown7E5315 .word ?      ; $7E5315
    wUnknown7E5317 .word ?      ; $7E5317
    wUnknown7E5319 .word ?      ; $7E5319
    aUnitJoinOrder .brept 24    ; $7E531B
      .word ?
    .endrept
    ; Is indexed by unit generation ID and stores value of how many player units existed when unit was loaded.
    ; If someone dies, their value gets zero'd, and anyone with a higher value gets decremented.

    .fill 3 ; $7E534B

    wEpilogueOtherUnitsExistFlag .word ? ; $7E534E
    aEpilogueUnitMovement .block
      wCharacterID .word ?              ; $7E5350
      wStartingCoordinates .word ?      ; $7E5352
      wDestinationCoordinates .word ?   ; $7E5354
      wMovementData .byte ?             ; $7E5356
    .bend

    ; $7E5358

  .endvirtual




  .virtual $7E7358

    aUnitLossesCount .brept 48 ; $7E7358
      .byte ?
    .endrept

    ; $7E7388

  .endvirtual





  .virtual $7E6388

    aBG1TilemapBuffer .block             ; $7E6388
      Page0 .fill (32 * 32 * size(word)) ; $7E6388
      Page1 .fill (32 * 32 * size(word)) ; $7E6B88
      .endblock

    aBG2TilemapBuffer .block             ; $7E7388
      Page0 .fill (32 * 32 * size(word)) ; $7E7388
      Page1 .fill (32 * 32 * size(word)) ; $7E7B88
      .endblock

    aBG3TilemapBuffer .block             ; $7E8388
      Page0 .fill (32 * 32 * size(word)) ; $7E8388
      Page1 .fill (32 * 32 * size(word)) ; $7E8B88
      .endblock

  .endvirtual

  .virtual $7E8B88

    aDecompressionBuffer .fill ($7F0000 - *) ; $7E8B88
    ; IDK when this ends

  .endvirtual

  .virtual $7E8B88

    aEventMovement .block

      aMapTraversalList .fill $800 ; $7E8B88
      aMovementCostMap .fill $1000 ; $7E9388
        ; Stores movement cost +1, any tile with a unit gets +8
      .fill 64  ; $7EA388
        ; Clear area to not mess with the aTargetDistanceMap when looking for
        ; tiles upwards
      aTargetDistanceMap .fill $1000 ; $7EA3C8
        ; Holds the distance of each tile from the destination point to the specified units tile.
      .fill 64 ; $7EB3C8
        ; Clear area for aTargetDistanceMap downwards
      .fill 64 ; $7EB408
        ; Clear area for aTargetMap upwards
      aTargetMap .fill $1000 ; $7EB448
        ; The tile index with the target marked with a 0.
      .fill 64 ; $7EB408
        ; Clear area for aTargetMap downwards
      wMovementCostPointer .word ?    ; $7EC488
      wEntryIndex .word ?    ; $7EC48A
      wUnitXCoordinate .word ?    ; $7EC48C
      wUnitYCoordinate .word ?    ; $7EC48E
        ; Coordinates where the unit to me moved is before the movement.
      wDestinationXCoordinate .word ?    ; $7EC490
      wDestinationYCoordinate .word ?    ; $7EC492
        ; Coordinates where the unit is supposed to move to.
      wUnknown7EC494 .word ?    ; $7EC494
        ; 0 or 1?
      wStartingXCoordinate .word ?    ; $7EC496
      wStartingYCoordinate .word ?    ; $7EC498
        ; Starting spot where the routine generates a distance map from.
        ; Equal to the Destination coorinates.
      wTargetXCoordinate .word ?    ; $7EC49A
      wTargetYCoordinate .word ?    ; $7EC49C
        ; First found target in the target map.
        ; Equal to the Units coorinates.
      .union
        .struct
          wRunningMovementCost .word ?            ; $7EC49E
          wAnalyzeTraversalOffset .word ?         ; $7EC4A0
          wMapTraversalListOffset .word ?         ; $7EC4A2
          wFilledMapTraversalListFlag .word ?     ; $7EC4A4
        .endstruct
        .struct
          wMovementScriptBufferAddress .word ?    ; $7EC49E
          wLowestMovementDistance .word ?         ; $7EC4A0
          wMapTileIndex .word ?                   ; $7EC4A2
          wMaxScriptCommandsCount .word ?         ; $7EC4A4
        .endstruct
      .endunion
      aMovementScriptBuffer1 .fill $200           ; $7EC4A6
      aMovementScriptBuffer2 .fill $200           ; $7EC6A6
      aMovementScriptBuffer3 .fill $200           ; $7EC8A6
      aMovementScriptBuffer4 .fill $200           ; $7ECAA6
      aScriptStartXCoordinate .fill size(word)* 4 ; $7ECCA6
      aScriptStartYCoordinate .fill size(word)* 4 ; $7ECCAE
      aScriptEndXCoordinate .fill size(word)* 4   ; $7ECCB6
      aScriptEndYCoordinate .fill size(word)* 4   ; $7ECCBE
    .bend

    wActionStructAttackerDeploymentNumber .word ? ; $7ECCC6
    wActionStructDefenderDeploymentNumber .word ? ; $7ECCC8
    wActionStructUnit1DeploymentNumber    .word ? ; $7ECCCA
    wActionStructUnit2DeploymentNumber    .word ? ; $7ECCCC

  .endvirtual



  .virtual $7ECCD6

    wBattleAttackerIndex    .word ? ; $7ECCD6
      ; 0 = player
      ; 1 = enemy
    wActionStructAttacker   .word ? ; $7ECCD8
    wActionStructDefender   .word ? ; $7ECCDA
    wBattleActivatedSkill   .word ? ; $7ECCDC
    bBattleRoundFlags .byte ? ; $7ECCDE
      ; "ＥＭＴＤＤＣＡＴ"
      ; $00 = player
      ; $01 = enemy
      ; $02 = staff action?
      ; $04 = crit
      ; $08 = miss
      ; $10 = vs julius, arena and not trigger skill 1 set?
      ; $20 = ranged
      ; $40 = magic
  .endvirtual

  .virtual $7ECCE6

    wScriptedCombatFlags .word ? ; $7ECCE6
      ; $01 = If set: attacker attacks first, else defender
      ; $02 = If set: regular fight, else arena?
      ; $04 = If set: Crit
      ; $08 = If set: miss, else hit
      ; $10 = Fixed Crit/Hit/Miss based on $04/$08

  .endvirtual

  ; .word ? ; $7ECCE8 - various things




  .virtual $7ECB88

    aWorldMapMarkerPalette .fill size(word) * 7 ; $7ECB88

  .endvirtual






  .virtual $7EDB88

    aMovingMapSpriteData .brept 4 ; $7EDB88 / $7EDC08 / $7EDC88 / $7EDD08
      wCharacterID        .word ? ; $00
      aSpawnCoordinates   .word ? ; $02
      .union
        bSpeed            .byte ? ; $04 ; lower nybble
        bFlags            .byte ? ; $04 ; upper nybble
        ; if bit $10 set, set bit $10 of wUnknown0017C2, DisappearOffscreenFlag
        ; if $80 set, check if char is dead, skip movement if so
      .endunion
      bAllegianceColor    .byte ? ; $05
      lPathScriptPointer  .long ? ; $06
      .fill $77                   ; $09
    .endrept

  ; $7EDD88

  .endvirtual











  .virtual $7EFF00

    aDialogueHDMATable1 .fill $80 ; $7EFF00
    aDialogueHDMATable2 .fill $80 ; $7EFF80

  .endvirtual


  .virtual $7F2000

    aTerrainTileset .fill $400 ; $7F2000
      ; This is a terrain byte for each tile in the tileset.
    aMapData .fill $1000 * size(word) ; $7F2400
      ; This holds the entire 64x64 map with each tile being a word-sized aTerrainTileset ID.

    .word ? ; $7F4400

    aAIAction .block ; 7F4402
      wUnknown7F4402 .word ?                  ; $7F4402 ; index for 86A035: 0 = silence foe, 1 = attack injured, 2 = regular attack?
      wTargetXPosition .word ?                ; $7F4404
      wTargetYPosition .word ?                ; $7F4406
      wAttackTileMapTileIndex .word ?         ; $7F4408
      wAttackTileXPosition .word ?            ; $7F440A
      wAttackTileYPosition .word ?            ; $7F440C
      wAttackMapTileIndexModifier .word ?     ; $7F440E
      wAttackTileXPositionModifier .word ?    ; $7F4410
      wAttackTileYPositionModifier .word ?    ; $7F4412
      .word ?                                 ; $7F4414
      .word ?                                 ; $7F4416
      wMapWidth .word ?                       ; $7F4418
      wMapHeight .word ?                      ; $7F441A
      wAttackChance .word ?                   ; $7F441C
      .word ?                                 ; $7F441E
      wMinimumAttackRange .word ?             ; $7F4420
      wMaximumAttackRange .word ?             ; $7F4422
      .word ?                                 ; $7F4424
      wAttackDirection .word ?                ; $7F4426
      wAdditionalAttackDirections .word ?     ; $7F4428
      wMapPointer .word ?                     ; $7F442A
      wUnknown7F442C .word ?                  ; $7F442C ; active faction/counter/?
      wUnitFaction .word ?                    ; $7F442E
      wUnitMovementCostPointer .word ?        ; $7F4430
      wUnknown7F4432 .word ?                  ; $7F4432
      wBestAttackChance .word ?               ; $7F4434
      wUnitToChosenTargetDistance .word ?     ; $7F4436
      wLeadershipPower .word ?                ; $7F4438
      wDestinationXPosition .word ?           ; $7F443A
      wDestinationYPosition .word ?           ; $7F443C
      wChosenTargetDeploymentOffset .word ?   ; $7F443E
      wUnknown7F4440 .word ?                  ; $7F4440 ; interaction type id? 0 = attack, 8 = silence?
      wUnitInventorySlot .word ?              ; $7F4442
      wUnitItemMinimumRange .word ?           ; $7F4444
      wUnitItemMaximumRange .word ?           ; $7F4446
      wUnknown7F4448 .word ?                  ; $7F4448 ; value of wAIUnknown7E2002 or 5 if guarding castle, index for aUnknown86A18F
      wUntDeploymentOffset .word ?            ; $7F444A
      wTargetDeploymentOffset .word ?         ; $7F444C
      wAttackTileTerrainType .word ?          ; $7F444E
      wUnitCurrentHP .word ?                  ; $7F4450
      wExpectedInflictedDamage .word ?        ; $7F4452
      wExpectedTakenDamage .word ?            ; $7F4454
      wTargetHPBonus .word ?                  ; $7F4456
      wUnitHPPenalty .word ?                  ; $7F4458
      wMovementDistanceToTarget .word ?       ; $7F445A ; needs checking
      wUnknown7F445C .word ?                  ; $7F445C ; some value based on attack range around target?
      wUnitToAttackTileDistance .word ?       ; $7F445E
      wTargetToAttackTileDistance .word ?     ; $7F4460
      .word ?                                 ; $7F4462
      wAttackTileThreatValue .word ?          ; $7F4464
      wTurnValue .word ?                      ; $7F4466
        ; Can either be capped at 63 or halved
      wTempValue .word ?                      ; $7F4468
      wTargetsBattleMight .word ?             ; $7F446A

    .bend

  .endvirtual




  .virtual $7F5400

    aWorldMapMarker .block
      wStatus .brept 8              ; $7F5400
        .word ?
      .endrept
      wTimer .brept 8               ; $7F5410
        .word ?
      .endrept
      wXPosition .brept 8           ; $7F5420
        .word ?
      .endrept
      wYPosition .brept 8           ; $7F5430
        .word ?
      .endrept
      wID .brept 8                  ; $7F5440
        .word ?
      .endrept
    .bend

    aWorldMapPortrait .block
      wStatus .brept 7              ; $7F5450
        .word ?
      .endrept
      wXPosition .brept 7           ; $7F545E
        .word ?
      .endrept
      wYPosition .brept 7           ; $7F546C
        .word ?
      .endrept
    .bend

    .word ?                         ; $7F547A

    wEpilogueSavedUnitID1 .word ?   ; $7F547C
    wEpilogueSavedUnitID2 .word ?   ; $7F547E
    wEpilogueSavedUnitID3 .word ?   ; $7F5480
    
  .endvirtual

  .virtual $7F5599

    aPortraitSlotsPaletteBuffer .fill (size(Palette) * 8) ; $7F5599

    ; 7F5699

  .endvirtual

  .virtual $7F454A

    aMapAction .block
      wWeaponType .word ?     ; $7F454A
      wUnknown7F454C .word ?  ; $7F454C
      wBattleClassID .word ?  ; $7F454E
        ; usually class ID, can differ if gendered?
      wUnknown7F4450 .word ?  ; $7F4550
      wXTilePosition .word ?  ; $7F4552
      wYTilePosition .word ?  ; $7F4554
      wUnknown7F4556 .word ?  ; $7F4556
      wUnknown7F4558 .word ?  ; $7F4558
      wUnknown7F455A .word ?  ; $7F455A
      wUnknown7F455C .word ?  ; $7F455C
      wUnknown7F455E .word ?  ; $7F455E
      wUnknown7F4560 .word ?  ; $7F4560
      wUnknown7F4562 .word ?  ; $7F4562
    .bend

  .endvirtual


  .virtual $7F454A

    .union
      .struct
        aMovingMapSpriteBuffers .brept 4 ; $7F454A
          .fill $2000
        .endrept
      .endstruct
      .struct
        aAllyUnitMap  .fill $1000       ; $7F454A
          ; Filled with deployment offsets of units of own faction and allies.
        aFoeUnitMap   .fill $1000       ; $7F554A
          ; Filled with deployment offsets of units of opposing faction and others.
        aRangeMap .fill $1000           ; $7F654A
          ; Filled with flagged tiles that can be attacked.
        aMovementMap .fill $1000        ; $7F754A
          ; Filled with the remaining field movement after movement to a specific tile.
        aTargetDistanceMap .fill $1000  ; $7F854A
          ; Filled with the total movement cost required to reach certain target tiles.
        aTargetMap .fill $1000        ; $7F954A
          ; Filled with either deployment offsets for units, or castle IDs that are the
          ; current AI's targets.
        .union
          .struct
            aMovementCostMap .fill $1000  ; $7FA54A
              ; Filled with the movement cost of all tiles on the map.
          .endstruct
          .struct
            aUnitMap .fill $1000  ; $7FA54A
              ; Filled with deployment offsets of all units.
          .endstruct
        .endunion
        aMapTraversalList .fill $100  ; $7FB54A
          ; Used in different ways, either holds tile indices like up, down, left, right, and
          ; then takes one and overwrites it with its 4 directions and so on,
          ; or gets indexed by remaining field movement and then holds an offset to the next list.
        aNextTraversedTileIndexList .fill $400 ; $7FB64A
          ; The size of this is a guess, IDK how big it is
      .endstruct
    .endunion

  .endvirtual




  .virtual $7F8402

    wDebugMenuScreenIndex .word ? ; 7F8402

  .endvirtual




  .virtual $7FC54A

    aEpilogueUnitStates .fill 25 * size(word) ; $7FC54A
      ; indexed by CharacterID
      ; $8000 if dead
      ; $4000 if unrecruited
      ; $2000 + ora'd partners ID for selected children in aUnknown82F96C
    aUnknown7FC57C .fill 25 * size(word) ; $7FC57C
      ; indexed by Gen2 IDs, same as above

    ; $7FC5AE

  .endvirtual

  .virtual $7FC5CA

    aEpilogueUnitProcessedFlags .fill 25 * size(word) * 2 ; $7FC5CA
      ; -1 if unit hasn't been processed yet

    ; $7FC62E

  .endvirtual

  .virtual $7FC64A

    aEpilogueMainCharacters .fill $40  ; $7FC64A
      ; Indexed by epilogue ID, holds CharacterIDs of units that get their own
      ; epilogue.
    aEpilogueSupportingCharacters .fill $40  ; $7FC68A
      ; Characters who are involved in the epilogues of the prior table, same offsets.
    aEpilogueChosenDialogueID .fill $32  ; $7FC6CA
      ; For every unit, holds the ID for their epilogue pointers + 1.
      ; 0 means the character doesnt get an epilogue

    ; $7FC6FC

  .endvirtual

  .virtual $7FC70A

    aUnknown7FC70A .fill 16 * size(byte)      ; $7FC70A 
      ; result | remainder
    aUnknown7FC71A .fill 7 * size(byte)       ; $7FC71A
      ; ?
    aUnknown7FC721 .fill 9 * size(byte)       ; $7FC721
      ; male lovers gen ids indexed by female gen ids starting with patty
    aUnknown7FC72A .fill (8 + 1) * size(byte) ; $7FC72A
      ; ?
    ; $7FC734

  .endvirtual

  .virtual $7FEB4A

    aUnit1DataBuffer .block
      _Personal   .structPersonalCharacterDataBuffer  ; $7FEB4A
      _Extended   .structExtendedCharacterDataBuffer  ; $7FEB66
      _ROM        .structCharacterROMDataBuffer       ; $7FEB84
      _Inventory  .structInventoryDataBuffer          ; $7FEBA6
      _Lover      .structLoverDataRAM                 ; $7FEBBA
    .bend

    aUnit2DataBuffer .block
      _Personal   .structPersonalCharacterDataBuffer  ; $7FEBD8
      _Extended   .structExtendedCharacterDataBuffer  ; $7FEBF4
      _ROM        .structCharacterROMDataBuffer       ; $7FEC12
      _Inventory  .structInventoryDataBuffer          ; $7FEC34
      _Lover      .structLoverDataRAM                 ; $7FEC48
    .bend

    ; 7fec66

  .endvirtual


  .virtual $7FEA4A

    wDialogueBoxHDMAYPixelPosition .word ?                ; $7FEA4A
    wDialogueBoxHDMACycleCounter .word ?                  ; $7FEA4C
    wDialogueBoxHDMAStatus .word ?                        ; $7FEA4E
      ; -1 = done
      ; other values = busy
    wDialogueBoxHDMAPositionIndicator .word ?             ; $7FEA50
      ; 0 for top box, 1 for bottom
    aDialogueBoxHDMAIndirectTableEven .fill 19 * 3 +1     ; $7FEA52
    aDialogueBoxHDMADataTableEven .fill 19 * size(word)   ; $7FEA8C
    aDialogueBoxHDMAIndirectTableOdd .fill 19 * 3 +1      ; $7FEAB2
    aDialogueBoxHDMADataTableOdd .fill 19 * size(word)    ; $7FEAEC

    ; $7FEB12

  .endvirtual


  .virtual $7FEEA8

    aMapMenuRAMArea .block                     ; $7FEEA8
      _Header .structRAMAreaHeader

      ; structRAMAreaEntryHeader
      .fill $0E4F
    .bend
    ; $7FFCFF

  .endvirtual

