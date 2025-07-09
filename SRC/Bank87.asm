
    .section Code87A19DSection

      rlCheckIfUnitHasSpecifiedPersonalOrClassSkill ; 87/A19D

        .al
        .autsiz
        .databank `aValidPersonalSkillTable

        ; A = skill ID

        phb
        php
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        sta wRoutineVariable1,b

        lda wRoutineVariable1,b
        asl a
        clc
        adc wRoutineVariable1,b
        tax
        jsl rlGetSelectedUnitSkills

        lda lRoutineVariable,b
        bit aValidPersonalSkillTable,x
        bne +

        lda lRoutineVariable+1,b
        bit aValidPersonalSkillTable+1,x
        bne +

        lda wRoutineVariable1,b
        asl a
        tax
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSkills
        bit aValidClassSkillTable,x
        bne +

        plx
        stx wRoutineVariable1,b
        plx
        plp
        plb
        clc
        rtl

        +
        plx
        stx wRoutineVariable1,b
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      aValidPersonalSkillTable .block ; 87/A1EA

        .long 0                               ; SkillIDDummy
        .long 0                               ; SkillIDCanto
        .long 0                               ; SkillIDPavise
        .long UnitSkill1Wrath
        .long UnitSkill1Pursuit
        .long UnitSkill1Adept
        .long 0                               ; SkillIDSteal
        .long 0                               ; SkillIDUnknown2
        .long 0                               ; SkillIDDance
        .long 0                               ; SkillIDUnknown3
        .long 0                               ; SkillIDUnknown4
        .long UnitSkill1Dismount
        .long UnitSkill1Charm
        .long UnitSkill1PoW
        .long UnitSkill1Nihil
        .long UnitSkill1Miracle
        .long UnitSkill2Critical << 8
        .long UnitSkill2Vantage  << 8
        .long UnitSkill2Accost   << 8
        .long UnitSkill2Astra    << 8
        .long UnitSkill2Luna     << 8
        .long UnitSkill2Sol      << 8
        .long UnitSkill2Holy     << 8
        .long UnitSkill2Darkness << 8
        .long UnitSkill3Renewal  << 16
        .long UnitSkill3Paragon  << 16
        .long UnitSkill3Escape   << 16
        .long UnitSkill3Recover  << 16
        .long UnitSkill3Bargain  << 16
        .long UnitSkill3Return   << 16

      .bend

      aValidClassSkillTable .block ; 87/A244

        .word 0                       ; SkillIDDummy
        .word ClassSkillCanto
        .word ClassSkillPavise
        .word ClassSkillWrath
        .word ClassSkillPursuit
        .word ClassSkillAdept
        .word ClassSkillSteal
        .word ClassSkillUnknown1      ; SkillIDUnknown2
        .word ClassSkillDance
        .word ClassSkillUnknown2      ; SkillIDUnknown3
        .word ClassSkillUnknown3      ; SkillIDUnknown4
        .word ClassSkillDismount
        .word ClassSkillCharm
        .word 0                       ; SkillIDPoW
        .word 0                       ; SkillIDNihil
        .word 0                       ; SkillIDMiracle
        .word ClassSkillCritical
        .word 0                       ; SkillIDVantage
        .word 0                       ; SkillIDAccost
        .word 0                       ; SkillIDAstra
        .word 0                       ; SkillIDLuna
        .word 0                       ; SkillIDSol
        .word 0                       ; SkillIDHoly
        .word 0                       ; SkillIDDarkness
        .word 0                       ; SkillIDRenewal
        .word 0                       ; SkillIDParagon
        .word 0                       ; SkillIDEscape
        .word 0                       ; SkillIDRecover
        .word 0                       ; SkillIDBargain
        .word 0                       ; SkillIDReturn

      .bend

      aValidItemSkillTable .block; 87/A280

        .word 0                 ; SkillIDDummy
        .word ItemSkillCanto
        .word 0                 ; SkillIDPavise
        .word 0                 ; SkillIDWrath
        .word ItemSkillPursuit
        .word 0                 ; SkillIDAdept
        .word ItemSkillSteal
        .word 0                 ; SkillIDUnknown2
        .word 0                 ; SkillIDDance
        .word 0                 ; SkillIDUnknown3
        .word ItemSkillUnknown1 ; SkillIDUnknown4
        .word 0                 ; SkillIDDismount
        .word 0                 ; SkillIDCharm
        .word 0                 ; SkillIDPoW
        .word 0                 ; SkillIDNihil
        .word ItemSkillMiracle
        .word ItemSkillCritical
        .word 0                 ; SkillIDVantage
        .word 0                 ; SkillIDAccost
        .word 0                 ; SkillIDAstra
        .word 0                 ; SkillIDLuna
        .word 0                 ; SkillIDSol
        .word 0                 ; SkillIDHoly
        .word 0                 ; SkillIDDarkness
        .word ItemSkillRenewal
        .word ItemSkillParagon
        .word ItemSkillEscape
        .word ItemSkillRecover
        .word ItemSkillBargain
        .word ItemSkillReturn

      .bend

      rlCheckIfUnitHasSpecifiedPersonalSkill ; 87/A2BC

        .al
        .autsiz
        .databank `aValidPersonalSkillTable

        ; A = skill ID

        phb
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        sta wRoutineVariable1,b
        lda wRoutineVariable1,b
        asl a
        clc
        adc wRoutineVariable1,b
        tax
        jsl rlGetSelectedUnitSkills

        lda lRoutineVariable,b
        bit aValidPersonalSkillTable,x
        bne +

        lda lRoutineVariable+1,b
        bit aValidPersonalSkillTable+1,x
        bne +

        clc

        -
        plx
        stx wRoutineVariable1,b
        plx
        plb
        rtl
        
        +
        sec
        bra -

        .databank 0

      rlCheckIfInventoryItemsHaveSpecifiedSkill ; 87/A2EF

        .al
        .autsiz
        .databank `aValidItemSkillTable

        phb
        php
        phk
        plb
        phx
        phy

        asl a
        tax
        ldy #1

        -
        tya
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _CLC

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne +

          tya
          jsl rlCheckIfWeaponEquipped
          bcc ++

        +
        jsl rlGetItemSkills
        bit aValidItemSkillTable,x
        bne _SEC

        +
        inc y
        bra -

        _CLC
        ply
        plx
        plp
        plb
        clc
        rtl

        _SEC
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      rlDebugGetSkillList ; 87/A32C

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #0
        sta wDebugMenuSkillCounter

        ldx #size(aDebugMenuSkillFlags)-1
        lda #0

        -
        sta aDebugMenuSkillFlags,x
        dec x
        bpl -

        jsr rsDebugGetClassSkills
        jsr rsDebugGetPersonalSkills
        jsr rsDebugGetItemSkills
        plx

        plp
        plb
        rtl

        .databank 0

      rsDebugFlagSkillPossesstion ; 87/A352

        .al
        .autsiz
        .databank ?

        ; wR0 = skill ID

        phx
        ldx wR0
        lda aDebugMenuSkillFlags,x
        and #$00FF
        bne +

          sep #$20
          lda #1
          sta aDebugMenuSkillFlags,x
          rep #$20

          lda wDebugMenuSkillCounter
          inc a
          sta wDebugMenuSkillCounter

        +
        plx
        rts

        .databank 0

      rsDebugGetClassSkills ; 87/A373

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSkills
        ora #0
        beq _End

          sta wR1

          lda #size(aDebugMenuSkillFlags)-1
          sta wR0

          ldx #size(aValidClassSkillTable)-2

          -
          lda aValidClassSkillTable,x
          bit wR1
          beq +

            jsr rsDebugFlagSkillPossesstion

          +
          dec wR0
          dec x
          dec x
          bpl -

        _End
        rts

        .databank 0

      rsDebugGetPersonalSkills ; 87/A39C

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitSkills

        ; ora all skills together to see if we have minimum 1

        lda lRoutineVariable,b
        ora lRoutineVariable+1,b
        beq _End

          lda #size(aDebugMenuSkillFlags)-1
          sta wR0

          ldx #size(aValidPersonalSkillTable)-3

          -
          lda aValidPersonalSkillTable,x
          bit lRoutineVariable,b
          bne +

          lda aValidPersonalSkillTable+1,x
          bit lRoutineVariable+1,b
          beq ++

            +
            jsr rsDebugFlagSkillPossesstion
          
          +
          dec wR0
          dec x
          dec x
          dec x
          bpl -
        
        _End
        rts

        .databank 0

      rsDebugGetItemSkills ; 87/A3CD

        .al
        .autsiz
        .databank ?

        ldx #1
        
        _Loop
        txa
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer
        beq _End

          jsl rlGetItemEquipmentType
          cmp #EquipTypeWeapon
          bne +

            tya
            jsl rlCheckIfWeaponEquipped
            bcc _A411
          
          +
          jsl rlGetItemSkills
          ora #0
          beq _A411

          sta wR1

          lda #size(aDebugMenuSkillFlags)-1
          sta wR0

          phx
          ldx #size(aValidItemSkillTable)-2
          
          -
          lda aValidItemSkillTable,x
          bit wR1
          beq +

            jsr rsDebugFlagSkillPossesstion

          +
          dec wR0
          dec x
          dec x
          bpl -

          plx

          _A411
          inc x
          bra _Loop
        
        _End
        rts

        .databank 0

      rlUnknown87A415 ; 87/A415

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda #0
        sta $7E2000
        ldx #$001D
        lda #0
        
        -
        sta $7E2002,x
        dec x
        bpl -

        jsr $87A373
        jsr $87A39C

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetPromotedClassIfAvailable ; 87/A438

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda #0
        sta $7E2000

        jsl rlGetSelectedUnitStates
        bit #UnitState1000
        bne _SEC

        jsl rlGetSelectedUnitClassID
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitCharacterID
        dec a
        tax
        lda aPromotionTable,x
        and #$00FF
        cmp #$00FF
        beq _SEC

        cmp wRoutineVariable1,b
        beq _SEC

        jsl rlGetClassDataROMPointer
        jsl rlGetSelectedUnitLevel
        sta wRoutineVariable1,b

        jsl rlGetClassPromotionLevel
        dec a
        cmp wRoutineVariable1,b
        bpl +

          lda aPromotionTable,x
          sta $7E2000+2
          lda #1
          sta $7E2000

        +
        ply
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        _SEC
        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetClassDataROMPointer ; 87/A49D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        asl a
        clc
        adc aMainDataOffsets.ClassDataOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.ClassDataOffsets
        adc #<>aMainDataOffsets
        sta wCurrentClassDataROMPointer,b
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassNamePointer ; 87/A4BC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        asl a
        clc
        adc aMainDataOffsets.ClassNameOffsets
        tax
        lda #(`aMainDataOffsets)<<8
        sta lRoutineVariable+1,b
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.ClassNameOffsets
        adc #<>aMainDataOffsets
        sta lRoutineVariable,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetClassPromotionLevel ; 87/A4E1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.PromotionLevel,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassBaseHP ; 87/A4F9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.HP,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassStrength ; 87/A511

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Strength,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMagic ; 87/A529

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Magic,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSkill ; 87/A541

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Skill,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSpeed ; 87/A559

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Speed,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassDefense ; 87/A571

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Defense,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassResistance ; 87/A589

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Resistance,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassWeaponRank ; 87/A5A1

        .al
        .autsiz
        .databank ?

        ; A = weapon type

        phb
        php

        phk
        plb

        phx

        pha

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        pla
        clc
        adc wCurrentClassDataROMPointer,b
        tax
        lda structClassROMEntry.WeaponRanks,b,x
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetClassHPGrowth ; 87/A5C9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.HPGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassStrGrowth ; 87/A5E1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.StrengthGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMagGrowth ; 87/A5F9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.MagicGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSklGrowth ; 87/A611

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.SkillGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSpdGrowth ; 87/A629

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.SpeedGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassDefGrowth ; 87/A641

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.DefenseGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassResGrowth ; 87/A659

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.ResistanceGrowth,b,x 
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMovement ; 87/A671

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Movement,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMovementType ; 87/A689

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.MovementType,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassTerrainBonusType ; 87/A6A1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.TerrainBonusType,b,x 
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMoney ; 87/A6B9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Money,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSkills ; 87/A6D1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Skills,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rsFillChildExtendedPersonalData ; 87/A6E6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wR0
        pha
        lda wR1
        pha
        lda wR3
        pha

        jsl rlGetSelectedUnitGender
        sta wR3

        phy
        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData,x
        tay

        plx
        sep #$20
        lda $830000+structDynamicCharacterROMEntry.Class,x
        sta structExtendedCharacterDataRAM.Class,b,y
        lda $830000+structDynamicCharacterROMEntry.Level,x
        sta structExtendedCharacterDataRAM.Level,b,y
        lda #0
        sta structExtendedCharacterDataRAM.LeadershipStars,b,y
        sta structExtendedCharacterDataRAM.Experience,b,y
        rep #$20

        ; So... FE4 just autopromotes player units on spawn 
        ; if they are above the needed class promo level... why?
        jsl rlGetPromotedClassIfAvailable

        lda $7E2000
        beq +

          lda $7E2000+2
          jsl rlSetSelectedUnitClass

        +
        lda aUnit1DataBuffer._Extended.Money
        clc
        adc aUnit2DataBuffer._Extended.Money
        sta wR12

        ; divide total money by 10
        lda #0
        adc #0
        sta wR13
        lda #10
        sta wR14
        stz wR15
        jsl $80A1D8

        lda wR12
        clc
        adc #2000
        sta structExtendedCharacterDataRAM.Money,b,y

        jsl rlGetSelectedUnitLevel
        sta wR0
        jsl rlGetSelectedUnitTotalHPGrowth
        jsr rlGetAverageStatsForLevel
        clc
        adc #15
        sta aChildAverageLevelStats.HP

        jsl rlGetSelectedUnitTotalStrGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Strength

        jsl rlGetSelectedUnitTotalMagGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Magic

        jsl rlGetSelectedUnitTotalSklGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Skill

        jsl rlGetSelectedUnitTotalSpdGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Speed

        jsl rlGetSelectedUnitTotalDefGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Defense

        jsl rlGetSelectedUnitTotalResGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Resistance

        jsl rlGetSelectedUnitTotalLuckGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Luck

        phy
        ldx #0

        -
        lda aUnit1DataBuffer._Extended.HP,x
        sta wR0
        lda aUnit2DataBuffer._Extended.HP,x
        sta wR1
        lda aChildAverageLevelStats.HP,x
        sta wR2
        jsr rlGetChildAdjustedBaseStat

        sep #$20
        sta structExtendedCharacterDataRAM.HP,b,y
        rep #$20
        inc x
        inc x
        inc y
        cpx #size(aChildAverageLevelStats)
        bcc -

        ; Add a random amount of 0-9 luck to a child
        ply
        lda #9 +1
        jsl rlGetRandomNumber100
        inc a
        clc
        adc structExtendedCharacterDataRAM.Luck,b,y
        sta structExtendedCharacterDataRAM.Luck,b,y

        pla
        sta wR3
        pla
        sta wR1
        pla
        sta wR0
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetAverageStatsForLevel ; 87/A80A

        .al
        .autsiz
        .databank ?

        stz wR12
        cmp #101
        bcc +

          sec
          sbc #100
          sta wR12

          lda #100

        +
        jsl rlConvertChanceToFullByte
        sta wR10

        lda wR12
        beq +

          jsl rlConvertChanceToFullByte
          clc
          adc wR10
          sta wR10

        +
        lda wR0
        dec a
        xba
        sta wR11
        jsl rlUnsignedMultiply16By16
        lda wR13
        rts

        .databank 0

      rlGetChildAdjustedBaseStat ; 87/A83A

        .al
        .autsiz
        .databank ?

        ; wR3 = gender

        phb
        php
        phk
        plb
        lda wR3
        beq _Male

        asl wR0
        bra +
        
        _Male
        asl wR1
        
        +
        lda wR0
        clc
        adc wR1
        sta WRDIVA,b
        sep #$20
        lda #10
        sta WRDIVB,b
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        rep #$20
        lda RDDIV,b
        clc
        adc wR2
        plp
        plb
        rts

        .databank 0

      rlFillChildsConstantData ; 87/A869

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda wR0
        pha
        lda wR1
        pha
        lda wR2
        pha
        lda wR3
        pha
        lda wR4
        pha

        phy

        ldx wSelectedUnitDataRAMPointer,b

        sep #$20
        lda $7E0000+structCharacterDataRAM.ConstantData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.ConstantData,x
        tay

        plx
        phx
        phy
        lda #structDynamicCharacterROMEntry.Equipment2-structDynamicCharacterROMEntry.CharacterID
        sta wR2

        sep #$20

        -
        lda $830000+structDynamicCharacterROMEntry.CharacterID,x
        sta structCharacterConstantData.CharacterID,b,y
        inc x
        inc y
        dec wR2
        bne -

        rep #$20
        ply
        lda aUnit2DataBuffer._ROM.CharacterID
        sep #$20
        sta structCharacterConstantData.FatherID,b,y
        rep #$20
        phy
        lda structCharacterConstantData.Gender,b,y
        and #$00FF
        sta wR2

        ldx #structCharacterROMDataBuffer.HPGrowth

        -
        lda aUnit1DataBuffer._ROM.HPGrowth - structCharacterROMDataBuffer.HPGrowth,x
        sta wR0
        lda aUnit2DataBuffer._ROM.HPGrowth - structCharacterROMDataBuffer.HPGrowth,x
        sta wR1
        jsr rlGetChildGrowthRate

        sep #$20
        sta structCharacterConstantData.HPGrowth,b,y
        rep #$20
        inc x
        inc x
        inc y
        cpx #size(structCharacterConstantData.Growths)*2 + structCharacterROMDataBuffer.HPGrowth
        bcc -

        ply
        lda structCharacterConstantData.CharacterID,b,y
        sec
        sbc #Seliph
        sta wR3

        asl a
        clc
        adc wR3
        tax
        lda aUnit1DataBuffer._ROM.Skills1
        ora aUnit2DataBuffer._ROM.Skills1
        and aValidInheritableSkills,x
        sta structCharacterConstantData.Skills1,b,y

        lda aUnit1DataBuffer._ROM.Skills2
        ora aUnit2DataBuffer._ROM.Skills2
        and aValidInheritableSkills+1,x
        sta structCharacterConstantData.Skills2,b,y

        plx
        lda $830000+structDynamicCharacterROMEntry.MajorInfluence,x
        and #$00FF
        beq +

        ; Father influence

        lda aUnit1DataBuffer._ROM.HolyBlood1
        sta wR0
        lda aUnit2DataBuffer._ROM.HolyBlood1
        sta wR1
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood1,b,y

        lda aUnit1DataBuffer._ROM.HolyBlood2
        sta wR0
        lda aUnit2DataBuffer._ROM.HolyBlood2
        sta wR1
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood2,b,y
        bra ++

        ; Mother influence
        +
        lda aUnit2DataBuffer._ROM.HolyBlood1
        sta wR0
        lda aUnit1DataBuffer._ROM.HolyBlood1
        sta wR1
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood1,b,y

        lda aUnit2DataBuffer._ROM.HolyBlood2
        sta wR0
        lda aUnit1DataBuffer._ROM.HolyBlood2
        sta wR1
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood2,b,y

        +
        pla
        sta wR4
        pla
        sta wR3
        pla
        sta wR2
        pla
        sta wR1
        pla
        sta wR0

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aValidInheritableSkills .binclude "../TABLES/CHARACTER/ValidInheritableSkills.asm"  ; 87/A975

      rlGetChildGrowthRate ; 87/A9EA

        .al
        .autsiz
        .databank ?

        ; In: 
        ; wR0 = mother growth
        ; wR1 = father growth
        ; wR2 = gender

        ; if male: double father growth, add mother and halve the total
        ; if female: double mother growth, add father and halve the total

        lda wR2
        beq +

        asl wR0
        bra ++
        
        +
        asl wR1
        
        +
        lda wR0
        clc
        adc wR1
        lsr a
        rts

        .databank 0

      rlGetChildHolyBlood ; 87/A9FB

        .al
        .autsiz
        .databank ?

        ; wR0 = minor blood influence
        ; wR1 = major blood influence

        lda wR0
        clc
        adc #$5555
        lsr a
        and #$5555
        sta wR0

        stz wR2
        stz wR3
        stz wR4

        ldx #8

        -
        lsr wR0
        ror wR2
        lsr wR0
        ror wR2
        lsr wR1
        ror wR3
        lsr wR1
        ror wR3
        lsr wR4
        lsr wR4

        lda wR2
        clc
        adc wR3
        bcc +

          lda #$8000

        +
        and #$C000
        ora wR4
        sta wR4
        dec x
        bne -

        rts

        .databank 0

      rlInheritInventoryToChild ; 87/AA39

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsr rsUnknown87AAC9
        jsl rlGetSelectedUnitInventorySize
        sta wR3

        lda #1
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq +

          jsl rlGetItemMight

        +
        sta wR4

        ldx wSelectedUnitDataRAMPointer,b

        -
        lda wR2
        sta wSelectedUnitDataRAMPointer,b
        lda #1
        jsl rlGetPlayerItemIndexByInventorySlot
        bcs +

          tay
          lda #1
          jsl rlRemoveItemInSpecifiedInventorySlot
          tya
          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry
          stx wSelectedUnitDataRAMPointer,b
          jsr rsTryInheritItemToChild
          bra -
        
        +
        stx wSelectedUnitDataRAMPointer,b
        ldy #1

        ; Also inherit all the items that are in the supply
        -
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        sty wStructIndex,b
        jsl rlGetRAMStructEntryPointerByStructIndex
        bcs _End

          lda lStructPointer1,b
          sta $0587,b
          jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry
          jsl rlGetItemRAMStateAndOwner

          lda wR1
          cmp wR2
          bne +

            lda wR0
            cmp #ItemStateSupply
            bne +

              jsr rsTryInheritItemToChild

          +
          inc y
          bra -

        _End
        jsl rlEquipFirstWeaponInInventory
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsUnknown87AAC9 ; 87/AAC9

        .al
        .autsiz
        .databank ?

        ; wR2 = major influence parent ram pointer

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        lda wR2
        sta wSelectedUnitDataRAMPointer,b
        ldy #1

        -
        tya
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _InventoryDone

          jsr rsCheckForInheritableWeaponRank
          bcc +

            ; is a holy weapon
            tya
            jsl rlRemoveItemInSpecifiedInventorySlot
            jsl rlGetItemRAMStateAndOwner
            cpx wR1
            beq +

              jsl rlRevertItemAquirement
              bra -

          +
          inc y
          bra -


        _InventoryDone
        ldy #1

          _Loop
          lda wR2
          sta wSelectedUnitDataRAMPointer,b
          tya
          jsl rlGetItemIDByInventorySlot
          bcs _End

          sta wR0
          phy
          stx wSelectedUnitDataRAMPointer,b
          ldy #1

            -
            tya
            jsl rlGetItemIDByInventorySlot
            bcs _AB2C

              cmp wR0
              bne +

                tya
                jsl rlRemoveItemInSpecifiedInventorySlot
                jsl rlRevertItemAquirement
                bra _AB2C

            +
            inc y
            bra -

          _AB2C
          ply
          inc y
          bra _Loop
        
        _End
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        rts

        .databank 0

      rsCheckIfItemObtainableByType ; 87/AB36

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetItemEquipmentType
        asl a
        tax
        jsr (aItemObtainChecksByType,x)
        plx
        rts

        .databank 0

      aItemObtainChecksByType ; 87/AB42

        .addr rsCheckWeaponOrStaffObtainable
        .addr rsCheckWeaponOrStaffObtainable
        .addr rsCheckRingObtainable
        .addr rsCheckRingObtainable

      rsCheckWeaponOrStaffObtainable ; 87/AB4A

        .al
        .autsiz
        .databank ?

        jsl rlCheckItemObtainable
        rts

        .databank 0

      rsCheckRingObtainable ; 87/AB4F

        .al
        .autsiz
        .databank ?

        sec
        rts

        .databank 0

      rsCheckForInheritableWeaponRank ; 87/AB51

        .al
        .autsiz
        .databank ?

        ; Special holy weapon = 1 and clc
        ; normal weapon = 0 and clc
        ; holy weapon = $FF and sec

        jsl rlGetItemIDByItemRAMStructEntry
        cmp #Forseti
        beq +

        cmp #ValkyrieStaff
        beq +

        cmp #Yewfelle
        beq +

        jsl rlGetItemWeaponRank
        ora #0
        bmi ++

        lda #0
        clc
        
        -
        rts
        
        +
        lda #1
        clc
        bra -
        
        +
        sec
        bra -

        .databank 0

      rsTryInheritItemToChild ; 87/AB7B

        .al
        .autsiz
        .databank ?

        jsr rsCheckForInheritableWeaponRank
        bcs _NotInheritable
        bne +

        jsr rsCheckIfItemObtainableByType
        bcc _NotInheritable

        lda wR3
        cmp #size(structInventoryDataRAM.Slot)-1
        bcs _SendToUnitsSupply

        +
        inc wR3

        jsl rlGetItemMight
        cmp wR4
        bcc +

          sta wR4
          sty wRoutineVariable1,b
          jsl rlGivePlayerItemIDToSelectedUnitsFirstItemSlot
          bra _End

        +
        sty wRoutineVariable1,b
        jsl rlGivePlayerItemIDToSelectedUnit
        bra _End

        _SendToUnitsSupply
        lda #2
        sta wR0
        lda wSelectedUnitDataRAMPointer,b
        sta wR1
        jsl rlSetItemRAMStateAndOwner
        bra _End
        
        _NotInheritable
        jsl rlRevertItemAquirement
        
        _End
        rts

        .databank 0

      rlGetUnitLoveBaseWithTarget ; 87/ABC1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx
        ldx wR1
        phx

        jsl rlGetSelectedUnitGenerationID
        bcs _AC3E

        cmp #$10
        bcs +

          ; male unit
          jsl rlGetSelectedUnitLoveDataID
          sta wR0
          lda wRoutineVariable1,b
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitLoveDataID
          asl a
          sta wR1
          bra ++

          ; female unit
          +
          jsl rlGetSelectedUnitLoveDataID
          asl a
          sta wR1
          lda wRoutineVariable1,b
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitLoveDataID
          sta wR0

        +
        ldx wR1
        lda aLoveBaseOffsets,x
        clc
        adc wR0
        tax
        lda aLoveBaseOffsets,x
        and #$00FF
        cmp #$00FF
        beq ++

        cmp #$00FE
        beq +

        asl a
        sta wR0
        asl a
        asl a
        clc
        adc wR0
        bra _End
        
        +
        lda #499
        bra _End

        +
        lda #$FFFF
        
        _End
        plx
        stx wR1
        plx
        stx wR0
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        _AC3E
        lda #0
        bra _End

        .databank 0

      rlGetSelectedUnitLoverData ; 87/AC43

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.LoverData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.LoverData,x
        tax
        rtl

        .databank 0

      rlSaveLoverDataToBuffer ; 87/AC56

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda lR18
        pha
        lda lR18+1
        pha

        jsl rlGetSelectedUnitLoverData
        lda lRAMBufferPointer+1,b
        sta lR18+1
        lda lRAMBufferPointer,b
        sta lR18
        ldy #0

          -
          lda $0000,b,x
          sta [lR18],y
          inc x
          inc x
          inc y
          inc y
          cpy #size(structLoverDataRAM)
          bne -

        pla
        sta lR18+1
        pla
        sta lR18
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87AC8C ; 87/AC8C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $24
        pha
        lda $24+1
        pha

        jsl rlGetSelectedUnitLoverData
        lda lRAMBufferPointer+1,b
        sta $24+1
        lda lRAMBufferPointer,b
        sta $24
        ldy #0
        
        -
        lda [$24],y
        sta $0000,b,x
        inc x
        inc x
        inc y
        inc y
        cpy #$001E
        bne -

        pla
        sta $24+1
        pla
        sta $24
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLoveDataIDByCharacterID ; 87/ACC2

        .al
        .autsiz
        .databank ?

        phx
        phy
        lda wRoutineVariable1,b
        pha

        jsl rlGetSelectedUnitCharacterID
        cmp #Gerrard
        bcs _Enemy

          sta wRoutineVariable1,b

          jsl rlGetSelectedUnitGender
          cmp #GenderMale
          bmi _Enemy
          bne _Female

          ; Male
          ldx #<>aMaleLoveDataIDs
          bra +

          _Female
          ldx #<>aFemaleLoveDataIDs
          
          +
          ldy #0
          
          -
          lda $830000,x
          bmi _End

          cmp wRoutineVariable1,b
          beq _Match

          inc y
          inc x
          inc x
          bra -
          
          _End
          plx
          stx wRoutineVariable1,b
          ply
          plx
          rtl

          _Match
          tya
          plx
          stx wRoutineVariable1,b
          ply
          plx
          rtl

        _Enemy
        lda #$FFFF
        bra _End

        .databank 0

      rlGetUnitLoveGrowthWithTarget ; 87/AD0E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx
        ldx wR1
        phx

        jsl rlGetSelectedUnitGenerationID
        bcs _AD79

        cmp #$10
        bcs +

        jsl rlGetSelectedUnitLoveDataID
        sta wR0
        lda wRoutineVariable1,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitLoveDataID
        asl a
        sta wR1
        bra ++

        +
        jsl rlGetSelectedUnitLoveDataID
        asl a
        sta wR1
        lda wRoutineVariable1,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitLoveDataID
        sta wR0
        
        +
        ldx wR1
        lda aLoveGrowthOffsets,x
        clc
        adc wR0
        tax
        lda aLoveGrowthOffsets,x
        bit #$0080
        bne +

        and #$007F
        bra _End
        
        +
        ora #$FF80
        
        _End
        plx
        stx wR1
        plx
        stx wR0
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx

        plp
        plb
        rtl
        
        _AD79
        lda #0
        bra _End

        .databank 0

      rlGetLoverPointsWithTarget ; 87/AD7E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        ldx wRoutineVariable1,b
        phx

        dec a
        asl a
        sta wRoutineVariable1,b
        jsl rlGetSelectedUnitLoverData
        cpx #0
        beq +

          txa
          clc
          adc wRoutineVariable1,b
          tax
          lda $0000,b,x

        +
        plx 
        stx wRoutineVariable1,b

        plx
        plp
        plb
        rtl

        .databank 0

      rlSaveUnitLoveValueWithTarget ; 87/ADA6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx
        ldx wR1
        phx

        sta wR0
        ldy wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitGenerationID
        cmp #$10
        bcs +

          ; male
          dec a
          sta wR1
          lda wRoutineVariable1,b
          sta wSelectedUnitDataRAMPointer,b
          bra ++
          
          ; female
          +
          lda wRoutineVariable1,b
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitGenerationID
          bcs _End

          dec a
          sta wR1
          sty wSelectedUnitDataRAMPointer,b

        ; male number-1 in wR1, female pointer in wSelectedUnitDataRAMPointer
        +
        jsl rlGetSelectedUnitLoverData
        cpx #0
        beq _End

          txa
          asl wR1
          clc
          adc wR1
          tax
          lda wR0
          sta $0000,b,x

        _End
        plx
        stx wR1
        plx
        stx wR0
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlModifyUnitsLovePoints ; 87/AE05

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = male GenerationID
        ; wSelectedUnitDataRAMPointer = female character data
        ; wRoutineVariable1 = love points amount, can be negative

        ; If love points are 500 or more, marry units to each other.

        phb
        php
        phk
        plb
        phx
        phy
        ldx wRoutineVariable2,b
        phx
        ldx wRoutineVariable3,b
        phx

        cmp #$0010
        bcs _End

          sta wRoutineVariable2,b
          jsl rlGetSelectedUnitGenerationID
          bcs _End

            sta wRoutineVariable3,b
            jsl rlGetSelectedUnitLoverGenerationID
            ora #0
            bne _End

              jsl rlGetSelectedUnitLoverData
              txa
              clc
              adc wRoutineVariable2,b
              clc
              adc wRoutineVariable2,b
              dec a
              dec a
              tay

              lda $0000,b,y
              and #$01FF
              cmp #$01FF
              beq _End

                lda wRoutineVariable1,b
                beq _End
                bmi _Negative

                  lda $0000,b,y
                  clc
                  adc wRoutineVariable1,b
                  cmp #500
                  bcs +

                    sta $0000,b,y
                    bra _End

                  +
                  lda #500
                  sta $0000,b,y
                  jsl rlSetUnitsAsLoversByGenerationIDs
                  bra _End

                _Negative
                lda $0000,b,y
                clc
                adc wRoutineVariable1,b
                bpl +

                  lda #0

                +
                sta $0000,b,y

        _End
        plx
        stx wRoutineVariable3,b
        plx
        stx wRoutineVariable2,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/AE88


    .endsection Code87A19DSection


    .section Code87BB50Section

      rlActionStructGetScriptedCritPossibility ; 87/BB50

        .al
        .autsiz
        .databank ?

        ; Out:
        ; 1 = sibling crit
        ; 2 = lover crit
        ; 3 = triangle attack

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha
        lda wR10
        pha
        lda wR11
        pha

        ldx wR10
        lda aDeploymentTable._XTilePosition,x
        sta wR10
        lda aDeploymentTable._YTilePosition,x
        sta wR11

        lda #(`$7F654A)<<8
        sta lRoutineVariable+1,b
        lda #<>$7F654A
        sta lRoutineVariable,b
        jsl rlUnknown8483F3

        pla
        sta wR11
        pla
        sta wR10

        lda wR10
        sta wR0
        lda wR11
        sta wR1

        jsl rlGetUnitsDistance
        sta $1A

        ldx wR10
        lda aDeploymentTable._XTilePosition,x
        sta wR0
        lda aDeploymentTable._YTilePosition,x
        sta wR1

        ldx wR11
        lda aDeploymentTable._XTilePosition,x
        sec
        sbc wR0
        clc
        adc #16
        sta wR0
        lda aDeploymentTable._YTilePosition,x
        sec
        sbc wR1
        clc
        adc #16
        asl a
        asl a
        asl a
        asl a
        asl a
        clc
        adc wR0
        tax

        lda $7F652A,x
        and #$00FF
        sta wR2
        lda $7F6549,x
        and #$00FF
        sta wR3
        lda $7F656A,x
        and #$00FF
        sta wR4
        lda $7F654B,x
        and #$00FF
        sta wR5
        lda $7F673A
        and #$00FF
        sta wR6
        lda $7F6759
        and #$00FF
        sta wR7
        lda $7F677A
        and #$00FF
        sta wR8
        lda $7F675B
        and #$00FF
        sta wR9

        ldx wR10
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b

        ldy #$000E
        
        -
        lda $0004,b,y
        cmp #$00FF
        beq ++

        cmp wR10
        beq +

        jsl rlCheckIfTargetBelongsToOwnFaction
        bcs ++
        
        +
        lda #$00FF
        sta $0004,b,y
        
        +
        dec y
        dec y
        bpl -

        lda wR13
        cmp #2
        bcs +

        jsr rsActionStructCheckForTriangleAttack
        lda #3
        bcs _End

        ; lover crit?
        +
        jsr rsUnknown87BC5C
        lda #2
        bcs _End

        jsr rsActionStructCheckForSiblingCrit
        lda #1
        bcs _End

        lda #0

        _End
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        .databank 0

      rsUnknown87BC5C ; 87/BC5C

        .al
        .autsiz
        .databank ?

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx

        jsl rlGetSelectedUnitLoverGenerationID
        ora #0
        beq _CLC

          sta wR0
          lda #$00FF
          sta $7F442A
          sta $7F442C
          sta aAIAction.wUnitFaction

          lda #0
          sta wR12
          ldx #0
          ldy #6

          -
          lda $000C,b,y
          cmp #$00FF
          beq +

          phx
          tax
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          plx
          jsl rlGetSelectedUnitGenerationID
          bcs +

            cmp wR0
            bne +

              inc wR12
              lda $000C,b,y
              sta $7F442A,x
              inc x
              inc x

          +
          dec y
          dec y
          bpl -

          lda wR12
          beq _CLC

            plx
            stx wR0
            plx 
            stx wSelectedUnitDataRAMPointer,b
            ply
            plx
            sec
            rts

        _CLC
        plx
        stx wR0
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        clc
        rts

        .databank 0

      rsActionStructCheckForSiblingCrit ; 87/BCCF

        .al
        .autsiz
        .databank ?

        lda #(`aSiblingCritEntryPointers)<<8
        sta lR18+1
        lda #<>aSiblingCritEntryPointers
        sta lR18
        lda #1
        jsr rsCountUnitsInSpecialCombatEffectTable
        cmp #2
        bcc +

          sec
          rts

        +
        clc
        rts

        .databank 0

      aSiblingCritEntryPointers ; 87/BCE8

        .addr aSiblingCritEntry1
        .addr aSiblingCritEntry2
        .addr aSiblingCritEntry3
        .addr aSiblingCritEntry4
        .addr aSiblingCritEntry5
        .addr aSiblingCritEntry6
        .addr aSiblingCritEntry7
        .addr aSiblingCritEntry8
        .addr aSiblingCritEntry9
        .addr aSiblingCritEntry10
        .addr aSiblingCritEntry11
        .addr aSiblingCritEntry12
        .addr aSiblingCritEntry13
        .addr aSiblingCritEntry14
        .addr aSiblingCritEntry15
        .addr aSiblingCritEntry16
        .addr aSiblingCritEntry17
        .word 0

      aSiblingCritEntry1 ; 87/BD0C

        .word Sigurd
        .word Ethlyn
        .word 0

      aSiblingCritEntry2 ; 87/BD12

        .word Dalvin
        .word Creidne
        .word 0

      aSiblingCritEntry3 ; 87/BD18

        .word Scathach
        .word Larcei
        .word 0

      aSiblingCritEntry4 ; 87/BD1E

        .word Asaello
        .word Daisy
        .word 0

      aSiblingCritEntry5 ; 87/BD24

        .word Febail
        .word Patty
        .word 0

      aSiblingCritEntry6 ; 87/BD2A

        .word Leif
        .word Altena
        .word 0

      aSiblingCritEntry7 ; 87/BD30

        .word Charlot
        .word Laylea
        .word 0

      aSiblingCritEntry8 ; 87/BD36

        .word Coirpre
        .word Lene
        .word 0

      aSiblingCritEntry9 ; 87/BD3C

        .word Hawk
        .word Hermina
        .word 0

      aSiblingCritEntry10 ; 87/BD42

        .word Ced
        .word Fee
        .word 0

      aSiblingCritEntry11 ; 87/BD48

        .word Tristan
        .word Jeanne
        .word 0

      aSiblingCritEntry12 ; 87/BD4E

        .word Diarmuid
        .word Nanna
        .word 0

      aSiblingCritEntry13 ; 87/BD54

        .word Deimne
        .word Muirne
        .word 0

      aSiblingCritEntry14 ; 87/BD5A

        .word Lester
        .word Lana
        .word 0

      aSiblingCritEntry15 ; 87/BD60

        .word Amid
        .word Linda
        .word 0

      aSiblingCritEntry16 ; 87/BD66

        .word Arthur
        .word Tine
        .word 0

      aSiblingCritEntry17 ; 87/BD6C

        .word Brigid
        .word Edain
        .word 0

      rsActionStructCheckForTriangleAttack ; 87/BD72

        .al
        .autsiz
        .databank ?

        lda #(`aTriangleAttackEntryPointers)<<8
        sta lR18+1
        lda #<>aTriangleAttackEntryPointers
        sta lR18
        lda #0
        jsr rsCountUnitsInSpecialCombatEffectTable
        cmp #3
        bcc +

          sec
          rts

        +
        clc
        rts

        .databank 0

      aTriangleAttackEntryPointers ; 87/BD8B

        .word <>aTriangleAttackEntry1
        .word <>aTriangleAttackEntry2
        .word <>aTriangleAttackEntry3
        .word 0

      aTriangleAttackEntry1 ; 87/BD93

        .word BanbaCh07
        .word FotlaCh07
        .word EriuCh07
        .word 0

      aTriangleAttackEntry2 ; 87/BD9B

        .word BanbaCh08
        .word FotlaCh08
        .word EriuCh08
        .word 0

      aTriangleAttackEntry3 ; 87/BDA3

        .word Meng
        .word Mabel
        .word Bleg
        .word 0

      rsCountUnitsInSpecialCombatEffectTable ; 87/BDAB

        .al
        .autsiz
        .databank ?

        ; lR18 = long pointer to a pointer table

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR1
        phx
        ldx wR10
        phx
        ldx wR11
        phx

        asl a
        asl a
        asl a
        sta wR10
        stz wR12

        jsl rlGetSelectedUnitCharacterID
        sta wR0

        jsr rsCheckIfUnitInSpecialCombatEffectTable
        bcs _End

          stx wR1
          inc wR12
          lda #$00FF
          sta $7F442A
          sta $7F442C
          sta aAIAction.wUnitFaction
          ldx #0
          ldy wR10
          lda #4
          sta wR11

          -
          lda $0004,b,y
          cmp #$00FF
          beq _Next

            phx
            tax
            lda aDeploymentTable._UnitRAMPointer,x
            sta wSelectedUnitDataRAMPointer,b
            plx

            jsl rlGetSelectedUnitCharacterID
            sta wR0

            phx
            ldx wR1
            jsr rsCheckIfUnitInSpecialCombatEffectEntry
            plx
            bcs _Next

              inc wR12
              lda $0004,b,y
              sta $7F442A,x
              inc x
              inc x

          _Next
          inc y
          inc y
          dec wR11
          bne -

        _End
        lda wR12
        plx
        stx wR11
        plx
        stx wR10
        plx
        stx wR1
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        rts

        .databank 0

      rsCheckIfUnitInSpecialCombatEffectTable ; 87/BE2D

        .al
        .autsiz
        .databank ?

        ; In:
        ; wR0  = unit ID
        ; lR18 = pointer table

        ; Out:
        ; x = entry pointer
        ; clc if found
        ; sec if not

        phb
        php
        phk
        plb
        phy

        ldy lR18
        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        ; branch if end of table reached
        -
        lda $0000,b,y
        beq _SEC

        tax
        phx
        jsr rsCheckIfUnitInSpecialCombatEffectEntry
        plx
        bcc _CLC

        inc y
        inc y
        bra -

        _SEC
        ply
        plp
        plb
        sec

        -
        rts

        _CLC
        ply
        plp
        plb
        clc
        bra -

        .databank 0

      rsCheckIfUnitInSpecialCombatEffectEntry ; 87/BE58

        .al
        .autsiz
        .databank ?

        ; wR0 = unit ID
        ; x = entry for triangle attack or sibling crit

        ; clc = is in table
        ; sec = is not

        -
        lda $0000,b,x
        beq _SEC

        cmp wR0
        beq _CLC

        inc x
        inc x
        bra -

        _SEC
        sec
        bra +

        _CLC
        clc
        
        +
        rts 

        .databank 0

      rlGetAnimationOptionSetting ; 87/BE6A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda wOptionSettings,b
        and #$6000
        clc
        rol a
        rol a
        rol a
        rol a

        plp
        plb
        rtl

        .databank 0

      rlUnknown87BE7C ; 87/BE7C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        pha

        ; Reset animation settings

        lda #$6000
        trb wOptionSettings,b

        pla
        and #$0003
        xba
        lsr a
        lsr a
        lsr a
        ora $0D70,b
        sta $0D70,b
        plp
        plb
        rtl

        .databank 0

        ; 87/BE98

    .endsection Code87BB50Section


    .section Code87DF12Section

      rlInitiateItemRAMData ; 87/DF12

        .al
        .autsiz
        .databank ?

        ; lRoutineVariable = PlayerItemTable

        phb
        php

        phk
        plb

        ldx #size(aItemRAMData)-1
        sep #$20
        lda #0
        
          -
          sta aItemRAMData,x
          dec x
          bpl -

        rep #$20

        lda #(`aItemRAMData)<<8
        sta lR18+1
        lda #<>aItemRAMData
        sta lR18
        lda #len(aItemRAMData._Entry)
        sta wR0
        lda #size(aItemRAMData._Entry[0])
        sta wR1
        jsl rlBuildRAMStructHeader

        ldx lRoutineVariable,b

        sep #$20
        lda lRoutineVariable+2,b
        pha
        rep #$20
        plb

          _Loop
          lda #7
          sta wR0
          lda #0
          sta wR1
          lda $0000,b,x
          cmp #$FFFF
          beq +

            and #$00FF
            jsl rlAppendNewItemRAMEntry
            inc x
            bra _Loop

        ; Break Tyrfing from the get go
        +
        lda #PI_Tyrfing
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        bcs +

          lda #0
          jsl rlSetItemRAMStructEntryDurability

        +
        plp
        plb
        rtl

        .databank 0

      rlAppendNewItemRAMEntry ; 87/DF79

        .al
        .autsiz
        .databank ?

        ; A = item ID

        phb
        php

        phk
        plb

        sta $7E2000+structItemRAMEntry.ItemID

        lda wR0
        cmp #5
        beq +

          lda $7E2000+structItemRAMEntry.ItemID
          and #$00FF
          jsl rlGetItemDataROMPointer
          jsl rlGetItemMaxDurability2
          sep #$20
          sta $7E2000+structItemRAMEntry.Durability
          bra ++

        +
        sep #$20
        lda #0
        sta $7E2000+structItemRAMEntry.Durability

        +
        lda wR0
        sta $7E2000+structItemRAMEntry.ItemState
        lda #0
        sta $7E2000+structItemRAMEntry.KillCount
        rep #$20

        lda wR1
        sta $7E2000+structItemRAMEntry.OwnerRAMPointer

        ; Dest
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b

        ; source
        lda #(`$7E2000)<<8
        sta lStructPointer1+1,b
        lda #<>$7E2000
        sta lStructPointer1,b

        jsl rlAppendNewStructEntry

        plp
        plb
        rtl

        .databank 0

      rlUnknown87DFDA ; 87/DFDA

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        and #$00FF
        sta wStructIndex,b
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        lda #(`$87E001)<<8
        sta lStructPointer1+1,b
        lda #<>$87E001
        sta lStructPointer1,b
        jsl $82E85D
        plb
        rtl

        .databank 0

      aUnknown87E001 ; 87/E001

        .byte $FF
        .byte $FF
        .byte $00
        .byte $FF
        .byte $FF
        .byte $FF

      rlUnknown87E007 ; 87/E007

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        jsl rlGetRAMStructCurrentStructCount
        plp
        plb
        rtl

        .databank 0

      rlGetItemRAMStructEntryByPlayerItemIndex ; 87/E01E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        sta wStructIndex,b

        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        jsl rlGetRAMStructEntryPointerByStructIndex
        bcs +

          lda lStructPointer1,b
          sta wCurrentItemDataRAMPointer,b
          plp
          plb
          clc

          -
          rtl

        +
        stz wCurrentItemDataRAMPointer,b
        plp
        plb
        sec
        bra -

        .databank 0

      rlLoadItemRAMDataByIndex ; 87/E049

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        sta wStructIndex,b
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        jsl rlLoadRAMStructDataByIndex

        plp
        plb
        rtl

        .databank 0

      rlGetEffectiveItemIDByItemRAMStructEntry ; 87/E063

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.Durability,b,x
        and #$00FF
        bne +

        jsr rsGetBrokenWeaponID
        bra ++
        
        +
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemIDByItemRAMStructEntry ; 87/E088

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEffectiveItemROMPointerByItemRAMStructEntry ; 87/E0A0

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx

        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.Durability,b,x
        and #$00FF
        bne +

          jsr rsGetBrokenWeaponID
          bra ++

        +
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        
        +
        jsl rlGetItemDataROMPointer

        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemROMPointerByItemRAMStructEntry ; 87/E0C9

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        jsl rlGetItemDataROMPointer
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemCurrentDurability ; 87/E0E5

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.Durability,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlReduceItemCurrentDurability ; 87/E0FD

        .al
        .autsiz
        .databank ?

        ; Return clc if broken, sec if not

        phb
        phx
        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        ldx wCurrentItemDataRAMPointer,b
        sep #$20
        lda structItemRAMEntry.Durability,b,x
        beq _Broken

        dec a
        sta structItemRAMEntry.Durability,b,x
        bne _Broken

        rep #$20
        sec
        bra +
        
        _Broken
        rep #$20
        clc

        +
        plx
        plb
        rtl

        .databank 0

      rlSetItemRAMStructEntryDurability ; 87/E122

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        pha

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        ldx wCurrentItemDataRAMPointer,b

        pla
        sep #$20
        sta structItemRAMEntry.Durability,b,x

        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemRAMKillCountAndCritAbility ; 87/E13D

        .al
        .autsiz
        .databank ?

        ; sec if able to crit due to kills
        ; clc if not
        ; kills in A

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        beq +

        lda structItemRAMEntry.KillCount,b,x
        and #$00FF
        cmp #50
        bcs ++

        +
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        +
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlAddToItemRAMKillCount ; 87/E163

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        ldx wCurrentItemDataRAMPointer,b
        pla
        sep #$20
        clc
        adc structItemRAMEntry.KillCount,b,x
        cmp #100
        bcc +

          lda #100
        
        +
        sta structItemRAMEntry.KillCount,b,x
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemRAMStateAndOwner ; 87/E188

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.ItemState,b,x
        and #$00FF
        sta wR0
        lda structItemRAMEntry.OwnerRAMPointer,b,x
        sta wR1
        plx

        plp
        plb
        rtl

        .databank 0

      rlSetItemRAMStateAndOwner ; 87/E1A7

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        sep #$20
        lda wR0
        sta structItemRAMEntry.ItemState,b,x
        rep #$20

        lda wR1
        sta structItemRAMEntry.OwnerRAMPointer,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlRevertItemAquirement ; 87/E1C7

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        sep #$20
        lda #ItemStateUnobtained
        sta structItemRAMEntry.ItemState,b,x

        rep #$20
        lda #0
        sta structItemRAMEntry.OwnerRAMPointer,b,x

        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        jsl rlGetItemDataROMPointer
        jsl rlGetItemMaxDurability2
        sep #$20
        sta structItemRAMEntry.Durability,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87E1FD ; 87/E1FD

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        jsl $87E0C9
        jsl $87E3BE
        sta $14
        cmp #$00FF
        beq _E229

        jsl $87E0E5
        cmp #0
        beq +

        cmp $14
        beq _E229

        jsl $87E230
        asl a
        bra _End
        
        +
        lda #$03E8
        bra _End
        
        _E229
        jsl $87E3D6
        
        _End
        plp
        plb
        rtl

        .databank 0

      rlUnknown87E230 ; 87/E230

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        jsl $87E0C9
        jsl $87E3D6
        lsr a
        sta $14
        jsl $87E0E5
        and #$00FF
        sta $16
        jsl rlUnsignedMultiply16By16
        jsl $87E3BE
        sta $1C
        stz $1E
        jsl $80A1D8
        lda $18
        plp
        plb
        rtl

        .databank 0

      rlUnknown87E25D ; 87/E25D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        jsl $87E0C9
        jsl $87E0E5
        and #$00FF
        sta $0585,b
        jsl $87E3D6
        sta $14
        jsl $87E3BE
        sec
        sbc $0585,b
        sta $16
        jsl rlUnsignedMultiply16By16
        jsl $87E3BE
        sta $1C
        stz $1E
        jsl $80A1D8
        lda $18
        plp
        plb
        rtl

        .databank 0

      rlUnknown87E294 ; 87/E294

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        jsl $87E0C9
        jsl $87E3D6
        sta $1A
        jsl $87E3BE
        sta $1C
        jsl $80A1AB
        lda $1A
        plp
        plb
        rtl

        .databank 0

      rsGetBrokenWeaponID ; 87/E2B1

        .al
        .autsiz
        .databank ?

        phx
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        jsl rlGetItemDataROMPointer

        jsl rlGetItemWeaponRank
        inc a
        sta $0585,b

        jsl rlGetItemWeaponType
        asl a
        tax

        lda aBrokenWeaponOffsets,x
        clc
        adc $0585,b
        tax

        lda aBrokenWeaponOffsets,x
        and #$00FF

        plx
        rts

        .databank 0

      aBrokenWeaponOffsets .include "../TABLES/ITEM/BrokenWeaponOffsets.csv.asm" ; 87/E2DC
      aBrokenWeaponData .binclude "../TABLES/ITEM/BrokenWeaponData.csv.asm"      ; 87/E2F0

      rlGetItemNamePointerByItemID ; 87/E314

        .al
        .autsiz
        .databank ?

        jsl rlGetItemDataROMPointer
        jsl rlGetItemNamePointer
        rtl

        .databank 0

      rlGetItemDataROMPointer ; 87/E31D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        cmp #0
        bmi +

          asl a
          clc
          adc aMainDataOffsets.ItemDataOffsets
          tax
          lda aMainDataOffsets,x
          clc
          adc aMainDataOffsets.ItemDataOffsets
          adc #<>aMainDataOffsets
          sta wCurrentItemDataROMPointer,b

          -
          plx
          plp
          plb
          rtl

        +
        stz wCurrentItemDataROMPointer,b
        bra -

        .databank 0

      rlGetItemNamePointer ; 87/E346

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aMainDataOffsets.ItemNameOffsets
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

          lda structItemROMEntry.Name,b,x
          and #$00FF
          asl a
          clc
          adc aMainDataOffsets.ItemNameOffsets
          tax
          lda #(`aMainDataOffsets)<<8
          sta lRoutineVariable+1,b
          lda aMainDataOffsets,x
          clc
          adc aMainDataOffsets.ItemNameOffsets
          adc #<>aMainDataOffsets
          sta lRoutineVariable,b

          -
          plx
          plp
          plb
          rtl
        
        +
        lda #(`aDummyItemName)<<8
        sta lRoutineVariable+1,b
        lda #<>aDummyItemName
        sta lRoutineVariable,b
        bra -

        .databank 0

      aDummyItemName ; 87/E38A

        .text "　\n"

      rlGetItemEquipmentType ; 87/E38E

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structWeaponStaffROMEntry.EquipmentType,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemMaxDurability1 ; 87/E3A6

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.Durability,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemMaxDurability2 ; 87/E3BE

        .al
        .autsiz
        .databank ?

        ; Identical to the previous one

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.Durability,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlUnknown87E3D6 ; 87/E3D6

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #$83
        pha
        rep #$20
        plb

        phx
        ldx $0583,b
        lda $0003,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemStatBonus ; 87/E3EB

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.StatBonuses,b,x
        and #$00FF
        
        -
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        bra -

        .databank 0

      rlGetItemStaffEffect ; 87/E40A

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.StaffEffect,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemWeaponRank ; 87/E422

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structWeaponStaffROMEntry.WeaponRank,b,x
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemSkills ; 87/E444

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structWeaponStaffROMEntry.Skills,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlUnknown87E459 ; 87/E459

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #$83
        pha
        rep #$20
        plb

        phx
        ldx $0583,b
        lda $0000,b,x
        and #$00FF
        asl a
        clc
        adc $83800E
        tax
        lda #$8300
        sta lRoutineVariable+1,b
        lda $838000,x
        clc
        adc $83800E
        adc #$8000
        sta lRoutineVariable,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemWeaponType ; 87/E48D

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

          lda structItemROMEntry.EquipmentType,b,x
          and #$00FF
          cmp #EquipTypeRing
          bcs +

            lda structWeaponStaffROMEntry.WeaponType,b,x
            and #$00FF

            plx

            plp
            plb
            rtl

        +
        lda #0

        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemMight ; 87/E4B9

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

          lda structItemROMEntry.EquipmentType,b,x
          and #$00FF
          cmp #EquipTypeRing
          bcs +

            lda structWeaponStaffROMEntry.Might,b,x
            and #$00FF
            plx
            plp
            plb

            -
            rtl

        +
        lda #0
        plx
        plp
        plb
        bra -

        .databank 0

      rlGetItemAccuracy ; 87/E4E6

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.Accuracy,b,x
        and #$00FF
        plx
        plp
        plb
        
        -
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        bra -

        .databank 0

      rlUnknown87E513 ; 87/E513

        .al
        .autsiz
        .databank ?

        lda #0
        rtl

        .databank 0

      rlGetItemWeight ; 87/E517

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #2
        bcs +

        lda structWeaponStaffROMEntry.Weight,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemMinimumRange ; 87/E543

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.MinRange,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemMaximumRange ; 87/E56F

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.MaxRange,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemEffectiveness ; 87/E59B

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.Effectiveness,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87E5C5 ; 87/E5C5

        .al
        .autsiz
        .databank ?

        ; This routine tries its hardest to be recursive...

        phb
        php
        phk
        plb
        phx
        jsl rlUnknown87E5C5
        ora #0
        beq +

        lda #1

        -
        lsr $0585,b
        bcs +

        inc a
        bra -

        +
        asl a
        tax
        lda #>`aWeaponEffectivenessTextPointers
        sta lRoutineVariable+1,b
        lda aWeaponEffectivenessTextPointers,x
        sta lRoutineVariable,b
        plx
        plp
        plb
        rtl

        .databank 0

      aWeaponEffectivenessTextPointers ; 87/E5F1

        .addr aWeaponEffectivenessNoneText
        .addr aWeaponEffectivenessCavalierText
        .addr aWeaponEffectivenessFlierText
        .addr aWeaponEffectivenessDragonText
        .addr aWeaponEffectivenessKnightText
        .addr aWeaponEffectivenessMageText

      aWeaponEffectivenessNoneText      .text "\n"        ; 87/E5FD
      aWeaponEffectivenessCavalierText  .text "ナイト系\n"  ; 87/E5FF
      aWeaponEffectivenessFlierText     .text "ひこう系\n"  ; 87/E609
      aWeaponEffectivenessDragonText    .text "ドラゴン系\n" ; 87/E613
      aWeaponEffectivenessKnightText    .text "アーマー系\n" ; 87/E61F
      aWeaponEffectivenessMageText      .text "マージ系\n"  ; 87/E62B

      rlGetItemWeaponTraits ; 87/E635

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.Traits,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemAdditionalInfo ; 87/E65F

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.AdditionalInfo,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87E689 ; 87/E689

        .al
        .autsiz
        .databank ?

        pha
        jsl rlGetItemMinimumRange
        sta wR10
        jsl rlGetItemMaximumRange
        sta wR11
        pla

        jsl $848924
        ora #0
        beq +

        sec

        -
        rtl
        
        +
        clc
        bra -

        .databank 0

      rlUnknown87E6A5 ; 87/E6A5

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetItemStaffEffect
        asl a
        tax
        jsr (aUnknown87E6B1,x)
        plx
        rtl

        .databank 0

      aUnknown87E6B1 ; 87/E6B1

        .word <>$87E6D3
        .word <>$87E6D7
        .word <>$87E6D7
        .word <>$87E6D7
        .word <>$87E6DF
        .word <>$87E6DF
        .word <>$87E6E9
        .word <>$87E6E9
        .word <>$87E6F1
        .word <>$87E6E9
        .word <>$87E6E4
        .word <>$87E705
        .word <>$87E6F6
        .word <>$87E6FB
        .word <>$87E6FB
        .word <>$87E6FB
        .word <>$87E707

        ; 87/E6D3

    .endsection Code87DF12Section



    .section Code87E98DSection

      rlGetLocationEventDataEntry ; 87/E98D

        .al
        .autsiz
        .databank ?

        ; Looks into the chapters LocationData table and based on the specified ID, 
        ; fills the wEventLocationEntry with the matching short pointer.

        ; Input:
        ; A = LocationID

        ; Output:
        ; filled wEventLocationEntry 

        phb
        php
        phk
        plb
        phx
        ldx wR35
        phx
        ldx wR34
        phx

        sta wR35

        jsl rlGetChapterLocationDataPointer
        sta wR34

        ; Check if the location ID is within the total location events size

        tax
        lda $0000,b,x
        and #$00FF
        cmp wR35
        beq +
        bcc +

          lda wR35
          asl a
          clc
          adc wR34
          tax
          lda $0001,b,x
          sta wEventLocationEntry,b

          pla
          sta wR34
          pla
          sta wR35
          plx
          plp
          plb
          clc

          -
          rtl

        +
        pla
        sta wR34
        pla
        sta wR35
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetEventLocationEntryCoordinatesByID ; 87/E9D1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        jsl rlGetLocationEventDataEntry
        jsl rlGetEventLocationEntryCoordinates
        plp
        plb
        rtl

        .databank 0

        ; 87/E9E0

    .endsection Code87E98DSection



    .section Code87EA87Section

      rlCheckIfCoordsNotEventLocationTile ; 87/EA87

        .al
        .autsiz
        .databank ?

        ; Find location event by coordinates?
        ; sec = not found

        ; Input:
        ; CLC if on event location tile, SEC if not
        ; wR0 = X coordinate
        ; wR1 = Y coordinate

        phb
        php
        phk
        plb
        phx
        phy

        lda wR2
        pha

        jsl rlGetChapterLocationDataPointer
        tay
        lda $0000,b,y
        and #$00FF
        sta wR2

          -
          phy
          ldx $0001,b,y
          stx wEventLocationEntry,b
          txy
          jsl rlGetEventLocationEntryType
          asl a
          tax
          lda aEventLocationTypeOffsets,x
          tax

          sep #$20
          lda aEventLocationTypeOffsets+6,x
          clc
          adc $0003,b,y
          cmp wR0
          bne +

            lda aEventLocationTypeOffsets+7,x
            clc
            adc $0004,b,y
            cmp wR1
            bne +

              ply
              bra _CLC

          +
          rep #$20
          ply
          inc y
          inc y
          dec wR2
          bne -

        lda #0
        sta wEventLocationEntry,b

        pla
        sta wR2

        ply
        plx
        plp
        plb
        sec
        
        _End
        rtl

        _CLC
        rep #$20

        pla
        sta wR2

        ply
        plx
        plp
        plb
        clc
        bra _End

        .databank 0

      rlUpdateAllLocationEvents ; 87/EAF1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wR3
        pha

        lda lChapterEventDataPointer,b
        beq _End

          ; Get the chapters location event count
          jsl rlGetChapterLocationDataPointer
          tay
          lda $0000,b,y
          and #$00FF
          sta wR3

            -
            ldx $0001,b,y
            stx wEventLocationEntry,b
            jsl rlHandleEventLocationModification
            inc y
            inc y
            dec wR3
            bne -

        _End
        pla
        sta wR3
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87EB24 ; 87/EB24

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wR3
        pha
        lda wR2
        pha

        lda lChapterEventDataPointer,b
        beq _End

          jsl rlGetChapterLocationDataPointer

          tay
          stz wR2
          lda $0000,b,y
          and #$00FF
          sta wR3

            -
            ldx $0001,b,y
            stx wEventLocationEntry,b
            jsl rlGetEventLocationEntryType
            cmp #0
            bne +

              lda wEventLocationEntry,b
              sta wR2

            +
            inc y
            inc y
            dec wR3
            bne -

          lda wR2
          sta wEventLocationEntry,b
        
        _End
        pla
        sta wR2
        pla
        sta wR3
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlCountAlliedCastles ; 87/EB6E

        .al
        .autsiz
        .databank ?

        ; Input:
        ; Filled lChapterEventDataPointer

        ; Output:
        ; A = count

        phb
        php
        phk
        plb
        phx
        phy
        lda wR3
        pha
        lda wR2
        pha
        lda lChapterEventDataPointer,b
        beq _End

          jsl rlGetChapterLocationDataPointer
          tay

          stz wR2
          lda $0000,b,y
          and #$00FF
          sta wR3
          
            _Loop
            ldx $0001,b,y
            stx wEventLocationEntry,b
            jsl rlGetEventLocationEntryType
            cmp #LocationTypeCastle
            bne _Next

              jsl rlGetLocationFactionSlotOwner
              tax

              lda #0
              jsl rlGetFactionRelation
              cmp #AllegianceOther
              beq _Next

                cmp #AllegianceEnemy
                beq _Next

                  inc wR2

            _Next
            inc y
            inc y
            dec wR3
            bne _Loop

          lda wR2

        _End
        plx
        stx wR2
        plx
        stx wR3
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/EBC8

    .endsection Code87EA87Section



    .section Code87EC42Section

      rlGetEventLocationEntryID ; 87/EC42

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        ; Output:
        ; A = ID that is set inside the entry

        phb
        php
        phk
        plb
        phx

        ldx wEventLocationEntry,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterLocationEntry.ID,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationEntryNameID ; 87/EC5D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wEventLocationEntry,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterLocationEntry.NameID,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationEntryType ; 87/EC78

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wEventLocationEntry,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterLocationEntry.Type,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationEntryCastleName ; 87/EC93

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wEventLocationEntry,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda #>`aCastleNameOffsets
        sta lRoutineVariable+1,b
        lda structChapterLocationEntry.NameID,b,x
        and #$00FF
        asl a
        tax
        lda aCastleNameOffsets,x
        clc
        adc #<>aCastleNameOffsets
        sta lRoutineVariable,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationEntryCoordinates ; 87/ECC1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wEventLocationEntry,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterLocationEntry.XPosition,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationEntryOriginXCoordinate ; 87/ECD9

        .al
        .autsiz
        .databank ?

        jsl rlGetEventLocationEntryType
        jsl rlGetEventLocationTypeOriginXOffset
        rtl

        .databank 0

      rlGetEventLocationEntryOriginYCoordinate ; 87/ECE2

        .al
        .autsiz
        .databank ?

        jsl rlGetEventLocationEntryType
        jsl rlGetEventLocationTypeOriginYOffset
        rtl

        .databank 0

      rlGetEventLocationEntryEffectiveModificationXCoordinate ; 87/ECEB

        .al
        .autsiz
        .databank ?

        jsl rlGetEventLocationEntryType
        jsl rlGetEventLocationTypeModificationXOffset
        rtl

        .databank 0

      rlGetEventLocationEntryEffectiveModificationYCoordinate ; 87/ECF4

        .al
        .autsiz
        .databank ?

        jsl rlGetEventLocationEntryType
        jsl rlGetEventLocationTypeModificationYOffset
        rtl

        .databank 0

      rlGetEventLocationEntryEffectiveXCoordinate ; 87/ECFD

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wEventLocationEntry,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        jsl rlGetEventLocationEntryType
        jsl rlGetEventLocationTypeInteractionXOffset

        clc
        adc structChapterLocationEntry.XPosition,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationEntryEffectiveYCoordinate ; 87/ED21

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wEventLocationEntry,b

        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        jsl rlGetEventLocationEntryType
        jsl rlGetEventLocationTypeInteractionYOffset

        clc
        adc structChapterLocationEntry.YPosition,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetLocationFactionSlotOwner ; 87/ED45

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        ; Output:
        ; A = FactionSlot that owns the location

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        and #LocationFactionSlotOwnerMask
        cmp #Factionless
        bcc +

          lda #$FFFF

        +
        plx
        rtl

        .databank 0

      rlSetLocationFactionSlotOwner ; 87/ED5C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot
        ; filled wEventLocationEntry

        phx
        pha

        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        and #~LocationFactionSlotOwnerMask
        sta aChapterLocationRAMData,x

        pla
        sep #$20
        and #LocationFactionSlotOwnerMask
        ora aChapterLocationRAMData,x
        sta aChapterLocationRAMData,x
        rep #$20
        plx
        rtl

        .databank 0

      rlBuildDeadPlayerCharacterList ; 87/ED7F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wR0
        pha

        ldx #(24 - 1) * size(word)
        lda #$FFFF

          -
          sta aDeadPlayerCharacterList,x
          dec x
          dec x
          bpl -

        jsl rlGetEventLocationEntryID
        sta wR0

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b
        ldx #0
        ldy #1

          _Loop
          sty $0550,b
          jsl rlLoadRAMStructDataByIndex
          bcs _End

            lda lStructPointer1,b
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitHomeCastle
            cmp wR0
            bne _Next

              jsl rlGetSelectedUnitStates
              bit #(UnitStateFielded | UnitStateDead)
              bne _Next

                jsl rlGetSelectedUnitDeploymentOffset
                bcs _Next

                  jsl rlGetSelectedUnitDeploymentOffset
                  bcs _Next

                    sta aDeadPlayerCharacterList,x
                    inc x
                    inc x

            _Next
            inc y
            bra _Loop

        _End
        pla
        sta wR0
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationMoneyReward ; 87/EDEB

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetEventLocationEntryID
        asl a
        tax
        lda aChapterLocationMoneyRewards,x
        plx
        rtl

        .databank 0

      rlSubtractEventLocationMoneyReward ; 87/EDF8

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = value to subtract

        phb
        php
        phk
        plb
        phx
        ldx wR0
        phx

        sta wR0
        jsl rlGetEventLocationEntryID
        asl a
        tax
        lda aChapterLocationMoneyRewards,x
        sec
        sbc wR0
        bpl +

          lda #0

        +
        sta aChapterLocationMoneyRewards,x
        beq _SEC

        plx
        stx wR0
        plx
        plp
        plb
        clc

        -
        rtl

        _SEC
        plx
        stx wR0
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlCheckIfCastleGuarded ; 87/EE2B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        ; Output:
        ; SEC if true

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        bit #CastleGuarded
        bne +

          clc
          plx
          rtl

        +
        sec
        plx
        rtl

        .databank 0

      rlSetCastleGuarded ; 87/EE40

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        phx
        jsl rlGetEventLocationEntryID
        tax
        sep #$20
        lda aChapterLocationRAMData,x
        ora #CastleGuarded
        sta aChapterLocationRAMData,x
        rep #$20
        plx
        rtl

        .databank 0

      rlUnsetCastleGuarded ; 87/EE56

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        phx
        jsl rlGetEventLocationEntryID
        tax
        sep #$20
        lda aChapterLocationRAMData,x
        and #~CastleGuarded
        sta aChapterLocationRAMData,x
        rep #$20
        plx
        rtl

        .databank 0

      rlUnknown87EE6C ; 87/EE6C

        .al
        .autsiz
        .databank ?
        
        ; Input:
        ; filled wEventLocationEntry

        ; Output:
        ; SEC if true

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        bit #LocationState40
        bne +

        clc
        plx
        rtl

        +
        sec
        plx
        rtl

        .databank 0

      rlUnknown87EE81 ; 87/EE81

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        ora #LocationState40
        sta aChapterLocationRAMData,x
        plx
        rtl

        .databank 0

      rlCheckLocationDestroyed ; 87/EE94

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        ; Output:
        ; SEC if true

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        bit #LocationDestroyed
        bne +

          clc
          plx
          rtl

        +
        sec
        plx
        rtl

        .databank 0

      rlSetLocationDestroyed ; 87/EEA9

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        ora #LocationDestroyed
        sta aChapterLocationRAMData,x
        plx
        rtl

        .databank 0

      rlCheckIfVillageClosed ; 87/EEBC

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        ; Output:
        ; SEC if true

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        bit #VillageClosed
        bne +

          clc
          plx
          rtl

        +
        sec
        plx
        rtl

        .databank 0

      rlSetVillageClosed ; 87/EED1

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wEventLocationEntry

        phx
        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        ora #VillageClosed
        sta aChapterLocationRAMData,x
        plx
        rtl

        .databank 0

      rlSetVillageOpen ; 87/EEE4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR0
        pha
        lda wR1
        pha

        jsl rlGetEventLocationEntryID
        tax
        lda aChapterLocationRAMData,x
        and #~VillageClosed
        sta aChapterLocationRAMData,x

        ldx wEventLocationEntry,b
        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        jsl rlGetEventLocationEntryOriginXCoordinate
        clc
        adc structChapterLocationEntry.XPosition,b,x
        and #$00FF
        sta wR0
        jsl rlGetEventLocationEntryOriginYCoordinate
        clc
        adc structChapterLocationEntry.YPosition,b,x
        and #$00FF
        sta wR1
        phk
        plb
        lda #<>aVillageOpenedTileData
        jsl $86C6E8

        pla
        sta wR1
        pla
        sta wR0
        plx
        plp
        plb
        rtl

        .databank 0

      aVillageOpenedTileData ; 87/EF38

        .byte 3, 2

        .word $FFFF, $FFFF, $FFFF
        .word $FFFF, $00B1, $FFFF

        ; 87/EF46

    .endsection Code87EC42Section






    .section Code87EF61Section

      rlHandleEventLocationModification ; 87/EF61

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlCheckLocationDestroyed
        bcs +

          jsl rlGetEventLocationEntryType
          asl a
          tax
          jsr (aEventLocationTypeModifications,x)
          bra ++

        +
        jsr rsDestroyEventLocation

        +
        plx
        plp
        plb
        rtl

        .databank 0

      aEventLocationTypeModifications ; 87/EF7E

        .word <>rsEventLocationCastleModification
        .word <>rsEventLocationDummyModification
        .word <>rsEventLocationVillageModification
        .word <>rsEventLocationDummyModification
        .word <>rsEventLocationDummyModification
        .word <>rsEventLocationDummyModification
        .word <>rsEventLocationDummyModification

      rsEventLocationDummyModification ; 87/EF8C

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsEventLocationCastleModification ; 87/EF8D

        .al
        .autsiz
        .databank ?

        ; Handles changing the banner color of the bottom left tile of a castle
        ; to match the occupiers allegiance.

        lda #0
        jsl rlGetFactionSlotNameID
        cmp #$FFFF
        bne +

        lda #1
        bra ++

        +
        jsl rlGetLocationFactionSlotOwner
        tax

        lda #0
        jsl rlGetFactionRelation

        +
        asl a
        sta wR2

        ldx wEventLocationEntry,b
        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        jsl rlGetEventLocationEntryEffectiveModificationXCoordinate
        clc
        adc structChapterLocationEntry.XPosition,b,x
        and #$00FF
        sta wR0

        jsl rlGetEventLocationEntryEffectiveModificationYCoordinate
        clc
        adc structChapterLocationEntry.YPosition,b,x
        and #$00FF
        sta wR1

        lda wR1
        xba
        lsr a
        lsr a
        clc
        adc wR0
        asl a
        tax

        ; Check the tile one up, two left from the allegiance indicator
        ; of a castle.
        lda aMapData - size(word) * (1 * $40 + 2),x
        and #$03FF
        cmp #$0057
        bcs _End

          sec
          sbc #$0050
          bcc _End

            phx
            tax
            lda aCastleBannerTileIndexesOffsets,x
            clc
            adc wR2
            tax
            lda aCastleBannerTileIndexesOffsets,x
            plx
            sep #$20
            sta aMapData,x
            rep #$20

        _End
        rts

        .databank 0

      aCastleBannerTileIndexesOffsets ; 87/F007

        .word aCastle1BannerTileIndexes - aCastleBannerTileIndexesOffsets
        .byte 0
        .word aCastle2BannerTileIndexes - aCastleBannerTileIndexesOffsets
        .byte 0
        .word aCastle3BannerTileIndexes - aCastleBannerTileIndexesOffsets

      aCastle1BannerTileIndexes ; 87/F00F

        .word $0072
        .word $0000
        .word $0001
        .word $0002

      aCastle2BannerTileIndexes ; 87/F017

        .word $0075
        .word $0020
        .word $0021
        .word $0022

      aCastle3BannerTileIndexes ; 87/F01F

        .word $0078
        .word $0003
        .word $0004
        .word $0005

      rsEventLocationVillageModification ; 87/F027

        .al
        .autsiz
        .databank ?

        ; Handles the different stages of village destruction.

        ; This is a way to get some pseudo-random value that will then be used
        ; for the pattern a village gets destoryed in.

        jsl rlGetEventLocationEntryID
        and #$0003
        asl a
        sta wR2

        ldx wEventLocationEntry,b
        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        jsl rlGetEventLocationEntryOriginXCoordinate
        clc
        adc structChapterLocationEntry.XPosition,b,x
        and #$00FF
        sta wR0

        jsl rlGetEventLocationEntryOriginYCoordinate
        clc
        adc structChapterLocationEntry.YPosition,b,x
        and #$00FF
        sta wR1

        jsl rlGetEventLocationMoneyReward
        dec a
        sta wR13

        lda #500
        sta wR14
        jsl $80A1AB

        lda wR13
        cmp #9
        bcs +

          asl wR13
          phk
          plb
          ldx wR2
          lda aVillageDestroyedPatterns,x
          clc
          adc wR13
          tax

          lda aVillageDestroyedPatterns,x
          beq +

            jsl $86C6E8

        +
        jsl rlCheckIfVillageClosed
        bcc _End

          phk
          plb
          lda #<>aVillageClosedTiles
          jsl $86C6E8

        _End
        rts

        .databank 0

      aVillageClosedTiles ; 87/F096

        .byte 3, 2
        .word $FFFF, $FFFF, $FFFF
        .word $FFFF, $00B3, $FFFF

      aVillageDestroyedPatterns ; 87/F0A4

        .word aVillageDestroyedPattern1States - aVillageDestroyedPatterns
        .word aVillageDestroyedPattern2States - aVillageDestroyedPatterns
        .word aVillageDestroyedPattern3States - aVillageDestroyedPatterns
        .word aVillageDestroyedPattern4States - aVillageDestroyedPatterns

      aVillageDestroyedPattern1States ; 87/F0AC

        .word <>aVillageDestroyedPattern1State9Tiles
        .word <>aVillageDestroyedPattern1State8Tiles
        .word <>aVillageDestroyedPattern1State7Tiles
        .word <>aVillageDestroyedPattern1State6Tiles
        .word <>aVillageDestroyedPattern1State5Tiles
        .word <>aVillageDestroyedPattern1State4Tiles
        .word <>aVillageDestroyedPattern1State3Tiles
        .word <>aVillageDestroyedPattern1State2Tiles
        .word <>aVillageDestroyedPattern1State1Tiles

      aVillageDestroyedPattern1State1Tiles ; 87/F0BE

        .byte 3, 2
        .word $FFFF, $0007, $FFFF
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern1State2Tiles ; 87/F0CC

        .byte 3, 2
        .word $FFFF, $00BF, $FFFF
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern1State3Tiles ; 87/F0DA

        .byte 3, 2
        .word $FFFF, $00BF, $FFFF
        .word $FFFF, $FFFF, $0006

      aVillageDestroyedPattern1State4Tiles ; 87/F0E8

        .byte 3, 2
        .word $FFFF, $00BF, $FFFF
        .word $FFFF, $FFFF, $009F

      aVillageDestroyedPattern1State5Tiles ; 87/F0F6

        .byte 3, 2
        .word $FFFF, $00BF, $FFFF
        .word $0007, $FFFF, $009F

      aVillageDestroyedPattern1State6Tiles ; 87/F104

        .byte 3, 2
        .word $FFFF, $00BF, $FFFF
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern1State7Tiles ; 87/F112

        .byte 3, 2
        .word $FFFF, $00BF, $0006
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern1State8Tiles ; 87/F120

        .byte 3, 2
        .word $FFFF, $00BF, $009F
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern1State9Tiles ; 87/F12E

        .byte 3, 2
        .word $0006, $00BF, $009F
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern2States ; 87/F13C

        .word <>aVillageDestroyedPattern2State9Tiles
        .word <>aVillageDestroyedPattern2State8Tiles
        .word <>aVillageDestroyedPattern2State7Tiles
        .word <>aVillageDestroyedPattern2State6Tiles
        .word <>aVillageDestroyedPattern2State5Tiles
        .word <>aVillageDestroyedPattern2State4Tiles
        .word <>aVillageDestroyedPattern2State3Tiles
        .word <>aVillageDestroyedPattern2State2Tiles
        .word <>aVillageDestroyedPattern2State1Tiles

      aVillageDestroyedPattern2State1Tiles ; 87/F14E

        .byte 3, 2
        .word $FFFF, $FFFF, $FFFF
        .word $FFFF, $FFFF, $0006

      aVillageDestroyedPattern2State2Tiles ; 87/F15C

        .byte 3, 2
        .word $FFFF, $FFFF, $FFFF
        .word $FFFF, $FFFF, $009F

      aVillageDestroyedPattern2State3Tiles ; 87/F16A

        .byte 3, 2
        .word $FFFF, $FFFF, $FFFF
        .word $0007, $FFFF, $009F

      aVillageDestroyedPattern2State4Tiles ; 87/F178

        .byte 3, 2
        .word $FFFF, $FFFF, $FFFF
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern2State5Tiles ; 87/F186

        .byte 3, 2
        .word $FFFF, $FFFF, $0006
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern2State6Tiles ; 87/F194

        .byte 3, 2
        .word $FFFF, $FFFF, $009F
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern2State7Tiles ; 87/F1A2

        .byte 3, 2
        .word $0006, $FFFF, $009F
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern2State8Tiles ; 87/F1B0

        .byte 3, 2
        .word $009F, $FFFF, $009F
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern2State9Tiles ; 87/F1BE

        .byte 3, 2
        .word $009F, $0007, $009F
        .word $00BF, $FFFF, $009F

      aVillageDestroyedPattern3States ; 87/F1CC

        .word <>aVillageDestroyedPattern3State9Tiles
        .word <>aVillageDestroyedPattern3State8Tiles
        .word <>aVillageDestroyedPattern3State7Tiles
        .word <>aVillageDestroyedPattern3State6Tiles
        .word <>aVillageDestroyedPattern3State5Tiles
        .word <>aVillageDestroyedPattern3State4Tiles
        .word <>aVillageDestroyedPattern3State3Tiles
        .word <>aVillageDestroyedPattern3State2Tiles
        .word <>aVillageDestroyedPattern3State1Tiles

      aVillageDestroyedPattern3State1Tiles ; 87/F1DE

        .byte 3, 2
        .word $FFFF, $FFFF, $FFFF
        .word $0007, $FFFF, $FFFF

      aVillageDestroyedPattern3State2Tiles ; 87/F1EC

        .byte 3, 2
        .word $FFFF, $FFFF, $FFFF
        .word $00BF, $FFFF, $FFFF

      aVillageDestroyedPattern3State3Tiles ; 87/F1FA

        .byte 3, 2
        .word $FFFF, $FFFF, $0006
        .word $00BF, $FFFF, $FFFF

      aVillageDestroyedPattern3State4Tiles ; 87/F208

        .byte 3, 2
        .word $FFFF, $FFFF, $009F
        .word $00BF, $FFFF, $FFFF

      aVillageDestroyedPattern3State5Tiles ; 87/F216

        .byte 3, 2
        .word $0006, $FFFF, $009F
        .word $00BF, $FFFF, $FFFF

      aVillageDestroyedPattern3State6Tiles ; 87/F224

        .byte 3, 2
        .word $009F, $FFFF, $009F
        .word $00BF, $FFFF, $FFFF

      aVillageDestroyedPattern3State7Tiles ; 87/F232

        .byte 3, 2
        .word $009F, $0007, $009F
        .word $00BF, $FFFF, $FFFF

      aVillageDestroyedPattern3State8Tiles ; 87/F240

        .byte 3, 2
        .word $009F, $00BF, $009F
        .word $00BF, $FFFF, $FFFF

      aVillageDestroyedPattern3State9Tiles ; 87/F24E

        .byte 3, 2
        .word $009F, $00BF, $009F
        .word $00BF, $FFFF, $0006

      aVillageDestroyedPattern4States ; 87/F25C

        .word <>aVillageDestroyedPattern4State9Tiles
        .word <>aVillageDestroyedPattern4State8Tiles
        .word <>aVillageDestroyedPattern4State7Tiles
        .word <>aVillageDestroyedPattern4State6Tiles
        .word <>aVillageDestroyedPattern4State5Tiles
        .word <>aVillageDestroyedPattern4State4Tiles
        .word <>aVillageDestroyedPattern4State3Tiles
        .word <>aVillageDestroyedPattern4State2Tiles
        .word <>aVillageDestroyedPattern4State1Tiles

      aVillageDestroyedPattern4State1Tiles ; 87/F26E

        .byte 3, 2
        .word $FFFF, $FFFF, $0006
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern4State2Tiles ; 87/F27C

        .byte 3, 2
        .word $FFFF, $FFFF, $009F
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern4State3Tiles ; 87/F28A

        .byte 3, 2
        .word $0006, $FFFF, $009F
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern4State4Tiles ; 87/F298

        .byte 3, 2
        .word $009F, $FFFF, $009F
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern4State5Tiles ; 87/F2A6

        .byte 3, 2
        .word $009F, $0007, $009F
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern4State6Tiles ; 87/F2B4

        .byte 3, 2
        .word $009F, $00BF, $009F
        .word $FFFF, $FFFF, $FFFF

      aVillageDestroyedPattern4State7Tiles ; 87/F2C2

        .byte 3, 2
        .word $009F, $00BF, $009F
        .word $FFFF, $FFFF, $0006

      aVillageDestroyedPattern4State8Tiles ; 87/F2D0

        .byte 3, 2
        .word $009F, $00BF, $009F
        .word $FFFF, $FFFF, $009F

      aVillageDestroyedPattern4State9Tiles ; 87/F2DE

        .byte 3, 2
        .word $009F, $00BF, $009F
        .word $0007, $FFFF, $009F

      rsDestroyEventLocation ; 87/F2EC

        .al
        .autsiz
        .databank ?

        ldx wEventLocationEntry,b
        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        jsl rlGetEventLocationEntryOriginXCoordinate
        clc
        adc structChapterLocationEntry.XPosition,b,x
        and #$00FF
        sta wR0

        jsl rlGetEventLocationEntryOriginYCoordinate
        clc
        adc structChapterLocationEntry.YPosition,b,x
        and #$00FF
        sta wR1

        phk
        plb
        jsl rlGetEventLocationEntryType
        jsl rlGetEventLocationTypeDestoyedTileData
        jsl $86C6E8
        rts

        .databank 0

        ; 87/F321

    .endsection Code87EF61Section


    .section Code87F3A7Section

      rlGetEventLocationTypeOriginXOffset ; 87/F3A7

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx

        asl a
        tax
        lda aEventLocationTypeOffsets,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.OriginXOffset,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationTypeOriginYOffset ; 87/F3C0

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx
        asl a
        tax

        lda aEventLocationTypeOffsets,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.OriginYOffset,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationTypeModificationXOffset ; 87/F3D9

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx

        asl a
        tax
        lda aEventLocationTypeOffsets,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.ModificationXOffset,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationTypeModificationYOffset ; 87/F3F2

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx

        asl a
        tax
        lda aEventLocationTypeOffsets,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.ModificationYOffset,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationTypeInteractionXOffset ; 87/F40B

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx

        asl a
        tax
        lda aEventLocationTypeOffsets,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.InteractionXOffset,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationTypeInteractionYOffset ; 87/F424

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx

        asl a
        tax
        lda aEventLocationTypeOffsets,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.InteractionYOffset,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEventLocationTypeDestoyedTileData ; 87/F43D

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx

        asl a
        tax
        lda aEventLocationTypeOffsets,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.DestoyedTileData,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      aEventLocationTypeOffsets ; 87/F453

        .word aCastleLocationTypeData   - aEventLocationTypeOffsets
        .word aUnknown87F46B            - aEventLocationTypeOffsets
        .word aVillageLocationTypeData  - aEventLocationTypeOffsets
        .word aUnknown87F47F            - aEventLocationTypeOffsets
        .word aUnknown87F489            - aEventLocationTypeOffsets
        .word aUnknown87F493            - aEventLocationTypeOffsets
        .word aUnknown87F49D            - aEventLocationTypeOffsets

      aCastleLocationTypeData ; 87/F461

        .structEventLocationType 0, [-1, -1], [1, 2], [0, 2], aCastleDestroyedTileData

      aUnknown87F46B ; 87/F46B

        .structEventLocationType 0, [0, 0], [1, 0], [0, 1], 0

      aVillageLocationTypeData ; 87/F475

        .structEventLocationType 5000, [-1, -1], [1, 0], [0, 0], aVillageDestroyedTileData

      aUnknown87F47F ; 87/F47F

        .structEventLocationType 0, [0, 0], [0, 0], [0, 0], 0

      aUnknown87F489 ; 87/F489

        .structEventLocationType 0, [0, 0], [0, 0], [0, 0], 0

      aUnknown87F493 ; 87/F493

        .structEventLocationType 0, [0, 0], [0, 0], [0, 0], 0

      aUnknown87F49D ; 87/F49D

        .structEventLocationType 0, [0, 0], [0, 0], [0, 0], 0

      aCastleDestroyedTileData ; 87/F4A7

        .byte 3, 4 
        .word $000D, $000E, $000F
        .word $002D, $002E, $002F
        .word $000A, $000B, $000C
        .word $002A, $002B, $002C

      aVillageDestroyedTileData ; 87/F4C1

        .byte 3, 2
        .word $009F, $00BF, $009F
        .word $00BF, $009F, $009F

        ; 87/F4CF

    .endsection Code87F3A7Section



    .section Code87F515Section

      rlUnknown87F515 ; 87/F515

        .al
        .autsiz
        .databank ?

        phb
        phx
        phy
        tay

        lda #(`aUnitRAMArea)<<8
        sta lR18+1
        lda #<>aUnitRAMArea
        sta lR18
        jsl rlBufferAndLoadNewRAMAreaPointer

        lda #size(structCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda lR25
        sta wSelectedUnitDataRAMPointer,b

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b

        lda lR25
        sta lStructPointer1,b

        jsl rlAppendNewStructEntry

        tya
        jsr $87F55A
        jsr $87FABC
        jsr $87FB94
        jsl rlLoadBufferedRAMAreaPointer

        ply
        plx
        plb
        rtl

        .databank 0

        ; 87/F559

    .endsection Code87F515Section



