
    structHDMADirectEntryInfo .struct Init, OnCycle, Code, HDMATable, BBADxSetting, DMAPxSetting
      Init    .word <>\Init
      OnCycle .word <>\OnCycle
      Code    .word <>\Code
      .union
        .struct
          TableOffset       .word ?
          TableBankAndBBADx .word ?
        .endstruct
        .struct
          Table .long \HDMATable
          BBADx .byte (\BBADxSetting - PPU_REG_BASE)
        .endstruct
      .endunion
      DMAPx .byte \DMAPxSetting
    .endstruct

    structHDMAIndirectEntryInfo .struct Init, OnCycle, Code, HDMATable, BBADxSetting, DMAPxSetting, IndirectBank
      Init    .word <>\Init
      OnCycle .word <>\OnCycle
      Code    .word <>\Code
      .union
        .struct
          TableOffset       .word ?
          TableBankAndBBADx .word ?
        .endstruct
        .struct
          Table .long \HDMATable
          BBADx .byte (\BBADxSetting - PPU_REG_BASE)
        .endstruct
      .endunion
      DMAPx .byte \DMAPxSetting
      IndirectBank .byte \IndirectBank
    .endstruct

    HDMA_YIELD .segment Cycles, Offset
      .word \Cycles, <>\Offset
    .endsegment

    HDMA_SLEEP .segment Cycles
      ; 82/C1DA
      .word <>rsHDMACodeSleep
      .word \Cycles
    .endsegment

    HDMA_END .segment
      ; 82/C1E8
      .word <>rsHDMACodeEnd
    .endsegment

    HDMA_HALT_SLEEP .segment
      ; 82/C1F6
      .word <>rsHDMACodeHaltSleep
    .endsegment

    HDMA_HALT .segment
      ; 82/C1FC
      .word <>rsHDMACodeHalt
    .endsegment

    HDMA_CALL .segment Routine
      ; 82/C204
      .word <>rsHDMACodeCall
      .long \Routine
    .endsegment

    HDMA_SET_ONCYCLE .segment OnCycle
      ; 82/C21F
      .word <>rsHDMACodeSetOnCycle
      .word <>\OnCycle
    .endsegment

    HDMA_JUMP .segment Position
      ; 82/C231
      .word <>rsHDMACodeJump
      .word <>\Position
    .endsegment

    HDMA_SET_TIMER .segment Time
      ; 82/C236
      .word <>rsHDMACodeSetTimer
      .word \Time
    .endsegment

    HDMA_JUMP_WHILE_TIMER .segment Position
      ; 82/C23F
      .word <>rsHDMACodeJumpWhileTimer
      .word <>\Position
    .endsegment

    HDMA_JUMP_IF_BITS_UNSET .segment Position, Bits
      ; 82/C247
      .word <>rsHDMACodeJumpIfBitsUnset
      .word <>\Position
      .word \Bits
    .endsegment

    HDMA_JUMP_IF_BITS_SET .segment Position, Bits
      ; 82/C254
      .word <>rsHDMACodeJumpIfBitsSet
      .word <>\Position
      .word \Bits
    .endsegment

    HDMA_SET_INDIRECT_BANK .segment Bank
      ; 82/C261
      .word <>rsHDMACodeSetTableBank
      .byte \Bank
    .endsegment
