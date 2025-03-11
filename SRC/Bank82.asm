
    .weak

      rlFadeInByTimer                               :?= address($80A21C)
      rlFadeOutByTimer                              :?= address($80A25A)
      rlEventEngineFreeProc                         :?= address($91A47D)
      procUnknown9EC70B                             :?= address($9EC70B)
      rlUnknown8885EF                               :?= address($8885EF)
      rlUnknown88863E                               :?= address($88863E)

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

      procUnknown8282D3 ; 82/82D3

        .structProcInfo "Bt", rlProcUnknown8282D3Init, rlProcUnknown8282D3Cycle, aProcUnknown8282D3Code

      rlProcUnknown8282D3Init ; 82/82DB
      
        .al
        .autsiz
        .databank ?

        lda aProcSystem.wInput0,b
        sta aProcSystem.aBody0,b,x

        lda bBufferINIDISP
        bit #INIDISP_ForcedBlank
        bne +

          bit #INIDISP_Brightness
          beq +

            lda #(`procFadeOut)<<8
            sta lR44+1
            lda #<>procFadeOut
            sta lR44
            jsl rlProcEngineCreateProc

        +
        rtl

        .databank 0

      rlProcUnknown8282D3Cycle ; 82/82FC
      
        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        bit #INIDISP_ForcedBlank
        bne +

          bit #INIDISP_Setting(false, 15)
          bne ++

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

        +
        rtl

        .databank 0

      aProcUnknown8282D3Code ; 82/8322

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

      procUnknown828364 ; 82/8364

        .structProcInfo "Bt", rlProcUnknown828364Init, rlProcUnknown828364Cycle, aProcUnknown828364Code

      rlProcUnknown828364Init ; 82/836C

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

      rlProcUnknown828364Cycle ; 82/838D

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

      aProcUnknown828364Code ; 82/83B3

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

          lda $0D79,b
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

