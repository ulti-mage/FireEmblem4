
    .weak

      rlFadeInByTimer                               :?= address($80A21C)
      rlFadeOutByTimer                              :?= address($80A25A)
      rlEventEngineFreeProc                         :?= address($91A47D)
      procUnknown9EC70B                             :?= address($9EC70B)
      rlUnknown8885EF                               :?= address($8885EF)
      rlUnknown88863E                               :?= address($88863E)

      rlSetPermanentEventFlag                       :?= address($8680BE)
      rlUnsetPermanentEventFlag                     :?= address($8680F6)

      rlGetFatherUnitsChildrenRAMPointers           :?= address($848DF4)

    .endweak

    .section Code828299Section

      procFadeIn ; 82/8299

        .structProcInfo "FI", rlProcFadeInInit, rlProcFadeInCycle, aProcFadeInCode

      rlProcFadeInInit ; 82/82A1

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda #$FF
        sta wScreenFadingFlag,b
        plp
        rtl

        .databank 0

      rlProcFadeInCycle ; 82/82AB

        .al
        .autsiz
        .databank ?

        lda #1
        jsl rlFadeInByTimer
        bcc +

          jsl rlProcEngineFreeProc

        +
        rtl

        .databank 0

      aProcFadeInCode ; 82/82B9

        PROC_HALT

      procFadeOut ; 82/82BB

        .structProcInfo "FO", rlProcFadeInInit, rlProcFadeOutCycle, aProcFadeOutCode

      rlProcFadeOutCycle ; 82/82C3
      
        .al
        .autsiz
        .databank ?

        lda #1
        jsl rlFadeOutByTimer
        bcc +

          jsl rlProcEngineFreeProc

        +
        rtl

        .databank 0

      aProcFadeOutCode ; 82/82D1

        PROC_HALT

      procMainLoopChangeFade ; 82/82D3

        .structProcInfo "Bt", rlProcMainLoopChangeFadeInit, rlProcMainLoopChangeFadeCycle, aProcMainLoopChangeFadeCode

      rlProcMainLoopChangeFadeInit ; 82/82DB
      
        .al
        .autsiz
        .databank ?

        lda aProcSystem.wInput0,b
        sta aProcSystem.aBody0,b,x

        lda bBufferINIDISP
        bit #INIDISP_ForcedBlank
        bne +

          bit #INIDISP_Setting(false, 15)
          beq +

            lda #(`procFadeOut)<<8
            sta lR44+1
            lda #<>procFadeOut
            sta lR44
            jsl rlProcEngineCreateProc

        +
        rtl

        .databank 0

      rlProcMainLoopChangeFadeCycle ; 82/82FC

        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        bit #INIDISP_ForcedBlank
        bne +

          bit #INIDISP_Setting(false, 15)
          bne _End

        +
        lda aProcSystem.aBody0,b,x
        jsl rlUnknown80A9D4

        sei

        sep #$20
        lda bBufferNMITIMEN
        and #~(NMITIMEN_VCountIRQ | NMITIMEN_HCountIRQ)
        sta bBufferNMITIMEN
        sta NMITIMEN,b
        rep #$20

        jsl rlProcEngineFreeProc

        _End
        rtl

        .databank 0

      aProcMainLoopChangeFadeCode ; 82/8322

        PROC_HALT

      procFadeInByScreenFadingTimer ; 82/8324

        .structProcInfo "FI", rlProcFadeInByScreenFadingTimerInit, rlProcFadeInByScreenFadingTimerCycle, aProcFadeInByScreenFadingTimerCode

      rlProcFadeInByScreenFadingTimerInit ; 82/832C

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda #$FF
        sta wScreenFadingFlag,b
        lda wScreenFadingProcInput,b
        sta aProcSystem.aBody0,b,x
        plp
        rtl

        .databank 0

      rlProcFadeInByScreenFadingTimerCycle ; 82/833C

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        jsl rlFadeInByTimer
        bcc +

          jsl rlProcEngineFreeProc

        +
        rtl

        .databank 0

      aProcFadeInByScreenFadingTimerCode ; 82/834A

        PROC_HALT

      procFadeOutByScreenFadingTimer ; 82/834C

        .structProcInfo "FO", rlProcFadeInByScreenFadingTimerInit, rlProcFadeOutByScreenFadingTimerCycle, $828362

      rlProcFadeOutByScreenFadingTimerCycle ; 82/8354

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        jsl rlFadeOutByTimer
        bcc +

          jsl rlProcEngineFreeProc

        +
        rtl

        .databank 0

      aProcFadeOutByScreenFadingTimerCode ; 82/8362

        PROC_HALT

      procMainLoopChangeFadeByTimer ; 82/8364

        .structProcInfo "Bt", rlProcMainLoopChangeFadeByTimerInit, rlProcMainLoopChangeFadeByTimerCycle, aProcMainLoopChangeFadeByTimerCode

      rlProcMainLoopChangeFadeByTimerInit ; 82/836C

        .al
        .autsiz
        .databank ?

        lda aProcSystem.wInput0,b
        sta aProcSystem.aBody0,b,x

        lda bBufferINIDISP
        bit #INIDISP_ForcedBlank
        bne +

          bit #INIDISP_Setting(false, 15)
          beq +

            lda #(`procFadeOutByScreenFadingTimer)<<8
            sta lR44+1
            lda #<>procFadeOutByScreenFadingTimer
            sta lR44
            jsl rlProcEngineCreateProc
        
        +
        rtl

        .databank 0

      rlProcMainLoopChangeFadeByTimerCycle ; 82/838D

        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        bit #INIDISP_ForcedBlank
        bne +

          bit #INIDISP_Setting(false, 15)
          bne _End

        +
        lda aProcSystem.aBody0,b,x
        jsl rlUnknown80A9D4

        sei

        sep #$20
        lda bBufferNMITIMEN
        and #~(NMITIMEN_VCountIRQ | NMITIMEN_HCountIRQ)
        sta bBufferNMITIMEN
        sta NMITIMEN,b
        rep #$20

        jsl rlProcEngineFreeProc

        _End
        rtl

        .databank 0

      aProcMainLoopChangeFadeByTimerCode ; 82/83B3

        PROC_HALT

      ; 82/83B5

    .endsection Code828299Section



    .section Code828A30Section

      procUnknown828A30 ; 82/8A30

        .structProcInfo "TT", rlProcUnknown828A30Init, rlProcUnknown828A30Cycle1, $828A86

        .word 0

      rlProcUnknown828A30Init ; 82/8A3A

        .al
        .autsiz
        .databank ?

        ldy wActiveEventOffset,b
        lda lActiveEventPointer,b
        sta @l lR22
        lda lActiveEventPointer+1,b
        sta @l lR22+1
        lda [lR22],y
        sta aProcSystem.aBody0,b,x
        rtl

        .databank 0

      rlProcUnknown828A30Cycle1 ; 82/8A51

        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        and #INIDISP_Brightness
        cmp #INIDISP_Setting(false, 0)
        bne _End

          lda aProcSystem.aBody0,b,x
          bit #$0080
          bne +

            lda #<>rlProcUnknown828A30Cycle2
            sta aProcSystem.aHeaderOnCycle,b,x
            bra _End

          +
          lda bBufferINIDISP
          bit #INIDISP_ForcedBlank
          bne _End

            jsl rlEventEngineFreeProc

        _End
        rtl

        .databank 0

      rlProcUnknown828A30Cycle2 ; 82/8A77

        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        and #INIDISP_Brightness
        cmp #INIDISP_Setting(false, 15)
        bne +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcUnknown828A30Code ; 82/8A86

        PROC_HALT

      procUnknown828A88 ; 82/8A88

        .structProcInfo "LL", rlProcUnknown828A88Init, $82899F, $828A1A

        .word 0

      rlProcUnknown828A88Init ; 82/8A92

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      procUnknown828A93 ; 82/8A93

        .structProcInfo "TT", rlProcUnknown828A93Init, rlProcUnknown828A93Cycle1, aProcUnknown828A93Code

        .word 0

      rlProcUnknown828A93Init ; 82/8A9D

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlProcUnknown828A93Cycle1 ; 82/8A9E

        .al
        .autsiz
        .databank ?

        lda bUnknown000E7B,b
        bit #$0001
        bne +

          lda #4
          sta aProcSystem.aBody0,b,x
          lda #<>rlProcUnknown828A93Cycle2
          sta aProcSystem.aHeaderOnCycle,b,x

        +
        rtl

        .databank 0

      rlProcUnknown828A93Cycle2 ; 82/8AB3

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        dec a
        sta aProcSystem.aBody0,b,x
        bne +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcUnknown828A93Code ; 82/8AC1

        PROC_HALT

      procUnknown828AC3 ; 82/8AC3

        .structProcInfo "ME", rlProcUnknown828AC3Init, rlProcUnknown828AC3Cycle, aProcUnknown828AC3Code

        .word 0

      rlProcUnknown828AC3Init ; 82/8ACD

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlUnknown828ACE ; 82/8ACE

        .al
        .autsiz
        .databank ?

        lda #1
        sta aDialogue.wTextSound,b

        lda aDialogue.wStatus,b
        bit #DialogueStatusEnabled
        beq +

          lda #<>rlProcUnknown828AC3Cycle
          sta aProcSystem.aHeaderOnCycle,b,x

        +
        rtl

        .databank 0

      rlProcUnknown828AC3Cycle ; 82/8AE3

        .al
        .autsiz
        .databank ?

        lda aDialogue.wStatus,b
        bit #DialogueStatusEnabled
        bne +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcUnknown828AC3Code ; 82/8AF0

        PROC_HALT

      procUnknown828AF2 ; 82/8AF2

        .structProcInfo "ME", rlProcUnknown828AF2Init, rlProcUnknown828AF2Cycle, aProcUnknown828AF2Code

        .word 0

      rlUnknown828AFC ; 82/8AFC

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlUnknown828AFD ; 82/8AFD

        .al
        .autsiz
        .databank ?

        lda $04BA,b
        bne +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcCodeUnknown828B07 ; 82/8B07

        PROC_HALT

      procUnknown828AD9 ; 82/8AD9

        .structProcInfo "ME", rlProcUnknown828AF2Init, rlProcUnknown828AF2Cycle, aProcUnknown828AF2Code

        .word 0

      rlProcUnknown828AF2Init ; 82/8B13

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlProcUnknown828AF2Cycle ; 82/8B14
      
        .al
        .autsiz
        .databank ?

        lda #(`procUnknown9EC70B)<<8
        sta lR44+1
        lda #<>procUnknown9EC70B
        sta lR44
        jsl rlProcEngineFindProc
        bcs +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcUnknown828AF2Code ; 82/8B29

        PROC_HALT

      ; 82/8B2B

    .endsection Code828A30Section


    .section Code828F3FSection

      procMapScroll ; 82/8F3F

        .structProcInfo "M2", rlProcMapScrollInit, rlProcMapScrollCycle, aProcMapScrollCode
        .word 0

      rlProcMapScrollInit ; 82/8F49

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        stz wMapCurrentlyScrollingFlag,b
        stz wMapScrollScriptOffset,b
        plp
        rtl

        .databank 0

      rlProcMapScrollCycle ; 82/8F54

        .al
        .autsiz
        .databank ?

        php
        phb
        lda $0302,b
        cmp #$0012
        beq +

          cmp #$000F
          bne _End

        +
        jsl $819166
        bcc _End

          lda wUnknown000D79,b
          bit #$8000
          bne +

            phx
            jsl $88BF97
            plx
            bcc +

              lda #$0080
              sta $0768,b
              sta $076A,b

          +
          jsl rlEventEngineFreeProc

        _End
        plb
        plp
        rtl

        .databank 0

      aProcMapScrollCode ; 82/8F89

        PROC_HALT

      procWorldMapScroll ; 82/8F8B

        .structProcInfo "MS", rlProcWorldMapScrollInit, rlProcWorldMapScrollCycle, aProcWorldMapScrollCode

      .word 0

      rlProcWorldMapScrollInit ; 82/8F95
      
        .al
        .autsiz
        .databank ?

        php
        rep #$30
        lda #0
        sta aProcSystem.aBody2,b,x

        ldy wActiveEventOffset,b
        lda [lR22],y
        sta aProcSystem.aBody0,b,x
        inc y
        inc y
        lda [lR22],y
        sta aProcSystem.aBody1,b,x

        plp
        rtl

        .databank 0

      rlProcWorldMapScrollCycle ; 82/8FAF
      
        .al
        .autsiz
        .databank ?

        php
        phb
        lda #0
        sta aProcSystem.aBody2,b,x
        sta aProcSystem.aBody3,b,x

        lda #1
        sta wMapScrollSpeed,b

        lda aProcSystem.aBody0,b,x
        cmp wMapScrollXPixels,b
        beq _CheckYMatch
        bcs _SetScrollRight

            lda #1
            sta aProcSystem.aBody2,b,x
            bra _CheckYMatch

          _SetScrollRight
          lda #-1
          sta aProcSystem.aBody2,b,x
          bra _CheckYMatch

        _CheckYMatch
        lda aProcSystem.aBody1,b,x
        cmp wMapScrollYPixels,b
        beq _CheckXScroll
        bcs _SetScrollDown

            lda #1
            sta aProcSystem.aBody3,b,x
            bra _CheckXScroll

          _SetScrollDown
          lda #-1
          sta aProcSystem.aBody3,b,x
          bra _CheckXScroll

        _CheckXScroll
        lda aProcSystem.aBody2,b,x
        bne _ScrollX

        ; No need to scroll X
        lda aProcSystem.aBody3,b,x
        beq _FinishedScrolling
        bra _ScrollY

        _ScrollX
        bpl _ScrollLeft
        bra _ScrollRight
        
        _ScrollY
        bpl _ScrollUp
        bra _ScrollDown

        _ScrollLeft
        lda aProcSystem.aBody3,b,x
        beq _ScrollJustLeft
        bpl _ScrollLeftUp
        bra _ScrollLeftDown

        _ScrollJustLeft
        jsl rlUnknown8885EF
        bra _End

        _ScrollLeftUp
        jsl $88860B
        bra _End

        _ScrollLeftDown
        jsl $88861C
        bra _End

        _ScrollRight
        lda aProcSystem.aBody3,b,x
        beq _ScrollJustRight
        bpl _ScrollRightUp
        bra _ScrollRightDown

        _ScrollJustRight
        jsl $8885FD
        bra _End

        _ScrollRightUp
        jsl $88862D
        bra _End

        _ScrollRightDown
        jsl rlUnknown88863E
        bra _End

        _ScrollUp
        jsl $8885D3
        bra _End

        _ScrollDown
        jsl $8885E1
        bra _End

        _FinishedScrolling
        jsl rlEventEngineFreeProc
        
        _End
        plb
        plp
        rtl

        .databank 0

      aProcWorldMapScrollCode ; 82/9051

        PROC_HALT

      procEventFadeInByTimer ; 82/9053

        .structProcInfo "EI", rlProcEventFadeInByTimerInit, rlProcEventFadeInByTimerCycle, aProcEventFadeInByTimerCode

        .word 0

      rlProcEventFadeInByTimerInit ; 82/905D

        .al
        .autsiz
        .databank ?

        php
        rep #$20
        ldy wActiveEventOffset,b
        lda [lR22],y
        and #$00FF
        sta aProcSystem.aBody0,b,x
        plp
        rtl

        .databank 0

      rlProcEventFadeInByTimerCycle ; 82/906D

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        jsl rlFadeInByTimer
        bcc +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcEventFadeInByTimerCode ; 82/907B

        PROC_HALT

      procEventFadeOutByTimer ; 82/907D

        .structProcInfo "EO", rlProcEventFadeOutByTimerInit, rlProcEventFadeOutByTimerCycle, aProcEventFadeOutByTimerCode
        .word 0

      rlProcEventFadeOutByTimerInit ; 82/9087

        .al
        .autsiz
        .databank ?

        php
        rep #$20
        ldy wActiveEventOffset,b
        lda [lR22],y
        and #$00FF
        sta aProcSystem.aBody0,b,x
        plp
        rtl

        .databank 0

      rlProcEventFadeOutByTimerCycle ; 82/9097

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        jsl rlFadeOutByTimer
        bcc +

          sep #$20
          lda bBufferINIDISP
          sta INIDISP,b
          rep #$20

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcEventFadeOutByTimerCode ; 82/90AE

        PROC_HALT

        ; 82/90B0

    .endsection Code828F3FSection


    .section Code82921ESection

      procEventPause ; 82/921E

        .structProcInfo "e0", rlProcEventPauseInit, rlProcEventPauseCycle, aProcEventPauseCode
        .word 2

      rlProcEventPauseInit ; 82/9228

        .al
        .autsiz
        .databank ?

        ldy wActiveEventOffset,b
        lda [lR22],y
        cmp #2
        bcs +

          lda #2

        +
        sta aProcSystem.aBody0,b,x
        rtl

        .databank 0

      rlProcEventPauseCycle ; 82/9239

        .al
        .autsiz
        .databank ?

        dec aProcSystem.aBody0,b,x
        bne +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcEventPauseCode ; 82/9243

        PROC_HALT

      ; 82/9245

    .endsection Code82921ESection

    .section Code829478Section

      rlCreateProcHaltEvent ; 82/9478

        .al
        .autsiz
        .databank ?

        ; Halt until $0002 of $7F4C07 is set

        lda #(`$828B2B)<<8
        sta lR44+1
        lda #<>$828B2B
        sta lR44
        jsl rlEventEngineCreateProc
        rtl

        .databank 0

        ; 82/9487

    .endsection Code829478Section

    .section Code82E41BSection

      rlBuildRAMStructHeader ; 82/E41B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = struct count
        ; wR1 = struct size

        ; lR18 = dest pointer

        phb
        php

        phk
        plb

        phx
        phy

        ldy lR18

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        sep #$20
        lda wR1
        beq _End

        sta structRAMStructHeader.StructSize,b,y

        cmp #4
        bcc +

          ; struct size is more than 4?
          dec wR0

        +
        lda wR0
        beq _End

        sta structRAMStructHeader.MaxStructCount,b,y

        lda #0
        sta structRAMStructHeader.CurrentStructCount,b,y

        lda wR1
        tax
        cpx #4
        bcs +

        lda aUnknown82E460,x
        bra ++

        +
        lda #3

        +
        sta structRAMStructHeader.Unknown,b,y
        rep #$20
        
        _End
        ply
        plx

        plp
        plb
        rtl

        .databank 0

      aUnknown82E460 ; 82/E460

        .byte 0
        .byte 0
        .byte 1
        .byte 2

      rlUnknown82E464 ; 82/E464

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlAppendNewStructEntry ; 82/E465

        .al
        .autsiz
        .databank ?

        ; lStructPointer1 source
        ; lStructPointer2 dest

        ; Gets the struct size of the destination on its own

        ; Returns clc if success, else return sec

        jsl rlGetRAMStructCurrentStructCount
        inc a
        sta wStructIndex

        jsl rlAddStructEntry
        lda wStructIndex

        rtl

        .databank 0

      rlWriteToFirstStructEntry ; 82/E477

        .al
        .autsiz
        .databank ?

        lda #1
        sta wStructIndex
        jsl rlAddStructEntry
        rtl

        .databank 0

      rlRemoveRAMStructEntry ; 82/E483

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lStructPointer1 = RAM struct entry
        ; lStructPointer2 = RAM struct area to remove it from

        ; Output:
        ; CLC if successful, SEC if not

        phb
        phk
        plb
        jsl rlFindRAMStructEntry
        sta wStructIndex,b
        jsl rlRemoveRAMStructEntryByID
        plb
        rtl

        .databank 0

      rlRemoveRAMStructEntryByID ; 82/E493

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wStructIndex = the entry to remove (1 indexed)
        ; lStructPointer2 = the RAM struct to remove it from

        ; Output:
        ; CLC if successful, SEC if not

        phb
        php
        phk
        plb
        phx
        phy

        ldx lStructPointer2,b
        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.Unknown,b,x
        bit #$0080
        bne _CLC

        lda structRAMStructHeader.StructSize,b,x
        and #$00FF
        sta wStructSize
        sep #$20

        lda wStructIndex
        beq _SEC

        cmp structRAMStructHeader.CurrentStructCount,b,x
        bcc +
        beq _LastEntry
        bra _SEC

        ; The entry we want to remove is somewhere in the middle,
        ; so get the offset of the entry and shift all the following
        ; data over it.
        +
        phx
        lda structRAMStructHeader.CurrentStructCount,b,x
        rep #$20
        and #$00FF
        sec
        sbc wStructIndex
        inc a
        jsr rsGetRAMStructOffset
        sta wStructIndexAlternate

        lda wStructIndex
        jsr rsGetRAMStructOffset
        clc
        adc lStructPointer2
        tax
        clc
        adc wStructSize
        tay

          -
          sep #$20
          lda $0000 + size(structRAMStructHeader),b,y
          sta $0000 + size(structRAMStructHeader),b,x
          rep #$20
          inc y
          inc x
          lda wStructIndexAlternate
          dec a
          sta wStructIndexAlternate
          bne -

        plx

        _LastEntry
        ; If the entry we want to remove is the last one, 
        ; simply reduce the count by one and call it a day.
        rep #$20
        lda structRAMStructHeader.CurrentStructCount,b,x
        dec a
        sta structRAMStructHeader.CurrentStructCount,b,x

        _CLC
        ply
        plx
        plp
        plb
        clc
        rtl

        _SEC
        ; The entry we want to remove either doesnt exist, 
        ; or its ID is above the max struct count.
        rep #$20
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      rlUnknown82E520 ; 82/E520

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        jsl rlFindRAMStructEntry
        inc a
        sta wStructIndex,b

        pha
        lda $054D+1,b
        sta lStructPointer1+1,b
        lda $054D,b
        sta lStructPointer1,b
        jsl rlAddStructEntry
        pla

        plb
        rtl

        .databank 0

      rlUnknown82E53F ; 82/E53F

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        jsl rlFindRAMStructEntry
        sta wStructIndex,b

        pha
        lda $054D+1,b
        sta lStructPointer1+1,b
        lda $054D,b
        sta lStructPointer1,b
        jsl rlAddStructEntry
        pla

        plb
        rtl

        .databank 0

      rlAddStructEntry ; 82/E55D

        .al
        .autsiz
        .databank ?

        ; wStructIndex = struct to write to

        phb
        php

        phk
        plb

        phx
        phy

        ldx lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.Unknown,b,x
        bit #$0080
        bne _CLC

        lda structRAMStructHeader.StructSize,b,x
        and #$00FF
        sta wStructSize

        sep #$20
        lda structRAMStructHeader.CurrentStructCount,b,x
        sta $000552

        cmp structRAMStructHeader.MaxStructCount,b,x
        bcs _SEC

        cmp wStructIndex
        bcc _AppendNewEntry

        ; When adding an entry in the middle, shift all the data after the selected entry back
        ; so the new data can be written to the selected slot

        phx
        rep #$20
        and #$00FF
        sec
        sbc wStructIndex
        inc a
        inc a
        jsr rsGetRAMStructOffset
        sta wStructIndexAlternate

        lda $000552
        and #$00FF
        jsr rsGetRAMStructOffset
        clc
        adc lStructPointer2
        clc
        adc wStructSize
        tay

        clc
        adc wStructSize
        tax

        sep #$20
        
        -
        lda $0003,b,y
        sta $0003,b,x
        dec y
        dec x
        lda wStructIndexAlternate
        dec a
        sta wStructIndexAlternate
        bne -

        plx
        bra +
        
        _AppendNewEntry
        inc a
        sta wStructIndex
        
        +
        rep #$20
        lda wStructIndex
        jsr rsSaveDataToRAMStruct

        lda structRAMStructHeader.CurrentStructCount,b,x
        inc a
        sta structRAMStructHeader.CurrentStructCount,b,x
        
        _CLC
        ply
        plx
        plp
        plb
        clc
        rtl

        _SEC
        rep #$20
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

        ; 82/E5FF

    .endsection Code82E41BSection




    .section Code82E747Section

      rlGetRAMStructCurrentStructCount ; 82/E747

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phy
        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.CurrentStructCount,b,y
        and #$00FF

        ply
        plp
        plb
        rtl

        .databank 0

      rlUnknown82E762 ; 82/E762

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda $0001,b,y
        and #$00FF

        ply
        plp
        plb
        rtl

        .databank 0

      rlUnknown82E77D ; 82/E77D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy
        pha

        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        pla
        sep #$20
        cmp $0000,b,y
        bcc _SEC

        sta $0001,b,y
        rep #$20
        ply
        plp
        plb
        clc
        rtl

        _SEC
        ply
        plp
        plb
        sec
        rtl

        .databank 0

      rlUnknown82E7A6 ; 82/E7A6

        .al
        .autsiz
        .databank ?

        lda #1
        sta wStructIndex
        jsl rlLoadRAMStructDataByIndex
        rtl

        .databank 0

      rlUnknown82E7B2 ; 82/E7B2

        .al
        .autsiz
        .databank ?

        jsl rlGetRAMStructCurrentStructCount
        sta wStructIndex
        jsl rlLoadRAMStructDataByIndex
        rtl

        .databank 0

      rlLoadRAMStructDataByIndex ; 82/E7BF

        .al
        .autsiz
        .databank ?

        ; In:
        ; wStructIndex
        ; lStructPointer2 = pointer to struct header

        phb
        php
        phk
        plb
        phy
        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.CurrentStructCount,b,y
        and #$00FF
        cmp wStructIndex
        bcc +

          lda structRAMStructHeader.StructSize,b,y
          and #$00FF
          sta wStructSize

          lda wStructIndex
          jsr rsLoadDataFromRAMStruct

          ply
          plp
          plb
          clc
          rtl

        +
        ply
        plp
        plb
        sec
        rtl

        .databank 0

      rlUnknown82E7F7 ; 82/E7F7

        .al
        .autsiz
        .databank ?

        lda #1
        sta wStructIndex
        jsl rlGetRAMStructEntryPointerByStructIndex
        rtl

        .databank 0

      rlGetLatestStructEntryPointer ; 82/E803

        .al
        .autsiz
        .databank ?

        jsl rlGetRAMStructCurrentStructCount
        sta wStructIndex
        jsl rlGetRAMStructEntryPointerByStructIndex
        rtl

        .databank 0

      rlGetRAMStructEntryPointerByStructIndex ; 82/E810

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phy

        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.CurrentStructCount,b,y
        and #$00FF
        cmp wStructIndex
        bcc +

          lda structRAMStructHeader.StructSize,b,y
          and #$00FF
          sta wStructSize

          lda lStructPointer2+1
          sta lStructPointer1+1

          lda wStructIndex
          jsr rsGetRAMStructOffset
          clc
          adc #size(structRAMStructHeader)
          clc
          adc lStructPointer2
          sta lStructPointer1

          ply
          plp
          plb
          clc
          rtl

        +
        ply
        plp
        plb
        sec
        rtl

        .databank 0

      rlUnknown82E85D ; 82/E85D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda $0000,b,y
        and #$00FF
        cmp wStructIndex
        bcc _SEC

          lda $0002,b,y
          and #$00FF
          sta wStructSize

          lda wStructIndex
          jsr rsSaveDataToRAMStruct
          ply
          plp
          plb
          clc
          rtl

        _SEC
        ply
        plp
        plb
        sec
        rtl

        .databank 0

      rlFindRAMStructEntry ; 82/E895

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lStructPointer1 = Data to search for
        ; lStructPointer2 = RAM struct to search in

        ; Output:
        ; A = entry ID (1 indexed)

        phb
        php
        phk
        plb
        phx
        phy

        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.CurrentStructCount,b,y
        and #$00FF
        beq _End

          tax
          lda structRAMStructHeader.StructSize,b,y
          and #$00FF
          sta wStructSize

          lda #1
          sta wStructIndexAlternate

            _Loop
            jsr rsCompareRAMStructData
            beq _Found

              tya
              clc
              adc wStructSize
              tay

              lda wStructIndexAlternate
              inc a
              sta wStructIndexAlternate
              dec x
              bne _Loop

        _End
        ply
        plx
        plp
        plb
        lda #0
        rtl

        _Found
        lda wStructIndexAlternate
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsGetRAMStructOffset ; 82/E8EA

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = struct index
        ; wStructSize

        ; Out:
        ; A = offset

        phb
        php

        phk
        plb

        dec a
        bmi _End
        beq _End

        cmp #4
        bcs _Multiply

        cmp #3
        beq ++

        cmp #2
        beq +

        lda wStructSize,b
        bra _End

        +
        lda wStructSize,b
        asl a
        bra _End
        
        +
        lda wStructSize,b
        asl a
        clc
        adc wStructSize,b
        bra _End
        
        _Multiply
        phx
        xba
        sta $0558,b

        lda wStructSize,b
        sta $055A,b

        lda #0
        ldx #8

        -
        asl a
        asl $0558,b
        bcc +

        clc
        adc $055A,b
        
        +
        dec x
        bne -

        plx

        _End
        plp
        plb
        rts

        .databank 0

      rsSaveDataToRAMStruct ; 82/E939

        .al
        .autsiz
        .databank ?

        ; A = struct index
        ; wStructSize
        ; lStructPointer1 = data source, 1,2 or 3 bytes or pointer 
        ; lStructPointer2 = dest struct pointer

        php
        phy

        jsr rsGetRAMStructOffset

        clc
        adc lStructPointer2
        tay

        ; If the data to write is 4 bytes of more, do it indirect via a pointer
        lda wStructSize
        cmp #4
        bcs _Indirect

        ; Else the data is directly in the long regiser
        cmp #3
        beq ++

        cmp #2
        beq +

        sep #$20
        lda lStructPointer1
        sta $0004,b,y
        rep #$20
        bra _End
        
        +
        lda lStructPointer1
        sta $0004,b,y
        bra _End
        
        +
        lda lStructPointer1
        sta $0004,b,y
        lda lStructPointer1+1
        sta $0004+1,b,y
        bra _End

        _Indirect
        lda wStructSize
        pha
        lda lR38
        pha
        lda lR38+1
        pha

        phx
        lda lStructPointer1
        sta lR38
        lda lStructPointer1+1
        sta lR38+1

        sep #$20
        tyx
        ldy #0
        
        -
        lda [lR38],y
        sta $0004,b,x
        inc y
        inc x
        lda wStructSize
        dec a
        sta wStructSize
        bne -

        rep #$20
        plx

        pla
        sta lR38+1
        pla
        sta lR38
        pla
        sta wStructSize
        
        _End
        ply
        plp
        rts

        .databank 0

      rsLoadDataFromRAMStruct ; 82/E9BE

        .al
        .autsiz
        .databank ?

        ; A = struct index
        ; wStructSize
        ; lStructPointer1 = dest struct pointer
        ; lStructPointer2 = data source, 1,2 or 3 bytes or pointer 

        php
        phx
        phy

        jsr rsGetRAMStructOffset

        clc
        adc lStructPointer2
        tay

        lda wStructSize
        cmp #4
        bcs _Indirect

        cmp #3
        beq ++

        cmp #2
        beq +

        sep #$20
        lda $0004,b,y
        sta lStructPointer1
        rep #$20
        bra _End
        
        +
        lda $0004,b,y
        sta lStructPointer1
        bra _End
        
        +
        lda $0004,b,y
        sta lStructPointer1
        lda $0004+1,b,y
        sta lStructPointer1+1
        bra _End
        
        _Indirect
        lda wStructSize
        pha
        lda lR38
        pha
        lda lR38+1
        pha

        lda lStructPointer1
        sta lR38
        lda lStructPointer1+1
        sta lR38+1

        sep #$20
        tyx
        ldy #0
        
        -
        lda $0004,b,x
        sta [lR38],y
        inc x
        inc y
        lda wStructSize
        dec a
        sta wStructSize
        bne -

        rep #$20

        pla
        sta lR38+1
        pla
        sta lR38
        pla
        sta wStructSize
        
        _End
        ply
        plx
        plp
        rts

        .databank 0

      rsCompareRAMStructData ; 82/EA43

        .al
        .autsiz
        .databank ?

        ; Input:
        ; Y = pointer to some RAM struct entry
        ; wStructSize
        ; Filled lStructPointer1

        ; Output:
        ; A = 0 if data matches, else returns 1

        lda wStructSize
        cmp #4
        bcs _Dynamic

        cmp #3
        beq _Long

        cmp #2
        beq _Word

        ; Byte
        lda $0004,b,y
        and #$00FF
        cmp lStructPointer1
        beq _Equal
        bra _Unequal
        
        _Word
        lda $0004,b,y
        cmp lStructPointer1
        beq _Equal
        bra _Unequal

        _Long
        lda $0004,b,y
        cmp lStructPointer1
        bne _Unequal

        lda $0004+1,b,y
        cmp lStructPointer1+1
        beq _Equal
        bra _Unequal
        
        _Dynamic
        phx
        phy
        lda wStructSize
        pha
        lda lR38
        pha
        lda lR38+1
        pha

        lda lStructPointer1
        sta lR38
        lda lStructPointer1+1
        sta lR38+1
        sep #$20
        tyx
        ldy #0
        
          _Loop
          lda $0004,b,x
          cmp [lR38],y
          bne +

            inc x
            inc y
            lda wStructSize
            dec a
            sta wStructSize
            bne _Loop

        rep #$20
        pla
        sta lR38+1
        pla
        sta lR38
        pla
        sta wStructSize
        ply
        plx
        bra _Equal

        +
        rep #$20
        pla
        sta lR38+1
        pla
        sta lR38
        pla
        sta wStructSize
        ply
        plx

        _Unequal
        lda #1
        rts

        _Equal
        lda #0
        rts 

        .databank 0

        ; 82/EADE


























    .endsection Code82E747Section


    .section Code82ECB9Section

      rlBuildRAMAreaHeaderAndGuidingEntry ; 82/ECB9

        .al
        .autsiz
        .databank ?

        ; A   = area size
        ; lR18 = ram area pointer
        ; wStructIndex = ?

        phb
        php

        phk
        plb

        tay
        phy

        lda wR0
        pha

        sty wR0
        jsl rlLoadRAMAreaPointer

        ldy lR18

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        sep #$20
        lda wStructIndex,b
        beq +

          lda #$80

        +
        sta structRAMAreaHeader.Flags,b,y
        bne +

        lda wUnknown00056B
        bra ++

        +
        lda #0

        +
        sta structRAMAreaHeader.Unknown2,b,y
        rep #$20

        lda wR0
        clc
        adc lRAMAreaPointer
        sta structRAMAreaHeader.AreaEnd,b,y

        lda wR0
        sec
        sbc #size(structRAMAreaHeader)
        sta wR0
        sta structRAMAreaHeader.AreaSize,b,y

        phy

        tya
        clc
        adc #size(structRAMAreaHeader)
        tay

        jsr rsFreeRAMAreaEntryHeader
        jsr rsSaveOffsetToRAMAreaEntry

        ply

        jsr rsUnknown82F143
        sta structRAMAreaHeader.Unknown3,b,y

        pla
        sta wR0

        ply
        plp
        plb
        rtl

        .databank 0

      rlUnknown82ED1D ; 82/ED1D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        plp
        plb
        rtl

        .databank 0

      rlUnknown82ED24 ; 82/ED24

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy
        tay

        lda $00
        pha
        lda $02
        pha
        lda $04
        pha

        sty $00
        lda $0565,b
        ora $0566,b
        beq _EDB1

        lda $00
        clc
        adc #6
        sta $00

        ldy $0565,b

        sep #$20
        lda $0565+2,b
        pha
        rep #$20
        plb

        jsr $82F19A
        bcs _EDB6

        sta $02
        sep #$20
        lda $0000,b,y
        ora #$20
        sta $0000,b,y
        rep #$20

        jsr $82F032
        tay
        jsr $82F1EA

        lda $0001,b,y
        sec
        sbc $00
        pha
        jsr $82F00C
        jsr $82F022
        pla
        pha
        cmp #7
        bcs +

        pla
        clc
        adc $0001,b,y
        sta $0001,b,y
        bra ++
        
        +
        jsr $82F086
        tay
        jsr rsFreeRAMAreaEntryHeader
        pla
        sta $0001,b,y
        
        +
        phk
        plb
        lda $000566
        sta $3A

        lda $02
        sta $39
        ldy #0
        
        -
        pla
        sta $04
        pla
        sta $02
        pla
        sta $00

        tya
        ply
        plp
        plb
        rtl

        _EDB1
        ldy #$FFFF
        bra -

        _EDB6
        ldy #$FFFE
        bra -

        .databank 0

        ; 82/EDBB

    .endsection Code82ECB9Section




    .section Code82EDE7Section


      rlAllocateRAMArea ; 82/EDE7

        .al
        .autsiz
        .databank ?

        ; This reserves space in a RAM area with the size of a specified RAM struct entry + the RAM area entry header

        ; Input:
        ; wR0 = size
        ; lRAMAreaPointer = RAM pointer

        ; Output:
        ; lR25 = RAM entry

        phb
        php

        phk
        plb

        phy
        tay

        lda wR0
        pha
        lda wR2
        pha

        sty wR0

        ; Checks if pointer exists
        lda lRAMAreaPointer,b
        ora lRAMAreaPointer+1,b
        beq _End

        lda wR0
        clc
        adc #size(structRAMAreaEntryHeader)
        sta wR0

        ldy lRAMAreaPointer,b

        sep #$20
        lda lRAMAreaPointer+2,b
        pha
        rep #$20
        plb

        sep #$20
        lda structRAMAreaHeader.Flags,b,y
        ora #$20
        sta structRAMAreaHeader.Flags,b,y
        rep #$20

        ; Check for free entry
        jsr rsUnknown82F032

        ; Load max size, subtract requested size
        tay
        lda structRAMAreaEntryHeader.Offset,b,y
        sec
        sbc wR0
        sta structRAMAreaEntryHeader.Offset,b,y

        cmp #7
        bcs +

          clc
          adc wR0
          sta wR0
          bra ++

        +
        jsr rsGetRAMAreaEntryOffset
        tay

        +
        jsr rsAddNewRAMAreaEntry
        jsr rsSaveOffsetToRAMAreaEntry

        phk
        plb

        lda lRAMAreaPointer+1,b
        sta lR25+1
        tya
        clc
        adc #size(structRAMAreaEntryHeader)
        sta lR25
        
        _End
        ldy #0

        pla
        sta wR2
        pla
        sta wR0

        tya
        ply

        plp
        plb
        rtl

        .databank 0

      rlRemoveRAMAreaEntry ; 82/EE5C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR25 = pointer to a RAM area entry
        ; filled lRAMAreaPointer 

        phb
        php
        phk
        plb

        sep #$20
        lda lRAMAreaPointer+2,b
        pha
        rep #$20
        plb

        jsr rsFreeSpecifiedRAMAreaEntryHeader
        jsr rsCombineAdjacentFreeRAMAreaEntries

        plp
        plb
        rtl

        .databank 0

      rlCopyDataToRAMArea ; 82/EE72

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = size
        ; X = source
        ; lR25 = destination

        phb
        php
        phk
        plb
        phx
        phy

        dec a
        pha
        clc
        adc $0000,b,x
        pha

        sep #$20
        lda $0000+2,b,x
        pha
        rep #$20
        plb

        plx
        ply

        sep #$20
        
          -
          lda $0000,b,x
          sta [lR25],y
          dec x
          dec y
          bpl -

        rep #$20
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown82EE9C ; 82/EE9C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        dec a
        pha
        clc
        adc $0000,b,x
        pha

        sep #$20
        lda $0000+2,b,x
        pha
        rep #$20
        plb

        lda [lR25]
        sta lR24
        inc lR25
        lda [lR25]
        sta lR24+1
        dec lR25
        plx
        ply

        sep #$20

          -
          lda $0000,b,x
          sta [lR24],y
          dec x
          dec y
          bpl -

        rep #$20
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown82EED2 ; 82/EED2

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        phy

        lda wR1
        pha
        lda wR2
        pha
        lda wR3
        pha
        lda wR4
        pha

        ldy lRAMAreaPointer,b

        sep #$20
        lda lRAMAreaPointer+2,b
        pha
        rep #$20
        plb

        sep #$20
        lda structRAMAreaHeader.Flags,b,y
        ora #$40
        sta structRAMAreaHeader.Flags,b,y
        rep #$20

        lda structRAMAreaHeader.AreaEnd,b,y
        sta $04

        tya
        clc
        adc #size(structRAMAreaHeader)
        tay

        _Loop
        lda structRAMAreaEntryHeader.Flags,b,y
        bit #$0080
        beq _EF48

          jsr rsGetRAMAreaEntryOffset
          tax
          lda $0000,b,x
          bit #$0040
          bne _EF48

          lda $0003,b,x
          sta wR1
          jsr rsUnknown82F1EA

          lda $0001,b,y
          sta wR4
          lda $0001,b,x
          sta wR3
          
          -
          sep #$20
          lda $0000,b,x
          sta $0000,b,y
          rep #$20

          inc x
          inc y
          dec wR3
          bne -

          jsr rsFreeRAMAreaEntryHeader

          lda wR4
          sta $0001,b,y
          jsr rsCombineAdjacentFreeRAMAreaEntries

        _EF48
        jsr rsGetRAMAreaEntryOffset
        tay
        cpy wR2
        bcc _Loop

        pla
        sta wR4
        pla
        sta wR3
        pla
        sta wR2
        pla
        sta wR1

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlSaveRAMAreaPointer ; 82/EF61

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        lda lRAMAreaPointer+1,b
        sta lR18+1
        lda lRAMAreaPointer,b
        sta lR18

        plp
        plb
        rtl

        .databank 0

      rlLoadRAMAreaPointer ; 82/EF72

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        lda lR18+1
        sta lRAMAreaPointer+1,b
        lda lR18
        sta lRAMAreaPointer,b

        plp
        plb
        rtl

        .databank 0

      rlBufferAndLoadNewRAMAreaPointer ; 82/EF83

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        lda lRAMAreaPointer+1,b
        sta lRAMAreaPointerBuffer+1,b
        lda lRAMAreaPointer,b
        sta lRAMAreaPointerBuffer,b

        lda lR18+1
        sta lRAMAreaPointer+1,b
        lda lR18
        sta lRAMAreaPointer,b

        plp
        plb
        rtl

        .databank 0

      rlLoadBufferedRAMAreaPointer ; 82/EFA0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda lRAMAreaPointerBuffer,b
        ora lRAMAreaPointerBuffer+1,b
        beq +

          lda lRAMAreaPointerBuffer+1,b
          sta lRAMAreaPointer+1,b
          lda lRAMAreaPointerBuffer,b
          sta lRAMAreaPointer,b

        +
        plp
        plb
        rtl

        .databank 0

      rlUnknown82EFBB ; 82/EFBB

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        ldy lRAMAreaPointer,b

        sep #$20
        lda lRAMAreaPointer+2,b
        pha
        rep #$20
        plb

        lda $0000,b,y
        and #$00FF
        pha
        sep #$20
        and #$7F
        sta $0000,b,y
        rep #$20

        pla
        ply
        plp
        plb
        rtl

        .databank 0

      rsFreeRAMAreaEntryHeader ; 82/EFE1

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #$80
        sta structRAMAreaEntryHeader.Flags,b,y
        rep #$20
        lda #0
        sta structRAMAreaEntryHeader.BaseTable+1,b,y
        sta structRAMAreaEntryHeader.BaseTable,b,y
        rts

        .databank 0

      rsAddNewRAMAreaEntry ; 82/EFF4

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #$40
        sta structRAMAreaEntryHeader.Flags,b,y
        rep #$20

        lda lRAMAreaPointer+1
        sta structRAMAreaEntryHeader.BaseTable+1,b,y
        lda lRAMAreaPointer
        sta structRAMAreaEntryHeader.BaseTable,b,y
        rts

        .databank 0

      rsUnknown82F00C ; 82/F00C

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #0
        sta $0000,b,y
        rep #$20

        lda $000566
        sta $0003+1,b,y
        lda wR1
        sta $0003,b,y
        rts

        .databank 0

      rsSaveOffsetToRAMAreaEntry ; 82/F022

        .al
        .autsiz
        .databank ?

        lda wR0
        sta structRAMAreaEntryHeader.Offset,b,y
        rts

        .databank 0

      rsUnknown82F028 ; 82/F028

        .al
        .autsiz
        .databank ?

        lda wR0
        clc
        adc #6
        sta $0001,b,y
        rts

        .databank 0

      rsUnknown82F032 ; 82/F032

        .al
        .autsiz
        .databank ?

        jsr rsCheckIfEntryFitsInRAMArea
        bcs +
        
        -
        rts
        
        ; All slots are filled
        +
        jsl rlUnknown82EED2
        jsr rsCheckIfEntryFitsInRAMArea
        bcs +
        bra -

        +
        sep #$20
        lda #$3F
        sta CGADSUB
        lda #$32
        sta COLDATA
        lda #$C0
        sta COLDATA
        rep #$20
        .byte 0

        .databank 0

      rsCheckIfEntryFitsInRAMArea ; 82/F05A

        .al
        .autsiz
        .databank ?

        ; wR0 = size

        phy
        lda structRAMAreaHeader.AreaEnd,b,y
        sta wR2

        tya
        clc
        adc #size(structRAMAreaHeader)
        tay

        -
        lda structRAMAreaEntryHeader.Flags,b,y
        bit #$0080
        beq +

        ; Is a guiding entry
        lda structRAMAreaEntryHeader.Offset,b,y
        cmp wR0
        bcs ++

        ; Entry isnt a guiding one, or space isnt enough for entry
        +
        tya
        clc
        adc structRAMAreaEntryHeader.Offset,b,y
        tay
        cpy wR2
        bcc -

        ; Entry doesnt fit
        ply
        sec
        rts

        ; Entry fits
        +
        tya
        ply
        clc
        rts

        .databank 0

      rsGetRAMAreaEntryOffset ; 82/F086

        .al
        .autsiz
        .databank ?

        ; Input:
        ; Y = RAM are entry

        tya
        clc
        adc structRAMAreaEntryHeader.Offset,b,y
        rts

        .databank 0

      rsFreeSpecifiedRAMAreaEntryHeader ; 82/F08C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR25 = pointer to a RAM area entry
        ; filled lRAMAreaPointer 

        phb
        php
        phk
        plb
        phy
        lda wR2
        pha

        lda lR25
        sec
        sbc #size(structRAMAreaEntryHeader)
        sta wR2

        lda lRAMAreaPointer,b
        ora lRAMAreaPointer+1,b
        beq _End

          sep #$20
          lda lRAMAreaPointer+2,b
          cmp lR25+2
          bne _End

            rep #$20
            lda wR2
            cmp lRAMAreaPointer,b
            bcc _End

              ldy lRAMAreaPointer,b

              sep #$20
              lda lRAMAreaPointer+2,b
              pha
              rep #$20
              plb

              lda structRAMAreaHeader.AreaEnd,b,y
              dec a
              cmp wR2
              bcc _End

                ldy wR2
                jsr rsFreeRAMAreaEntryHeader

                lda lRAMAreaPointer
                tay
                sep #$20
                lda structRAMAreaHeader.Flags,b,y
                ora #$10
                sta structRAMAreaHeader.Flags,b,y

        _End
        rep #$20
        ldy #0

        pla
        sta wR2
        tya
        ply
        plp
        plb
        rts

        .databank 0

      rsCombineAdjacentFreeRAMAreaEntries ; 82/F0EB

        .al
        .autsiz
        .databank ?

        phx
        phy
        lda wR2
        pha

        lda lRAMAreaPointer
        tay
        lda structRAMAreaHeader.AreaEnd,b,y
        sta wR2

        tya
        clc
        adc #size(structRAMAreaHeader)
        tay

        ; First check for any entry that is marked as free
        _OuterLoop
        lda structRAMAreaEntryHeader.Flags,b,y
        bit #$0080
        beq +

          ; Now check if that entry points within the RAM area
          _InnerLoop
          jsr rsGetRAMAreaEntryOffset
          tax
          cpx wR2
          bcs _End

            ; It is, check if the entry afterwards also is marked as free
            lda structRAMAreaHeader.Flags,b,x
            bit #$0080
            beq +

              ; Add the offset of the following entry to the current one
              lda structRAMAreaEntryHeader.Offset,b,y
              clc
              adc structRAMAreaEntryHeader.Offset,b,x
              sta structRAMAreaEntryHeader.Offset,b,y

              ; And remove the following entry
              lda #0
              sta structRAMAreaEntryHeader.Flags,b,x
              sta structRAMAreaEntryHeader.Offset,b,x
              sta structRAMAreaEntryHeader.BaseTable+1,b,x
              sta structRAMAreaEntryHeader.BaseTable,b,x
              bra _InnerLoop

            +
            tya
            clc
            adc structRAMAreaEntryHeader.Offset,b,y
            tay
            cpy wR2
            bcc _OuterLoop

        _End
        pla
        sta wR2

        ply
        plx
        rts

        .databank 0

      rsUnknown82F143 ; 82/F143

        .al
        .autsiz
        .databank ?

        phy
        lda wR0
        pha
        lda wR3
        pha

        lda structRAMAreaHeader.Unknown2,b,y
        and #$00FF
        beq _End

          sta wR3
          asl a
          asl a
          clc
          adc #3
          sta wR0
          jsl rlAllocateRAMArea

          ldy lR25
          lda #0
          sta $0000,b,y

          sep #$20
          lda wR3
          sta $0002,b,y
          rep #$20

          ldx wR3

          -
          sep #$20
          lda #$80
          sta $0006,b,y
          rep #$20

          tya
          clc
          adc #4
          tay
          dec x
          bne -

          pla
          sta wR3
          pla
          sta wR0

          lda lR25
          ply
          rts

        _End
        pla
        sta wR3
        pla
        sta wR0

        lda #0
        ply
        rts

        .databank 0

      rlUnknown82F19A ; 82/F19A

        .al
        .autsiz
        .databank ?

        phx
        phy
        lda $0006,b,y
        beq _SEC

          tay

            _OuterLoop
            phy
            lda $0002,b,y
            and #$00FF
            beq _Next

              tax
              tya
              clc
              adc #3
              tay
              
                _InnerLoop
                lda $0003,b,y
                bit #$0080
                bne _CLC

                  tya
                  clc
                  adc #4
                  tay
                  dec x
                  bne _InnerLoop

            _Next
            ply
            lda $0000,b,y
            beq +

              tay
              bra _OuterLoop

          +
          tyx
          lda lRAMAreaPointer
          tay
          jsr rsUnknown82F143
          sta $0000,b,x
          clc
          adc #3
          ply
          plx
          clc
          rts

          _CLC
          tya
          ply
          ply
          plx
          clc
          rts

        _SEC
        ply
        plx
        sec
        rts

        .databank 0

      rsUnknown82F1EA ; 82/F1EA

        .al
        .autsiz
        .databank ?

        phx
        ldx wR1
        sep #$20
        lda #0
        sta $0003,b,x
        rep #$20

        lda $00566
        sta $0001,b,x
        tya
        clc
        adc #6
        sta $0000,b,x
        plx
        rts

        .databank 0

        ; 82/F207

    .endsection Code82EDE7Section


    .section Code82F4DEESection

      rlGetUNITGroupPointer ; 82/F4DE

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = UNIT group ID
        ; lR18 = UNIT data pointer

        ; Output:
        ; A = UNIT group entry pointer

        php
        phy
        phb

        dec a
        asl a
        clc
        adc lR18
        tay

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        lda $0000,b,y
        plb
        clc
        adc lR18

        ply
        plp
        rtl

        .databank 0

        ; 82/F4F9

    .endsection Code82F4DEESection



    .section Code82F567Section

      rlAddOffsetTableEntry ; 82/F567

        .al
        .autsiz
        .databank ?

        ; At the given desination, builds a structure of a word offset to some data, and writes the source data there.
        ; New entries put their offset behind the last current offset, recalcs all the other offsets to match the new data, 
        ; and then adds its own data at the end.

        ; wR0  = size of data to write
        ; lR18 = destination (eg aFactionArea)
        ; lR19 = data source pointer

        phb
        php
        phk
        plb
        phy

        lda wR0
        pha

        ldy lR18

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        ; Check for existing offset
        lda $0000,b,y
        bne +

          ; If there is no offset, set it to minimal possible offset
          lda #2
          sta $0000,b,y
          lda #0
          bra ++

        +
        lsr a
        dec a
        pha
        sta $02
        lda #2
        sta wR0
        
        -
        lda $02
        jsl rlShiftOffsetTableEntry
        dec $02
        bne -

        pla
        asl a
        
        +
        clc
        adc lR18
        tay
        lda $0000,b,y
        clc
        adc #2
        sta $0000,b,y
        clc
        adc lR18
        sta lBlockCopyDestination,b

        sep #$20
        lda lR18+2
        sta lBlockCopyDestination+2,b
        rep #$20

        lda lR19+1
        sta lBlockCopySource+1,b
        lda lR19
        sta lBlockCopySource,b

        pla
        sta wR0
        sta wBlockCopySize,b

        jsl rlBlockCopyMVNByRAM

        lda $0000,b,y
        clc
        adc wR0
        sta $0002,b,y

        ply
        plp
        plb
        rtl

        .databank 0

      rlShiftOffsetTableEntry ; 82/F5DD

        .al
        .autsiz
        .databank ?

        ; This shifts data in a table back and adjusts all offsets to match the new locations

        ; A    = index of the offset to shift
        ; wR0  = value to shift the entries by
        ; lR18 = pointer to offset table

        phb
        php

        phk
        plb

        phy

        ldy wR1
        phy

        dec a
        asl a
        clc
        adc lR18
        tay

        sep #$20
        lda lR18+2
        sta lBlockCopySource+2,b
        sta lBlockCopyDestination+2,b
        pha
        rep #$20
        plb

        ; get last entries size

        lda $0002,b,y
        sec
        sbc $0000,b,y
        sta wR1

        lda wR0
        bpl +

          ; shift the entries backwards
          lda $0000,b,y
          clc
          adc lR18
          sta lBlockCopySource,b
          clc
          adc wR0
          sta lBlockCopyDestination,b
          lda wR1
          sta wBlockCopySize,b
          jsl rlBlockCopyMVNByRAM
          bra ++

          ; shift the entries forwards
          +
          lda $0002,b,y
          dec a
          clc
          adc lR18
          sta lBlockCopySource,b
          clc
          adc wR0
          sta lBlockCopyDestination,b
          lda wR1
          sta wBlockCopySize,b
          jsl rlBlockCopyMVPByRAM

        +
        lda $0000,b,y
        clc
        adc wR0
        sta $0000,b,y

        ply
        sty wR1

        ply
        plp
        plb
        rtl

        .databank 0

      rlUnknown82F649 ; 82/F649

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        sta wR3

        lda wR0
        sta wR4

        ldy lR18

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        lda $0000,b,y
        lsr a
        dec a
        sta wR1
        sta wR2

        lda #2
        sta wR0
        
          -
          lda wR2
          jsl rlShiftOffsetTableEntry
          dec wR2
          bne -

        lda wR1
        asl a
        clc
        adc lR18
        tay
        lda $0000,b,y
        clc
        adc #2
        sta $0000,b,y

        lda wR1
        inc a
        sec
        sbc wR3
        sta wR2
        
          -
          lda $0000,b,y
          sta $0002,b,y
          dec y
          dec y
          dec wR2
          bpl -

        lda wR1
        inc a
        sta wR2
        lda wR4
        sta wR0
        
          -
          lda wR2
          jsl rlShiftOffsetTableEntry
          dec wR2
          lda wR2
          cmp wR3
          bne -

        lda wR1
        asl a
        clc
        adc lR18
        tay
        lda $0002,b,y
        clc
        adc wR4
        sta $0002,b,y

        lda wR3
        dec a
        asl a
        clc
        adc lR18
        tay
        lda $0000,b,y
        clc
        adc lR18
        sta lBlockCopyDestination,b

        sep #$20
        lda lR18+2
        sta lBlockCopyDestination+2,b
        rep #$20

        lda lR19+1
        sta lBlockCopySource+1,b
        lda lR19
        sta lBlockCopySource,b
        lda wR4
        sta wBlockCopySize,b
        jsl rlBlockCopyMVNByRAM

        ply
        plp
        plb
        rtl

        .databank 0

      rlUpdateOffsetTable ; 82/F6F3

        .al
        .autsiz
        .databank ?

        ; If the size of an entry in an offset table changed, this shifts the entries after
        ; a specified offset ID around to account for it.

        ; A    = offset ID to start shifting
        ; wR0  = new size of last entry that doesn't get shifted
        ; lR18 = offset table pointer
        ; lR19 = last entry data replacement

        phb
        php
        phk
        plb
        phy

        sta wR3
        dec a
        asl a
        clc
        adc lR18
        tay

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        ; first offset in Y

        lda $0002,b,y
        sec
        sbc $0000,b,y
        sta wR4

        ; wR4 now holds the current length of the last, non shifting entry

        lda wR0
        pha
        sec
        sbc wR4
        sta wR4
        beq _FillWithReplacement

        ; wR4 now holds the shift amount
        ; branch if the offset ID to shift, is the free space offset

        ldy lR18
        lda $0000,b,y
        lsr a
        dec a
        pha
        cmp wR3
        beq _DoneShifting

        sta wR1 ; index of the free space offset

        lda wR4
        bmi +

          ; shift all entries forward
          lda wR4
          sta wR0

          -
          lda wR1
          jsl rlShiftOffsetTableEntry
          dec wR1

          lda wR1
          cmp wR3
          bne -
          bra _DoneShifting

        ; shift all entries backwards
        +
        lda wR3
        inc a
        sta wR2
        lda wR4
        sta wR0
        
          -
          lda wR2
          jsl rlShiftOffsetTableEntry
          inc wR2

          lda wR2
          cmp wR1
          bcc -
          beq -

        _DoneShifting
        ; Update the free space offset 

        pla
        asl a
        clc
        adc lR18
        tay
        lda $0000,b,y
        clc
        adc wR4
        sta $0000,b,y

        lda lR19
        ora lR19+1
        bne _FillWithReplacement

          pla
          bra _End

        _FillWithReplacement
        lda wR3 ; free space ID
        dec a
        asl a
        clc
        adc lR18
        tay
        lda $0000,b,y
        clc
        adc lR18
        sta lBlockCopyDestination,b
        sep #$20
        lda lR18+2
        sta lBlockCopyDestination+2,b
        rep #$20

        lda lR19+1
        sta lBlockCopySource+1,b
        lda lR19
        sta lBlockCopySource,b

        pla
        sta wBlockCopySize,b
        jsl rlBlockCopyMVNByRAM
        
        _End
        ply
        plp
        plb
        rtl

        .databank 0

        ; 82/F7A2

    .endsection Code82F567Section


    .section Code82F866Section

      rlSetParentsPermanentFlags ; 82/F866

        .al
        .autsiz
        .databank ?

        ; Run at the start of ch6

        phb
        phx
        phy
        phk
        plb
        ldx #Sigurd
        
          _Loop
          txa

          jsl rlGetUnitRAMDataPointerByID
          bcs _NotFound

            txa
            clc
            adc #40
            jsl rlSetPermanentEventFlag

            jsl rlGetSelectedUnitStates
            and #UnitStateDead
            bne _Dead

            txa
            clc
            adc #64
            jsl rlSetPermanentEventFlag
            bra _Next

          _NotFound
          txa
          clc
          adc #40
          jsl rlUnsetPermanentEventFlag

          _Dead
          txa
          clc
          adc #64
          jsl rlUnsetPermanentEventFlag

          _Next
          inc x
          cpx #Seliph
          bne _Loop

        ply
        plx
        plb
        rtl

        .databank 0

      rlEvaluateEpilogueEndings ; 82/F8AE

        .al
        .autsiz
        .databank ?

        ; Evaluates what characters get what ending scenes

        phb
        phx
        phy
        phk
        plb
        ldx #0
        txa
        sep #$20

          -
          sta aEpilogueMainCharacters,x
          sta aEpilogueSupportingCharacters,x
          sta aEpilogueChosenDialogueID,x
          inc x
          cpx #50
          bne -

        rep #$20
        lda #$FFFF
        sta aEpilogueUnitProcessedFlags

        jsr rsEpilogueGetParentsEpilogueStates
        jsr rsEpilogueGetChildrenEpilogueStates
        jsr rsEvaluateEpiloguePriorities
        jsr rsEvaluateEpilogueDialogueIDs

        jsr rsUnknown82FDC1
        jsr rsUnknown82FE07
        jsr rsUnknown82FE41
        ply
        plx
        plb
        rtl

        .databank 0

      rsEpilogueGetParentsEpilogueStates ; 82/F8ED

        .al
        .autsiz
        .databank ?

        ldx #2
        
        _Loop
        lda #$FFFF
        sta aEpilogueUnitProcessedFlags,x
        txa
        lsr a
        adc #40
        jsl rlCheckPermanentEventFlagSet
        bcs _ParentRecruited

          lda #($8000 | $4000)
          sta aEpilogueUnitStates,x
          bra _Next

        _ParentRecruited
        txa
        lsr a
        adc #64
        jsl rlCheckPermanentEventFlagSet
        bcc _ParentDied

          lda #0
          sta aEpilogueUnitStates,x
          bra _Next

        _ParentDied
        lda #$8000
        sta aEpilogueUnitStates,x

        _Next
        inc x
        inc x
        cpx #50
        bne _Loop

        ldx #0

        ; For all parents, save their partners in each others states.
        _Loop2
        lda _F96C,x
        and #$00FF
        beq _End

        jsl rlGetUnitRAMDataPointerByID
        bcs +

          phx
          jsl rlGetSelectedUnitFatherID
          pha

          asl a
          tax
          jsl rlGetSelectedUnitMotherID
          ora aEpilogueUnitStates,x
          ora #$2000
          sta aEpilogueUnitStates,x
          and #$00FF
          asl a
          tax

          pla
          ora aEpilogueUnitStates,x
          ora #$2000
          sta aEpilogueUnitStates,x
          plx

        +
        inc x
        bra _Loop2

        _End
        rts

        .databank 0

        _F96C ; 82/F96C

        ; Seems kind of like Gen2 recruitment order but Lester doesnt fit.

        .byte Seliph
        .byte Leif
        .byte Diarmuid
        .byte Scathach
        .byte Fee
        .byte Arthur
        .byte Lene
        .byte Lester
        .byte Patty
        .byte 0

      rsEpilogueGetChildrenEpilogueStates ; 82/F976

        .al
        .autsiz
        .databank ?

        ldx #Seliph * 2
        
        _Loop
        lda #$FFFF
        sta aEpilogueUnitProcessedFlags,x
        txa
        lsr a
        jsl rlGetUnitRAMDataPointerByID
        bcc _UnitExists

          -
          lda #($8000 | $4000)
          sta aEpilogueUnitStates,x
          bra _Next

        _UnitExists
        jsl rlGetSelectedUnitFactionSlot
        cmp #FS_Player
        bne -

        jsl rlGetSelectedUnitStates
        and #UnitStateDead
        beq +

          lda #$8000

        +
        sta aEpilogueUnitStates,x
        bne _Next

          jsl rlGetSelectedUnitLoverGenerationID
          cmp #0
          beq _Next

            jsl rlFindCharacterByGenerationID
            bcc +

              brk

            +
            jsl rlGetSelectedUnitCharacterID
            ora aEpilogueUnitStates,x
            ora #$2000
            sta aEpilogueUnitStates,x

        _Next
        inc x
        inc x
        cpx #64 * 2
        bne _Loop

        rts

        .databank 0

      rsEvaluateEpiloguePriorities ; 82/F9D3

        .al
        .autsiz
        .databank ?

        ldx #0

          _Loop
          lda aEpiloguePriorityList+2,x
          and #$00FF
          sta wR1
          lda aEpiloguePriorityList+1,x
          and #$00FF
          sta wR0
          lda aEpiloguePriorityList,x
          and #$00FF
          cmp #$00FF
          beq _End

            phx
            asl a
            tax
            jsr (aEpiloguePriorityRoutines,x)

            plx
            inc x
            inc x
            inc x
            bra _Loop

        _End
        rts

        .databank 0

      aEpiloguePriorityRoutines .include "../TABLES/SYSTEM/EpiloguePriorityRoutines.csv.asm" ; 82/FA01

      aEpiloguePriorityList ; 82/FA1B

        .byte EPrio_StartRegion,        Seliph,     SeliphEpilogueID
        .byte EPrio_Main,               Julia,      JuliaEpilogueID

        .byte EPrio_StartRegion_IfSon,  Jamke,      JamkesSonEpilogueID
        .byte EPrio_Main_IfDaughter,    Jamke,      JamkesDaughterEpilogueID

        .byte EPrio_StartRegion_IfSon,  Lex,        LexSonEpilogueID
        .byte EPrio_Main_IfDaughter,    Lex,        LexDaughterEpilogueID
        .byte EPrio_FollowUp2,          Iuchar,     IucharEpilogueID
        .byte EPrio_FollowUp2,          Iucharba,   IucharbaEpilogueID

        .byte EPrio_StartRegion_IfSon,  Claud,      ClaudsSonEpilogueID
        .byte EPrio_Main_IfDaughter,    Claud,      ClaudsDaughterEpilogueID

        .byte EPrio_StartRegion_IfSon,  Azelle,     AzellesSonEpilogueID
        .byte EPrio_Main_IfDaughter,    Azelle,     AzellesDaughterEpilogueID

        .byte EPrio_StartRegion_IfSon,  Lewyn,      LewnysSonEpilogueID
        .byte EPrio_Main_IfDaughter,    Lewyn,      LewnysDaughterEpilogueID

        .byte EPrio_StartRegion,        Shannan,    ShannanEpilogueID
        .byte EPrio_FollowUp1,          Scathach,   ScathachEpilogueID
        .byte EPrio_Main_NoPriority2,   Larcei,     LarceiEpilogueID

        .byte EPrio_StartRegion,        Leif,       LeifEpilogueID
        .byte EPrio_FollowUp1,          Altena,     AltenaEpilogueID

        .byte EPrio_StartRegion,        Ares,       AresEpilogueID
        .byte EPrio_FollowUp1,          Diarmuid,   DiarmuidEpilogueID
        .byte EPrio_Main_NoPriority2,   Nanna,      NannaEpilogueID

        .byte EPrio_StartRegion,        Oifey,      OifeyEpilogueID

        .byte EPrio_StartRegion,        Febail,     FebailEpilogueID
        .byte EPrio_Main_NoPriority1,   Patty,      PattyEpilogueID
        .byte EPrio_FollowUp2,          Lester,     LesterEpilogueID
        .byte EPrio_Main_NoPriority3,   Lana,       LanaEpilogueID

        .byte EPrio_StartRegion,        Arthur,     ArthurEpilogueID
        .byte EPrio_Sub_FollowUp,       Amid,       AmidEpilogueID
        .byte EPrio_Main_NoPriority1,   Tine,       TineEpilogueID
        .byte EPrio_Main_NoPriority1,   Linda,      LindaEpilogueID

        .byte EPrio_Main,               Dalvin,     DalvinEpilogueID
        .byte EPrio_Main,               Deimne,     DeimneEpilogueID
        .byte EPrio_Main,               AdultFinn,  FinnEpilogueID
        .byte EPrio_Main,               Hannibal,   HannibalEpilogueID
        .byte EPrio_Main,               Charlot,    CharlotEpilogueID
        .byte EPrio_Main,               Coirpre,    CoirpreEpilogueID
        .byte EPrio_Main,               Asaello,    AsaelloEpilogueID
        .byte EPrio_Main,               Tristan,    TristanEpilogueID
        .byte EPrio_Main,               Ced,        CedEpilogueID
        .byte EPrio_Main,               Hawk,       HawkEpilogueID

        .byte EPrio_Male_Lover,         Seliph,     SeliphEpilogueID
        .byte EPrio_Son_Lover,          Jamke,      JamkesSonEpilogueID
        .byte EPrio_Son_Lover,          Lex,        LexSonEpilogueID
        .byte EPrio_Son_Lover,          Claud,      ClaudsSonEpilogueID
        .byte EPrio_Son_Lover,          Azelle,     AzellesSonEpilogueID
        .byte EPrio_Son_Lover,          Lewyn,      LewnysSonEpilogueID
        .byte EPrio_Male_Lover,         Iuchar,     IucharEpilogueID
        .byte EPrio_Male_Lover,         Iucharba,   IucharbaEpilogueID
        .byte EPrio_Male_Lover,         Shannan,    ShannanEpilogueID
        .byte EPrio_Male_Lover,         Scathach,   ScathachEpilogueID
        .byte EPrio_Male_Lover,         Leif,       LeifEpilogueID
        .byte EPrio_Male_Lover,         Ares,       AresEpilogueID
        .byte EPrio_Male_Lover,         Diarmuid,   DiarmuidEpilogueID
        .byte EPrio_Male_Lover,         Oifey,      OifeyEpilogueID
        .byte EPrio_Male_Lover,         Febail,     FebailEpilogueID
        .byte EPrio_Male_Lover,         Lester,     LesterEpilogueID
        .byte EPrio_Male_Lover,         Arthur,     ArthurEpilogueID
        .byte EPrio_Male_Lover,         Amid,       AmidEpilogueID
        .byte EPrio_Male_Lover,         Dalvin,     DalvinEpilogueID
        .byte EPrio_Male_Lover,         Deimne,     DeimneEpilogueID
        .byte EPrio_Male_Lover,         Charlot,    CharlotEpilogueID
        .byte EPrio_Male_Lover,         Coirpre,    CoirpreEpilogueID
        .byte EPrio_Male_Lover,         Asaello,    AsaelloEpilogueID
        .byte EPrio_Male_Lover,         Tristan,    TristanEpilogueID
        .byte EPrio_Male_Lover,         Ced,        CedEpilogueID
        .byte EPrio_Male_Lover,         Hawk,       HawkEpilogueID
        .byte EPrio_Daughter_Main_NoPriority, Jamke,  JamkesDaughterEpilogueID
        .byte EPrio_Daughter_Main_NoPriority, Lex,    LexDaughterEpilogueID
        .byte EPrio_Daughter_Main_NoPriority, Claud,  ClaudsDaughterEpilogueID
        .byte EPrio_Daughter_Main_NoPriority, Azelle, AzellesDaughterEpilogueID
        .byte EPrio_Daughter_Main_NoPriority, Lewyn,  LewnysDaughterEpilogueID

        .byte EPrio_Main,               Larcei,     LarceiEpilogueID
        .byte EPrio_Main,               Nanna,      NannaEpilogueID
        .byte EPrio_Main,               Patty,      PattyEpilogueID
        .byte EPrio_Main,               Lana,       LanaEpilogueID
        .byte EPrio_Main,               Tine,       TineEpilogueID
        .byte EPrio_Main,               Linda,      LindaEpilogueID
        .byte EPrio_Main,               Creidne,    CreidneEpilogueID
        .byte EPrio_Main,               Muirne,     MuirneEpilogueID
        .byte EPrio_Main,               Daisy,      DaisyEpilogueID
        .byte EPrio_Main,               Lene,       LeneEpilogueID
        .byte EPrio_Main,               Laylea,     LayleaEpilogueID
        .byte EPrio_Main,               Jeanne,     JeanneEpilogueID
        .byte EPrio_Main,               Fee,        FeeEpilogueID
        .byte EPrio_Main,               Hermina,    HerminaEpilogueID

        .char -1

      rsEpilogueSetDaughterMainCharacterNoPriority ; 82/FB1E

        .al
        .autsiz
        .databank ?

        ; If daughter exists:
        ; Save unit in main character table

        lda wR0
        jsl rlGetFatherUnitsChildrenRAMPointers

        lda wDaughterCharacterROMPointer
        beq rsEpiloguePriorityHandleUnprocessedCharacters._End

          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitCharacterID
          sta wR0

      rsEpilogueSetMainCharacterNoPriority ; 82/FB33

        .al
        .autsiz
        .databank ?

        ; Save unit in main character table

        ldy #0

      rsEpiloguePriorityHandleUnprocessedCharacters ; 82/FB36

        .al
        .autsiz
        .databank ?

        lda wR0
        asl a
        tax
        lda aEpilogueUnitStates,x
        and #$8000
        bne _End

          lda aEpilogueUnitProcessedFlags,x
          bpl _End

            tya
            ora aEpilogueUnitStates,x
            sta aEpilogueUnitStates,x

            lda wR1
            sta aEpilogueUnitProcessedFlags,x
            tax
            sep #$20
            lda wR0
            cpy #$0200
            beq +

              sta aEpilogueMainCharacters,x
              bra ++

              +
              sta aEpilogueSupportingCharacters,x

            +
            rep #$20
            cpy #$0100
            bne _End

              lda #1
              sta wR3

        _End ; FB78
        rts

        .databank 0

      rsEpilogueSetMainCharacterFollowUpPriority ; 82/FB79

        .al
        .autsiz
        .databank ?

        ; Save unit in main character table and set priority
        ; if nobody had it yet.

        lda wR3
        beq rsEpilogueStartRegionPriority

        bra rsEpilogueSetMainCharacterNoPriority

      rsEpilogueStartRegionPriorityIfSonExists ; 82/FB7F

        .al
        .autsiz
        .databank ?

        ; Nulls wR3, the priority set flag
        ; If units son exists:
        ; If unit is alive, they set the flag and get saved in
        ; the main character table.

        lda #0
        sta wR3
        lda wR0
        jsl rlGetFatherUnitsChildrenRAMPointers
        lda wSonCharacterROMPointer
        beq rsEpiloguePriorityHandleUnprocessedCharacters._End

        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        sta wR0

      rsEpilogueStartRegionPriority ; 82/FB99

        .al
        .autsiz
        .databank ?

        ; Nulls wR3, the priority set flag
        ; If unit is alive, they set the flag and get saved in
        ; the main character table.

        lda #0
        sta wR3
        ldy #$0100
        bra rsEpiloguePriorityHandleUnprocessedCharacters

      rsEpilogueSetMainCharacerOnNoPriorityIfDaughterExists ; 82/FBA3

        .al
        .autsiz
        .databank ?

        ; If daughter exists check:

        ; If nobody has priority yet, unit gets saved in the main
        ; character table.
        ; If priority is set, unit doesnt get an epilogue.

        lda wR0
        jsl rlGetFatherUnitsChildrenRAMPointers

        lda wDaughterCharacterROMPointer
        beq rsEpiloguePriorityHandleUnprocessedCharacters._End

        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        sta wR0

      rsEpilogueSetMainCharacerOnNoPriority ; 82/FBB8

        .al
        .autsiz
        .databank ?

        ; If nobody has priority yet, unit gets saved in the main
        ; character table.
        ; If priority is set, unit doesnt get an epilogue.

        lda wR3
        beq rsEpilogueStartRegionPriority

        rts

        .databank 0

      rsEpiloguePrioritySetSonsLover ; 82/FBBD

        .al
        .autsiz
        .databank ?

        ; If son exists check:
        ; If unit is married:
        ; Process the lover and save her in the supporting
        ; character table.

        lda wR0
        jsl rlGetFatherUnitsChildrenRAMPointers
        lda wSonCharacterROMPointer
        beq rsEpiloguePriorityHandleUnprocessedCharacters._End

        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        sta wR0

      rsEpiloguePrioritySetMaleLover ; 82/FBD2

        .al
        .autsiz
        .databank ?

        ; If male unit is married:
        ; Process the lover and save her in the supporting
        ; character table.

        lda wR0
        asl a
        tax
        lda aEpilogueUnitStates,x
        bit #$2000
        beq rsEpiloguePriorityHandleUnprocessedCharacters._End

        and #$00FF
        sta wR0
        ldy #$0200
        jml rsEpiloguePriorityHandleUnprocessedCharacters

        .databank 0

      rsEvaluateEpilogueDialogueIDs ; 82/FBEB

        .al
        .autsiz
        .databank ?

        lda #SeliphEpilogueID
        sta wR1

          _Loop
          lda wR1
          asl a
          tax
          lda aEpilogueDialogueIDEvaluationTable+1,x
          and #$00FF
          sta wR2
          lda aEpilogueDialogueIDEvaluationTable,x
          and #$00FF
          asl a
          tax
          jsr (aEpilogueDialogueIDRoutines,x)
          ldx wR1
          sep #$20
          tya
          sta aEpilogueChosenDialogueID,x
          rep #$20
          inc x
          stx wR1
          cpx #50
          bne _Loop

        rts

        .databank 0

      aEpilogueDialogueIDRoutines .include "../TABLES/SYSTEM/EpilogueDialogueIDRoutines.csv.asm" ; 82/FC1D
      aEpilogueDialogueIDEvaluationTable .binclude "../TABLES/SYSTEM/EpilogueDialogueIDEvaluation.csv.asm" ; 82/FC37

      rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue ; 82/FC9B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR1 = CharacterEpilogueID

        ; Output:
        ; Y = 0 if character doesnt get epilogue, else 1

        ldy #0
        ldx wR1
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta wR0
        beq +

          inc y

        +
        rts

        .databank 0

      rsGetEpilogueCharactersSupport ; 82/FCAD

        .al
        .autsiz
        .databank ?

        ; wR1 = EpilogueCharacterID

        ldx wR1
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        rts

        .databank 0

      rsGetEpilogueCharactersMarriedState ; 82/FCB7

        .al
        .autsiz
        .databank ?

        ; wR0 = CharacterID

        lda wR0
        asl a
        tax
        lda aEpilogueUnitStates,x
        bit #$2000
        rts

        .databank 0

      rsCheckIfTargetEpilogueCharacterHasPriority ; 82/FCC3

        .al
        .autsiz
        .databank ?

        lda wR0
        asl a
        tax
        lda aEpilogueUnitStates,x
        and #$0100
        rts

        .databank 0

      rsGetEpilogueTargetCharactersDeadState ; 82/FCCF

        .al
        .autsiz
        .databank ?

        lda wR2
        asl a
        tax
        lda aEpilogueUnitStates,x
        and #$8000
        rts

        .databank 0

      rsEpilogueDialogueIDMaleCheckIfWithLover ; 82/FCDB

        .al
        .autsiz
        .databank ?

        ; Output:
        ; Y = 0; no epilogue
        ; Y = 1; no support
        ; Y = 2; has support

        ; A = married CharacterID

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq +

          jsr rsGetEpilogueCharactersSupport
          beq +

            inc y

        +
        rts

        .databank 0

      rsEpilogueDialogueIDMaleCheckIfWithLoverAndTargetAlive ; 82/FCE7

        .al
        .autsiz
        .databank ?

        ; Output:
        ; Y = 0; no epilogue
        ; Y = 1; no support, target died
        ; Y = 2; has support, target died
        ; Y = 3; no support, target alive
        ; Y = 4; has support, target alive

        jsr rsEpilogueDialogueIDMaleCheckIfWithLover
        cpy #0
        beq +

          jsr rsGetEpilogueTargetCharactersDeadState
          bne +

            inc y
            inc y

        +
        rts

        .databank 0

      rsEpilogueDialogueIDMaleCheckIfWithLoverAndPriotity ; 82/FCF7

        .al
        .autsiz
        .databank ?

        ; Output:
        ; Y = 0; no epilogue
        ; Y = 1; no support, priority
        ; Y = 2; has support, priority
        ; Y = 3; no support, no priority
        ; Y = 4; has support, no priority

        jsr rsEpilogueDialogueIDMaleCheckIfWithLover
        cpy #0
        beq _End

          jsr rsCheckIfTargetEpilogueCharacterHasPriority
          bne _End

            inc y
            inc y

        _End
        rts

        .databank 0

      rsEpilogueDialogueIDFemaleCheckIfMarriedAndTargetAlive ; 82/FD07

        .al
        .autsiz
        .databank ?

        ; Out:
        ; Y = 0; no epilogue
        ; Y = 1; has lover (died)
        ; Y = 2; no lover, target died
        ; Y = 3; no lover, target alive

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq rsEpilogueDialogueIDMaleCheckIfWithLoverAndPriotity._End

        _CheckMarriedStateAndTarget
        jsr rsGetEpilogueCharactersMarriedState
        bne +

          ; Unmarried
          inc y
          jsr rsGetEpilogueTargetCharactersDeadState
          bne +

            inc y

        ; If married, getting here means they only got their own epilogue because
        ; their lover already died.

        +
        rts

        .databank 0

      rsEpilogueDialogueIDFemaleCheckIfMarriedAndPriority ; 82/FD19

        .al
        .autsiz
        .databank ?

        ; Out:
        ; Y = 0; no epilogue
        ; Y = 1; priority, no lover
        ; Y = 2; priority, has lover (died)
        ; Y = 3; no priority, no lover
        ; Y = 4; no priority, has lover (died)

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq _End

          jsr rsCheckIfTargetEpilogueCharacterHasPriority
          bne +

            inc y
            inc y

          +
          jsr rsGetEpilogueCharactersMarriedState
          beq _End

            inc y

        _End
        rts

        .databank 0

      rsEpilogueDialogueIDFemaleCheckIfMarriedAndPriorityAndTargetAlive ; 82/FD2C

        .al
        .autsiz
        .databank ?

        ; Out:
        ; Y = 0; no epilogue
        ; Y = 1; priority, has lover (dead)
        ; Y = 2; priority, no lover

        ; Y = 3; no priority, has lover (died)
        ; Y = 4; no priority, no lover, target died
        ; Y = 5; no priority, no lover, target alive

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq _End

          jsr rsCheckIfTargetEpilogueCharacterHasPriority
          bne +

            inc y
            inc y
            bra rsEpilogueDialogueIDFemaleCheckIfMarriedAndTargetAlive._CheckMarriedStateAndTarget

          +
          jsr rsGetEpilogueCharactersMarriedState
          beq _End

            inc y

        _End
        rts

        .databank 0

      rsGetSeliphEpilogueDialogueID ; 82/FD41

        .al
        .autsiz
        .databank ?

        ; Y = 0; no epilogue (what are you even doing at that point)
        ; Y = 1; no support, julia dead
        ; Y = 2; has support, julia dead
        ; Y = 1; no support/ has support but its julia, julia alive
        ; Y = 2; has support, julia alive

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq _End

          jsr rsGetEpilogueCharactersSupport
          beq +

            cmp #Julia
            beq +

              inc y

          +
          jsr rsGetEpilogueTargetCharactersDeadState
          bne _End

            inc y
            inc y

        _End
        rts

        .databank 0

      rsGetJuliaEpilogueDialogueID ; 82/FD59

        .al
        .autsiz
        .databank ?

        ldy #0
        rts

        .databank 0

      rsGetAltenaEpilogueDialogueID ; 82/FD5D

        .al
        .autsiz
        .databank ?

        ; Y = 0; no epilogue
        ; Y = 1; arion dead, leif dead
        ; Y = 2; arion alive, leif dead
        ; Y = 1; arion dead, leif alive
        ; Y = 2; arion alive, leif alive

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq _End

          lda #PermanentFlagChapterFinalArionDied
          jsl rlCheckPermanentEventFlagSet 
          bcs +

            inc y

          +
          jsr rsGetEpilogueTargetCharactersDeadState
          bne _End

            inc y
            inc y

        _End
        rts

        .databank 0

      rsGetHannibalEpilogueDialogueID ; 82/FD74

        .al
        .autsiz
        .databank ?

        ; Y = 0; no epilogue
        ; Y = 1; charlot exists and died
        ; Y = 2; charlot exists and is alive
        ; Y = 3; coirpre exists and died
        ; Y = 4; coirpre exists and is alive

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq _End

          lda aEpilogueUnitStates + (Charlot * 2)
          bit #$4000
          beq +

            inc y
            inc y
            lda aEpilogueUnitStates + (Coirpre *2)

          +
          and #$8000
          bne _End

            inc y

        _End
        rts

        .databank 0

      rsGetLewynsSonEpilogueDialogueID ; 82/FD8F

        .al
        .autsiz
        .databank ?

        ; Y = 0; no epilogue
        ; Y = 1; sister dead, no support
        ; Y = 2; sister dead, has support
        ; Y = 3; sister alive, no support
        ; Y = 4; sister alive, has support

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq _End

          jsr rsGetEpilogueCharactersSupport
          beq +

            inc y

          +
          lda aEpilogueMainCharacters + LewnysDaughterEpilogueID
          and #$00FF
          bne _End

            inc y
            inc y

        _End
        rts

        .databank 0

      rsGetLewynsDaughterEpilogueDialogueID ; 82/FDA6

        .al
        .autsiz
        .databank ?

        ; Y = 0; no epilogue
        ; Y = 1; priority, brother dead
        ; Y = 2; priority, brother alive
        ; Y = 3; no priority, brother dead
        ; Y = 4; no priority, brother alive

        jsr rsCheckIfCurrentEpilogueCharacterGetsOwnEpilogue
        beq _End

          jsr rsCheckIfTargetEpilogueCharacterHasPriority
          bne +

            inc y
            inc y

          +
          lda aEpilogueSupportingCharacters + LewnysSonEpilogueID
          and #$00FF
          beq _End

            inc y

        _End
        rts

        .databank 0

      rsEpilogueDialogueIDDefault ; 82/FDBD

        .al
        .autsiz
        .databank ?

        ldy #1
        rts

        .databank 0

      rsUnknown82FDC1 ; 82/FDC1

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          phx
          txa
          clc
          adc #$0012
          asl a
          tax
          lda aEpilogueUnitStates,x
          plx
          sep #$20
          and #$0F
          sta aUnknown7FC71A,x
          rep #$20
          inc x
          cpx #7
          bne -

        ldx #0

          -
          txa
          clc
          adc #GEN_ID_Daisy_Patty
          jsl rlFindCharacterByGenerationID
          lda #0
          bcs +

            jsl rlGetSelectedUnitLoverGenerationID

          +
          sep #$20
          and #$0F
          sta aUnknown7FC721,x
          rep #$20
          inc x
          cpx #9
          bne -

        rts

        .databank 0

      rsUnknown82FE07 ; 82/FE07

        .al
        .autsiz
        .databank ?

        sep #$20
        ldx #0

          -
          lda aUnknown7FC721+1,x
          asl a
          asl a
          asl a
          asl a
          ora aUnknown7FC71A,x
          sta aUnknown7FC72A,x
          inc x
          cpx #8
          bne -

        ldx #0
        txa

          -
          clc
          adc aUnknown7FC72A,x
          inc x
          cpx #8
          bne -

        sta aUnknown7FC72A,x
        rep #$20
        rts

        .databank 0

      aUnknown82FE38 ; 82/FE38

        .byte $46
        .byte $69
        .byte $72
        .byte $65
        .byte $45
        .byte $6D
        .byte $62
        .byte $6C
        .byte $6D

      rsUnknown82FE41 ; 82/FE41

        .al
        .autsiz
        .databank ?

        sep #$20
        ldx #0
        
          -
          lda aUnknown7FC72A,x
          clc
          adc aUnknown82FE38,x
          sta aUnknown7FC72A,x
          inc x
          cpx #9
          bne -

        rep #$20
        ldx #0
        lda aUnknown7FC72A
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 1
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 2
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 3
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 4
        lsr a
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 5
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 6
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 7
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a

        _FEAF
        and #$01FF
        sta wR13

        lda #26
        sta wR14
        jsl $80A1AB ; divide
        sep #$20
        lda wR13
        clc
        adc #$41
        sta aUnknown7FC70A,x
        inc x
        lda wR10
        clc
        adc #$41
        sta aUnknown7FC70A,x
        inc x
        rep #$20
        rts

        .databank 0

        ; 82/FED6

    .endsection Code82F866Section
