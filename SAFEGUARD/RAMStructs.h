
  structRAMStructHeader .struct
    CurrentStructCount  .byte ? ; $00
    MaxStructCount      .byte ? ; $01
    StructSize          .byte ? ; $02
    Unknown             .byte ? ; $03
  .endstruct

  ; Flag $10 = entry just got removed?
  ; Flag $40 = filled?
  ; Flag $80 = empty?

  structRAMAreaHeader .struct 
    Flags     .byte ? ; $00
    AreaEnd   .word ? ; $01
    AreaSize  .word ? ; $03
    Unknown2  .byte ? ; $05
    Unknown3  .word ? ; $06
  .endstruct

  structRAMAreaEntryHeader .struct
    Flags     .byte ? ; $00
    Offset    .word ? ; $01
    BaseTable .long ? ; $03
  .endstruct
