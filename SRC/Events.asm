
    .weak

      rlFindCharacterByGenerationID             :?= address($848726)
      rlClearHighlightWorldMapPart              :?= address($8B8A84)
      rlGetMapSpriteMovementSound               :?= address($88C13E)
      rsMovingMapSpriteAppendDecomp             :?= address($88D67C)
      rlApplyMapTileChange                      :?= address($86C6E8)

    .endweak

    .section Code868000Section

      .enc "screen"
      .text "VER 960402 2000"
      .byte 0

      rlUnknown868010 ; 86/8010

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlUnknown868011 ; 86/8011

        .al
        .autsiz
        .databank ?

        stz $1753,b

        lda wJoy1Input
        bit #JOY_Start
        bne +

          inc $0302,b
          stz $0304,b
          rtl
    
        +
        jsl rlProcEngineResetProcEngine
        stz $0302,b

        lda #<>$80F1D5
        sta aProcSystem.wInput0,b

        lda #(`procUnknown8282D3)<<8
        sta lR44+1
        lda #<>procUnknown8282D3
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

      rlUnknown86803E ; 86/803E

        .al
        .autsiz
        .databank ?

        lda $0304,b
        cmp #2
        bmi +
        
          -
          bra -

        +
        asl a
        tax
        jsr (aUnknown86804E,x)
        rtl

        .databank 0

      aUnknown86804E ; 86/804E

        .addr rsUnknown868052
        .addr rsUnknown86805D

      rsUnknown868052 ; 86/8052

        .al
        .autsiz
        .databank ?

        jsl $9BFC8D
        bcs +

          rts

        +
        inc $0304,b
        rts

        .databank 0

      rsUnknown86805D ; 86/805D

        .al
        .autsiz
        .databank ?

        jsl rlProcEngineResetProcEngine
        stz $0302,b

        lda #<>$80C0B6
        sta aProcSystem.wInput0,b

        lda #(`procUnknown8282D3)<<8
        sta lR44+1
        lda #<>procUnknown8282D3
        sta lR44
        jsl rlProcEngineCreateProc
        rts

        .databank 0

      rlInitiateChapterEventRAMData ; 86/8079

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        ldx #33

        sep #$20
        lda #0

          -
          sta bEventStatus,b,x
          dec x
          bpl -

        rep #$20

        ldx #size(aPermanentEventFlags) + size(aChapterEventRAMData) -1
        sep #$20
        lda #0
        
          -
          sta aPermanentEventFlags,x
          dec x
          bpl -

        rep #$20

        lda #0
        sta $7E52EE

        lda #(`aChapterEventRAMData)<<8
        sta lR18+1
        lda #<>aChapterEventRAMData
        sta lR18
        lda #len(aChapterEventRAMData._Entry)
        sta wR0
        lda #size(aChapterEventRAMData._Entry[0])
        sta wR1
        jsl rlBuildRAMStructHeader

        plp
        plb
        rtl

        .databank 0

      rlSetPermanentEventFlag ; 86/80BE

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        cmp #256
        bcs +

          pha

          lsr a
          lsr a
          lsr a
          tay

          sep #$20
          lda #`aPermanentEventFlags
          pha
          rep #$20
          plb

          .databank `aPermanentEventFlags

          pla
          and #$0007
          tax
          sep #$20
          lda aPermanentEventFlags,y
          ora aSetPermanentEventFlagMask,x
          sta aPermanentEventFlags,y
          rep #$20

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aSetPermanentEventFlagMask ; 86/80EE

        .byte $01
        .byte $02
        .byte $04
        .byte $08
        .byte $10
        .byte $20
        .byte $40
        .byte $80

      rlUnsetPermanentEventFlag ; 86/80F6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        cmp #256
        bcs +

          pha

          lsr a
          lsr a
          lsr a
          tay

          sep #$20
          lda #`aPermanentEventFlags
          pha
          rep #$20
          plb

          .databank `aPermanentEventFlags

          pla
          and #$0007
          tax
          sep #$20
          lda aPermanentEventFlags,y
          and aUnsetPermanentEventFlagMask,x
          sta aPermanentEventFlags,y
          rep #$20

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aUnsetPermanentEventFlagMask ; 86/8126

        .byte $FE
        .byte $FD
        .byte $FB
        .byte $F7
        .byte $EF
        .byte $DF
        .byte $BF
        .byte $7F

      rlCheckPermanentEventFlagSet ; 86/812E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        cmp #256
        bcs +

          pha

          lsr a
          lsr a
          lsr a
          tay

          sep #$20
          lda #`aPermanentEventFlags
          pha
          rep #$20
          plb

          .databank `aPermanentEventFlags

          pla
          and #$0007
          tax
          lda aPermanentEventFlags,y
          and #$00FF
          and aCheckPermanentEventFlagSetMask,x
          bne ++

        +
        ply
        plx
        plp
        plb
        clc
        rtl
        
        +
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      aCheckPermanentEventFlagSetMask ; 86/8163

        .byte $01
        .byte $02
        .byte $04
        .byte $08
        .byte $10
        .byte $20
        .byte $40
        .byte $80

      rlUnknown86816B ; 86/816B

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        cmp #$FFFF
        beq +

          jsr rsRunEventConditionCommand

        +
        rtl

        .databank 0

      rlBeginChapterEvents ; 86/8177

        .al
        .autsiz
        .databank ?

        ; Creates a struct in RAM with the header data, grabs the opening
        ; event pointer and runs it.

        ; Input:
        ; lR18 = Chapter event header pointer

        phb
        php
        phk
        plb
        phy

        lda #1
        tsb bEventStatus,b

        lda #(`aChapterEventRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aChapterEventRAMData
        sta lStructPointer2,b
        lda #(`aDefaultChapterRAMData)<<8
        sta lStructPointer1+1,b
        lda #<>aDefaultChapterRAMData
        sta lStructPointer1,b
        jsl rlAppendNewStructEntry

        jsl rlGetLatestStructEntryPointer

        ldy lStructPointer1,b

        sep #$20
        lda lStructPointer1+2,b
        pha
        rep #$20
        plb

        lda [lR18]
        sta structChapterEventRAMEntry.Chapter,b,y
        lda lR18
        sta structChapterEventRAMEntry.EventPointer,b,y
        lda lR18+1
        sta structChapterEventRAMEntry.EventPointer+1,b,y

        phk
        plb

        lda lStructPointer1+1,b
        sta lChapterEventRAMDataEntryPointer+1,b
        lda lStructPointer1,b
        sta lChapterEventRAMDataEntryPointer,b
        jsl rlRunChapterOpeningEvents

        lda #1
        trb bEventStatus,b

        lda wUnknown00171A,b
        bit #$0008
        bne +

        ply
        plp
        plb
        clc

        -
        rtl

        +
        ply
        plp
        plb
        sec
        bra -

        .databank 0

      aDefaultChapterRAMData ; 86/81E8

        .word 0
        .long 0
        .word 0
        .fill 10, 0

      rlRemoveChapterRAMStruct ; 86/81F9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsl rlGetSpecifiedChaptersRAMPointer
        bcs +

          sta wStructIndex,b
          lda #(`aChapterEventRAMData)<<8
          sta lStructPointer2+1,b
          lda #<>aChapterEventRAMData
          sta lStructPointer2,b
          jsl rlRemoveRAMStructEntryByID

          plp
          plb
          clc
          rtl

        +
        plp
        plb
        sec
        rtl

        .databank 0

      rlUnknown86821E ; 86/821E

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlGetSpecifiedChaptersRAMPointer ; 86/821F

        .al
        .autsiz
        .databank ?

        ; I assume they were planning on leaving all chapter RAM data, so
        ; they could check temp flags in later chapters. Or the planned on a free roam mode like Gaiden
        ; and didnt want you to trigger eg. Ch1s brave axe event if you are currently in a Ch5 state.
        ; This routine is mostly useless and will only get the active chapters pointer back.
        ; If the specified chapter matches the current one, return CLC, else SEC.
        ; Always fills lChapterEventRAMDataEntryPointer

        ; Input:
        ; A = ChapterID

        phb
        php
        phk
        plb
        phx

        sta wEventEngineParameter3,b
        lda #(`aChapterEventRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aChapterEventRAMData
        sta lStructPointer2,b
        ldx #1

        -
        stx wStructIndex,b

        jsl rlGetRAMStructEntryPointerByStructIndex
        bcs _SEC

        lda lStructPointer1,b
        sta lChapterEventRAMDataEntryPointer,b
        lda lStructPointer1+1,b
        sta lChapterEventRAMDataEntryPointer+1,b
        jsl rlGetEventChapterID
        cmp wEventEngineParameter3,b
        beq _CLC

        inc x
        bra -

        _SEC
        lda #0
        plx
        plp
        plb
        sec
        
        -
        rtl
        
        _CLC
        txa
        plx
        plp
        plb
        clc
        bra -

        .databank 0

      rlGetChapterEventRAMEntryPointerByID ; 86/8266

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        sta wStructIndex,b
        lda #(`aChapterEventRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aChapterEventRAMData
        sta lStructPointer2,b
        jsl rlGetRAMStructEntryPointerByStructIndex
        bcs _SEC

        lda lStructPointer1,b
        sta lChapterEventRAMDataEntryPointer,b
        lda lStructPointer1+1,b
        sta lChapterEventRAMDataEntryPointer+1,b
        plp
        plb
        clc
        
        -
        rtl
        
        _SEC
        plp
        plb
        sec
        bra -

        .databank 0

      rlCheckIfEventFlagOfSpecifiedChapterSet ; 86/8294

        .al
        .autsiz
        .databank ?

        ; Accessing anything but the current chapter doesn't work with this. Thanks FE4

        ; Input:
        ; A = ChapterID
        ; wEventEngineParameter1 = EventFlag

        phb
        php
        phk
        plb
        jsl rlGetSpecifiedChaptersRAMPointer
        bcs ++

          lda wEventEngineParameter1,b
          jsl rlCheckEventFlagSet
          bcc +

            lda #0
            plp
            plb
            sec
            rtl

          +
          lda #0
          plp
          plb
          clc
          rtl

        +
        lda #$FFFF
        plp
        plb
        clc
        rtl

        .databank 0

      rlGetAndRunChapterMapEventConditions ; 86/82BC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda lStructPointer1,b
        pha
        lda lStructPointer1+1,b
        pha
        phx

        lda bEventStatus,b
        bit #$0003
        bne _CLC

        lda #2
        tsb bEventStatus,b

        ldx #1

        -
        lda #(`aChapterEventRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aChapterEventRAMData
        sta lStructPointer2,b
        stx wStructIndex,b
        jsl rlGetRAMStructEntryPointerByStructIndex
        bcs +

          lda lStructPointer1,b
          sta lChapterEventRAMDataEntryPointer,b
          lda lStructPointer1+1,b
          sta lChapterEventRAMDataEntryPointer+1,b
          jsl rlRunChapterMapEventConditions
          inc x
          bra -

        +
        lda #2
        trb bEventStatus,b

        lda wUnknown00171A,b
        bit #$0008
        bne _SEC
        
        _CLC
        plx
        pla
        sta lStructPointer1+1,b
        pla
        sta lStructPointer1,b
        plp
        plb
        clc
        
        -
        rtl
        
        _SEC
        plx
        pla
        sta lStructPointer1+1,b
        pla
        sta lStructPointer1,b
        plp
        plb
        sec
        bra -

        .databank 0

      rlUnknown86832B ; 86/832B

        .al
        .autsiz
        .databank ?

        jsl rlGetEventChapterID
        jsl rlRemoveChapterRAMStruct
        rtl

        .databank 0

      rlGetCurrentEventPointer ; 86/8334

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lChapterEventRAMDataEntryPointer

        phb
        php
        phk
        plb
        phy

        ldy lChapterEventRAMDataEntryPointer,b

        sep #$20
        lda lChapterEventRAMDataEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterEventRAMEntry.EventPointer,b,y
        sta lEventPointer
        lda structChapterEventRAMEntry.EventPointer+1,b,y
        sta lEventPointer+1

        ply
        plp
        plb
        rtl

        .databank 0

      rlGetEventChapterID ; 86/8357

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lChapterEventRAMDataEntryPointer

        phb
        php
        phk
        plb
        phy
        ldy lChapterEventRAMDataEntryPointer,b

        sep #$20
        lda lChapterEventRAMDataEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterEventRAMEntry.Chapter,b,y
        ply
        plp
        plb
        rtl

        .databank 0

      rlRunChapterOpeningEvents ; 86/836F

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lChapterEventRAMDataEntryPointer

        phb
        php
        phk
        plb
        phx
        phy
        jsl rlGetCurrentEventPointer

        ldx lEventPointer,b

        sep #$20
        lda lEventPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterEventHeader.OpeningEvents,b,x
        tay

        sep #$20
        lda structChapterEventHeader.OpeningEvents+2,b,x
        pha
        rep #$20
        plb

        jsl rlRunChapterEventConditions

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlRunChapterMapEventConditions ; 86/839B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lChapterEventRAMDataEntryPointer

        phb
        php
        phk
        plb
        phx
        phy

        jsl rlGetCurrentEventPointer

        ldx lEventPointer,b

        sep #$20
        lda lEventPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterEventHeader.MapEvents,b,x

        tay
        sep #$20
        lda structChapterEventHeader.MapEvents+2,b,x
        pha
        rep #$20
        plb

        jsl rlRunChapterEventConditions

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown8683C7 ; 86/83C7

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetCurrentEventPointer
        ldx #<>lEventPointer
        lda #8
        jsl $80A861
        plx
        rtl

        .databank 0

      rlRunChapterEventConditions ; 86/83D8

        .al
        .autsiz
        .databank ?

        -
        lda $0000,b,y
        cmp #$FFFF
        beq +

          jsr rsRunEventConditionCommand
          bra -

        +
        rtl

        .databank 0

      rsRunEventConditionCommand ; 86/83E6

        .al
        .autsiz
        .databank ?

        inc y
        and #$00FF
        asl a
        tax
        clc
        jmp (aChapterEventConditionCommands,x)

        .databank 0

      rsTrySkipEventConditionCommand ; 86/83F0

        .al
        .autsiz
        .databank ?

        inc y
        and #$00FF
        asl a
        tax
        sec
        jmp (aChapterEventConditionCommands,x)

        .databank 0

      aChapterEventConditionCommands ; 86/83FA

        .word <>rsChapterEventConditionCommand00
        .word <>rsChapterEventConditionCommand01
        .word <>rsChapterEventConditionCommand02
        .word <>rsChapterEventConditionCommand03
        .word <>rsChapterEventConditionCommand04
        .word <>rsChapterEventConditionCommand05
        .word <>rsChapterEventConditionCommand06
        .word <>rsChapterEventConditionCommand07
        .word <>rsChapterEventConditionCommand08
        .word <>rsChapterEventConditionCommand09
        .word <>rsChapterEventConditionCommand0A
        .word <>rsChapterEventConditionCommand0B
        .word <>rsChapterEventConditionCommand0C
        .word <>rsChapterEventConditionCommand0D
        .word <>rsChapterEventConditionCommand0E
        .word <>rsChapterEventConditionCommand0F
        .word <>rsChapterEventConditionCommand10
        .word <>rsChapterEventConditionCommand11
        .word <>rsChapterEventConditionCommand12
        .word <>rsChapterEventConditionCommand13
        .word <>rsChapterEventConditionCommand14
        .word <>rsChapterEventConditionCommand15
        .word <>rsChapterEventConditionCommand16
        .word <>rsChapterEventConditionCommand17
        .word <>rsChapterEventConditionCommand18
        .word <>rsChapterEventConditionCommand19
        .word <>rsChapterEventConditionCommand1A
        .word <>rsChapterEventConditionCommand1B
        .word <>rsChapterEventConditionCommand1C
        .word <>rsChapterEventConditionCommand1D
        .word <>rsChapterEventConditionCommand1E
        .word <>rsChapterEventConditionCommand1F
        .word <>rsChapterEventConditionCommand20
        .word <>rsChapterEventConditionCommand21
        .word <>rsChapterEventConditionCommand22
        .word <>rsChapterEventConditionCommand23
        .word <>rsChapterEventConditionCommand24
        .word <>rsChapterEventConditionCommand20 ; $25
        .word <>rsChapterEventConditionCommand26
        .word <>rsChapterEventConditionCommand27
        .word <>rsChapterEventConditionCommand28
        .word <>rsChapterEventConditionCommand29
        .word <>rsChapterEventConditionCommand2A
        .word <>rsChapterEventConditionCommand2B
        .word <>rsChapterEventConditionCommand2C
        .word <>rsChapterEventConditionCommand2D
        .word <>rsChapterEventConditionCommand20 ; $2E
        .word <>rsChapterEventConditionCommand2F ; $2F
        .word <>rsChapterEventConditionCommand30
        .word <>rsChapterEventConditionCommand31
        .word <>rsChapterEventConditionCommand32
        .word <>rsChapterEventConditionCommand33
        .word <>rsChapterEventConditionCommand34
        .word <>rsChapterEventConditionCommand35
        .word <>rsChapterEventConditionCommand36
        .word <>rsChapterEventConditionCommand37
        .word <>rsChapterEventConditionCommand38
        .word <>rsChapterEventConditionCommand39
        .word <>rsChapterEventConditionCommand3A
        .word <>rsChapterEventConditionCommand3B
        .word <>rsChapterEventConditionCommand3C
        .word <>rsChapterEventConditionCommand3D
        .word <>rsChapterEventConditionCommand3E
        .word <>rsChapterEventConditionCommand3F
        .word <>rsChapterEventConditionCommand40
        .word <>rsChapterEventConditionCommand41
        .word <>rsChapterEventConditionCommand42
        .word <>rsChapterEventConditionCommand43
        .word <>rsChapterEventConditionCommand44
        .word <>rsChapterEventConditionCommand45
        .word <>rsChapterEventConditionCommand46
        .word <>rsChapterEventConditionCommand47
        .word <>rsChapterEventConditionCommand48
        .word <>rsChapterEventConditionCommand49
        .word <>rsChapterEventConditionCommand4A
        .word <>rsChapterEventConditionCommand4B
        .word <>rsChapterEventConditionCommand4C
        .word <>rsChapterEventConditionCommand4D
        .word <>rsChapterEventConditionCommand4E
        .word <>rsChapterEventConditionCommand4F
        .word <>rsChapterEventConditionCommand50
        .word <>rsChapterEventConditionCommand51
        .word <>rsChapterEventConditionCommand52
        .word <>rsChapterEventConditionCommand53
        .word <>rsChapterEventConditionCommand54
        .word <>rsChapterEventConditionCommand55
        .word <>rsChapterEventConditionCommand56
        .word <>rsChapterEventConditionCommand57
        .word <>rsChapterEventConditionCommand58
        .word <>rsChapterEventConditionCommand59
        .word <>rsChapterEventConditionCommand5A
        .word <>rsChapterEventConditionCommand5B
        .word <>rsChapterEventConditionCommand5C
        .word <>rsChapterEventConditionCommand5D
        .word <>rsChapterEventConditionCommand5E
        .word <>rsChapterEventConditionCommand5F
        .word <>rsChapterEventConditionCommand60
        .word <>rsChapterEventConditionCommand61
        .word <>rsChapterEventConditionCommand62
        .word <>rsChapterEventConditionCommand63
        .word <>rsChapterEventConditionCommand64
        .word <>rsChapterEventConditionCommand65
        .word <>rsChapterEventConditionCommand66
        .word <>rsChapterEventConditionCommand67
        .word <>rsChapterEventConditionCommand68
        .word <>rsChapterEventConditionCommand69
        .word <>rsChapterEventConditionCommand6A
        .word <>rsChapterEventConditionCommand6B
        .word <>rsChapterEventConditionCommand6C
        .word <>rsChapterEventConditionCommand6D
        .word <>rsChapterEventConditionCommand6E
        .word <>rsChapterEventConditionCommand6F
        .word <>rsChapterEventConditionCommand70
        .word <>rsChapterEventConditionCommand71
        .word <>rsChapterEventConditionCommand72
        .word <>rsChapterEventConditionCommand73
        .word <>rsChapterEventConditionCommand74
        .word <>rsChapterEventConditionCommand75
        .word <>rsChapterEventConditionCommand76
        .word <>rsChapterEventConditionCommand77
        .word <>rsChapterEventConditionCommand78

      rsChapterEventConditionCommand00 ; 86/84EC

        .al
        .autsiz
        .databank ?

        ; EC_NOP_00

        rts

        .databank 0

      rsUnknown8684ED ; 86/84ED

        .al
        .autsiz
        .databank ?

        bcs _AdjustScriptOffset

        sep #$20
        cmp bEventActionIdentifier,b
        rep #$20
        bne _SkipEvent

          ; Check if event always works
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _CheckEvent

            bit #$0080
            bne +

              jsl rlCheckEventFlagSet
              bcs _SkipEvent
              bra _CheckEvent

            +
            and #$007F
            jsl rlCheckEventFlagSet
            bcc _SkipEvent

          _CheckEvent
          jsr _RunEventCheck
          bcc _SkipEvent

          ; Requirements fulfilled

          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _RunEvent

            bit #$0080
            bne +

              jsl rlSetEventFlag
              bra _RunEvent

            +
            and #$007F
            jsl rlUnsetEventFlag
          
          _RunEvent
          jsr _AdjustScriptOffset

          lda $0000,b,y
          jsr rsRunEventConditionCommand
          jml rsUnknown868C37

        _SkipEvent
        jsr _AdjustScriptOffset

        lda $0000,b,y
        jsr rsTrySkipEventConditionCommand
        bra +
        
        _AdjustScriptOffset
        tya
        clc
        adc wEventCommandLength,b
        tay

        +
        rts

        _RunEventCheck
        jmp (lEventPointer)

      rsUnknown86855D ; 86/855D

        .al
        .autsiz
        .databank ?

        php
        ldx #3
        stx wEventCommandLength,b
        ldx #<>rsUnknown86856F
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown86856F ; 86/856F

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        jsr rsEventCheck1Parameter
        rts

        .databank 0

      rsUnknown868579 ; 86/8579

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsUnknown86858B
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown86858B ; 86/858B

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsEventCheck2Parameters
        rts

        .databank 0

      rsUnknown86859B ; 86/859B

        .al
        .autsiz
        .databank ?

        php
        ldx #7
        stx wEventCommandLength,b
        ldx #<>rsUnknown8685AD
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown8685AD ; 86/85AD

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b
        jsr rsEventCheck4Parameters
        rts

        .databank 0

      rsEventCheckUnitsFighting ; 86/85C3

        .al
        .autsiz
        .databank ?

        php
        ldx #9
        stx wEventCommandLength,b
        ldx #<>rsEventCheckUnitsFightingCallback
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsEventCheckUnitsFightingCallback ; 86/85D5

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b
        lda $0007,b,y
        sta wEventEngineParameter4,b
        jsr rsEventCheckUnitsFightingCallbackEffect
        rts

        .databank 0

      rsEventCheckUnitsFightingCallbackEffect ; 86/85F1

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1
          bne _CheckReverse

        +
        lda wEventEngineParameter2
        bmi +

          lda wEventEngineArgument2,b
          cmp wEventEngineParameter2
          bne _CheckReverse

        +
        lda wEventEngineParameter3
        bmi +

          lda wEventEngineArgument3,b
          cmp wEventEngineParameter3
          bne _CheckReverse

        +
        lda wEventEngineParameter4
        bmi +

          lda wEventEngineArgument4,b
          cmp wEventEngineParameter4
          bne _CheckReverse

        +
        sec
        rts

        _CheckReverse
        lda wEventEngineParameter3
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter3
          bne _CLC

        +
        lda wEventEngineParameter4
        bmi +

          lda wEventEngineArgument2,b
          cmp wEventEngineParameter4
          bne _CLC

        +
        lda wEventEngineParameter1
        bmi +

          lda wEventEngineArgument3,b
          cmp wEventEngineParameter1
          bne _CLC

        +
        lda wEventEngineParameter2
        bmi +

          lda wEventEngineArgument4,b
          cmp wEventEngineParameter2
          bne _CLC

        +
        sec
        rts

        _CLC
        clc
        rts

        .databank 0

      rsEventCheckInteraction ; 86/866F

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsEventCheckInteractionCallback
        stx lEventPointer,b
        plp

        jml rsUnknown8684ED

        .databank 0

      rsEventCheckInteractionCallback ; 86/8681

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsEventCheck2Parameters
        bcc +

          ; >>> Comment is for seizing castles <<<<
          ; This doesnt quite work. It expects wEventEngineArgument1 to have
          ; the seizing units CharacterID but it has the FactionSlot instead
          ; So it fails to grab the RAM pointer and writes 0 to wEventUnit1Pointer

          ldx wSelectedUnitDataRAMPointer,b
          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsEventCheckTalk ; 86/86A7

        .al
        .autsiz
        .databank ?

        php
        ldx #7
        stx wEventCommandLength,b
        ldx #<>rsEventCheckTalkCallback
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsEventCheckTalkCallback ; 86/86B9

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b
        jsr rsEventCheck3Parameters
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          lda wEventEngineArgument2,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit2Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsUnknown8686F2 ; 86/86F2

        .al
        .autsiz
        .databank ?

        php
        ldx #3
        stx wEventCommandLength,b
        ldx #<>rsUnknown868704
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown868704 ; 86/8704

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument1,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID1,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        jsr rsEventEngineCheckGen2CharacterIDParameter
        rts

        .databank 0

      rsUnknown868717 ; 86/8717

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsUnknown868729
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown868729 ; 86/8729

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument1,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID1,b

        lda wEventEngineArgument2,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID2,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsEventEngineCheck2Gen2CharacterIDParameters
        rts

        .databank 0

      rsUnknown86874B ; 86/874B

        .al
        .autsiz
        .databank ?

        php
        ldx #9
        stx wEventCommandLength,b
        ldx #<>rsUnknown86875D
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown86875D ; 86/875D

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument2,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID1,b

        lda wEventEngineArgument4,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID2,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b
        lda $0007,b,y
        sta wEventEngineParameter4,b
        jsr rsUnknown86890E
        rts

        .databank 0

      rsUnknown86878B ; 86/878B

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsUnknown86879D
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown86879D ; 86/879D

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument1,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID1,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsEventEngineCheckGen2CharacterIDParameterAdditional
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsUnknown8687CC ; 86/87CC

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsUnknown8687DE
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown8687DE ; 86/87DE

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument1,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID1,b

        lda wEventEngineArgument2,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID2,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsEventEngineCheck2Gen2CharacterIDParameters
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsUnknown868816 ; 86/8816

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsUnknown868828
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown868828 ; 86/8828

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument1,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID1,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsEventEngineCheckGen2CharacterIDParameterAdditional
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          lda wEventEngineArgument2,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit2Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsEventCheckChildTalk ; 86/8864

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsEventCheckChildTalkCallback
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsEventCheckChildTalkCallback ; 86/8876

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument1,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID1,b

        lda wEventEngineArgument2,b
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineGen2CharacterID2,b

        lda $0001,b,y
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineParameter1,b

        lda $0003,b,y
        jsr rsEventUnifyGen2CharacterIds
        sta wEventEngineParameter2,b

        jsr rsEventEngineCheck2Gen2CharacterIDParameters
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          lda wEventEngineArgument2,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit2Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsEventEngineCheckGen2CharacterIDParameter ; 86/88C1

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineGen2CharacterID1,b
          cmp wEventEngineParameter1,b
          bne ++

        +
        sec
        rts

        +
        clc
        rts

        .databank 0

      rsEventEngineCheckGen2CharacterIDParameterAdditional ; 86/88D2

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineGen2CharacterID1,b
          cmp wEventEngineParameter1,b
          bne _CLC

        +
        lda wEventEngineParameter2,b
        bmi +

          lda wEventEngineArgument2,b
          cmp wEventEngineParameter2,b
          bne _CLC

        +
        sec
        rts

        _CLC
        clc
        rts

        .databank 0

      rsEventEngineCheck2Gen2CharacterIDParameters ; 86/88F0

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineGen2CharacterID1,b
          cmp wEventEngineParameter1,b
          bne _CLC

        +
        lda wEventEngineParameter2,b
        bmi +

          lda wEventEngineGen2CharacterID2,b
          cmp wEventEngineParameter2,b
          bne _CLC

        +
        sec
        rts

        _CLC
        clc
        rts

        .databank 0

      rsUnknown86890E ; 86/890E

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1,b
          bne _8944

        +
        lda wEventEngineParameter2,b
        bmi +

          lda wEventEngineGen2CharacterID1,b
          cmp wEventEngineParameter2,b
          bne _8944

        +
        lda wEventEngineParameter3,b
        bmi +

          lda wEventEngineArgument3,b
          cmp wEventEngineParameter3,b
          bne _8944

        +
        lda wEventEngineParameter4,b
        bmi +

          lda wEventEngineGen2CharacterID2,b
          cmp wEventEngineParameter4,b
          bne _8944

        +
        sec
        rts

        _8944
        lda wEventEngineParameter3,b
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter3,b
          bne _CLC

        +
        lda wEventEngineParameter4,b
        bmi +

          lda wEventEngineGen2CharacterID1,b
          cmp wEventEngineParameter4,b
          bne _CLC

        +
        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineArgument3,b
          cmp wEventEngineParameter1,b
          bne _CLC

        +
        lda wEventEngineParameter2,b
        bmi +

          lda wEventEngineGen2CharacterID2,b
          cmp wEventEngineParameter2,b
          bne _CLC

        +
        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rsChapterEventConditionCommand01 ; 86/897C

        .al
        .autsiz
        .databank ?

        lda #$20
        jml rsUnknown86855D

        .databank 0

      rsChapterEventConditionCommand02 ; 86/8983

        .al
        .autsiz
        .databank ?

        ; CHECK_SEIZING_CASTLE

        ; wEventEngineArgument1 = new owner faction
        ; wEventEngineArgument2 = locationID

        lda #1
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand03 ; 86/898A

        .al
        .autsiz
        .databank ?

        ; CHECK_VILLAGE_DESTROYED

        ; wEventEngineArgument1 = destroyer faction slot
        ; wEventEngineArgument2 = location id

        lda #$02
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand04 ; 86/8991

        .al
        .autsiz
        .databank ?

        ; CHECK_TALK

        ; wEventEngineArgument1 = initiator CharacterID
        ; wEventEngineArgument1 = target CharacterID
        ; wEventEngineArgument3 = CostsMoneyFlag, only works if there is a structChapterTalkEventEntry with the flag set

        lda #$0A
        jml rsEventCheckTalk

        .databank 0

      rsChapterEventConditionCommand05 ; 86/8998

        .al
        .autsiz
        .databank ?

        ; CHECK_ENTERING_HOME_CASTLE

        ; wEventEngineArgument1 = CharacterID
        ; wEventEngineArgument2 = Home castle locationID

        lda #4
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand06 ; 86/899F

        .al
        .autsiz
        .databank ?

        lda #$05
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand07 ; 86/89A6

        .al
        .autsiz
        .databank ?

        lda #$06
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand08 ; 86/89AD

        .al
        .autsiz
        .databank ?

        lda #$07
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand09 ; 86/89B4

        .al
        .autsiz
        .databank ?

        lda #$08
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand0A ; 86/89BB

        .al
        .autsiz
        .databank ?

        ; VISIT_VILLAGE

        lda #$09
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand0B ; 86/89C2

        .al
        .autsiz
        .databank ?

        ; CHECK_UNIT_IN_AREA

        php
        lda #8
        sta wEventCommandLength,b
        lda #<>rsUnknown8689D7
        sta lEventPointer,b
        lda #$03
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown8689D7 ; 86/89D7

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b

        lda $0007,b,y
        bit #$0080
        bne +

          and #$007F
          bra ++
          
          +
          ora #$FF80

        +
        sta wEventEngineParameter4,b

        lda #$03
        jsl rlCheckEventParameters
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsChapterEventConditionCommand0C ; 86/8A1A

        .al
        .autsiz
        .databank ?

        php
        lda #7
        sta wEventCommandLength,b
        lda #<>rsUnknown868A2F
        sta lEventPointer,b
        lda #$03
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown868A2F ; 86/8A2F

        .al
        .autsiz
        .databank ?

        ; wEventEngineArgument1 = CharacterID
        ; wEventEngineArgument2 = XPosition
        ; wEventEngineArgument3 = YPosition
        ; wEventEngineArgument4 = Faction

        ldx wSelectedUnitDataRAMPointer,b

        lda $0006,b,y
        and #$00FF
        cmp #$00FF
        beq +

          cmp wEventEngineArgument4,b
          bne _CLC

        +
        lda $0001,b,y
        cmp #$FFFF
        beq +

          cmp wEventEngineArgument1,b
          bne _CLC

        +
        jsl rlFindCharactersDeploymentOffset

        stx wSelectedUnitDataRAMPointer,b
        ora #0
        bmi _CLC

          sta wR0
          lda $0003,b,y
          jsl rlFindCharactersDeploymentOffset
          stx wSelectedUnitDataRAMPointer,b
          ora #0
          bmi _CLC

            sta wR1
            tax
            lda aDeploymentTable._State,x
            bit #DeploymentStateAlive
            beq _CLC

              bit #DeploymentStateDefeated
              bne _CLC

                jsl rlGetUnitsDistance
                dec a
                sep #$20
                cmp $0005,b,y
                rep #$20
                bcs _CLC

                  sec
                  rts

        _CLC
        clc
        rts

        .databank 0

      rsChapterEventConditionCommand0D ; 86/8A8F

        .al
        .autsiz
        .databank ?

        ; CHECK_UNITS_FIGHTING

        lda #$14
        jml rsEventCheckUnitsFighting

        .databank 0

      rsChapterEventConditionCommand0E ; 86/8A96

        .al
        .autsiz
        .databank ?

        ; CHECK_UNITS_FIGHTING_1TO2RANGE

        php
        ldx #9
        stx wEventCommandLength,b
        ldx #<>rsEventCheckUnitsFighting1To2RangeCallback
        stx lEventPointer,b
        lda #$14
        plp
        jml rsUnknown8684ED

        .databank 0

      rsEventCheckUnitsFighting1To2RangeCallback ; 86/8AAB

        .al
        .autsiz
        .databank ?

        lda wBattleDistance
        cmp #3
        bcs +

          lda $0001,b,y
          sta wEventEngineParameter1,b
          lda $0003,b,y
          sta wEventEngineParameter2,b
          lda $0005,b,y
          sta wEventEngineParameter3,b
          lda $0007,b,y
          sta wEventEngineParameter4,b
          jsr rsEventCheckUnitsFightingCallbackEffect

          rts

        +
        clc
        rts

        .databank 0

      rsChapterEventConditionCommand0F ; 86/8AD2

        .al
        .autsiz
        .databank ?

        ; CHECK_UNIT_DIED

        ; wEventEngineArgument1 = CharacterID
        ; wEventEngineArgument2 = FactionSlot

        lda #$17
        jml rsUnknown868579

        .databank 0

      rsChapterEventConditionCommand1A ; 86/8AD9

        .al
        .autsiz
        .databank ?

        ; CHECK_UNIT_DIED_TO

        lda #$18
        jml rsUnknown868579

        .databank 0

      rsChapterEventConditionCommand10 ; 86/8AE0

        .al
        .autsiz
        .databank ?

        ; CHECK_FELL_IN_LOVE

        lda #$11
        jml rsUnknown868579

        .databank 0

      rsChapterEventConditionCommand11 ; 86/8AE7

        .al
        .autsiz
        .databank ?

        lda #$06
        php
        ldx #7
        stx wEventCommandLength,b
        ldx #<>rsUnknown868AFC
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown868AFC ; 86/8AFC

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b
        jsr rsUnknown868B76
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          stx wEventUnit1Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsChapterEventConditionCommand12 ; 86/8B28

        .al
        .autsiz
        .databank ?

        lda #$0A
        php
        ldx #7
        stx wEventCommandLength,b
        ldx #<>rsUnknown868B3D
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown868B3D ; 86/8B3D

        .al
        .autsiz
        .databank ?

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b
        jsr rsUnknown868B76
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          lda wEventEngineArgument2,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit2Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsUnknown868B76 ; 86/8B76

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1,b
          bne _CLC

        +
        lda wEventEngineParameter2,b
        bmi +

          lda wEventEngineArgument2,b
          cmp wEventEngineParameter2,b
          bne _CLC

        +
        lda wEventEngineParameter3,b
        bmi +

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          jsl rlGetSelectedUnitGender
          cmp wEventEngineParameter3,b
          bne _CLC

        +
        sec
        rts

        _CLC
        clc
        rts

        .databank 0

      rsChapterEventConditionCommand13 ; 86/8BA9

        .al
        .autsiz
        .databank ?

        lda #$04
        jml rsUnknown86878B

        .databank 0

      rsChapterEventConditionCommand14 ; 86/8BB0

        .al
        .autsiz
        .databank ?

        lda #$06
        jml rsUnknown86878B

        .databank 0

      rsChapterEventConditionCommand15 ; 86/8BB7

        .al
        .autsiz
        .databank ?

        lda #$0A
        jml rsUnknown868816

        .databank 0

      rsChapterEventConditionCommand16 ; 86/8BBE

        .al
        .autsiz
        .databank ?

        ; CHECK_CHILD_TALK

        lda #$0A
        jml rsEventCheckChildTalk

        .databank 0

      rsChapterEventConditionCommand17 ; 86/8BC5

        .al
        .autsiz
        .databank ?

        lda #$17
        jml rsUnknown8686F2

        .databank 0

      rsChapterEventConditionCommand1B ; 86/8BCC

        .al
        .autsiz
        .databank ?

        lda #$18
        jml rsUnknown868717

        .databank 0

      rsChapterEventConditionCommand18 ; 86/8BD3

        .al
        .autsiz
        .databank ?

        lda #$11
        jml rsUnknown868717

        .databank 0

      rsChapterEventConditionCommand19 ; 86/8BDA

        .al
        .autsiz
        .databank ?

        lda #$14
        jml rsUnknown86874B

        .databank 0

      rsChapterEventConditionCommand1C ; 86/8BE1

        .al
        .autsiz
        .databank ?

        ; RESCUE_CIVILIAN

        ; wEventEngineArgument1 = CharacterID
        ; wEventEngineArgument2 = FormationID + 1

        lda #$1A
        jml rsEventCheckInteraction

        .databank 0

      rsChapterEventConditionCommand1D ; 86/8BE8

        .al
        .autsiz
        .databank ?

        ; CHECK_PLAYER_UNCAPTURED_IF_SEIZING

        lda #$1B
        jml rsUnknown86855D

        .databank 0

      rsChapterEventConditionCommand1E ; 86/8BEF

        .al
        .autsiz
        .databank ?

        php
        lda #$1C
        ldx #7
        stx wEventCommandLength,b
        ldx #<>rsEventCheckWonInArenaCallback
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsEventCheckWonInArenaCallback ; 86/8C04

        .al
        .autsiz
        .databank ?

        ; Arg1 = player CharacterID
        ; Arg2 = LocationID
        ; Arg3 = target CharacterID

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        lda $0005,b,y
        sta wEventEngineParameter3,b
        jsr rsEventCheck3Parameters
        bcc +

          ldx wSelectedUnitDataRAMPointer,b

          lda wEventEngineArgument1,b
          jsl rlGetUnitRAMDataPointerByID
          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnit1Pointer,b

          stx wSelectedUnitDataRAMPointer,b
          sec

        +
        rts

        .databank 0

      rsChapterEventConditionCommand1F ; 86/8C30

        .al
        .autsiz
        .databank ?

        ; CHECK_SPECIAL_CRIT

        lda #$1D
        jml rsUnknown868579

        .databank 0

      rsUnknown868C37 ; 86/8C37

        .al
        .autsiz
        .databank ?

        -
        lda $0001,b,y
        cmp #$6666
        beq +
        
        -
        inc y
        bra --
        
        +
        lda $0000,b,y
        and #$00FF  
        cmp #$20
        bne -

        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand21 ; 86/8C51

        .al
        .autsiz
        .databank ?

        bcs _End

        lda $0000,b,y
        bit #$0080
        bne +

          and #$007F
          bra ++

          +
          ora #$FF80
        
        +
        sta wEventEngineParameter1,b

        lda $0001,b,y
        bit #$0080
        bne +

          and #$007F
          bra ++

          +
          ora #$FF80
        
        +
        sta wEventEngineParameter2,b

        lda $0002,b,y
        bit #$0080
        bne +

          and #$007F
          bra ++

          +
          ora #$FF80

        +
        sta wEventEngineParameter3,b

        lda $0003,b,y
        sta wEventEngineParameter4,b
        lda #$21
        jsl rlCheckEventParameters
        bcs _End

          jml rsEventFindTurnCheckBreak

        _End
        tya
        clc
        adc #5
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand22 ; 86/8CA6

        .al
        .autsiz
        .databank ?

        lda #$20
        jml rsUnknown868CBB

        .databank 0

      rsChapterEventConditionCommand23 ; 86/8CAD

        .al
        .autsiz
        .databank ?

        lda #$25
        jml rsUnknown868CBB

        .databank 0

      rsChapterEventConditionCommand24 ; 86/8CB4

        .al
        .autsiz
        .databank ?

        lda #$26
        jml rsUnknown868CBB

        .databank 0

      rsUnknown868CBB ; 86/8CBB

        .al
        .autsiz
        .databank ?

        bcs +

          sep #$20
          cmp bEventActionIdentifier,b
          rep #$20

            bne rsEventFindTurnCheckBreak
        
        +
        rts

        .databank 0

      rsEventFindTurnCheckBreak ; 86/8CC7

        .al
        .autsiz
        .databank ?

        -
        lda $0001,b,y
        cmp #$6666
        beq +

        -
        inc y
        bra --

        +
        lda $0000,b,y
        and #$00FF
        cmp #$25
        bne -

        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand26 ; 86/8CE1

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          sta lEventPointer,b
          lda $0001,b,y
          sta lEventPointer+1,b
          phk
          pea #<>(+)-1
          jml [lEventPointer]

        +
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand27 ; 86/8CFA

        .al
        .autsiz
        .databank ?

        ; SET_FLAG

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlSetEventFlag

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand28 ; 86/8D08

        .al
        .autsiz
        .databank ?

        ; UNSET_FLAG

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlUnsetEventFlag

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand29 ; 86/8D16

        .al
        .autsiz
        .databank ?

        ; CHECK_FLAG_SET

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlCheckEventFlagSet
          bcc rsChapterEventConditionCommand2F

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand2A ; 86/8D26

        .al
        .autsiz
        .databank ?

        ; CHECK_FLAG_UNSET

        bcs +

          lda $0000,b,y
          and #$00FF  
          jsl rlCheckEventFlagSet
          bcs rsChapterEventConditionCommand2F

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand2B ; 86/8D36

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          tay

          -
          rts

        +
        inc y
        inc y
        bra -

        .databank 0

      rsChapterEventConditionCommand2C ; 86/8D41

        .al
        .autsiz
        .databank ?

        ; CHECK_ALL_FLAGS_IN_LIST_SET

        bcs _Skip

          -
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _End

            jsl rlCheckEventFlagSet
            bcc rsChapterEventConditionCommand2F

              inc y
              bra -

          _End
          inc y
          rts

          _Skip
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq +

            inc y
            bra _Skip

        +
        bra _End

        .databank 0

      rsChapterEventConditionCommand2D ; 86/8D69

        .al
        .autsiz
        .databank ?

        ; CHECK_FLAG_IN_LIST_SET

        bcs _Skip
        
          -
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq +

            jsl rlCheckEventFlagSet
            bcs _Skip

              inc y
              bra -

          +
          bra rsChapterEventConditionCommand2F

          _End
          inc y
          rts

        _Skip
        lda $0000,b,y
        and #$00FF
        cmp #$00FF
        beq +

          inc y
          bra _Skip

        +
        bra _End

      rsChapterEventConditionCommand2F ; 86/8D93

        .al
        .autsiz
        .databank ?

        -
        lda $0001,b,y
        cmp #$6666
        beq +

        -
        inc y
        bra --

        +
        lda $0000,b,y
        and #$00FF
        cmp #$2E
        beq +

        cmp #$2F
        bne -

        +
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand20 ; 86/8DB2

        .al
        .autsiz
        .databank ?

        ; $20, $25 and $2E

        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand30 ; 86/8DB5

        .al
        .autsiz
        .databank ?

        bcs _End

          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq +

            jsl rlCheckEventFlagSet
            bcs _End

          +
          lda $0001,b,y
          jsl rlUnknown80C1CB
          bcs +

            lda $0000,b,y
            and #$00FF
            jsl rlSetEventFlag
            bra _End

          +
          nop

        _End
        tya
        clc
        adc #3
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand31 ; 86/8DE5

        .al
        .autsiz
        .databank ?

        ; SET_BATTLE_OR_DEATH_QUOTE

        bcs _End

        ldx wSelectedUnitDataRAMPointer,b

        ; If death quote flag set, always change the quote, 
        ; for battle quote check if they can talk
        lda $0004,b,y
        and #$00FF
        bne +

          lda aActionStructUnit2.UnitRAMPointer
          beq _End

            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitStatus
            cmp #StatusSilence
            beq _CantTalk

              cmp #StatusSleep
              beq _CantTalk

        +
        lda $0000,b,y
        and #$00FF
        cmp #$00FF
        beq +

          jsl rlCheckEventFlagSet
          bcs _End

            lda $0000,b,y
            and #$00FF
            jsl rlSetEventFlag

        +
        lda $0001,b,y
        sta lR18
        lda $0001+1,b,y
        sta lR18+1
        lda $0004,b,y
        and #$00FF
        jsl rlSetBattleDeathQuotes

        _CantTalk
        stx wSelectedUnitDataRAMPointer,b
        
        _End
        tya
        clc
        adc #5
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand32 ; 86/8E42

        .al
        .autsiz
        .databank ?

        ; SET_PRECOMBAT_DIALOGUE

        bcs _End

          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq +

            jsl rlCheckEventFlagSet
            bcs _End

              lda $0000,b,y
              and #$00FF
              jsl rlSetEventFlag

          +
          phx
          phy
          lda wSelectedUnitDataRAMPointer,b
          pha

          lda $0001,b,y
          sta lR18
          lda $0001+1,b,y
          sta lR18+1
          lda $0004,b,y
          jsl rlUnknown91ADC7

          pla
          sta wSelectedUnitDataRAMPointer,b
          ply
          plx

        _End
        tya
        clc
        adc #6
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand33 ; 86/8E83

        .al
        .autsiz
        .databank ?

        bcs +

          jsl rlUnknown86832B

        +
        rts

        .databank 0

      rsChapterEventConditionCommand34 ; 86/8E8A

        .al
        .autsiz
        .databank ?

        ; REMOVE_CHAPTER_STRUCT

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlRemoveChapterRAMStruct
          inc y

        +
        rts

        .databank 0

      rsChapterEventConditionCommand35 ; 86/8E98

        .al
        .autsiz
        .databank ?

        bcs _Skip

          lda lChapterEventRAMDataEntryPointer,b
          pha
          lda lChapterEventRAMDataEntryPointer+1,b
          pha

          lda $0000+1,b,y
          sta lR18+1
          lda $0000,b,y
          sta lR18

          jsl rlBeginChapterEvents

          pla
          sta lChapterEventRAMDataEntryPointer+1,b
          pla
          sta lChapterEventRAMDataEntryPointer,b

        _Skip
        tya
        clc
        adc #3
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand36 ; 86/8EBF

        .al
        .autsiz
        .databank ?

        ; SET_PERMANENT_FLAG

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlSetPermanentEventFlag

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand37 ; 86/8ECD

        .al
        .autsiz
        .databank ?

        ; UNSET_PERMANENT_FLAG

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlUnsetPermanentEventFlag

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand38 ; 86/8EDB

        .al
        .autsiz
        .databank ?

        ; CHECK_PERMANENT_FLAG_SET

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlCheckPermanentEventFlagSet
          bcs +

            jml rsChapterEventConditionCommand2F

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand39 ; 86/8EEF

        .al
        .autsiz
        .databank ?

        ; CHECK_PERMANENT_FLAG_UNSET

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlCheckPermanentEventFlagSet
          bcc +

            jml rsChapterEventConditionCommand2F

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3A ; 86/8F03

        .al
        .autsiz
        .databank ?

        ; CHECK_ALL_PERMANENT_FLAGS_IN_LIST_SET

        bcs _Skip
        
          -
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _End

            jsl rlCheckPermanentEventFlagSet
            bcs +

              jml rsChapterEventConditionCommand2F

            +
            inc y
            bra -

          _End
          inc y
          rts

        _Skip
        lda $0000,b,y
        and #$00FF
        cmp #$00FF
        beq +

          inc y
          bra _Skip

        +
        bra _End

        .databank 0

      rsChapterEventConditionCommand3B ; 86/8F2F

        .al
        .autsiz
        .databank ?

        ; SET_CHAPTER_EVENT_COUNTER

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          lda $0001,b,y
          and #$00FF
          jsl rlSetChapterEventCounter

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3C ; 86/8F47

        .al
        .autsiz
        .databank ?

        ; ADD_CHAPTER_EVENT_COUNTER

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl rlGetChapterEventCounter

          sep #$20
          clc
          adc $0001,b,y
          rep #$20

          and #$00FF
          jsl rlSetChapterEventCounter

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3D ; 86/8F68

        .al
        .autsiz
        .databank ?

        ; INCREMENT_CHAPTER_EVENT_COUNTER

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl rlIncrementChapterEventCounter

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3E ; 86/8F79

        .al
        .autsiz
        .databank ?

        ; DECREMENT_CHAPTER_EVENT_COUNTER

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl rlDecrementChapterEventCounter

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3F ; 86/8F8A

        .al
        .autsiz
        .databank ?

        ; CHECK_CHAPTER_EVENT_COUNTER_EQUAL

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl rlGetChapterEventCounter

          sep #$20
          cmp $0001,b,y
          rep #$20
          beq +

            jml rsChapterEventConditionCommand2F

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand40 ; 86/8FA9

        .al
        .autsiz
        .databank ?

        ; CHECK_CHAPTER_EVENT_COUNTER_NOT_EQUAL

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl rlGetChapterEventCounter

          sep #$20
          cmp $0001,b,y
          rep #$20
          bne +

            jml rsChapterEventConditionCommand2F
        
        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand41 ; 86/8FC8

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsl $87A040
          bcs +

            jml rsChapterEventConditionCommand2F

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand42 ; 86/8FDA

        .al
        .autsiz
        .databank ?

        bcs +

          lda wR0
          pha
          lda wR1
          pha

          lda $0000,b,y
          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          jsl rlGetItemRAMStateAndOwner

          lda wR0
          cmp #ItemStateUnobtained
          beq +

            pla
            sta wR1
            pla
            sta wR0
            jml rsChapterEventConditionCommand2F

        +
        pla
        sta wR1
        pla
        sta wR0
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand43 ; 86/9007

        .al
        .autsiz
        .databank ?

        ; CHECK_NO_CASTLE_DESTROYED

        bcs _End
        
          lda wEventLocationEntry,b
          pha
          ldx #0

          _Loop
          txa
          jsl rlGetLocationEventDataEntry
          bcs +

            jsl rlGetEventLocationEntryType
            cmp #LocationTypeCastle
            bne _Next

              jsl rlCheckLocationDestroyed
              bcs _Destroyed

            _Next
            inc x
            bra _Loop

          +
          pla
          sta wEventLocationEntry,b

        _End
        rts

        _Destroyed
        pla
        sta wEventLocationEntry,b
        jml rsChapterEventConditionCommand2F

        .databank 0

      rsChapterEventConditionCommand44 ; 86/9036

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlCountUnitsInFactionSlotAlive
          cmp #0
          beq +

            jml rsChapterEventConditionCommand2F

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand45 ; 86/904D

        .al
        .autsiz
        .databank ?

        ; CHECK_UNITS_MARRIED

        lda wR0
        pha

        lda wSelectedUnitDataRAMPointer,b
        pha

        bcs _End

          lda $0000,b,y
          and #$00FF
          jsl rlGetUnitRAMDataPointerByID
          bcs +

            jsl rlGetSelectedUnitLoverGenerationID
            sta wR0
            cmp #0
            beq +

              lda $0001,b,y
              and #$00FF
              cmp #$00FF
              beq _End

                jsl rlGetUnitRAMDataPointerByID
                bcs +

                  jsl rlGetSelectedUnitGenerationID
                  cmp wR0
                  beq _End

          +
          pla
          sta wSelectedUnitDataRAMPointer,b
          pla
          sta wR0
          jml rsChapterEventConditionCommand2F

        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        pla
        sta wR0
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand46 ; 86/909B

        .al
        .autsiz
        .databank ?

        ; CHECK_UNIT_ALIVE

        lda wSelectedUnitDataRAMPointer,b
        pha

        bcs _End

          lda $0000,b,y
          jsl rlGetUnitRAMDataPointerByID
          bcs +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            beq _End

          +
          pla
          sta wSelectedUnitDataRAMPointer,b
          jml rsChapterEventConditionCommand2F

        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand47 ; 86/90C2

        .al
        .autsiz
        .databank ?

        ; CHECK_FATHERS_CHILD_ALIVE

        lda wSelectedUnitDataRAMPointer,b
        pha

        bcs _End

          stz wEventUnit1Pointer,b
          stz wEventUnit2Pointer,b

          lda $0000,b,y
          jsl $848DF4

          lda $7E2000
          beq _NoChildren

            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne +

              lda wSelectedUnitDataRAMPointer,b
              sta wEventUnit1Pointer,b

            +
            lda $7E2002
            beq _NoChildren

              sta wSelectedUnitDataRAMPointer,b
              jsl rlGetSelectedUnitStates
              bit #UnitStateDead
              bne +

                lda wSelectedUnitDataRAMPointer,b
                sta wEventUnit2Pointer,b

              +
              lda wEventUnit1Pointer,b
              ora wEventUnit2Pointer,b
              bne _End

          _NoChildren
          pla
          sta wSelectedUnitDataRAMPointer,b
          jml rsChapterEventConditionCommand2F

        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand48 ; 86/911C

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000+1,b,y
          sta lR18+1
          lda $0000,b,y
          sta lR18
          jsl rlSetChapterEventDataPointer

        +
        tya
        clc
        adc #3
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand49 ; 86/9133

        .al
        .autsiz
        .databank ?

        ; REGISTER_CHARACTER_MAP_SPRITE

        bcs +

          lda $0000,b,y
          jsl $848603

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand4A ; 86/913F

        .al
        .autsiz
        .databank ?

        ; REGISTER_UNITGROUP_MAP_SPRITES

        bcs +

          lda #(`aUNITGroupPointers)<<8
          sta lR18+1
          lda #<>aUNITGroupPointers
          sta lR18
          lda $0000,b,y
          and #$00FF
          inc a
          jsl rlGetUNITGroupPointer
          sta lR18
          jsl $8488EC ; rlLoadUNITGroupMapSprites

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand4B ; 86/915E

        .al
        .autsiz
        .databank ?

        ; LOAD_FACTION_GROUP

        bcs +

          lda $0001,b,y
          and #$00FF
          sta wRoutineVariable1,b
          lda $0000,b,y
          and #$00FF
          jsl rlLoadFactionGroup

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand4C ; 86/9176

        .al
        .autsiz
        .databank ?

        ; SET_FACTION_GROUP

        bcs +

          lda $0001,b,y
          and #$00FF
          sta wRoutineVariable1,b
          lda $0000,b,y
          and #$00FF
          jsl rlSetFactionSlotGroupID

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand4D ; 86/918E

        .al
        .autsiz
        .databank ?

        ; SET_FACTION_HOSTILITY

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wRoutineVariable1,b
          lda $0001,b,y
          jsl rlSetFactionHostility

        +
        tya
        clc
        adc #3
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand4E ; 86/91A7

        .al
        .autsiz
        .databank ?

        ; DEPLOY_UNIT_GROUP

        bcs +

          stz lR19
          stz lR19+1

          lda #(`aUNITGroupPointers)<<8
          sta lR18+1
          lda #<>aUNITGroupPointers
          sta lR18

          lda $0000,b,y
          and #$00FF
          sta $0D7D,b
          inc a
          jsl rlGetUNITGroupPointer
          sta lR18
          jsl $8487BA
        
        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand4F ; 86/91CD

        .al
        .autsiz
        .databank ?

        ; DEPLOY_UNIT_GROUP_CHILD

        bcs +

          phb
          phb
          pla
          sta lR19+1
          tya
          clc
          adc #1
          sta lR19

          lda #(`aUNITGroupPointers)<<8
          sta lR18+1
          lda #<>aUNITGroupPointers
          sta lR18

          lda $0000,b,y
          and #$00FF
          sta $0D7D,b
          inc a
          jsl rlGetUNITGroupPointer
          sta lR18
          jsl $8487BA

        +
        tya
        clc
        adc #6
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand50 ; 86/9200

        .al
        .autsiz
        .databank ?

        ; SET_UNIT_POSITION

        bcs _End

          phx
          lda $0003,b,y
          sta wRoutineVariable1,b

          ldx #FS_Player
          lda $0000,b,y
          jsl rlUnknown84C87A
          tax
          jsl rlDeployedUnitUnsetHiddenIfAlive

          lda $0002,b,y
          and #$00FF
          cmp #$00FF
          beq +

            jsl rlSetUnitResidingInCastle

          +
          plx

        _End
        tya
        clc
        adc #5
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand51 ; 86/922F

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0003,b,y
          sta wRoutineVariable1,b

          lda $0002,b,y
          and #$00FF
          tax
          lda $0000,b,y
          jsl rlUnknown84C87A
          tax
          jsl rlDeployedUnitUnsetHiddenIfAlive

          lda $0005,b,y
          and #$007F
          jsl rlSetSelectedUnitAI

          lda $0005,b,y
          bit #$0080
          beq +

            lda #UnitStateGroupLeader
            jsl rlSetSelectedUnitStates

        +
        tya
        clc
        adc #6
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand52 ; 86/926A

        .al
        .autsiz
        .databank ?

        lda #0
        sta wRoutineVariable1,b

        ldx #FS_Player
        lda $0000,b,y
        jsl rlUnknown84C87A
        tax
        jsl rlDeployedUnitUnsetHiddenIfAlive
        lda #0
        jsl rlSetUnitResidingInCastle
        jsl rlGetSelectedUnitLevel
        sta wRoutineVariable1,b
        lda $0002,b,y
        and #$00FF
        beq +

          sec
          sbc wRoutineVariable1,b
          beq +
          bcc +

            tax

            -
            lda #(`aDecompressionBuffer)<<8
            sta lRoutineVariable+1,b
            lda #<>aDecompressionBuffer
            sta lRoutineVariable,b
            jsl rlGetLevelUpStats
            dec x
            bne -

        +
        lda $0003,b,y
        and #$00FF
        cmp #$00FF
        beq +

          sta wRoutineVariable1,b
          jsl rlGivePlayerItemIDToSelectedUnit

        +
        lda $0004,b,y
        and #$00FF
        cmp #$00FF
        beq +

          sta wRoutineVariable1,b
          jsl rlGivePlayerItemIDToSelectedUnit

        +
        tya
        clc
        adc #5
        tay
        rts

        .databank 0

      rsEventLoadSpecifiedOrEventUnit1Pointer ; 86/92DC

        .al
        .autsiz
        .databank ?

        ; If the input in A has the highest bit set, load the pointer in
        ; wEventUnit1Pointer, else get the pointer by the CharacterID

        ; Input:
        ; A = CharacterID

        ; Output:
        ; filled wSelectedUnitDataRAMPointer
        ; CLC if successful, SEC if not

        bmi +
        
          jsl rlGetUnitRAMDataPointerByID
          bcs ++
          bra _CLC

        +
        lda wEventUnit1Pointer,b
        sta wSelectedUnitDataRAMPointer,b

        _CLC
        clc

        +
        rts

        .databank 0

      rsChapterEventConditionCommand53 ; 86/92EE

        .al
        .autsiz
        .databank ?

        bcs _End

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs _End

            jsl rlGetSelectedUnitStates
            bit #UnitStateFielded
            bne +

              lda $0002,b,y
              and #$00FF
              sta wRoutineVariable1
              jsl rlChangeFactionSlotOfSelectedUnit
              bra _End

            +
            jsl rlGetSelectedUnitDeploymentOffset
            tax
            lda $0002,b,y
            and #$00FF
            jsl rlChangeFactionSlotOfFieldedSelectedUnit

        _End
        tya
        clc
        adc #3
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand54 ; 86/9327

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs +

            lda $0002,b,y
            sta wRoutineVariable1,b
            jsl rlAddSelectedCharacterMoney

        +
        tya
        clc
        adc #4
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand55 ; 86/9342

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs +

            lda $0002,b,y
            sta wRoutineVariable1,b
            jsl rlSubtractSelectedCharacterMoney

        +
        tya
        clc
        adc #4
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand56 ; 86/935D

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsChapterEventConditionCommand57 ; 86/935E

        .al
        .autsiz
        .databank ?

        ; GIVE_UNIT_PID

        bcs +

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs +

            lda $0002,b,y
            and #$00FF
            sta wRoutineVariable1,b
            jsl rlGiveItemToUnitCheckEncumbered

            stz wUnknownDeploymentOffset000D7F,b
            lda #8
            sta $0D81,b
            lda wRoutineVariable1,b
            sta $0D83,b

        +
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand58 ; 86/9388

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs +

            lda $0002,b,y
            and #$00FF
            sta wRoutineVariable1,b
            jsl rlGiveItemToUnitCheckEncumbered

            jsl rlGetSelectedUnitInventorySize
            jsl rlFlagEquippedInventorySlotAndGetStatBonus
            stz wUnknownDeploymentOffset000D7F,b

            lda #8
            sta $0D81,b
            lda $0002,b,y
            and #$00FF
            sta $0D83,b

        +
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand59 ; 86/93BD

        .al
        .autsiz
        .databank ?

        bcs +
        
          lda $0000,b,y
          jsr rsEventUnifyGen2CharacterIds
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs +

            lda $0002,b,y
            and #$00FF
            sta wRoutineVariable1,b
            jsl rlGiveItemToUnitCheckEncumbered

            stz wUnknownDeploymentOffset000D7F,b
            lda #8
            sta $0D81,b
            lda wRoutineVariable1,b
            sta $0D83,b

        +
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand5A ; 86/93EA

        .al
        .autsiz
        .databank ?

        ; SEND_INVENTORY_TO_SUPPLY

        bcs +

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs +

            -
            lda #1
            sta wSelectedInventorySlot,b
            jsl rlDumpInventorySlotIntoSupplyIfFilled
            bcs +
            bra -

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand5B ; 86/9405

        .al
        .autsiz
        .databank ?

        ; GIVE_UNIT_PID_FORCED

        bcs _End

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs _End

            jsl rlGetSelectedUnitInventorySize
            cmp #7
            bcc +

              lda #7
              sta wSelectedInventorySlot,b
              jsl rlDumpInventorySlotIntoSupplyIfFilled
              bcs _End

            +
            lda $0002,b,y
            and #$00FF
            sta wRoutineVariable1,b
            jsl rlGiveItemToUnitCheckEncumbered

        _End
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand5C ; 86/9435

        .al
        .autsiz
        .databank ?

        bcs +

          jsl rlUpdateAllLocationEvents
          jsl rlUpdateMapChangeEvents

        +
        rts

        .databank 0

      rsChapterEventConditionCommand5D ; 86/9440

        .al
        .autsiz
        .databank ?

        bcs _End

          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq +

            jsl rlCheckEventFlagSet
            bcc _End

          +
          lda $0001,b,y
          sta wEventEngineParameter1,b
          lda $0003,b,y
          bit #$0080
          bne +

            and #$007F
            bra ++

            +
            ora #$FF80

          +
          sta wEventEngineParameter2,b
          lda $0004,b,y
          bit #$0080
          bne +

            and #$007F
            bra ++

            +
            ora #$FF80

          +
          sta wEventEngineParameter3,b
          lda #$0026
          jsl rlCheckEventParameters
          bcc _End

            lda $0005,b,y
            jsl rlUnknown80C1CB

        _End
        tya
        clc
        adc #7
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand5E ; 86/9496

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          sta lR18
          lda $0000+1,b,y
          sta lR18+1
          jsl $84B613

        +
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand5F ; 86/94AA

        .al
        .autsiz
        .databank ?

        ; SET_SCRIPTED_ACTION

        bcs _End

          lda $0000,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs _End

            jsl rlGetSelectedUnitDeploymentOffset
            sta $0871,b

            lda $0002,b,y
            and #$00FF
            asl a
            asl a
            asl a
            asl a
            sta $0875,b

            lda $0003,b,y
            and #$00FF
            asl a
            asl a
            asl a
            asl a
            sta $0877,b

            lda $0005,b,y
            cmp #$FFFF
            beq +

              jsl rlGetUnitRAMDataPointerByID
              bcs _End

                jsl rlGetSelectedUnitDeploymentOffset

            +
            sta $0873,b

            lda $0004,b,y
            and #$00FF
            sta $0879,b
            cmp #11
            bne +

              phb
              phb
              pla
              sta lAITemp000E90+1,b
              lda $0007,b,y
              sta lAITemp000E90,b
              inc y
              inc y

            +
            lda #$FFFF
            sta $086F,b

            lda #1
            tsb bUnknown000E7B,b

        _End
        tya
        clc
        adc #7
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand60 ; 86/9519

        .al
        .autsiz
        .databank ?

        ; MODIFY_LOVE_POINTS

        bcs _End

          lda $0002,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs _End

            jsl rlGetSelectedUnitGenerationID
            tax

            lda $0000,b,y
            jsl rlGetUnitRAMDataPointerByID
            bcs _End

              jsl rlGetSelectedUnitLoverGenerationID
              ora #0
              bne _End

                lda $0004,b,y
                bit #$0080
                bne +

                  and #$007F
                  bra ++

                  +
                  ora #$FF80

                +
                sta wRoutineVariable1,b
                txa
                jsl rlModifyUnitsLovePoints

        _End
        tya
        clc
        adc #5
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand61 ; 86/9559

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsl rlGetUnitRAMDataPointerByID
          bcs +

            jsl rlGetSelectedUnitDeploymentOffset
            tax
            lda $0002,b,y
            and #$00FF
            jsl rlSetUnitResidingInCastle

        +
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand62 ; 86/9577

        .al
        .autsiz
        .databank ?

        ; SET_LOCATION_TAKEOVER

        bcs _End

          lda $0001,b,y
          and #$00FF
          jsl rlGetLocationEventDataEntry
          bcs _End

            jsl rlGetEventLocationEntryID
            sta wEventEngineParameter2

            jsl rlGetLocationFactionSlotOwner
            sta wEventEngineParameter1
            jsl rlGetFactionSlotLocationID
            cmp wEventEngineParameter2
            bne +

              lda wEventEngineParameter1
              jsl rlUnloadFactionSlot

            +
            lda $0000,b,y
            and #$00FF
            jsl rlSetLocationFactionSlotOwner
            jsl rlUnsetCastleGuarded
            jsl rlHandleEventLocationModification
            phy
            jsl $888410
            ply

        _End
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand63 ; 86/95C2

        .al
        .autsiz
        .databank ?

        ; DELETE_FACTIONS_AI

        bcs +

          lda $0001,b,y
          and #$00FF
          sta wRoutineVariable1,b
          lda $0000,b,y
          and #$00FF
          jsl rlDeleteFactionsUnitsOfAISetting

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand64 ; 86/95DA

        .al
        .autsiz
        .databank ?

        ; REVIVE_FACTIONS_AI

        bcs +
        
          lda $0001,b,y
          and #$00FF
          sta wRoutineVariable1,b
          lda $0000,b,y
          and #$00FF
          jsl rlReviveFactionsUnitsOfAISetting

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand65 ; 86/95F2

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsl rlGetUnitRAMDataPointerByID
          bcs +

            jsl rlUndeployUnit
            jsl rlDeleteUnit

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand66 ; 86/9608

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsl rlGetUnitRAMDataPointerByID
          bcs +

            jsl rlUndeployUnit

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand67 ; 86/961A

        .al
        .autsiz
        .databank ?

        bcs _End

          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq +

            jsl rlFindCharacterByGenerationID
            bcs _End

              lda wSelectedUnitDataRAMPointer,b
              sta wEventUnit1Pointer,b

          +
          inc y
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _End

            jsl rlFindCharacterByGenerationID
            bcs _End

              lda wSelectedUnitDataRAMPointer,b
              sta wEventUnit2Pointer,b
        
        _End
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand68 ; 86/964D

        .al
        .autsiz
        .databank ?

        ; SET_TALK_TARGET

        bcs _End

          lda wSelectedUnitDataRAMPointer,b
          pha

          lda $0000,b,y
          and #$00FF
          jsl rlGetUnitRAMDataPointerByID
          bcs +

            lda $0001,b,y
            and #$00FF
            jsl rlSetSelectedUnitTalkTarget

          +
          pla
          sta wSelectedUnitDataRAMPointer,b

        _End
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand69 ; 86/9670

        .al
        .autsiz
        .databank ?

        ; SET_TALK_TARGET_IF_UNMARRIED

        bcs _End

          lda wSelectedUnitDataRAMPointer,b
          pha

          lda $0000,b,y
          and #$00FF
          sta wR0
          lda $0002,b,y
          and #$00FF
          sta wR1
          jsr rsEventGetExistingUnitRAMPointer
          bcs +

            jsl rlGetSelectedUnitLoverGenerationID
            ora #0
            bne +

              ldx wSelectedUnitDataRAMPointer,b
              lda $0001,b,y
              and #$00FF
              sta wR0
              lda $0003,b,y
              and #$00FF
              sta wR1
              jsr rsEventGetExistingUnitRAMPointer
              bcs +

                jsl rlGetSelectedUnitLoverGenerationID
                ora #0
                bne +

                  jsl rlGetSelectedUnitCharacterID
                  stx wSelectedUnitDataRAMPointer,b
                  jsl rlSetSelectedUnitTalkTarget

          +
          pla
          sta wSelectedUnitDataRAMPointer,b

        _End
        tya
        clc
        adc #4
        tay
        rts

        .databank 0

      rsEventGetExistingUnitRAMPointer ; 86/96CB

        .al
        .autsiz
        .databank ?

        ; If first character exists, return their pointer.
        ; If not, check 2nd character.
        ; If neither exist, exit with SEC.

        ; Input:
        ; wR0 = CharacterID 1
        ; wR1 = CharacterID 2 or $FF if ignored

        ; Output:
        ; filled wSelectedUnitDataRAMPointer if successful
        ; CLC if either unit exists
        ; SEC if none of them exist

        lda wR0
        jsl rlGetUnitRAMDataPointerByID
        bcc +

          lda wR1
          cmp #$00FF
          beq _SEC

            jsl rlGetUnitRAMDataPointerByID
            bcs _SEC

        +
        rts

        _SEC
        sec
        rts

        .databank 0

      rsChapterEventConditionCommand6A ; 86/96E3

        .al
        .autsiz
        .databank ?

        ; SET_CHILD_TALK_TARGET

        bcs _End

          lda $0000,b,y
          and #$00FF
          sta wR0
          lda $0002,b,y
          and #$00FF
          sta wR1
          jsr rsEventGetExistingUnitRAMPointer
          bcs _End

            ldx wSelectedUnitDataRAMPointer,b
            lda $0001,b,y
            and #$00FF
            jsl rlGetUnitRAMDataPointerByID
            bcc _TalkToFirst

              lda $0003,b,y
              and #$00FF
              cmp #$00FF
              beq _End

                jsl rlGetUnitRAMDataPointerByID
                bcs _End
                bra _TalkToSecond

            _TalkToFirst
            stx wSelectedUnitDataRAMPointer,b
            lda $0001,b,y
            and #$00FF
            jsl rlSetSelectedUnitTalkTarget
            bra _End

            _TalkToSecond
            stx wSelectedUnitDataRAMPointer,b
            lda $0003,b,y
            and #$00FF
            jsl rlSetSelectedUnitTalkTarget

        _End
        tya
        clc
        adc #4
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand6B ; 86/973F

        .al
        .autsiz
        .databank ?

        ; SET_TALK_TARGET_IF_MARRIED

        bcs _End

          lda $0000,b,y
          and #$00FF
          jsl rlCheckEventFlagSet
          bcs _End

            lda $0001,b,y
            and #$00FF
            sta wR0
            lda $0002,b,y
            and #$00FF
            sta wR1
            jsl $848EA0
            bcs +

        _End
        tya
        clc
        adc #3
        tay
        rts

        +
        lda $0000,b,y
        and #$00FF
        jsl rlSetEventFlag
        inc y
        clc
        jml rsChapterEventConditionCommand68

        .databank 0

      rsChapterEventConditionCommand6C ; 86/977A

        .al
        .autsiz
        .databank ?

        bcs _End

          lda $0000,b,y
          and #$00FF
          jsl rlCheckEventFlagSet
          bcs _End

            lda $0001,b,y
            and #$00FF
            sta wR0
            lda $0002,b,y
            and #$00FF
            sta wR1
            jsl $848EA0
            bcs _97FB

            lda $0003,b,y
            and #$00FF
            cmp #$00FF
            beq +

              sta wR0
              lda $0002,b,y
              and #$00FF
              sta wR1
              jsl $848EA0
              bcs _97FB

            +
            lda $0001,b,y
            and #$00FF
            sta wR0
            lda $0004,b,y
            and #$00FF
            cmp #$00FF
            beq +

              sta wR1
              jsl $848EA0
              bcs _97FB

            +
            lda $0003,b,y
            and #$00FF
            cmp #$00FF
            beq _End

              sta wR0
              lda $0004,b,y
              and #$00FF
              cmp #$00FF
              beq _End

                sta wR1
                jsl $848EA0
                bcs _97FB

        _End
        tya
        clc
        adc #5
        tay
        rts

        _97FB
        lda $0000,b,y
        and #$00FF
        jsl rlSetEventFlag
        inc y
        clc
        jml rsChapterEventConditionCommand6A

        .databank 0

      rsChapterEventConditionCommand6D ; 86/980B

        .al
        .autsiz
        .databank ?

        ; ADD_CASTLE_MONEY

        bcs +

          lda #0
          jsl rlAddCastleMoneyToAllUnitsInFaction

        +
        rts

        .databank 0

      rsChapterEventConditionCommand6E ; 86/9815

        .al
        .autsiz
        .databank ?

        ; CLOSE_VILLAGE

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlGetLocationEventDataEntry
          jsl rlGetEventLocationEntryType
          cmp #LocationTypeVillage
          bne +

            jsl rlSetVillageClosed

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand6F ; 86/9830

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl rlGetLocationEventDataEntry
          jsl rlGetEventLocationEntryType
          cmp #LocationTypeVillage
          bne +

            jsl rlSetVillageOpen
            lda #10
            jsl $80900D

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand70 ; 86/9852

        .al
        .autsiz
        .databank ?

        ; ADD_UNIT_STAT

        bcs _End

          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq +

            jsl rlGetUnitRAMDataPointerByID
            bcs _End
            bra ++

            +
            lda wEventUnit1Pointer,b
            sta wSelectedUnitDataRAMPointer,b

          +
          lda $0001,b,y
          and #$00FF
          sta wRoutineVariable1,b
          asl a
          tax
          lda $0002,b,y
          and #$00FF
          jsl rlAddSelectedUnitStat
          sta aActionStructUnit1.LevelUpData.HPGain,x 

        _End
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand71 ; 86/988A

        .al
        .autsiz
        .databank ?

        ; REMOVE_AREA_RESTRICTION

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl $81B43F

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand72 ; 86/9898

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          jsl $81B461

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand73 ; 86/98A6

        .al
        .autsiz
        .databank ?

        bcs +

          jsl rlUnknown84DE36

        +
        rts

        .databank 0

      rsChapterEventConditionCommand74 ; 86/98AD

        .al
        .autsiz
        .databank ?

        ; COMBATANTS_STAY_ON_MAP

        bcs +

          lda aActionStructUnit1.TriggerableSkills
          ora #CombatSkillFlagStayOnMap
          sta aActionStructUnit1.TriggerableSkills

          lda aActionStructUnit2.TriggerableSkills
          ora #CombatSkillFlagStayOnMap
          sta aActionStructUnit2.TriggerableSkills

        +
        rts

        .databank 0

      rsChapterEventConditionCommand75 ; 86/98C6

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          jsl rlGetUnitRAMDataPointerByID
          bcs +

            lda $0002,b,y
            and #$00FF
            jsl rlSetSelectedUnitStatus
            lda $0003,b,y
            and #$00FF
            jsl rlSetSelectedUnitStatusDuration

        +
        tya
        clc
        adc #4
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand76 ; 86/98EC

        .al
        .autsiz
        .databank ?

        ; REPLACE_UNIT

        bcs _End

          lda $0000,b,y
          jsl rlGetUnitRAMDataPointerByID
          bcs _End

            jsl rlGetSelectedUnitFactionSlot
            sta wR0

            lda wSelectedUnitDataRAMPointer,b
            pha

            ldx wSelectedUnitDataRAMPointer,b
            lda $7E0001+1,x
            sta lR19+1
            lda $7E0001,x
            sta lR19
            lda $0002,b,y
            jsl rlLoadUnit

            ldx wSelectedUnitDataRAMPointer,b
            lda $7E0001+1,x
            sta lR20+1
            lda $7E0001,x
            sta lR20

            lda lR19+1
            sta $7E0001+1,x
            lda lR19
            sta $7E0001,x
            jsl rlGetSelectedUnitDeploymentOffset
            tax
            lda wSelectedUnitDataRAMPointer,b
            sta aDeploymentTable._UnitRAMPointer,x
            lda #Factionless
            jsl rlSetSelectedUnitFaction

            lda wR0
            jsl rlAssignUnitToFactionSlot

            plx
            stx wSelectedUnitDataRAMPointer,b

            lda lR20+1
            sta $7E0001+1,x
            lda lR20
            sta $7E0001,x
            lda wR0
            jsl rlSetSelectedUnitFaction
            jsl rlUndeployUnit
            jsl rlDeleteUnit
        
        _End
        tya
        clc
        adc #4
        tay
        rts

        .databank 0

      rsChapterEventConditionCommand77 ; 86/9970

        .al
        .autsiz
        .databank ?

        ; CLEAR_TALK_IF_ONE_MARRIED

        bcs _Skip

          lda wSelectedUnitDataRAMPointer,b
          pha

          phb
          phy
          lda $0000,b,y
          tax

          sep #$20
          lda $0000+2,b,y
          pha
          rep #$20
          plb

            _Loop
            lda $0000,b,x
            bmi _End

            lda $0001,b,x
            and #$00FF
            jsl rlGetUnitRAMDataPointerByID
            bcs _Next

              jsl rlGetSelectedUnitLoverGenerationID
              ora #0
              bne +

                ldy wSelectedUnitDataRAMPointer,b
                lda $0000,b,x
                and #$00FF
                jsl rlGetUnitRAMDataPointerByID
                bcs _Next

                  jsl rlGetSelectedUnitLoverGenerationID
                  ora #0
                  beq _Next

              sty wSelectedUnitDataRAMPointer,b

              +
              lda #0
              jsl rlSetSelectedUnitTalkTarget

            _Next
            inc x
            inc x
            bra _Loop

          _End
          ply
          plb
          pla
          sta wSelectedUnitDataRAMPointer,b
        
        _Skip
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand78 ; 86/99CF

        .al
        .autsiz
        .databank ?

        ; SAVE_CHAPTER_TURNCOUNT

        bcs +

          jsl $81B2AA

        +
        rts

        .databank 0

      rlSetEventFlag ; 86/99D6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        cmp #80
        bcs +

          pha

          ; This grabs the byte to modify

          lsr a
          lsr a
          lsr a
          clc
          adc lChapterEventRAMDataEntryPointer,b
          tay

          sep #$20
          lda lChapterEventRAMDataEntryPointer+2,b
          pha
          rep #$20
          plb

          ; The bit to modify grabs the corresponding mask

          pla
          and #$0007
          tax
          sep #$20
          lda structChapterEventRAMEntry.TemporaryEventFlags,b,y
          ora aSetEventFlagMask,x
          sta structChapterEventRAMEntry.TemporaryEventFlags,b,y
          rep #$20

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aSetEventFlagMask ; 86/9A0B

        .byte $01
        .byte $02
        .byte $04
        .byte $08
        .byte $10
        .byte $20
        .byte $40
        .byte $80

      rlUnsetEventFlag ; 86/9A13

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        cmp #80
        bcs +

          pha

          lsr a
          lsr a
          lsr a
          clc
          adc lChapterEventRAMDataEntryPointer,b
          tay

          sep #$20
          lda lChapterEventRAMDataEntryPointer+2,b
          pha
          rep #$20
          plb

          pla
          and #$0007
          tax
          sep #$20
          lda structChapterEventRAMEntry.TemporaryEventFlags,b,y
          and aUnsetEventFlagMask,x
          sta structChapterEventRAMEntry.TemporaryEventFlags,b,y
          rep #$20

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aUnsetEventFlagMask ; 86/9A48

        .byte ~$01
        .byte ~$02
        .byte ~$04
        .byte ~$08
        .byte ~$10
        .byte ~$20
        .byte ~$40
        .byte ~$80

      rlCheckEventFlagSet ; 86/9A50

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        cmp #80
        bcs +

          pha

          lsr a
          lsr a
          lsr a
          clc
          adc lChapterEventRAMDataEntryPointer,b
          tay

          sep #$20
          lda lChapterEventRAMDataEntryPointer+2,b
          pha
          rep #$20
          plb

          pla
          and #$0007
          tax
          lda structChapterEventRAMEntry.TemporaryEventFlags,b,y
          and #$00FF
          and aCheckEventFlagSetMask,x
          bne ++

        +
        ply
        plx
        plp
        plb
        clc
        rtl

        +
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      aCheckEventFlagSetMask ; 86/9A8A

        .byte $01
        .byte $02
        .byte $04
        .byte $08
        .byte $10
        .byte $20
        .byte $40
        .byte $80

      rlGetChapterEventCounter ; 86/9A92

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wEventEngineParameter1 = 0 or 1

        ; Output:
        ; A = value

        phb
        php
        phk
        plb
        phy
        lda wEventEngineParameter1,b
        cmp #2
        bcs _End

          ldy lChapterEventRAMDataEntryPointer,b
          sep #$20
          lda lChapterEventRAMDataEntryPointer+2,b
          pha
          rep #$20
          plb

          tya
          clc
          adc wEventEngineParameter1
          tay
          lda structChapterEventRAMEntry.Counter1,b,y
          and #$00FF

        _End
        ply
        plp
        plb
        rtl

        .databank 0

      rlSetChapterEventCounter ; 86/9ABC

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = value to set
        ; wEventEngineParameter1 = 0 or 1

        phb
        php
        phk
        plb
        phy
        pha
        lda wEventEngineParameter1,b
        cmp #2
        bcs _End

          ldy lChapterEventRAMDataEntryPointer,b
          sep #$20
          lda lChapterEventRAMDataEntryPointer+2,b
          pha
          rep #$20
          plb

          tya
          clc
          adc wEventEngineParameter1
          tay
          pla
          sep #$20
          sta structChapterEventRAMEntry.Counter1,b,y
          rep #$20

        _End
        ply
        plp
        plb
        rtl

        .databank 0

      rlIncrementChapterEventCounter ; 86/9AE9

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wEventEngineParameter1 = 0 or 1

        ; Output:
        ; A = value

        phb
        php
        phk
        plb
        phy
        lda wEventEngineParameter1,b
        cmp #2
        bcs _End

          ldy lChapterEventRAMDataEntryPointer,b
          sep #$20
          lda lChapterEventRAMDataEntryPointer+2,b
          pha
          rep #$20
          plb

          tya
          clc
          adc wEventEngineParameter1
          tay
          sep #$20
          lda structChapterEventRAMEntry.Counter1,b,y
          inc a
          sta structChapterEventRAMEntry.Counter1,b,y
          rep #$20
          and #$00FF

        _End
        ply
        plp
        plb
        rtl

        .databank 0

      rlDecrementChapterEventCounter ; 86/9B1B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wEventEngineParameter1 = 0 or 1

        ; Output:
        ; A = value

        phb
        php
        phk
        plb
        phy
        lda wEventEngineParameter1,b
        cmp #2
        bcs _End

          ldy lChapterEventRAMDataEntryPointer,b
          sep #$20
          lda lChapterEventRAMDataEntryPointer+2,b
          pha
          rep #$20
          plb

          tya
          clc
          adc wEventEngineParameter1
          tay
          sep #$20
          lda structChapterEventRAMEntry.Counter1,b,y
          dec a
          sta structChapterEventRAMEntry.Counter1,b,y
          rep #$20
          and #$00FF

        _End
        ply
        plp
        plb
        rtl

        .databank 0

      rlCheckEventParameters ; 86/9B4D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        sep #$20
        cmp bEventActionIdentifier,b
        bne _CLC

          rep #$20

          ora #0
          bmi _SEC

            asl a
            tax
            jsr (aEventCheckParametersByIdentifier,x)
            bcc _CLC

          _SEC
          plx
          plp
          plb
          sec
          rtl
        
        _CLC
        plx
        plp
        plb
        clc
        rtl

        .databank 0

      aEventCheckParametersByIdentifier ; 86/9B71

        .word <>rsEventTrue ; $00
        .word <>rsEventCheck2Parameters ; $01
        .word <>rsEventCheck2Parameters ; $02
        .word <>rsEventCheckUnitInArea ; $03
        .word <>rsEventTrue ; $04
        .word <>rsEventTrue ; $05
        .word <>rsEventCheck2Parameters ; $06
        .word <>rsEventCheck2Parameters ; $07
        .word <>rsEventCheck2Parameters ; $08
        .word <>rsEventCheck2Parameters ; $09
        .word <>rsEventCheck2Parameters ; $0A
        .word <>rsEventTrue ; $0B
        .word <>rsEventTrue ; $0C
        .word <>rsEventTrue ; $0D
        .word <>rsEventTrue ; $0E
        .word <>rsEventTrue ; $0F
        .word <>rsEventTrue ; $10
        .word <>rsEventTrue ; $11
        .word <>rsEventTrue ; $12
        .word <>rsEventTrue ; $13
        .word <>rsEventTrue ; $14
        .word <>rsEventTrue ; $15
        .word <>rsEventTrue ; $16
        .word <>rsEventTrue ; $17
        .word <>rsEventTrue ; $18
        .word <>rsEventTrue ; $19
        .word <>rsEventCheck2Parameters ; $1A
        .word <>rsEventCheck1Parameter ; $1B
        .word <>rsEventCheck2Parameters ; $1C
        .word <>rsEventCheck1Parameter ; $1D
        .word <>rsEventTrue ; $1E
        .word <>rsEventTrue ; $1F
        .word <>rsEventCheck1Parameter ; $20
        .word <>rsEventCheck4Parameters ; $21 - turn event stuff?
        .word <>rsEventTrue ; $22
        .word <>rsEventTrue ; $23
        .word <>rsEventTrue ; $24
        .word <>rsEventTrue ; $25
        .word <>rsEventCheck3Parameters ; $26
        .word <>rsEventTrue ; $27

      rsEventTrue ; 86/9BC1

        .al
        .autsiz
        .databank ?

        sec
        rts

        .databank 0

      rsEventCheck1Parameter ; 86/9BC3

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi _SEC

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1,b
          bne +

        _SEC
        sec
        rts

        +
        clc
        rts

        .databank 0

      rsEventCheck2Parameters ; 86/9BD4

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1,b
          bne _CLC

        +
        lda wEventEngineParameter2,b
        bmi _SEC

          lda wEventEngineArgument2,b
          cmp wEventEngineParameter2,b
          bne _CLC

        _SEC
        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rsEventCheck3Parameters ; 86/9BF2

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1,b
          bne _CLC
        
        +
        lda wEventEngineParameter2,b
        bmi +

          lda wEventEngineArgument2,b
          cmp wEventEngineParameter2,b
          bne _CLC
        
        +
        lda wEventEngineParameter3,b
        bmi +

          lda wEventEngineArgument3,b
          cmp wEventEngineParameter3,b
          bne _CLC
        
        +
        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rsEventCheck4Parameters ; 86/9C1D

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1,b
          bne _CLC
        
        +
        lda wEventEngineParameter2,b
        bmi +

          lda wEventEngineArgument2,b
          cmp wEventEngineParameter2,b
          bne _CLC
        
        +
        lda wEventEngineParameter3,b
        bmi +

          lda wEventEngineArgument3,b
          cmp wEventEngineParameter3,b
          bne _CLC
        
        +
        lda wEventEngineParameter4,b 
        bmi +

          lda wEventEngineArgument4,b
          cmp wEventEngineParameter4,b
          bne _CLC
        
        +
        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rsEventCheckUnitInArea ; 86/9C55

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter4,b
        bmi +

          lda wEventEngineArgument4,b
          cmp wEventEngineParameter4,b
          bne _CLC
        
        +
        lda wEventEngineParameter1,b
        bmi +

          lda wEventEngineArgument1,b
          cmp wEventEngineParameter1,b
          bne _CLC
        
        +
        sep #$20
        lda wEventEngineArgument2,b
        cmp wEventEngineParameter2,b
        bmi _CLC

          dec a
          cmp wEventEngineParameter3,b
          bpl _CLC

            lda wEventEngineArgument3,b
            cmp wEventEngineParameter2+1,b
            bmi _CLC

              dec a
              cmp wEventEngineParameter3+1,b
              bpl _CLC

        rep #$20
        sec
        rts
        
        _CLC
        rep #$20
        clc
        rts

        .databank 0

      rsEventUnifyGen2CharacterIds ; 86/9C95

        .al
        .autsiz
        .databank ?

        phy
        sec
        sbc #Seliph
        tax
        lda aEventsUnifiedGen2CharacterIds,x
        and #$00FF
        clc
        ply
        rts

        .databank 0

      aEventsUnifiedGen2CharacterIds ; 86/9CA5

        .byte Seliph ; Seliph
        .byte Shannan ; Shannan
        .byte Dalvin ; Dalvin
        .byte Asaello ; Asaello
        .byte Leif ; Leif
        .byte Iuchar ; Iuchar
        .byte Charlot ; Charlot
        .byte Hawk ; Hawk
        .byte Tristan ; Tristan
        .byte AdultFinn ; AdultFinn
        .byte Deimne ; Deimne
        .byte Hannibal ; Hannibal
        .byte Ares ; Ares
        .byte Amid ; Amid
        .byte Oifey ; Oifey
        .byte Daisy ; Daisy
        .byte Creidne ; Creidne
        .byte Muirne ; Muirne
        .byte Julia ; Julia
        .byte Altena ; Altena
        .byte Hermina ; Hermina
        .byte Linda ; Linda
        .byte Laylea ; Laylea
        .byte Jeanne ; Jeanne
        .byte Iucharba ; Iucharba
        .byte Dalvin ; Scathach
        .byte Asaello ; Febail
        .byte Charlot ; Coirpre
        .byte Hawk ; Ced
        .byte Tristan ; Diarmuid
        .byte Deimne ; Lester
        .byte Amid ; Arthur
        .byte Daisy ; Patty
        .byte Creidne ; Larcei
        .byte Muirne ; Lana
        .byte Hermina ; Fee
        .byte Linda ; Tine
        .byte Laylea ; Lene
        .byte Jeanne ; Nanna

      ; 86/9CCC

    .endsection Code868000Section


    .section Code86C4C4Section

      rlUnknown86C4C4 ; 86/C4C4

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = current chapter

        phx

        sta lR18
        asl a
        clc
        adc lR18
        tax
        lda aChapterEventPointers+1,x
        sta lR18+1
        lda aChapterEventPointers,x
        beq +

          sta lR18
          jsl rlBeginChapterEvents

          lda #0
          sta $7E52EE
          sta $7E52EE+1

        +
        plx
        rtl

        .databank 0

      rlUnknown86C4EB ; 86/C4EB

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        ldx #1

          _Loop
          txa
          jsl rlGetChapterEventRAMEntryPointerByID
          bcs _End

            phx
            ldy lChapterEventRAMDataEntryPointer,b

            sep #$20
            lda lChapterEventRAMDataEntryPointer+2,b
            pha
            rep #$20
            plb

            lda structChapterEventRAMEntry.Chapter,b,y
            asl a
            clc
            adc structChapterEventRAMEntry.Chapter,b,y
            tax

            lda aChapterEventPointers+1,x
            sta structChapterEventRAMEntry.EventPointer+1,b,y
            lda aChapterEventPointers,x
            sta structChapterEventRAMEntry.EventPointer,b,y
            plx
            inc x
            bra _Loop

        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetChapterEventDataPointerByID ; 86/C528

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = chapter ID

        phb
        php
        phk
        plb
        phx
        sta lR18

        asl a
        clc
        adc lR18
        tax

        lda aChapterEventDataPointers+1,x
        sta lR18+1
        lda aChapterEventDataPointers,x
        sta lR18
        jsl rlSetChapterEventDataPointer

        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown86C548 ; 86/C548

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda #0
        sta aChapterActiveMapChanges
        sta aChapterActiveMapChanges+2

        plp
        plb
        rtl

        .databank 0

      rlGetFactionGroupPointerByID ; 86/C55A

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = ID

        ; Output:
        ; Y = Pointer

        phx
        phk
        plb

        pha
        asl a
        clc
        adc #1,s
        tax
        pla

        sep #$20
        lda aFactionGroupPointers+2,x
        pha
        rep #$20
        plb

        lda aFactionGroupPointers,x
        tay

        plx
        rtl

        .databank 0

      rlUpdateMapChangeEvents ; 86/C575

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsl rlGetChapterMapChangesPointer

        lda lR18
        beq _End

          ldy lR18
          sep #$20
          lda lR18+2
          pha
          rep #$20
          plb

          ldx #0
          
          _Loop
          lda structChapterMapChangeEntry.ChapterID,b,y
          cmp #$FFFF
          beq _End

            pha
            lda structChapterMapChangeEntry.Flag,b,y
            and #$00FF
            sta wEventEngineParameter1,b
            pla

            jsl rlCheckIfEventFlagOfSpecifiedChapterSet
            bcc +

              txa
              jsr rsCheckIfChapterMapChanceActive
              bcs +

                txa
                jsr rsSetChapterMapChangeActive
                lda structChapterMapChangeEntry.XPosition,b,y
                and #$00FF
                sta wR0
                lda structChapterMapChangeEntry.YPosition,b,y
                and #$00FF
                sta wR1
                lda structChapterMapChangeEntry.MapChangeData,b,y
                jsl rlApplyMapTileChange

            +
            tya
            clc
            adc #size(structChapterMapChangeEntry)
            tay
            inc x
            bra _Loop

        _End
        jsl $888410
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsCheckIfChapterMapChanceActive ; 86/C5DC

        .al
        .autsiz
        .databank `aActiveMapChangesLookupTable

        ; Input:
        ; A = Map change ID

        phb
        phk
        plb
        phx
        phy
        pha
        lsr a
        lsr a
        lsr a
        tax
        pla
        and #$0007
        tay
        lda aChapterActiveMapChanges,x
        and #$00FF
        and aActiveMapChangesLookupTable,y
        bne +

        clc
        
        -
        ply
        plx
        plb
        rts
        
        +
        sec
        bra -

        .databank 0

      rsSetChapterMapChangeActive ; 86/C5FF

        .al
        .autsiz
        .databank `aActiveMapChangesLookupTable

        ; Input:
        ; A = Map change ID

        phb
        phk
        plb
        phx
        phy
        pha
        lsr a
        lsr a
        lsr a
        tax
        pla
        and #$0007
        tay
        sep #$20
        lda aChapterActiveMapChanges,x
        ora aActiveMapChangesLookupTable,y
        sta aChapterActiveMapChanges,x
        rep #$20
        ply
        plx
        plb
        rts

        .databank 0

      aActiveMapChangesLookupTable ; 86/C621

        .byte $01
        .byte $02
        .byte $04
        .byte $08
        .byte $10
        .byte $20
        .byte $40
        .byte $80

        ; 86/C629

    .endsection Code86C4C4Section

    .section Code91A40ESection

      rsUnknown91A40E ; 91/A40E

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        inc wUnknown00171C,b
        jsl rlUnknown91A7A8
        jsr rsGetEventLength
        jsl rlEventEngineFreeAllProcs
        jsl rlUnknown91C611
        jsl rlActiveSpriteEngineClearAllSprites

        lda $0302,b
        sta wUnknown001730,b

        stz wR26

        lda #0
        sta aMovingMapSprites.wState,b

        lda #8
        trb wUnknown00171A,b

        plp
        jml rlRunEventCommand

        .databank 0

      rsEventEngineClearProcs ; 91/A440

        .al
        .autsiz
        .databank ?

        php
        phx
        ldx #size(wEventProcBanks)-2
        
          -
          lda #$FFFF
          sta wEventProcBanks,b,x
          stz wEventProcOffsets,b,x
          dec x
          dec x
          bpl -

        plx
        plp
        rts

        .databank 0

      rlEventEngineCreateProc ; 91/A455

        .al
        .autsiz
        .databank ?

        php
        lda lR44
        pha
        lda lR44+1
        pha

        jsl rlProcEngineCreateProc
        tax

        pla
        sta lR44+1
        pla
        sta lR44

        lda lR44+1
        and #$FF00
        xba
        sta wEventProcBanks,b,x
        lda lR44
        sta wEventProcOffsets,b,x

        lda #$0004
        tsb wUnknown00171A,b

        plp
        rtl

        .databank 0

      rlEventEngineFreeProc ; 91/A47D

        .al
        .autsiz
        .databank ?

        php
        ldx aProcSystem.wOffset,b
        jsl rlProcEngineFreeProc
        plp
        rtl

        .databank 0

      rlEventEngineFreeAllProcs ; 91/A487

        .al
        .autsiz
        .databank ?

        php

        rep #$30
        ldx #size(wEventProcOffsets)-2

          -
          lda wEventProcBanks,b,x
          cmp #$FFFF
          beq +

            phx
            txa
            lsr a
            jsl rlProcEngineFreeProcByIndex
            plx

            lda #$FFFF
            sta wEventProcBanks,b,x
            stz wEventProcOffsets,b,x

          +
          dec x
          dec x
          bpl -

        plp
        rtl

        .databank 0

      rlUnknown91A4AC ; 91/A4AC

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        lda wEventProcBanks,b,x
        bit #$0200
        beq +

        bit #$0400
        beq ++

        plp
        sec
        rtl

        +
        ora #$0200
        sta wEventProcBanks,b,x

        +
        plp
        clc
        rtl

        .databank 0

      rsUnknown91A4C8 ; 91/A4C8

        .al
        .autsiz
        .databank ?

        lda #$0002
        tsb wUnknown00171A,b

        ldx #(16 - 1) *2
        
        _Loop
        lda wEventProcBanks,b,x
        cmp #$FFFF
        beq _Next

        lda wEventProcBanks,b,x
        bit #$0200
        bne _Next

        lda wEventProcOffsets,b,x
        cmp aProcSystem.aHeaderTypeOffset,b,x
        bne +

        lda wEventProcBanks,b,x
        and #$00FF
        cmp aProcSystem.aHeaderTypeBank,b,x
        beq ++

        +
        lda #$FFFF
        sta wEventProcBanks,b,x
        stz wEventProcOffsets,b,x

        _Next
        dec x
        dec x
        bpl _Loop

        rts

        +
        lda #$0002
        trb wUnknown00171A,b
        bra _Next

        .databank 0

      aEventCommandPointers ; 91/A50A

        .word <>rsEventCommand00
        .word <>rsEventCommand01
        .word <>rsEventCommand02
        .word <>rsEventCommand03
        .word <>rsEventCommand04
        .word <>rsEventCommand05
        .word <>rsEventCommand06
        .word <>rsEventCommand07
        .word <>rsEventCommand08
        .word <>rsEventCommand09
        .word <>rsEventCommand0A
        .word <>rsEventCommand0B
        .word <>rsEventCommand0C
        .word <>rsEventCommand0D
        .word <>rsEventCommand0E
        .word <>rsEventCommand0F
        .word <>rsEventCommand10
        .word <>rsEventCommand11
        .word <>rsEventCommand12
        .word <>rsEventCommand13
        .word <>rsEventCommand14
        .word <>rsEventCommand15
        .word <>rsEventCommand16
        .word <>rsEventCommand17
        .word $0000               ; $18
        .word <>rsEventCommand19
        .word <>rsEventCommand1A
        .word <>rsEventCommand1B
        .word <>rsEventCommand1C
        .word <>rsEventCommand1D
        .word $0000               ; $1E
        .word <>rsEventCommand1F
        .word <>rsEventCommand20
        .word <>rsEventCommand21
        .word <>rsEventCommand22
        .word <>rsEventCommand23
        .word <>rsEventCommand24
        .word <>rsEventCommand25
        .word <>rsEventCommand26
        .word <>rsEventCommand27
        .word <>rsEventCommand28
        .word <>rsEventCommand29
        .word <>rsEventCommand2A
        .word <>rsEventCommand2B
        .word <>rsEventCommand2C
        .word <>rsEventCommand2D
        .word <>rsEventCommand2E
        .word <>rsEventCommand2F
        .word <>rsEventCommand30
        .word <>rsEventCommand31
        .word <>rsEventCommand32
        .word <>rsEventCommand33
        .word <>rsEventCommand34
        .word <>rsEventCommand35
        .word <>rsEventCommand36
        .word <>rsEventCommand37
        .word <>rsEventCommand38
        .word <>rsEventCommand39
        .word <>rsEventCommand3A
        .word <>rsEventCommand3B
        .word <>rsEventCommand3C
        .word <>rsEventCommand3D
        .word <>rsEventCommand3E
        .word <>rsEventCommand3F
        .word <>rsEventCommand40
        .word <>rsEventCommand41
        .word <>rsEventCommand42
        .word <>rsEventCommand43
        .word <>rsEventCommand44
        .word <>rsEventCommand45
        .word <>rsEventCommand46
        .word <>rsEventCommand47
        .word <>rsEventCommand48
        .word <>rsEventCommand49
        .word <>rsEventCommand4A
        .word <>rsEventCommand4B
        .word <>rsEventCommand4C
        .word <>rsEventCommand4D
        .word <>rsEventCommand4E
        .word <>rsEventCommand4F
        .word <>rsEventCommand50
        .word <>rsEventCommand51
        .word <>rsEventCommand52
        .word <>rsEventCommand53
        .word <>rsEventCommand54
        .word <>rsEventCommand55
        .word <>rsEventCommand56
        .word <>rsEventCommand57
        .word <>rsEventCommand58
        .word <>rsEventCommand59
        .word <>rsEventCommand5A
        .word <>rsEventCommand5B
        .word <>rsEventCommand5C
        .word <>rsEventCommand5D
        .word <>rsEventCommand5E
        .word $0000               ; $5F

      rlRunEventCommand ; 91/A5CA

        .al
        .autsiz
        .databank `aEventCommandPointers

        phb
        php
        phk
        plb

        jsr rsUnknown91A629
        bcc _End

          lda lActiveEventPointer+1,b
          sta lR22+1
          lda lActiveEventPointer,b
          sta lR22

          ldy wActiveEventOffset,b
          bra _A5FC

            _Loop
            inc y
            sty wActiveEventOffset,b

            phy
            asl a
            tay

            lda aEventCommandPointers,y
            ply

            sta lR23
            pea #<>(+)-1
            jmp (lR23)

            +
            bcc _A5FC

              sty wActiveEventOffset,b
              bra _End

          _A5FC
          lda [lR22],y
          cmp #$FEFE
          bne +

            inc y
            inc y
            sty wActiveEventOffset,b
            lda [lR22],y

          +
          cmp #$FFFF
          bne +

            lda #2
            sta wUnknown00171C,b
            bra _End

          +
          and #$00FF
          cmp #$00FD
          bne _Loop

          inc y
          sty wActiveEventOffset,b

        _End
        stz wUnknown000921,b

        plp
        plb
        rtl

        .databank 0

      rsUnknown91A629 ; 91/A629

        .al
        .autsiz
        .databank ?

        lda wUnknown00171A,b
        bit #$0004
        beq _SEC

          jsr rsUnknown91A4C8

          lda #$0002
          bit wUnknown00171A,b
          beq _CLC

            ora #$0004
            trb wUnknown00171A,b

        _SEC
        sec
        bra +
        
        _CLC
        clc
        
        +
        rts

        .databank 0

      rsGetEventLength ; 91/A647

        .al
        .autsiz
        .databank ?

        php
        lda lActiveEventPointer,b
        sta lR22
        lda lActiveEventPointer+1,b
        sta lR22+1
        ldy #0

        -
        lda [lR22],y
        cmp #$FEFE
        beq ++

          cmp #$FFFF
          beq +

            inc y
            bra -

          +
          stz wActiveEventLength,b
          bra _End

        +
        inc y
        inc y
        sty wActiveEventLength,b

        _End
        plp
        rts

        .databank 0

    .endsection Code91A40ESection

    .section Code91BDD2Section

      rsEventCommand00 ; 91/BDD2

        .al
        .autsiz
        .databank ?

        ; EVENT_00

        phy
        lda [lR22],y
        and #$00FF
        pha

        lda #(`$8292A9)<<8
        sta lR44+1
        lda #<>$8292A9
        sta lR44

        jsl rlEventEngineCreateProc

        pla
        sta wR0

        pla
        clc
        adc wR0
        tay
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand02 ; 91/BDF4

        .al
        .autsiz
        .databank ?

        ; JUMP

        lda [lR22],y
        sec
        sbc lR22
        tay
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand03 ; 91/BDFF

        .al
        .autsiz
        .databank ?

        ; JUMP_TRUE

        lda wEventEngineTruthFlag,b
        bne +

          inc y
          inc y
          bra ++

        +
        lda [lR22],y
        sec
        sbc lR22
        tay

        +
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand04 ; 91/BE13

        .al
        .autsiz
        .databank ?

        ; JUMP_FALSE

        lda wEventEngineTruthFlag,b
        beq +

          inc y
          inc y
          bra ++

        +
        lda [lR22],y
        sec
        sbc lR22
        tay

        +
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand05 ; 91/BE27

        .al
        .autsiz
        .databank ?

        ; JUMP_RELATIVE_TRUE

        lda wEventEngineTruthFlag,b
        bne +

          inc y
          inc y
          bra ++

        +
        lda [lR22],y
        clc
        adc wActiveEventOffset,b
        tay

        +
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand06 ; 91/BE3C

        .al
        .autsiz
        .databank ?

        ; JUMP_RELATIVE_FALSE

        lda wEventEngineTruthFlag,b
        beq +

          inc y
          inc y
          bra ++

        +
        lda [lR22],y
        clc
        adc wActiveEventOffset,b
        tay

        +
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand07 ; 91/BE51

        .al
        .autsiz
        .databank ?

        ; TEST_PERMANENT_FLAG_SET

        phy
        lda [lR22],y
        and #$00FF
        jsl rlCheckPermanentEventFlagSet

        lda #0
        rol a
        sta wEventEngineTruthFlag,b

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand08 ; 91/BE69

        .al
        .autsiz
        .databank ?

        ; CHECK_FLAG_IN_CHAPTER_SET

        phy
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        tax

        lda wR0
        jsl rlGetSpecifiedChaptersRAMPointer
        bcs +

          txa
          jsl rlCheckEventFlagSet

          lda #0
          rol a
          sta wEventEngineTruthFlag,b

        +
        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand09 ; 91/BE94

        .al
        .autsiz
        .databank ?

        ; CHANGE_PALETTE_PROC

        phy

        lda #(`$8293AE)<<8
        sta lR44+1
        lda #<>$8293AE
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #6
        tay
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand0A ; 91/BEAE

        .al
        .autsiz
        .databank ?

        ; EVENT_0A

        phb
        php
        phk
        plb
        phx
        phy

        jsl $8780AA
        jsl $8780DF
        jsl rlResetDialogueEngine

        ply
        plx
        plp
        plb

        clc
        rts

        .databank 0

      aUnknown91BEC6 ; 91/BEC6

        .word $2000
        .word $4000
        .word $2B01
        .word $C00A
        .word $0B00
        .word $4880
        .word $7B01
        .word $C019

      rsEventCommand0B ; 91/BED6

        .al
        .autsiz
        .databank ?

        phy
        jsl $8780EC
        ply

        clc
        rts

        .databank 0

      rsEventCommand0C ; 91/BEDE

        .al
        .autsiz
        .databank ?

        ; DIALOGUE

        phy
        lda #0
        jsl rlDialogueUpdateSlotOffset

        lda #(`$82845F)<<8
        sta lR44+1
        lda #<>$82845F
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand0D ; 91/BEFD

        .al
        .autsiz
        .databank ?

        ; CASTLE_NAME

        phy
        lda #(`$8286B6)<<8
        sta lR44+1
        lda #<>$8286B6
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand0E ; 91/BF17

        .al
        .autsiz
        .databank ?

        phy
        lda [lR22],y
        and #$00FF
        sta $04BA,b

        lda #(`procUnknown828AF2)<<8
        sta lR44+1
        lda #<>procUnknown828AF2
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        sty wActiveEventOffset,b

        sec
        rts

        .databank 0

      rsEventCommand0F ; 91/BF35

        .al
        .autsiz
        .databank ?

        phy
        lda [lR22],y
        and #$00FF
        jsl $808FAD

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand10 ; 91/BF46

        .al
        .autsiz
        .databank ?

        phy
        lda [lR22],y
        and #$00FF
        jsl $808FAD

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand11 ; 91/BF57

        .al
        .autsiz
        .databank ?

        ; PLAY_SFX_BYTE

        phy
        lda [lR22],y
        and #$00FF
        jsl $80900D

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand12 ; 91/BF68

        .al
        .autsiz
        .databank ?

        ; PLAY_SFX_WORD

        phy
        lda [lR22],y
        jsl $808FA3

        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand13 ; 91/BF77

        .al
        .autsiz
        .databank ?

        ; RESTORE_PHASE_MUSIC

        phy
        jsl $81AB26

        lda #(`procUnknown828AF2)<<8
        sta lR44+1
        lda #<>procUnknown828AF2
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand14 ; 91/BF90

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_WITH_BG

        php
        phy

        lda #0
        sta $08B8,b

        lda #(`$828906)<<8
        sta lR44+1
        lda #<>$828906
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #6
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand15 ; 91/BFB2

        .al
        .autsiz
        .databank ?

        ; EVENT_15

        php
        phy

        lda #1
        sta $08B8,b

        lda #(`$828906)<<8
        sta lR44+1
        lda #<>$828906
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #6
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand16 ; 91/BFD4

        .al
        .autsiz
        .databank ?

        php
        phy
        jsl $8CEDD0

        lda #(`$828A88)<<8
        sta lR44+1
        lda #<>$828A88
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand17 ; 91/BFF0

        .al
        .autsiz
        .databank ?

        ; BERSERK_CAST

        php
        phy

        lda #(`$828B61)<<8
        sta lR44+1
        lda #<>$828B61
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #2
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand19 ; 91/C00C

        .al
        .autsiz
        .databank ?

        ; EVENT_19

        phy
        jsl $91A931
        ply

        phy
        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1
        inc y
        inc y
        lda [lR22],y
        tax

        lda #(`aDecompressionBuffer)<<8
        sta lR19+1
        lda #<>aDecompressionBuffer
        sta lR19

        ; Routine does nothing
        jsl $9183A8

        pla
        clc
        adc #5
        tay
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand1A ; 91/C03A

        .al
        .autsiz
        .databank ?

        ; EVENT_1A

        phy
        jsl rlUnknown9183A9
        ply

        clc
        rts

        .databank 0

      rsEventCommand1B ; 91/C042

        .al
        .autsiz
        .databank ?

        ; EVENT_1B

        phy
        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        jsl rlUnknown9183CC

        ply
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand1C ; 91/C059

        .al
        .autsiz
        .databank ?

        ; CHANGE_DIALOGUE

        phy
        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        jsl rlUnknown9183D7

        ply
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand1D ; 91/C070

        .al
        .autsiz
        .databank ?

        ; EVENT_1D

        jsl rlEnableActiveSpriteEngine
        jsl rlUnknown91C611

        clc
        rts

        .databank 0

      rsEventCommand1F ; 91/C07A

        .al
        .autsiz
        .databank ?

        ; CREATE_HDMA

        phy
        lda [lR22],y
        sta lR44
        inc y
        lda [lR22],y
        sta lR44+1

        jsl rlHDMAEngineCreateEntry

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        clc
        rts

        .databank 0

      rsEventCommand20 ; 91/C093

        .al
        .autsiz
        .databank ?

        ; EVENT_20

        php
        phy
        jsl rlActiveSpriteEngineReset
        jsl rlEnableActiveSpriteEngine
        jsl rlActiveSpriteEngineRenderOnScreenOnly
        jsl rlUnknown818064

        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1
        inc y
        inc y

        lda [lR22],y
        sta wR1
        inc y
        inc y
        lda [lR22],y
        sta wR0

        jsl rlDMAByPointer

        pla
        clc
        adc #7
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand21 ; 91/C0CA

        .al
        .autsiz
        .databank ?

        ; CREATE_SPRITE

        php
        phy
        lda [lR22],y
        sta lR44
        inc y
        lda [lR22],y
        sta lR44+1

        inc y
        inc y
        lda [lR22],y
        tax

        inc y
        inc y
        lda [lR22],y
        tay

        jsl rlActiveSpriteEngineCreateSpriteHighestSlot

        pla
        clc
        adc #7
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rlUnknown91C0EF ; 91/C0EF

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        plp
        rtl

        .databank 0

      rsUnknown91C0F4 ; 91/C0F4

        .al
        .autsiz
        .databank ?

        lda #1
        sta aMovingMapSprites.wUnknown0017C2,b
        jml +

      rsUnknown91C0FE ; 91/C0FE

        .al
        .autsiz
        .databank ?

        lda #0
        sta aMovingMapSprites.wUnknown0017C2,b

        +
        phx
        stx aMovingMapSprites.wOffset,b
        stz aMovingMapSprites.wUnknown0017C0,b

        ldy #0
        lda [lR18],y
        sta wR0
        inc y
        inc y
        lda [lR18],y
        and #$00FF
        sta wR2
        inc y
        lda [lR18],y
        and #$00FF
        sta wR3
        inc y
        lda [lR18],y
        and #$00FF
        sta wR4
        inc y
        lda [lR18],y
        and #$00FF
        sta wR5
        inc y
        lda [lR18],y
        and #$00FF
        sta wR1
        inc y
        lda [lR18],y
        and #$00FF
        sta wR6
        inc y
        phy

        lda wR1
        bit #$0020
        beq _SkipSlot1

        lda wEventUnitSlot1XCoordinate
        cmp #$FFFF
        beq _End

          sta wR2
          lda wEventUnitSlot1YCoordinate
          cmp #$FFFF
          beq _End

            sta wR3
            bra _Continue

              _SkipSlot1
              lda wR1
              bit #$0040
              beq _Continue

                lda wEventUnitSlot2XCoordinate
                cmp #$FFFF
                beq _End

                  sta wR4
                  lda wEventUnitSlot2YCoordinate
                  cmp #$FFFF
                  beq _End

                    sta wR5

            _Continue
            lda #0
            sta wR7
            jsl $818FA1
            jsr rsUnknown91C38C

        _End
        ply
        plx
        clc
        rts

        .databank 0

      rsUnknown91C191 ; 91/C191

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_BY_GROUP ?

        phx
        stx aMovingMapSprites.wOffset,b
        stz aMovingMapSprites.wUnknown0017C0,b
        lda #2
        sta aMovingMapSprites.wUnknown0017C2,b

        ldy #0
        lda [lR18],y
        and #$00FF
        sta wR0

        inc y
        lda [lR18],y
        sta wRoutineVariable1,b

        inc y
        inc y
        lda [lR18],y
        and #$00FF
        sta wR2

        inc y
        lda [lR18],y
        and #$00FF
        sta wR3

        inc y
        lda [lR18],y
        and #$00FF
        sta wR1

        inc y
        lda [lR18],y
        and #$00FF
        sta wR6

        inc y
        phy

        lda wR1
        pha
        lda wR2
        pha
        lda wR3
        pha
        lda wR0

        phx
        jsl rlLoadUNITAsHidden
        bcc +

          brk

        +
        plx
        sta aMovingMapSprites.wUnknown0017CC,b,x

        ; Grab the X coordinate
        lda wR1
        and #$00FF
        sta wR4

        ; and the Y coordinate
        lda wR1
        xba
        and #$00FF
        sta wR5

        phx
        ldx wR2
        lda aUnknown91C21D,x
        and #$00FF
        sta wR6
        plx

        pla
        sta wR3
        pla
        sta wR2
        pla
        sta wR1

        lda #1
        sta wR7
        jsl $818FA1
        jsr rsUnknown91C38C

        ply
        plx
        clc
        rts

        .databank 0

      aUnknown91C21D ; 91/C21D

        ; Indexed with allegiance

        .byte $02
        .byte $04
        .byte $06
        .byte $08

      rsEventCommand28 ; 91/C221

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_BY_GROUP_SILENT

        lda [lR22],y
        and #$00FF
        sta wR0
        inc y
        lda [lR22],y
        sta wRoutineVariable1,b
        inc y
        inc y
        phy

        lda wR0
        jsl rlLoadUNITAsHidden
        bcc +

          brk

        +
        tax
        jsl rlDeployedUnitUnsetHiddenIfAlive

        ply
        rts

        .databank 0

      rsUnknown91C241 ; 91/C241

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_DIRECT ?

        phx
        stx aMovingMapSprites.wOffset,b
        stz aMovingMapSprites.wUnknown0017C0,b

        lda #4
        sta aMovingMapSprites.wUnknown0017C2,b

        ldy #0
        lda [lR18],y
        sta wR0

        inc y
        inc y
        lda [lR18],y
        and #$00FF
        sta aMovingMapSprites.wUnknown001822,b
        sta wR7

        inc y
        lda [lR18],y
        and #$00FF
        sta wR2

        inc y
        lda [lR18],y
        and #$00FF
        sta wR3

        inc y
        lda [lR18],y
        and #$00FF
        sta wR4

        inc y
        lda [lR18],y
        and #$00FF
        sta wR5

        inc y
        lda [lR18],y
        and #$00FF
        sta wR1

        inc y
        lda [lR18],y
        and #$00FF
        sta wR6

        inc y
        lda [lR18],y
        and #$00FF
        sta aMovingMapSprites.wUnknown001824,b

        inc y
        phy

        lda wR0
        pha
        lda wR1
        pha
        lda wR2
        pha
        lda wR3
        pha
        lda wR4
        pha
        lda wR5
        pha
        lda wR6
        pha
        lda wR7
        pha
        phx

        lda #0
        sta wR7
        jsl $818FA1

        plx

        phx
        lda wR4
        pha
        lda wR5
        pha

        jsr rsUnknown91C38C

        pla
        sta wR8
        pla
        sta wR9
        plx

        pla
        sta wR7
        pla
        sta wR6
        pla
        sta wR5
        pla
        sta wR4
        pla
        sta wR3
        pla
        sta wR2
        pla
        sta wR1
        pla
        sta wR0

        phx
        lda wR8
        xba
        ora wR9
        sta wRoutineVariable1,b

        lda wR0
        ldx wR7
        plx
        sta aMovingMapSprites.wUnknown0017CC,b,x

        ply
        plx

        clc
        rts

        .databank 0

      rsUnknown91C2FD ; 91/C2FD

        .al
        .autsiz
        .databank ?

        phx
        stx aMovingMapSprites.wOffset,b
        lda #8
        sta aMovingMapSprites.wUnknown0017C2,b
        ldy #0
        lda [lR18],y
        sta wR0

        inc y
        inc y
        lda [lR18],y
        and #$00FF
        sta wR2

        inc y
        lda [lR18],y
        and #$00FF
        sta wR3

        inc y
        lda [lR18],y
        and #$00FF
        sta wR4

        inc y
        lda [lR18],y
        and #$00FF
        sta wR5

        inc y
        lda [lR18],y
        and #$00FF
        sta wR1

        inc y
        lda [lR18],y
        and #$00FF
        sta wR6

        inc y
        lda [lR18],y
        and #$00FF
        sta wR7

        inc y
        lda [lR18],y
        sta wR8
        sta aMovingMapSprites.wUnknown0017C0,b
        inc y
        inc y
        phy

        lda wR6
        pha
        lda wR7
        pha
        lda wR8
        pha

        phx
        lda #1
        sta wR7
        jsl $818FA1
        plx

        phx
        jsr rsUnknown91C38C
        plx

        pla
        sta wR8
        pla
        sta wR7
        pla
        sta wR6

        lda wR7
        sta aMovingMapSprites.wUnknown0017CC,b,x
        lda wR8
        sta aMovingMapSprites.wUnknown001814,b,x
        ply
        plx
        clc
        rts

        .databank 0

      rsUnknown91C382 ; 91/C382

        .al
        .autsiz
        .databank ?

        lda #0
        sta aMovingMapSprites.wUnknown0017C2
        stz aMovingMapSprites.wUnknown0017C0,b

      rsUnknown91C38C ; 91/C38C

        .al
        .autsiz
        .databank ?

        ; X = mover ID

        phx
        stx aMovingMapSprites.wOffset,b
        phx
        ldy #aMovingMapSpriteData[0].wCharacterID - aMovingMapSpriteData[0]

        lda aMovingMapSprites.wUnknown0017C0,b
        bne _C3CA

          ; Check if the character is already in RAM
          lda [lR18],y
          pha
          jsl rlGetUnitRAMDataPointerByID
          pla
          bcc +

            ; Is a new unit
            jsl rlGetCharacterMapSprite
            bra _C3CA

          +
          ldy #aMovingMapSpriteData[0].bFlags - aMovingMapSpriteData[0]
          lda [lR18],y
          bit #$0080
          beq +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            beq +

              tya
              clc
              adc #9
              tay
              plx
              brl _End

          +
          jsl rlGetSelectedUnitMapSprite

        _C3CA
        plx
        sta aMovingMapSpritesMapSprites,b,x

        phx
        phy
        phb
        jsl rsMovingMapSpriteAppendDecomp
        plb
        ply
        plx

        ; Sound
        jsr rsUnknown91C447
        jsl rlUnknown91C4CE

        ldy #aMovingMapSpriteData[0].aSpawnCoordinates - aMovingMapSpriteData[0]
        lda [lR18],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta aMovingMapSprites.wXPixelPosition,b,x
        inc y

        lda [lR18],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta aMovingMapSprites.wYPixelPosition,b,x
        inc y

        lda [lR18],y
        and #$000F
        sta aMovingMapSprites.wSpeed,b,x

        lda [lR18],y
        and #$00F0
        bit #$0010
        beq +

          lda aMovingMapSprites.wUnknown0017C2
          ora #$0010
          sta aMovingMapSprites.wUnknown0017C2

        +
        inc y

        ; sprite color

        lda [lR18],y
        and #$003E
        xba
        sta aMovingMapSprites.wUnknown001804,b,x
        inc y

        lda [lR18],y
        sta aMovingMapSprites.wPathScriptAddress,b,x
        inc y

        lda [lR18],y
        sta aMovingMapSprites.wPathScriptBank,b,x

        stz aMovingMapSprites.wPathScriptOffset,b,x
        inc y
        inc y

        phy
        lda #(`$8188B0)<<8
        sta lR44+1
        lda #<>$8188B0
        sta lR44
        jsl rlActiveSpriteEngineCreateSpriteHighestSlot
        ply

        _End
        plx
        clc
        rts

        .databank 0

      rsUnknown91C447 ; 91/C447

        .al
        .autsiz
        .databank ?

        ; Sound stuff

        pha
        phx
        phy

        lda lR18
        pha
        lda lR18+1
        pha
        php

        phx
        ldy #0
        lda [lR18],y
        jsl rlGetCharacterMapSprite
        jsl rlGetMapSpriteMovementSound
        jsl rlUnknown91C472

        plx
        sta aMovingMapSprites.wMovingSound,b,x

        plp
        pla
        sta lR18+1
        pla
        sta lR18

        ply
        plx
        pla
        rts

        .databank 0

      rlUnknown91C472 ; 91/C472

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = map sprite movement sound

        phx
        pha
        stz wR0

        ldx #0

          -
          lda aMovingMapSprites.wMovingSound,b,x
          and #$FF00
          ora wR0
          sta wR0
          inc x
          inc x
          cpx #8
          bne -

        lda wR0
        cmp #$0300
        beq +

          ldx #$0100
          cmp #$0200
          beq ++

            ldx #$0200
            bra ++

        +
        inc aMovingMapSprites.wUnknown00181C,b
        lda aMovingMapSprites.wUnknown00181C,b
        and #$0001
        inc a
        xba
        tax

        +
        stx wR0

        ldx #0

          -
          lda aMovingMapSprites.wMovingSound,b,x
          and #$FF00
          cmp wR0
          bne +

            lda aMovingMapSprites.wMovingSound,b,x
            and #$00FF
            sta aMovingMapSprites.wMovingSound,b,x

          +
          inc x
          inc x
          cpx #8
          bne -

        pla
        ora wR0
        plx
        rtl

        .databank 0

      rlUnknown91C4CE ; 91/C4CE

        .al
        .autsiz
        .databank ?

        ; Something with the playing song and the movement sound.

        phx
        lda $04BA,b
        beq +

          lda aMovingMapSprites.wMovingSound,b,x
          and #$00FF
          sta aMovingMapSprites.wMovingSound,b,x
          bra _End

        +
        lda aMovingMapSprites.wMovingSound,b,x
        sta wR0
        and #$FF00
        beq _End

          xba
          tax
          lda wR0
          and #$00FF
          dec x
          bne +

            sta $04CA,b
            stz $04D0,b
            bra _End

          +
          sta $04CD,b
          stz $04D3,b

        _End
        plx
        rtl

        .databank 0

      rsEventCommand27 ; 91/C503

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_BY_SCRIPT

        lda #0
        jml +

        .databank 0

      rsEventCommand22 ; 91/C50A

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS

        lda #1
        jml +

        .databank 0

      rsEventCommand23 ; 91/C511

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_BY_GROUP

        lda #2
        jml +

        .databank 0

      rsEventCommand24 ; 91/C518

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_DIRECT

        lda #3
        jml +

        .databank 0

      rsEventCommand25 ; 91/C51F

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS_FOLLOW

        lda #4
        jml +

        .databank 0

      rsEventCommand26 ; 91/C526

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS_CLASS

        lda #5
        jml +

        +
        phy
        sta wR0

        ; Wait until any decomps finished
        lda bDecompressionArrayFlag,b
        bne _SEC

          ; Wait until the move engine is free
          lda aMovingMapSprites.wState,b
          cmp #0
          bne _SEC

            lda lR22+1
            sta lR18+1

            tya
            clc
            adc lR22
            sta lR18

            ldx #6

              -
              lda aMovingMapSprites.wActiveSpriteOffset,b,x
              cmp #$FFFF
              beq +

                dec x
                dec x
                bpl -

        _SEC
        ply
        dec y
        sec
        bra _End

        +
        lda wR0
        jsr rsUnknown91C56C
        sty wR0

        pla
        clc
        adc wR0
        tay
        sty wActiveEventOffset,b

        clc
        
        _End
        rts

        .databank 0

      rsUnknown91C56C ; 91/C56C

        .al
        .autsiz
        .databank ?

        ; Unit movement?

        phx
        asl a
        tax
        lda aUnknown91C57D,x
        sta lR23
        plx

        pea #<>(+)-1
        jmp (lR23)
        
        +
        rts

        .databank 0

      aUnknown91C57D ; 91/C57D

        .word <>rsUnknown91C382
        .word <>rsUnknown91C0FE
        .word <>rsUnknown91C191
        .word <>rsUnknown91C241
        .word <>rsUnknown91C0F4
        .word <>rsUnknown91C2FD

      rsEventCommand29 ; 91/C589

        .al
        .autsiz
        .databank ?

        ; WAIT_UNIT_SPRITE_DECOMPRESSED

        lda bDecompressionArrayFlag,b
        bne _SEC

          lda aMovingMapSprites.wState,b
          cmp #0
          bne _SEC

            clc
            bra +

        _SEC
        dec y
        sec

        +
        rts

        .databank 0

      rsEventCommand2A ; 91/C59C

        .al
        .autsiz
        .databank ?

        ; WAIT_UNTIL_MAP_SPRITES_HALTING

        phy
        ldx #6

        -
        lda aMovingMapSprites.wActiveSpriteOffset,b,x
        cmp #$FFFF
        bne +

          dec x
          dec x
          bpl -
          bra _End

        +
        lda #(`$828431)<<8
        sta lR44+1
        lda #<>$828431
        sta lR44
        jsl rlEventEngineCreateProc

        _End
        ply
        clc
        rts

        .databank 0

      rsEventCommand2B ; 91/C5BF

        .al
        .autsiz
        .databank ?

        ; CONTINUE_FORM_MAP_SPRITE_HALT

        phx
        phy
        ldy #6

          _Loop
          lda aMovingMapSprites.wActiveSpriteOffset,b,y
          cmp #$FFFF
          beq _Next

            tax
            lda aActiveSpriteSystem.aUnknown0012E0,b,x
            ora #$8000
            sta aActiveSpriteSystem.aUnknown0012E0,b,x

            tyx
            lda aMovingMapSprites.wMovingSound,b,x
            and #$FF00
            bne +

              lda aMovingMapSprites.wMovingSound,b,x
              jsl rlUnknown91C472
              sta aMovingMapSprites.wMovingSound,b,x

            +
            jsl rlUnknown91C4CE

        _Next
        dec y
        dec y
        bpl _Loop

        ply
        plx
        rts

        .databank 0

      rsEventCommand2C ; 91/C5F4

        .al
        .autsiz
        .databank ?

        ; EVENT_2C

        phx
        phy
        ldy #6
        
          _Loop
          lda aMovingMapSprites.wActiveSpriteOffset,b,y
          cmp #$FFFF
          beq +

            tax
            stz aActiveSpriteSystem.aTypeOffset,b,x

          +
          dec y
          dec y
          bpl _Loop

        jsl rlUnknown91C611

        ply
        plx
        clc
        rts

        .databank 0

      rlUnknown91C611 ; 91/C611

        .al
        .autsiz
        .databank ?

        lda #$FFFF
        sta aMovingMapSprites.wActiveSpriteOffset,b 
        sta aMovingMapSprites.wActiveSpriteOffset+2,b
        sta aMovingMapSprites.wActiveSpriteOffset+4,b
        sta aMovingMapSprites.wActiveSpriteOffset+6,b

        sep #$20
        lda #$10
        sta $04CA,b
        rep #$20

        ldx #0
        jsl $809933

        sep #$20
        lda #$10
        sta $04CD,b
        rep #$20

        ldx #3
        jsl $809933
        rtl

        .databank 0

      rsEventChangePalette ; 91/C641

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        cpy #$0201
        bcs _End

          sty wR0
          ldy #0

            _Loop
            lda [lR18],y
            sta aBGPaletteBuffer,b,x
            inc x
            inc x
            inc y
            inc y
            cpy wR0
            bcc _Loop

        _End
        plp
        rts

        .databank 0

      rsEventCommand2D ; 91/C65D

        .al
        .autsiz
        .databank ?

        ; CHANGE_PALETTE

        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        inc y
        inc y
        lda [lR22],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        asl a
        tax

        inc y
        phy

        lda [lR22],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        asl a
        tay

        jsr rsEventChangePalette

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand2E ; 91/C68A

        .al
        .autsiz
        .databank ?

        ; PALETTE_SWAP

        php
        phy

        lda #(`$828BEA)<<8
        sta lR44+1
        lda #<>$828BEA
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #11
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand2F ; 91/C6A6

        .al
        .autsiz
        .databank ?

        ; STORE_WORD

        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        inc y
        inc y
        lda [lR22],y
        sta [lR18]
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand30 ; 91/C6BC

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$8292B6)<<8
        sta lR44+1
        lda #<>$8292B6
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rlUnknown91C6D8 ; 91/C6D8

        .al
        .autsiz
        .databank ?

        pea #<>(+)-1
        jmp (lR23)

        +
        rtl

        .databank 0

      rsEventCommand32 ; 91/C6DF

        .al
        .autsiz
        .databank ?

        clc
        rts

        .databank 0

      rsEventCommand33 ; 91/C6E1

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30
        jsl rlActiveSpriteEngineReset
        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand31 ; 91/C6ED

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30
        ply
        plp
        clc
        rts

        .databank 0

      rsEventCommand37 ; 91/C6F5

        .al
        .autsiz
        .databank ?

        php
        phy

        jsl $80C32C

        stz wBufferBG1HOFS
        stz wBufferBG1VOFS
        stz wBufferBG2HOFS
        stz wBufferBG2VOFS
        stz wBufferBG3HOFS
        stz wBufferBG3VOFS

        lda #$00FF
        jsl $91A7BC

        sep #$20
        lda #$17
        sta bBufferTM
        sta bBufferTMW
        rep #$20

        jsl $8780AA

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand38 ; 91/C720

        .al
        .autsiz
        .databank ?

        php
        phy

        jsl $80C35D

        stz wBufferBG1HOFS
        stz wBufferBG1VOFS
        stz wBufferBG2HOFS
        stz wBufferBG2VOFS

        sep #$20
        lda #$11
        sta bBufferTM
        sta bBufferTMW
        lda #0
        sta bBufferW12SEL
        lda bBufferOBSEL
        and #(OBSEL_Gap | OBSEL_Base)
        sta OBSEL,b
        sta bBufferOBSEL
        rep #$20

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand39 ; 91/C749

        .al
        .autsiz
        .databank ?

        ; SET_CAMERA_TO_EVENT_UNIT_SLOT_1

        php
        lda wEventUnitSlot1XCoordinate
        cmp #$FFFF
        beq +

          lda wEventUnitSlot1YCoordinate
          cmp #$FFFF
          beq +

            lda wEventUnitSlot1XCoordinate
            asl a
            asl a
            asl a
            asl a
            sec
            sbc wMapScrollXPixels,b
            sta wCursorXOffset,b

            lda wEventUnitSlot1YCoordinate
            asl a
            asl a
            asl a
            asl a
            sec
            sbc wMapScrollYPixels,b
            sta wCursorYOffset,b

        +
        plp
        clc
        rts

        .databank 0

      rsEventCommand3A ; 91/C77D

        .al
        .autsiz
        .databank ?

        ; SET_CAMERA_POSITION

        php
        lda [lR22],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta wMapXOffset,b

        inc y
        lda [lR22],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta wMapYOffset,b

        inc y
        sty wActiveEventOffset,b

        lda #$0080
        sta wCursorXOffset,b
        sta wCursorYOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand3B ; 91/C7A7

        .al
        .autsiz
        .databank ?

        ; Sets map state? $80 = not interactable?

        php
        phy
        lda [lR22],y
        and #$003F
        sta wScreenFadingProcInput,b

        lda [lR22],y
        ldx #3
        bit #$0080
        bne +

          ldx #2
          bit #$0040
          bne +

            ldx #0

        +
        stx $0D77,b

        lda #<>$80B122
        sta aProcSystem.wInput0,b

        lda #(`procUnknown828364)<<8
        sta lR44+1
        lda #<>procUnknown828364
        sta lR44
        jsl rlProcEngineCreateProc

        lda #(`procUnknown828A30)<<8
        sta lR44+1
        lda #<>procUnknown828A30
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y

        plp
        clc
        rts

        .databank 0

      rsEventCommand3C ; 91/C7F0

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$828CA3)<<8
        sta lR44+1
        lda #<>$828CA3
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        plp
        clc
        rts

        .databank 0

      rsEventCommand3D ; 91/C804

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$828ECB)<<8
        sta lR44+1
        lda #<>$828ECB
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        plp
        clc
        rts

        .databank 0

      rsEventCommand3E ; 91/C818

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$828D52)<<8
        sta lR44+1
        lda #<>$828D52
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand3F ; 91/C834

        .al
        .autsiz
        .databank ?

        ; SCRIPTED_MAP_SCROLL

        php
        phy
        lda [lR22],y
        sta wEventMapScrollScript,b
        inc y
        lda [lR22],y
        sta wEventMapScrollScript+1,b

        inc y
        inc y
        lda [lR22],y
        and #$00FF
        sta wEventMapScrollSpeed,b

        lda #(`procMapScroll)<<8
        sta lR44+1
        lda #<>procMapScroll
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand40 ; 91/C865

        .al
        .autsiz
        .databank ?

        ; MAP_SCROLL

        php
        phy

        lda wMapScrollXPixels,b
        lsr a
        lsr a
        lsr a
        lsr a
        sta wR2

        lda wMapScrollYPixels,b
        lsr a
        lsr a
        lsr a
        lsr a
        sta wR3

        lda [lR22],y
        and #$00FF
        sta wR4

        inc y
        lda [lR22],y
        and #$00FF
        sta wR5

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        jsl rlCreateMapScrollScriptFromCoordinates

        lda lR18
        sta wEventMapScrollScript,b
        lda lR18+1
        sta wEventMapScrollScript+1,b

        lda #(`procMapScroll)<<8
        sta lR44+1
        lda #<>procMapScroll
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand41 ; 91/C8B8

        .al
        .autsiz
        .databank ?

        php
        phy

        lda wEventUnitSlot1XCoordinate
        cmp #$FFFF
        beq _End

          lda wEventUnitSlot1YCoordinate
          cmp #$FFFF
          beq _End

            lda wEventUnitSlot1XCoordinate
            sta wR0
            lda wEventUnitSlot1YCoordinate
            sta wR1

            jsl $88C473

            lda wR0
            sta wR4
            lda wR1
            sta wR5

            lda wMapScrollXPixels,b
            lsr a
            lsr a
            lsr a
            lsr a
            sta wR2

            lda wMapScrollYPixels,b
            lsr a
            lsr a
            lsr a
            lsr a
            sta wR3

            lda [lR22],y
            and #$00FF
            sta wR1

            jsl rlCreateMapScrollScriptFromCoordinates

            lda lR18
            sta wEventMapScrollScript,b
            lda lR18+1
            sta wEventMapScrollScript+1,b

            lda #(`procMapScroll)<<8
            sta lR44+1
            lda #<>procMapScroll
            sta lR44
            jsl rlEventEngineCreateProc

        _End
        pla
        clc
        adc #1
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand42 ; 91/C925

        .al
        .autsiz
        .databank ?

        ; FILL_EVENT_UNIT_SLOT

        php
        lda [lR22],y
        tax

        inc y
        inc y
        lda [lR22],y
        and #$00FF

        inc y
        phy

        cmp #0
        bne +

          txa
          jsl rlFillEventUnitSlot1
          bra ++

        +
        txa
        jsl rlFillEventUnitSlot2

        +
        ply
        plp

        clc
        rts

        .databank 0

      rlFillEventUnitSlot1 ; 91/C947

        .al
        .autsiz
        .databank ?

        jsl rlGetUnitRAMDataPointerByID
        bcs +

          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnitSlot1ID,b
          jsl rlGetSelectedUnitDeploymentOffset

          tax
          lda aDeploymentTable._XTilePosition,x
          sta wEventUnitSlot1XCoordinate
          lda aDeploymentTable._YTilePosition,x
          sta wEventUnitSlot1YCoordinate
          bra ++

        +
        lda #$FFFF
        sta wEventUnitSlot1XCoordinate
        sta wEventUnitSlot1YCoordinate
        stz wEventUnitSlot1ID,b

        +
        rtl

        .databank 0

      rlFillEventUnitSlot2 ; 91/C979

        .al
        .autsiz
        .databank ?

        jsl rlGetUnitRAMDataPointerByID
        bcs +

          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnitSlot2ID,b
          jsl rlGetSelectedUnitDeploymentOffset

          tax
          lda aDeploymentTable._XTilePosition,x
          sta wEventUnitSlot2XCoordinate
          lda aDeploymentTable._YTilePosition,x
          sta wEventUnitSlot2YCoordinate
          bra ++

        +
        lda #$FFFF
        sta wEventUnitSlot2XCoordinate
        sta wEventUnitSlot2YCoordinate
        stz wEventUnitSlot2ID,b
        
        +
        rtl

        .databank 0

      rsEventCommand43 ; 91/C9AB

        .al
        .autsiz
        .databank ?

        ; 3rd value => 0 = wEventUnitSlot1ID, 1 = wEventUnitSlot2ID

        php
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        inc y
        lda [lR22],y
        and #$00FF
        tax

        bne +

        stz wEventUnitSlot1ID,b
        bra ++

        +
        stz wEventUnitSlot2ID,b

        +
        inc y
        phy

        phx
        jsl $848776
        plx
        bcs _End

        lda wSelectedUnitDataRAMPointer,b
        cpx #0
        bne +

        sta wEventUnitSlot1ID,b
        bra _End

        +
        sta wEventUnitSlot2ID,b

        _End
        ply 
        plp

        clc
        rts

        .databank 0

      rsEventCommand44 ; 91/C9EA

        .al
        .autsiz
        .databank ?

        ; FACTION_UNIT_DEATH

        php
        lda [lR22],y
        and #$00FF
        sta aProcSystem.wInput0,b

        inc y
        lda [lR22],y
        and #$00FF
        cmp #$00FF
        bne +

          lda #$FFFF

        +
        sta aProcSystem.wInput1,b

        inc y
        lda [lR22],y
        sta aProcSystem.wInput2,b

        inc y
        inc y
        phy

        lda #(`$87C249)<<8
        sta lR44+1
        lda #<>$87C249
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand45 ; 91/CA1F

        .al
        .autsiz
        .databank ?

        ; RUN_ASM

        php
        phy
        rep #$30
        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        jsl +

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        +
        jml [lR18]

        .databank 0

      rsEventCommand48 ; 91/CA3F

        .al
        .autsiz
        .databank ?

        php
        phy

        phy
        lda wUnknown053E,b
        sta $7EA7C5
        lda #$00FF
        sta wUnknown053E,b
        ply

        lda [lR22],y
        and #$00FF
        sta wR0
        asl a
        clc
        adc wR0
        tax

        inc y
        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        phx
        jsl $91A9BB
        plx

        lda lMapMenuRAMEntryPointer,b
        sta $7E93AA,x
        lda lMapMenuRAMEntryPointer+1,b
        sta $7E93AB,x

        lda #3
        ora bBufferW34SEL
        sta bBufferW34SEL

        lda bBufferTM
        ora #$0004
        sta bBufferTM

        lda bBufferTMW
        ora #$0004
        sta bBufferTMW

        sep #$20
        lda bBufferBGMODE
        ora #$08
        sta bBufferBGMODE
        rep #$20

        jsl $91A7DF

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand49 ; 91/CAA9

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30
        lda [lR22],y
        and #$00FF
        sta wR0
        asl a
        clc
        adc wR0
        tax

        lda $7E93AA,x
        sta lMapMenuRAMEntryPointer,b
        lda $7E93AB,x
        sta lMapMenuRAMEntryPointer+1,b

        lda #0
        sta $7E93AA,x
        rep #$20

        jsl $8785A4

        ply
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand46 ; 91/CADC

        .al
        .autsiz
        .databank ?

        php
        phy
        jsl rlClearAllFadeProcs

        lda #(`procEventFadeInByTimer)<<8
        sta lR44+1
        lda #<>procEventFadeInByTimer
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand47 ; 91/CAF8

        .al
        .autsiz
        .databank ?

        php
        phy
        jsl rlClearAllFadeProcs

        lda #(`procEventFadeOutByTimer)<<8
        sta lR44+1
        lda #<>procEventFadeOutByTimer
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand34 ; 91/CB14

        .al
        .autsiz
        .databank ?

        ; PAUSE

        php
        phy

        lda #(`procEventPause)<<8
        sta lR44+1
        lda #<>procEventPause
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand35 ; 91/CB2D

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30

        lda #(`$829245)<<8
        sta lR44+1
        lda #<>$829245
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand36 ; 91/CB43

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30

        lda #(`$82925E)<<8
        sta lR44+1
        lda #<>$82925E
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand4A ; 91/CB5E

        .al
        .autsiz
        .databank ?

        ; RUN_EVENT_CONDITION

        php
        phb

        sep #$20
        lda lR22+2
        pha
        plb
        rep #$20

        tya
        clc
        adc lR22
        tay

        jsl rlUnknown86816B

        tya
        sec
        sbc lR22
        tay

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4B ; 91/CB7A

        .al
        .autsiz
        .databank ?

        ; SET_FLAG_IF_IN_CHAPTER

        php
        phb
        phy
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        tax

        lda wR0
        jsl rlGetSpecifiedChaptersRAMPointer
        bcs +

          txa
          jsl rlSetEventFlag

        +
        pla
        clc
        adc #2
        tay

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4C ; 91/CBA2

        .al
        .autsiz
        .databank ?

        ; UNSET_FLAG_IF_IN_CHAPTER

        php
        phb
        phy
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        tax

        lda wR0
        jsl rlGetSpecifiedChaptersRAMPointer
        bcs +

          txa
          jsl rlUnsetEventFlag

        +
        pla
        clc
        adc #2
        tay

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4D ; 91/CBCA

        .al
        .autsiz
        .databank ?

        ; RUN_EVENT_CONDITION_UNSKIPPABLE

        php
        phb

        jsr rsEventCommand4A

        phy
        lda #(`procUnknown828A93)<<8
        sta lR44+1
        lda #<>procUnknown828A93
        sta lR44
        jsl rlEventEngineCreateProc
        ply

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4E ; 91/CBE3

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        lda #2
        jsl rlUnknown91811C
        ldx #0
        jsl $8ACE50

        phy
        lda #(`procUnknown828AC3)<<8
        sta lR44+1
        lda #<>procUnknown828AC3
        sta lR44
        jsl rlEventEngineCreateProc
        ply

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4F ; 91/CC15

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        lda #<>$80B3A2
        sta aProcSystem.wInput0,b

        lda #(`procUnknown8282D3)<<8
        sta lR44+1
        lda #<>procUnknown8282D3
        sta lR44
        jsl rlProcEngineCreateProc

        ply
        plb
        plp
        
        clc
        rts

        .databank 0

      rsEventCommand50 ; 91/CC31

        .al
        .autsiz
        .databank ?

        ; transition from world map to chapter name display?

        php
        phb
        phy

        lda wCurrentChapter,b
        cmp #$FFFF
        beq +

          stz $0302,b

          lda #<>$80F2BE
          sta aProcSystem.wInput0,b
          lda #2
          sta wScreenFadingProcInput,b

          lda #(`procUnknown828364)<<8
          sta lR44+1
          lda #<>procUnknown828364
          sta lR44
          jsl rlProcEngineCreateProc

          _End
          ply
          plb
          plp

          clc
          rts

        +
        jsl $8B80CB
        bra _End

        .databank 0

      rsEventCommand51 ; 91/CC64

        .al
        .autsiz
        .databank ?

        ; WM_SCROLL

        php
        phy

        lda #(`procWorldMapScroll)<<8
        sta lR44+1
        lda #<>procWorldMapScroll
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand52 ; 91/CC80

        .al
        .autsiz
        .databank ?

        ; WM_MARKER

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        inc y
        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y
        and #$00FF
        tay

        jsl $8B84E5

        ply
        inc y
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand53 ; 91/CCAD

        .al
        .autsiz
        .databank ?

        ; WM_CLEAR_MARKER

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        jsl $8B86BF

        ply
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand54 ; 91/CCC0

        .al
        .autsiz
        .databank ?

        ; WM_LOAD_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y

        jsl rlLoadPortraitIntoSlot

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand55 ; 91/CCD8

        .al
        .autsiz
        .databank ?

        ; WM_FADE_IN_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        jsl $8B821F

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand56 ; 91/CCFD

        .al
        .autsiz
        .databank ?

        ; WM_FADE_OUT_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        jsl $8B8245

        ply
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand57 ; 91/CD10

        .al
        .autsiz
        .databank ?

        ; WM_MOVE_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        jsl $8B8261

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand58 ; 91/CD35

        .al
        .autsiz
        .databank ?

        ; WM_DIALOGUE

        php
        phb
        phy

        phy
        jsl rlResetDialogueEngine
        ply

        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        lda #0
        jsl rlUnknown91811C

        lda #(`$8B9275)<<8
        sta aDialogue.lHDMARoutine+1,b
        lda #<>$8B9275
        sta aDialogue.lHDMARoutine,b

        ldx #0
        jsl $8B91F6

        phy
        lda #(`procUnknown828AC3)<<8
        sta lR44+1
        lda #<>procUnknown828AC3
        sta lR44
        jsl rlEventEngineCreateProc
        ply

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand59 ; 91/CD79

        .al
        .autsiz
        .databank ?

        php
        phb

        phy
        jsl $8B87A0
        ply

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5A ; 91/CD85

        .al
        .autsiz
        .databank ?

        ; Clears BG3HOFS hdma?

        php
        phb

        phy
        jsl $8B87C5
        ply

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5B ; 91/CD91

        .al
        .autsiz
        .databank ?

        ; WM_HIGHLIGHT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF

        jsl rlHighlightWorldMapPart

        ply
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5C ; 91/CDA3

        .al
        .autsiz
        .databank ?

        ; WM_CLEAR_HIGHLIGHT

        php
        phb

        phy
        jsl rlClearHighlightWorldMapPart
        ply

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand01 ; 91/CDAF

        .al
        .autsiz
        .databank ?

        ; EVENT_01

        lda #2
        sta wUnknown00171C,b

        clc
        rts

        .databank 0

      rsEventCommand5D ; 91/CDB7

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        stz $0D7B,b
        lda #1
        sta $1832,b

        lda $0CC2,b
        bne +

          lda $1B49,b
          and #$FFFE
          bne +

            stz $1832,b
            lda #$00D0
            jsl $808FA3

        +
        lda #(`$828865)<<8
        sta lR44+1
        lda #<>$828865
        sta lR44
        jsl rlEventEngineCreateProc

        lda #$8000
        tsb wUnknown00171A,b

        lda #$0010
        tsb $0788,b

        lda $04EA,b
        ora #$0005
        sta $04EA,b

        ply
        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5E ; 91/CE02

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        stz $0302,b
        lda #<>$80C0B6
        sta aProcSystem.wInput0,b

        lda #(`procUnknown8282D3)<<8
        sta lR44+1
        lda #<>procUnknown8282D3
        sta lR44
        jsl rlProcEngineCreateProc

        lda $04EA,b
        and #$FFFA
        sta $04EA,b

        ply
        plb
        plp

        clc
        rts

        .databank 0

      rlUnknown91CE2A ; 91/CE2A

        .al
        .autsiz
        .databank ?

        rtl
        
        .databank 0

        ; 91/CE2B

    .endsection Code91BDD2Section
