    
    .weak

      rlPushToOAMBufferTimed            :?= address($80885F)
      procWorldMapMarkerShadowFadeIn    :?= address($8B8B59)

    .endweak

    .section WorldMapMarkers1Section

      rlLoadWorldMapMarkerData ; 8B/84E5

        .al
        .autsiz
        .databank ?

        ; WMM

        ; wR0 = XPosition
        ; wR1 = YPosition
        ; X   = slot
        ; Y   = ID

        lda wR0
        sta aWorldMapMarker.wXPosition[0],x
        lda wR1
        sta aWorldMapMarker.wYPosition[0],x
        tya
        sta aWorldMapMarker.wID[0],x
        lda #$FFFF
        sta aWorldMapMarker.wStatus[0],x

        sep #$20
        lda #$16
        sta bBufferTS
        rep #$20

        phx
        tyx
        phy
        jsr (aWorldMapMarkerShadowPalettes,x)

        jsl rlDMAByStruct

          .structDMAToVRAM aBG2TilemapBuffer.Page1, 32 * 21 * size(word), $80, $A800

        ply
        tyx
        lda aWorldMapMarkerShadowHOFS,x
        sta wBufferBG2HOFS
        lda aWorldMapMarkerShadowVOFS,x
        sta wBufferBG2VOFS
        plx

        ldx #7 * size(word)
        lda #0

          -
          sta aBGPaletteBuffer.aPalette1+$10,b,x
          sta aBGPaletteBuffer.aPalette5+$10,b,x
          dec x
          dec x
          bpl -

        rtl

        .databank 0

      aWorldMapMarkerShadowPalettes ; 8B/8538

        .word <>rsWorldMapMarkerShadowLoadBluePalette ; $00
        .word <>rsWorldMapMarkerShadowLoadBluePalette ; $02
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $04
        .word <>rsWorldMapMarkerShadowLoadBluePalette ; $06
        .word <>rsWorldMapMarkerShadowLoadBluePalette ; $08
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $0A
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $0C
        .word <>rsWorldMapMarkerClearShadow           ; $0E
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $10
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $12
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $14
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $16
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $18
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $1A
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $1C
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $1E
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $20
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $22
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $24
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $26
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $28
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $2A
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $2C
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $2E
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $30
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $32
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $34
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $36
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $38
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $3A
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $3C
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $3E
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $40
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $42
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $44
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $46
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $48
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $4A
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $4C
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $4E
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $50
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $52
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $54
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $56
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $58
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $5A
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $5C
        .word <>rsWorldMapMarkerShadowLoadRedPalette  ; $5E

      rsWorldMapMarkerShadowLoadRedPalette ; 8B/8598

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aWorldMapMarkerShadowTilemap
        stx DecompressionVariables.lSource
        lda #`aWorldMapMarkerShadowTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>aBG2TilemapBuffer.Page1
        stx DecompressionVariables.lDest
        lda #`aBG2TilemapBuffer.Page1
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor

        ; Red palette

        ldx #7 * size(word)
        
          -
          lda $8CDCB0,x
          sta aWorldMapMarkerPalette,x
          dec x
          dec x
          bpl -

        rts

        .databank 0

      rsWorldMapMarkerShadowLoadBluePalette ; 8B/85C4

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aWorldMapMarkerShadowTilemap
        stx DecompressionVariables.lSource
        lda #`aWorldMapMarkerShadowTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>aBG2TilemapBuffer.Page1
        stx DecompressionVariables.lDest
        lda #`aBG2TilemapBuffer.Page1
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor

        ldx #7 * size(word)

        ; Blue palette

          -
          lda $8CDC30,x
          sta aWorldMapMarkerPalette,x
          dec x
          dec x
          bpl -

        rts

        .databank 0

      rsWorldMapMarkerClearShadow ; 8B/85F0

        .al
        .autsiz
        .databank ?

        ldx #32 * 21 * size(word) - 2
        lda #$00FF

          -
          sta aBG2TilemapBuffer.Page1,x
          dec x
          dec x
          bpl -

        rts

        .databank 0

      aWorldMapMarkerShadowHOFS ; 8B/85FF

        .sint -124  ; $00
        .sint -43   ; $02
        .sint -124  ; $04
        .sint -164  ; $06
        .sint -188  ; $08
        .sint -52   ; $0A
        .sint -132  ; $0C
        .sint 0     ; $0E
        .sint -116  ; $10
        .sint -44   ; $12
        .sint -68   ; $14
        .sint -108  ; $16
        .sint -164  ; $18
        .sint -180  ; $1A
        .sint -84   ; $1C
        .sint -156  ; $1E
        .sint -164  ; $20
        .sint -116  ; $22
        .sint 0     ; $24
        .sint -148  ; $26
        .sint -100  ; $28
        .sint -140  ; $2A
        .sint -84   ; $2C
        .sint -52   ; $2E
        .sint 0     ; $30
        .sint -156  ; $32
        .sint -84   ; $34
        .sint -174  ; $36
        .sint 0     ; $38
        .sint -116  ; $3A
        .sint -108  ; $3C
        .sint -172  ; $3E
        .sint -100  ; $40
        .sint -156  ; $42
        .sint -84   ; $44
        .sint -124  ; $46
        .sint -52   ; $48
        .sint -12   ; $4A
        .sint -44   ; $4C
        .sint -116  ; $4E
        .sint -132  ; $50
        .sint -124  ; $52
        .sint -100  ; $54
        .sint -180  ; $56
        .sint -164  ; $58
        .sint -156  ; $5A
        .sint -84   ; $5C
        .sint -52   ; $5E

      aWorldMapMarkerShadowVOFS ; 8B/865F

        .sint -76   ; $00
        .sint -146  ; $02
        .sint -76   ; $04
        .sint -12   ; $06
        .sint -92   ; $08
        .sint -140  ; $0A
        .sint -20   ; $0C
        .sint -224  ; $0E
        .sint -124  ; $10
        .sint -140  ; $12
        .sint -12   ; $14
        .sint -44   ; $16
        .sint 4     ; $18
        .sint -92   ; $1A
        .sint -140  ; $1C
        .sint -108  ; $1E
        .sint -4    ; $20
        .sint -92   ; $22
        .sint -224  ; $24
        .sint 8     ; $26
        .sint -4    ; $28
        .sint -52   ; $2A
        .sint -116  ; $2C
        .sint -140  ; $2E
        .sint -224  ; $30
        .sint -108  ; $32
        .sint -108  ; $34
        .sint -76   ; $36
        .sint -224  ; $38
        .sint -36   ; $3A
        .sint -140  ; $3C
        .sint -100  ; $3E
        .sint -76   ; $40
        .sint -20   ; $42
        .sint -4    ; $44
        .sint -76   ; $46
        .sint -12   ; $48
        .sint -68   ; $4A
        .sint -116  ; $4C
        .sint -92   ; $4E
        .sint -44   ; $50
        .sint -20   ; $52
        .sint -84   ; $54
        .sint -12   ; $56
        .sint -60   ; $58
        .sint -108  ; $5A
        .sint -4    ; $5C
        .sint -136  ; $5E

      rlClearWorldMapMarker ; 8B/86BF

        .al
        .autsiz
        .databank ?

        lda #0
        sta aWorldMapMarker.wStatus[0],x
        sta aWorldMapMarker.wTimer[0],x
        rtl

        .databank 0

      rsHandleWorldMapMarkers ; 8B/86CB

        .al
        .autsiz
        .databank ?

        ldx #7 * size(word)

          _Loop
          lda aWorldMapMarker.wStatus[0],x
          beq _Next

            lda aWorldMapMarker.wXPosition[0],x
            sta wR0
            lda aWorldMapMarker.wYPosition[0],x
            sta wR1
            lda aWorldMapMarker.wID[0],x
            tay

            phx
            jsr rsHandleWorldMapMarkersEffect
            plx

          _Next
          dec x
          dec x
          bpl _Loop

        rts

        .databank 0

      rsHandleWorldMapMarkersEffect ; 8B/86EF

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #`aWorldMapMarkerSprites
        pha
        plb
        rep #$20

        .databank `aWorldMapMarkerSprites

        lda aWorldMapMarker.wTimer[0],x
        sta wR2
        lda aWorldMapMarkerSprites,y
        tay

        lda #0
        sta wR5
        sta wR4

        phy
        phx
        jsl rlPushToOAMBufferTimed
        plx
        ply

        lda wVBlankEnabledFramecount
        and #$0007
        bne _End

          lda aWorldMapMarker.wTimer[0],x
          clc
          adc #1
          cmp #48
          bcs _End

            sta aWorldMapMarker.wTimer[0],x

            lda $0000,b,y
            cmp aWorldMapMarker.wTimer[0],x
            bne _End

              lda #(`procWorldMapMarkerShadowFadeIn)<<8
              sta lR44+1
              lda #<>procWorldMapMarkerShadowFadeIn
              sta lR44
              jsl rlProcEngineCreateProc

        _End
        rts

        .databank 0

      aWorldMapMarkerSprites .include "../TABLES/SYSTEM/WorldMapMarkerSprites.csv.asm" ; 8B/8740

      ;  .addr aWorldMapSprite1  ; $00 - evans to yngvi
      ;  .addr aWorldMapSprite2  ; $02 - ribaut to dahna
      ;  .addr aWorldMapSprite3  ; $04 - chalphy to yngvi
      ;  .addr aWorldMapSprite8  ; $06 - agusti to madino
      ;  .addr aWorldMapSprite9  ; $08 - madino to agusti
      ;  .addr aWorldMapSprite13 ; $0A - zaxon to belhalla (ch5/6)
      ;  .addr aWorldMapSprite4  ; $0C - belhallachp (chp/6/epi)
      ;  .addr aWorldMapSprite5  ; $0E - grannvale duchies
      ;  .addr aWorldMapSprite4  ; $10 - chalphy
      ;  .addr aWorldMapSprite4  ; $12 - yngvi
      ;  .addr aWorldMapSprite4  ; $14 - friege
      ;  .addr aWorldMapSprite4  ; $16 - dozel
      ;  .addr aWorldMapSprite6  ; $18 - velthomerchp
      ;  .addr aWorldMapSprite4  ; $1A - edda
      ;  .addr aWorldMapSprite4  ; $1C - silesse
      ;  .addr aWorldMapSprite4  ; $1E - zaxonch4
      ;  .addr aWorldMapSprite4  ; $20 - tofa
      ;  .addr aWorldMapSprite10 ; $22 - orgahil to sailane
      ;  .addr aWorldMapSprite11 ; $24 - silesse castles
      ;  .addr aWorldMapSprite12 ; $26 - zaxonch5 to lubeck
      ;  .addr aWorldMapSprite4  ; $28 - zaxonch5
      ;  .addr aWorldMapSprite4  ; $2A - phinora
      ;  .addr aWorldMapSprite4  ; $2C - velthomerch5
      ;  .addr aWorldMapSprite4  ; $2E - belhallach5
      ;  .addr aWorldMapSprite14 ; $30 - thracia to munster
      ;  .addr aWorldMapSprite15 ; $32 - manster to meath unused
      ;  .addr aWorldMapSprite16 ; $34 - thracia castles unused
      ;  .addr aWorldMapSprite4  ; $36 - peruluke
      ;  .addr aWorldMapSprite17 ; $38 - thracia to peruluke
      ;  .addr aWorldMapSprite4  ; $3A - unknown1
      ;  .addr aWorldMapSprite4  ; $3C - ribautch6
      ;  .addr aWorldMapSprite4  ; $3E - isaach
      ;  .addr aWorldMapSprite4  ; $40 - sofala
      ;  .addr aWorldMapSprite4  ; $42 - ganeshire
      ;  .addr aWorldMapSprite4  ; $44 - tirnanog
      ;  .addr aWorldMapSprite4  ; $46 - leonsterch7
      ;  .addr aWorldMapSprite4  ; $48 - aed
      ;  .addr aWorldMapSprite4  ; $4A - dahna
      ;  .addr aWorldMapSprite4  ; $4C - melgen
      ;  .addr aWorldMapSprite4  ; $4E - ulsterch7
      ;  .addr aWorldMapSprite4  ; $50 - ribautch7
      ;  .addr aWorldMapSprite4  ; $52 - leonsterch8
      ;  .addr aWorldMapSprite4  ; $54 - ulsterch8
      ;  .addr aWorldMapSprite4  ; $56 - connacht
      ;  .addr aWorldMapSprite4  ; $58 - munster
      ;  .addr aWorldMapSprite4  ; $5A - meath
      ;  .addr aWorldMapSprite4  ; $5C - tirnanog? unused
      ;  .addr aWorldMapSprite4  ; $5E - unknown2

      rlUnknown8B87A0 ; 8B/87A0

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlUnknown8B87A1 ; 8B/87A1

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .structDMAToVRAM $D97940, $01C0, $80, $AD40

        lda #0
        sta $7F5486

        sep #$20
        lda #$14
        sta $97
        rep #$20

        lda #0
        sta $7F5488
        rtl

        .databank 0

      rlUnknown8B87C5 ; 8B/87C5

        .al
        .autsiz
        .databank ?

        jsl rlDialogueFreeHDMA

        ldx #(32 * 32) * size(word) - 2
        lda #$00FF

          -
          sta aBG2TilemapBuffer.Page1,x
          dec x
          dec x
          bpl -

        jsl rlDMAByStruct

          .structDMAToVRAM aBG2TilemapBuffer.Page1, 32 * 21 * size(word), $80, $A800

        rtl

        .databank 0

        ; 8B/87E5

    .endsection WorldMapMarkers1Section


    .section WorldMapMarkers2Section

      aWorldMapSprite1 ; 8B/977D

        _Sprites := [[( -43,   -6), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[( -34,   -8), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -23,   -8), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -12,   -6), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  -2,   -3), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(   8,    2), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  18,    9), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  26,   17), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  35,   27), $21, SpriteLarge, $0002, 3, 1, true, true]]

        .structSpriteArray aWorldMapSprite1._Sprites

      aWorldMapSprite2 ; 8B/97AC

        _Sprites := [[(  57,  -70), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[(  52,  -60), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  48,  -49), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  42,  -38), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  36,  -28), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  27,  -18), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  18,   -9), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(   8,   -1), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  -2,    7), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -13,   14), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -24,   20), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -36,   26), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -49,   31), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -62,   35), $21, SpriteLarge, $0002, 3, 1, false, false]]

        .structSpriteArray aWorldMapSprite2._Sprites

      aWorldMapSprite3 ; 8B/97F4

        _Sprites := [[(   5,   -5), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  -5,   -5), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -15,   -4), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -25,   -2), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -35,    0), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -46,    3), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -56,    6), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -66,   11), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite3._Sprites

      aWorldMapSprite4 ; 8B/981E

        _Sprites := [[(   0,    0), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite4._Sprites

      aWorldMapSprite5 ; 8B/9825

        _Sprites := [[(-112,   24), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[( -41,    7), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  24,  -25), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[( -49,  -72), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[( -89, -104), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(   8, -120), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[( -18,   98), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite5._Sprites

      aWorldMapSprite6 ; 8B/984A

        _Sprites := [[(  -8,   -8), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite6._Sprites

      aWorldMapSprite7 ; 8B/9851

        _Sprites := [[(  -8,   -8), $21, SpriteLarge, $0002, 3, 1, false, false]]

        .structSpriteArray aWorldMapSprite7._Sprites

      aWorldMapSprite8 ; 8B/9858

        _Sprites := [[(  -7,   -8), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[( -15,  -16), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -22,  -27), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -27,  -38), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -30,  -50), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -32,  -63), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -33,  -76), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -32,  -87), $21, SpriteLarge, $0002, 3, 1, false, false]]

        .structSpriteArray aWorldMapSprite8._Sprites

      aWorldMapSprite9 ; 8B/9882

        _Sprites := [[( -32,  -87), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[( -27,  -78), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -22,  -68), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -18,  -57), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -15,  -46), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -12,  -34), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -10,  -22), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  -7,   -8), $21, SpriteLarge, $0002, 3, 1, false, false]]

        .structSpriteArray aWorldMapSprite9._Sprites

      aWorldMapSprite10 ; 8B/98AC

        _Sprites := [[(  -7,   -8), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(   2,   -7), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  13,   -5), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  24,   -1), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  35,    5), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  46,   13), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  57,   23), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite10._Sprites

      aWorldMapSprite11 ; 8B/98D1

        _Sprites := [[(   8,   17), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[(  16,  -88), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[(-112,    0), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[( -64,   48), $21, SpriteLarge, $0002, 3, 1, false, false]]

        .structSpriteArray aWorldMapSprite11._Sprites

      aWorldMapSprite12 ; 8B/98E7

        _Sprites := [[(  -7,   -8), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  -1,  -14), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(   9,  -18), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  19,  -20), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  30,  -19), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  41,  -16), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite12._Sprites

      aWorldMapSprite13 ; 8B/9907

        _Sprites := [[(  -7,  -32), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  -1,  -38), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(   9,  -42), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  19,  -44), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  30,  -43), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  41,  -40), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  48,  -36), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  53,  -28), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  55,  -19), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  55,   -9), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  49,    0), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  41,    8), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  32,   16), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  23,   22), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  15,   27), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(   7,   34), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  -1,   40), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  -8,   48), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -15,   57), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -21,   68), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -24,   80), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[( -28,   90), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -33,   99), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -44,  103), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -55,  104), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite13._Sprites

      aWorldMapSprite14 ; 8B/9986

        _Sprites := [[(  16,   32), $21, SpriteLarge, $0002, 3, 1, false, false]]
        _Sprites..= [[(   7,   27), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(   2,   18), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  -3,    8), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[(  -7,   -3), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -10,  -14), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -12,  -25), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -14,  -37), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -15,  -48), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -16,  -60), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -17,  -73), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -17,  -86), $21, SpriteLarge, $0000, 3, 1, false, false]]
        _Sprites..= [[( -15, -101), $21, SpriteLarge, $0000, 3, 1, false, false]]

        .structSpriteArray aWorldMapSprite14._Sprites

      aWorldMapSprite15 ; 8B/99C9

        _Sprites := [[(  -8,   -8), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  -3,   -2), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(   1,    6), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(   1,   15), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  -2,   24), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  -9,   31), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -16,   39), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite15._Sprites

      aWorldMapSprite16 ; 8B/99EE

        _Sprites := [[(  24,   32), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[( -72,   94), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(-113,   23), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[( -41,   -1), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(   0,  -64), $21, SpriteLarge, $0002, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite16._Sprites

      aWorldMapSprite17 ; 8B/9A09

        _Sprites := [[(  88,   24), $21, SpriteLarge, $0002, 3, 2, false, false]]
        _Sprites..= [[(  79,   18), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  72,   13), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  63,    9), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  53,    6), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  43,    5), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  32,    5), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  20,    6), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(   9,    9), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[(  -2,   12), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -12,   17), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -23,   21), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -32,   22), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -42,   22), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -50,   16), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -52,    6), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -51,   -4), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -47,  -14), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -45,  -26), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -49,  -37), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -58,  -43), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -68,  -48), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -78,  -48), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -85,  -42), $21, SpriteLarge, $0000, 3, 2, false, false]]
        _Sprites..= [[( -94,  -33), $21, SpriteLarge, $0000, 3, 2, false, false]]

        .structSpriteArray aWorldMapSprite17._Sprites

        ; 8B/9A88

    .endsection WorldMapMarkers2Section
