
  structMapMenu .struct PaletteDataPointer, GraphicsDataPointer, TilemapDataPointer, Type, Position, Unknown3
    .if (\PaletteDataPointer === ?)
      PaletteDataPointer  .long ? ; $00
      GraphicsDataPointer .long ? ; $03
      TilemapDataPointer  .long ? ; $06
      Type                .byte ? ; $09
      .union
        Position          .word ? ; $0A
        .struct
          XPosition       .byte ? ; $0A
          YPosition       .byte ? ; $0B
        .endstruct
      .endunion
      Unknown3            .long ? ; $0C
    .else
      PaletteDataPointer  .long \PaletteDataPointer  ; $00
      GraphicsDataPointer .long \GraphicsDataPointer ; $03
      TilemapDataPointer  .long \TilemapDataPointer  ; $06
      Type                .byte \Type                ; $09
      XPosition           .byte \Position[0]         ; $0A
      YPosition           .byte \Position[1]         ; $0B
      Unknown3            .long \Unknown3            ; $0C
    .endif
  .endstruct

  structMapMenuPaletteData .struct Size, Palette, Color, Source
    Size    .word \Size    ; $00
      ; How many color words to copy over.
    Palette .byte \Palette ; $02
    Color   .byte \Color   ; $03
      ; Which palette and which color in the palette to overwrite
    Source  .long \Source  ; $04
  .endstruct

  structMapMenuGraphicsData .struct DMACount, DMADestination, DecompressFlag, DataSource
    DMACount        .word \DMACount       ; $00
    DMADestination  .word \DMADestination ; $02
    DecompressFlag  .byte \DecompressFlag ; $04
    DataSource      .long \DataSource     ; $05
      ; If flag is set, decompress this data, then DMA from decomp buffer to VRAM
      ; If unset, directly DMA this.
  .endstruct

  structMapMenuTilemapData .struct Width, Height, BGBuffer, Unknown1, Unknown2
    .if (\Width === ?)
      .union
        Area        .word ?
        .struct
          Width     .byte ?
          Height    .byte ?
        .endstruct
      .endunion
      BGBuffer      .long ?
      Unknown1      .byte ?
      Unknown2      .long ?
    .else
      Width     .byte \Width    ; $00
      Height    .byte \Height   ; $01
      BGBuffer  .long \BGBuffer ; $02
      Unknown1  .byte \Unknown1 ; $05
      Unknown2  .long \Unknown2 ; $06
    .endif
  .endstruct
