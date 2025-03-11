
    structProcInfo .struct Name, Init, OnCycle, Code
      Name
      .union
        .word $0000
        .enc "proc"
          .cdef " ~", 32
        .text \Name
      .endunion
      Init    .word <>\Init
      OnCycle .word <>\OnCycle
      Code    .word <>\Code
    .endstruct

    PROC_YIELD .segment Time
      .word \Time
    .endsegment

    PROC_END .segment
      ; 82/81D5
      .word <>rsProcCodeEnd
    .endsegment

    PROC_HALT_SLEEP .segment
      ; 82/81E3
      .word <>rsProcCodeHaltSleep
    .endsegment

    PROC_HALT .segment
      ; 82/81E9
      .word <>rsProcCodeHalt
    .endsegment

    PROC_CALL .segment Routine
      ; 82/81F1
      .word <>rsProcCodeCall
      .long \Routine
    .endsegment

    PROC_CALL_ARGS .segment Routine, ArgsSize
      ; 82/820C
      .word <>rsProcCodeCallWithArgs
      .long \Routine
      .byte \ArgsSize
    .endsegment

    PROC_SET_ONCYCLE .segment Routine
      ; 82/8237
      .word <>rsProcCodeSetOnCycle
      .word <>\Routine
    .endsegment

    PROC_JUMP .segment Position
      ; 82/8249
      .word <>rsProcCodeJump
      .word <>\Position
    .endsegment

    PROC_SET_UNK_TIMER .segment Cycles
      ; 82/824E
      .word <>rsProcCodeSetUnknownTimer
      .word \Cycles
    .endsegment

    PROC_JUMP_WHILE_UNK_TIMER .segment Position
      ; 82/8257
      .word <>rsProcCodeJumpWhileUnknownTimer
      .word <>\Position
    .endsegment

    PROC_JUMP_IF_BITS_UNSET .segment Position, Bits
      ; 82/825F
      .word <>rsProcCodeJumpIfBitsUnset
      .word <>\Position
      .word \Bits
    .endsegment

    PROC_JUMP_IF_BITS_SET .segment Position, Bits
      ; 82/826C
      .word <>rsProcCodeJumpIfBitsSet
      .word <>\Position
      .word \Bits
    .endsegment
