
    .section Code818ECBSection

      rlCreateMapScrollScriptFromCoordinates ; 81/8ECB

        .al
        .autsiz
        .databank ?

        ; Takes in coordinates and turns them into a map scroll script.

        ; Input:
        ; wR1 = map scroll speed
        ; wR2 = Start x coord
        ; wR3 = Start y coord
        ; wR4 = Dest x coord
        ; wR5 = Dest y coord

        lda wR1
        sta wEventMapScrollSpeed,b

        lda #(`$7EDD88)<<8
        sta lR18+1
        lda #<>$7EDD88
        sta lR18
        jsr rsInitializeCreateMapScrollScript
        
          -
          jsr rsCreateMapScrollScriptFromCoordinatesEffect
          bcc -

        rtl

        .databank 0

      rsInitializeCreateMapScrollScript ; 81/8EE3

        .al
        .autsiz
        .databank ?

        ; Start with MAP_PAUSE 1

        ldy #0
        lda #9 +9
        sta [lR18],y
        inc y
        lda #1
        sta [lR18],y
        dec y
        rts

        .databank 0

      rsCreateMapScrollScriptFromCoordinatesEffect ; 81/8EF3

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR2 = Start x coord
        ; wR3 = Start y coord
        ; wR4 = Dest x coord
        ; wR5 = Dest y coord

        cpy #$007F
        bne +

          jml _WriteEndCommand

        +
        lda #0
        sta wR0
        ldx #0

        lda wR2
        cmp wR4
        beq +

          inc x

        +
        rol wR0

        lda wR3
        cmp wR5
        beq +

          inc x

        +
        rol wR0

        cpx #0
        beq _WriteEndCommand

        cpx #2
        bne _SingleDirectionScroll

        ; Scrolling in multiple directions needed
        lda wR0
        bit #$0002
        bne +

        inc wR2
        bra ++

        +
        dec wR2

        +
        bit #$0001
        bne +

        inc wR3
        bra ++

        +
        dec wR3

        +
        tax
        lda aDiagonalMapScrollLookupTable,x
        and #$00FF
        bra _WriteScrollCommand

        _SingleDirectionScroll
        lda wR2
        cmp wR4
        beq _CheckYScroll

          lda wR2
          cmp wR4
          bcc +

            ; Left multiple
            dec wR2
            lda #$0A
            bra _WriteScrollCommand

          ; Right multiple
          +
          inc wR2
          lda #$0B
          bra _WriteScrollCommand

        _CheckYScroll
        lda wR3
        cmp wR5
        bcc +

          ; Up multiple
          dec wR3
          lda #$0C
          bra _WriteScrollCommand

        ; Down multiple
        +
        inc wR3
        lda #$0D 
        bra _WriteScrollCommand

        _WriteEndCommand
        lda #$0080
        inc y
        inc y
        sta [lR18],y
        sec
        bra _End

        _WriteScrollCommand
        sta wR7
        lda [lR18],y
        and #$00FF
        cmp wR7
        bne _DifferentDirection

        ; If current direction matches last, increment the last ones
        ; scroll distance.
        inc y
        lda [lR18],y
        inc a
        sta [lR18],y
        dec y
        bra +

        _DifferentDirection
        lda wR7
        inc y
        inc y
        sta [lR18],y
        inc y
        lda #1
        sta [lR18],y
        dec y

        +
        clc

        _End
        rts

        .databank 0

      aDiagonalMapScrollLookupTable ; 81/8F9D

        .byte $11 ; bottom right
        .byte $10 ; top right
        .byte $0F ; bottom left
        .byte $0E ; top left

        ; 81/8FA1

    .endsection Code818ECBSection


    .section Code81B483Section

      rlSetChapterEventDataPointer ; 81/B483

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda lR18+1
        sta lChapterEventDataPointer+1,b
        lda lR18
        sta lChapterEventDataPointer,b

        plp
        plb
        rtl

        .databank 0

      rlGetChapterLocationDataPointer ; 81/B494

        .al
        .autsiz
        .databank ?

        phy
        ldy lChapterEventDataPointer,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20

        plb
        lda structChapterEventData.LocationDataPointer,b,y

        ply
        rtl

        .databank 0

      rlGetChapterMapChangesPointer ; 81/B4A6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        lda lChapterEventDataPointer+1,b
        sta lR18+1

        ldy lChapterEventDataPointer,b
        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterEventData.MapChangesPointer,b,y
        sta lR18

        ply
        plp
        plb
        rtl

        .databank 0

        ; 81/B4C5

    .endsection Code81B483Section
