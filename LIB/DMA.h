
      DMAToCGRAM          :?= 1
      DMAToVRAM           :?= 2
      DMAFromVRAM         :?= 3
      DMAInputDestination :?= 4


    structDMAToVRAM .struct Source, Count, Mode, Destination
      .if (\Source === ?)
        TransferType .byte ?
        Source .long ?
        Count .word ?
        Mode .byte ?
        Destination .word ?
      .else
        .byte DMAToVRAM
        .long \Source
        .if (\Count == $10000)
          .word 0
        .else
          .word \Count
        .endif
        .byte \Mode
        .word (\Destination >> 1)
      .endif
    .endstruct

