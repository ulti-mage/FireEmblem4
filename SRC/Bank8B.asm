
    .section Code8BCDD8Section

      rlUnknown8BCDD8 ; 8B/CDD8

        .al
        .autsiz
        .databank ?

        lda #0
        jsl rlGetFactionSlotUnitCount
        sta wR0

        jsl rlGetSelectedUnitGenerationID
        dec a
        tax

        lda wR0
        sep #$20
        sta $7E531B,x
        rep #$20
        rtl

        .databank 0

      rlUnknown8BCDF2 ; 8B/CDF2

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitGenerationID
        dec a
        tax
        lda $7E531B,x
        and #$00FF
        sta wR2

        sep #$20
        lda #0
        sta $7E531B,x
        rep #$20

        ldx #0

          -
          lda $7E531B,x
          and #$00FF
          cmp wR2
          bcc +

            lda $7E531B,x
            dec a
            sta $7E531B,x

          +
          inc x
          cpx #$0018
          bne -

        rtl

        .databank 0

        ; 8B/CE29

    .endsection Code8BCDD8Section
