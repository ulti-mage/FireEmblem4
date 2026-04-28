
    .section Code8F8000Section

      aUnknown8F8000 ; 8F/8000

        .word $AA24
        .word $B66C
        .word $5349

      rlUnknown8F8006 ; 8F/8006

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda aUnknown8F8000+4
        beq _CLC

          lda #0
          ldx #$8D56

            -
            clc
            adc $800000,x
            inc x
            inc x
            cpx #$8E2D
            bcc -

          cmp aUnknown8F8000
          bne _SEC

          lda #0
          ldx #$8017

            -
            clc
            adc $870000,x
            inc x
            inc x
            cpx #$80AA
            bcc -

          cmp aUnknown8F8000+2
          bne _SEC

          lda aUnknown8F8000
          cmp $888000
          bne _SEC

          cmp $878008
          bne _SEC

          lda aUnknown8F8000+2
          cmp $888002
          bne _SEC

          cmp $87800A
          bne _SEC

        _CLC
        plx
        plp
        plb
        clc
        rtl

        _SEC
        plx
        plp
        plb
        sec
        rtl

        .databank 0

    .endsection Code8F8000Section
