
    .weak

      rlFindCharacterByGenerationID             :?= address($848726)

    .endweak

    .section Code868000Section

      .enc "none"
      .text "VER 960402 2000\n"

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

        lda #(`$8282D3)<<8
        sta lR44+1
        lda #<>$8282D3
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

        lda #(`$8282D3)<<8
        sta lR44+1
        lda #<>$8282D3
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

      rlUnknown868266 ; 86/8266

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        sta $0550,b
        lda #$7E00
        sta $055C+1,b
        lda #$52B7
        sta $055C,b
        jsl $82E810
        bcs _SEC

        lda $054A,b
        sta $0EC5,b
        lda $054A+1,b
        sta $0EC5+1,b
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

          ; requirements fulfilled

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
        jsr $869BC3
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
        jsr $869BD4
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
        jsr $869C1D
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
        jsr $869BD4 ; rsEventCheck2Parameters
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
        jsr $869BF2
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
        jsr $869C95
        sta $0EB8,b
        lda $0001,b,y
        sta wEventEngineParameter1,b
        jsr rsUnknown8688C1
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
        jsr $869C95
        sta $0EB8,b

        lda wEventEngineArgument2,b
        jsr $869C95
        sta $0EBA,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsUnknown8688F0
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
        jsr $869C95
        sta $0EB8,b

        lda wEventEngineArgument4,b
        jsr $869C95
        sta $0EBA,b

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
        jsr $869C95
        sta $0EB8,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsUnknown8688D2
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
        jsr $869C95
        sta $0EB8,b

        lda wEventEngineArgument2,b
        jsr $869C95
        sta $0EBA,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsUnknown8688F0
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
        jsr $869C95
        sta $0EB8,b

        lda $0001,b,y
        sta wEventEngineParameter1,b
        lda $0003,b,y
        sta wEventEngineParameter2,b
        jsr rsUnknown8688D2
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

      rsUnknown868864 ; 86/8864

        .al
        .autsiz
        .databank ?

        php
        ldx #5
        stx wEventCommandLength,b
        ldx #<>rsUnknown868876
        stx lEventPointer,b
        plp
        jml rsUnknown8684ED

        .databank 0

      rsUnknown868876 ; 86/8876

        .al
        .autsiz
        .databank ?

        lda wEventEngineArgument1,b
        jsr $869C95
        sta $0EB8,b

        lda wEventEngineArgument2,b
        jsr $869C95
        sta $0EBA,b

        lda $0001,b,y
        jsr $869C95
        sta wEventEngineParameter1,b

        lda $0003,b,y
        jsr $869C95
        sta wEventEngineParameter2,b

        jsr rsUnknown8688F0
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

      rsUnknown8688C1 ; 86/88C1

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda $0EB8,b
          cmp wEventEngineParameter1,b
          bne ++

        +
        sec
        rts

        +
        clc
        rts

        .databank 0

      rsUnknown8688D2 ; 86/88D2

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda $0EB8,b
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

      rsUnknown8688F0 ; 86/88F0

        .al
        .autsiz
        .databank ?

        lda wEventEngineParameter1,b
        bmi +

          lda $0EB8,b
          cmp wEventEngineParameter1,b
          bne _CLC

        +
        lda wEventEngineParameter2,b
        bmi +

          lda $0EBA,b
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

          lda $0EB8,b
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

          lda $0EBA,b
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

          lda $0EB8,b
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

          lda $0EBA,b
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
        jsl $869B4D
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

        lda #$0A
        jml rsUnknown868864

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
        jsr $869BF2
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
        jsl $869B4D
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

        -
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
        bra -

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

          jsl $86832B

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

        bcs _8F1F
        
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

        _8F1F
        lda $0000,b,y
        and #$00FF
        cmp #$00FF
        beq +

          inc y
          bra _8F1F

        +
        bra _End

        .databank 0

      rsChapterEventConditionCommand3B ; 86/8F2F

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          lda $0001,b,y
          and #$00FF
          jsl $869ABC

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3C ; 86/8F47

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl $869A92

          sep #$20
          clc
          adc $0001,b,y
          rep #$20

          and #$00FF
          jsl $869ABC

        +
        inc y
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3D ; 86/8F68

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl $869AE9

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3E ; 86/8F79

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl $869B1B

        +
        inc y
        rts

        .databank 0

      rsChapterEventConditionCommand3F ; 86/8F8A

        .al
        .autsiz
        .databank ?

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl $869A92

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

        bcs +

          lda $0000,b,y
          and #$00FF
          sta wEventEngineParameter1,b
          jsl $869A92

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
          jsl $87E188

          lda wR0
          cmp #7
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
          bcs ++

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

        lda wSelectedUnitDataRAMPointer,b
        pha

        bcs _End

          stz wEventUnit1Pointer,b
          stz wEventUnit2Pointer,b

          lda $0000,b,y
          jsl $848DF4

          lda $7E2000
          beq _910D

            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne +

              lda wSelectedUnitDataRAMPointer,b
              sta wEventUnit1Pointer,b
            
            +
            lda $7E2002
            beq _910D

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

          _910D
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
          jsl $81B483

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
        jsl $849E23
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
            jsl $84AABA
            dec x
            bne -

        +
        lda $0003,b,y
        and #$00FF
        cmp #$00FF
        beq +

          sta wRoutineVariable1,b
          jsl $84F142

        +
        lda $0004,b,y
        and #$00FF
        cmp #$00FF
        beq +

          sta wRoutineVariable1,b
          jsl $84F142

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
          jsr $869C95
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
          jsl $869B4D
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

        bcs +
        
          lda $0001,b,y
          and #$00FF
          sta wRoutineVariable1,b
          lda $0000,b,y
          and #$00FF
          jsl $84C54C

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
          jsr rsUnknown8696CB
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
              jsr rsUnknown8696CB
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

      rsUnknown8696CB ; 86/96CB

        .al
        .autsiz
        .databank ?

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

        bcs _End

          lda $0000,b,y
          and #$00FF
          sta wR0
          lda $0002,b,y
          and #$00FF
          sta wR1
          jsr $8696CB
          bcs _End

            ldx wSelectedUnitDataRAMPointer,b
            lda $0001,b,y
            and #$00FF
            jsl rlGetUnitRAMDataPointerByID
            bcc +

            lda $0003,b,y
            and #$00FF
            cmp #$00FF
            beq _End

            jsl rlGetUnitRAMDataPointerByID
            bcs _End
            bra ++

            +
            stx wSelectedUnitDataRAMPointer,b
            lda $0001,b,y
            and #$00FF
            jsl rlSetSelectedUnitTalkTarget
            bra _End

            +
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
        jml $8696E3

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
            jsl $84977B
            lda $0003,b,y
            and #$00FF
            jsl $84983C

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

        CLEAR_TALK_IF_ONE_MARRIED

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

        ; 86/9A92

    .endsection Code868000Section


    .section Code86C4C4Section

      rlUnknown86C4C4 ; 86/C4C4

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = current chapter

        phx

        sta $24
        asl a
        clc
        adc $24
        tax
        lda aChapterEventPointers+1,x
        sta $24+1
        lda aChapterEventPointers,x
        beq +

          sta $24
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
        jsl $868266
        bcs _End

        phx
        ldy $0EC5,b

        sep #$20
        lda $0EC5+2,b
        pha
        rep #$20
        plb

        lda $0000,b,y
        asl a
        clc
        adc $0000,b,y
        tax
        lda $86C739+1,x
        sta $0002+1,b,y
        lda $86C739,x
        sta $0002,b,x
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
        sta aUnknown7E4EA5
        sta aUnknown7E4EA5+2

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
                jsl $86C6E8

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
        .databank ?

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
        and aActiveMapChangesLookupTable,b,y
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
        .databank ?

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
        ora aActiveMapChangesLookupTable,b,y
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

    .section Code86C4C4Section



