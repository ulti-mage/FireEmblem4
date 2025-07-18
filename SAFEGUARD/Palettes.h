
  ; Palette constants

    ; Created = 0.01
    ; Updated = 0.01
    Color_Unused = bits(%1000000000000000)
    Color_Blue   = bits(%0111110000000000)
    Color_Green  = bits(%0000001111100000)
    Color_Red    = bits(%0000000000011111)

  ; Palette helpers

    ; Created = 0.01
    ; Updated = 0.07
    Color .struct
      .fill len(bytes(Color_Red | Color_Green | Color_Blue))
    .endstruct

    ; Created = 0.01
    ; Updated = 0.07
    Palette .struct
      Colors .brept 16
        .dstruct Color
      .endrept
    .endstruct
