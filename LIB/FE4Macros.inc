

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





    structCharacterDataOffset .struct Offset
      .word <>(\Offset - aCharacterDataOffsets)
    .endstruct

    structCharacterNameOffset .struct Offset
      .word <>(\Offset - aCharacterNameOffsets)
    .endstruct

    structClassDataOffset .struct Offset
      .word <>(\Offset - aClassDataOffsets)
    .endstruct

    structClassNameOffset .struct Offset
      .word <>(\Offset - aClassNameOffsets)
    .endstruct

    structItemDataOffset .struct Offset
      .word <>(\Offset - aItemDataOffsets)
    .endstruct

    structBrokenWeaponOffset .struct Offset
      .word <>(\Offset - aBrokenWeaponOffsets)
    .endstruct

    structHolyBloodDataOffset .struct Offset
      .word <>(\Offset - aHolyBloodGrowthBoostsOffsets)
    .endstruct

    structChildrenDataOffset .struct Offset
      .word <>(\Offset - aChildrenDataOffsets)
    .endstruct

    structTerrainAvoidOffset .struct Offset
      .word <>(\Offset - aTerrainAvoidOffsets)
    .endstruct

    structMovementCostOffset .struct Offset
      .word <>(\Offset - aMovementCostOffsets)
    .endstruct

    structLoveBaseOffset .struct Offset
      .word <>(\Offset - aLoveBaseOffsets)
    .endstruct

    structLoveGrowthOffset .struct Offset
      .word <>(\Offset - aLoveGrowthOffsets)
    .endstruct

    structFactionNameOffset .struct Offset
      .word <>(\Offset - aFactionNameOffsets)
    .endstruct

    structItemNameOffset .struct Offset
      .word <>(\Offset - aItemNameOffsets)
    .endstruct

    structItemDescriptionOffset .struct Offset
      .word <>(\Offset - aItemDescriptionOffsets)
    .endstruct

    structTerrainNameOffset .struct Offset
      .word <>(\Offset - aTerrainNameOffsets)
    .endstruct

    structCastleNameOffset .struct Offset
      .word <>(\Offset - aCastleNameOffsets)
    .endstruct


    structHolyBloodDataEntry .struct BoostedWeaponRank, Unknown, HPGrowth, StrGrowth, MagGrowth, SklGrowth, SpdGrowth, DefGrowth, ResGrowth, LuckGrowth, StrBoost, MagBoost, SklBoost, SpdBoost, DefBoost, ResBoost
      BoostedWeaponRank .byte \BoostedWeaponRank  ; $00
      Unknown           .byte \Unknown            ; $01
      HPGrowth          .char \HPGrowth           ; $02
      StrGrowth         .char \StrGrowth          ; $03
      MagGrowth         .char \MagGrowth          ; $04
      SklGrowth         .char \SklGrowth          ; $05
      SpdGrowth         .char \SpdGrowth          ; $06
      DefGrowth         .char \DefGrowth          ; $07
      ResGrowth         .char \ResGrowth          ; $08
      LuckGrowth        .char \LuckGrowth         ; $09
      StrBoost          .char \StrBoost           ; $0A
      MagBoost          .char \MagBoost           ; $0B
      SklBoost          .char \SklBoost           ; $0C
      SpdBoost          .char \SpdBoost           ; $0D
      DefBoost          .char \DefBoost           ; $0E
      ResBoost          .char \ResBoost           ; $0F
    .endstruct


    structChildrenDataEntry .struct Son, Daughter
      .word \Son
      .word \Daughter
    .endstruct

    structCharacterROMEntry .struct Type
      Type .byte \Type
    .endstruct

    structCharacterEquipmentROMEntry .struct Equipment1, Equipment2
      Equipment1 .byte \Equipment1 ; $00
      Equipment2 .byte \Equipment2 ; $01
    .endstruct

    structCharacterConstantData .struct CharacterID, CharacterName, UnitNumber, Gender, FatherID, HPGrowth, StrengthGrowth, MagicGrowth, SkillGrowth, SpeedGrowth, DefenseGrowth, ResistanceGrowth, LuckGrowth, Skills1, Skills2, Skills3, HolyBlood1, HolyBlood2
      CharacterID       .word \CharacterID          ; $00
      CharacterName     .word \CharacterName        ; $02
      UnitNumber        .byte \UnitNumber           ; $04
      Gender            .byte \Gender               ; $05
      FatherID          .byte \FatherID             ; $06
      .union 
        Growths .fill 8                             ; $07
        .struct
          HPGrowth          .byte \HPGrowth         ; $07
          StrengthGrowth    .byte \StrengthGrowth   ; $08
          MagicGrowth       .byte \MagicGrowth      ; $09
          SkillGrowth       .byte \SkillGrowth      ; $0A
          SpeedGrowth       .byte \SpeedGrowth      ; $0B
          DefenseGrowth     .byte \DefenseGrowth    ; $0C
          ResistanceGrowth  .byte \ResistanceGrowth ; $0D
          LuckGrowth        .byte \LuckGrowth       ; $0E
        .endstruct
      .endunion
      Skills1           .byte \Skills1              ; $0F
      Skills2           .byte \Skills2              ; $10
      Skills3           .byte \Skills3              ; $11
      HolyBlood1        .word \HolyBlood1           ; $12
      HolyBlood2        .word \HolyBlood2           ; $14
    .endstruct

    structStaticCharacterROMEntry .struct Type, HP, Strength, Magic, Skill, Speed, Defense, Resistance, Luck, Class, Level, LeadershipStars, Money, CharacterID, CharacterName, UnitNumber, Gender, FatherID, HPGrowth, StrengthGrowth, MagicGrowth, SkillGrowth, SpeedGrowth, DefenseGrowth, ResistanceGrowth, LuckGrowth, Skills1, Skills2, Skills3, HolyBlood1, HolyBlood2, Equipment1, Equipment2, UniqueEquipment
      .dstruct structCharacterROMEntry            ; $00
      HP                .byte \HP                 ; $01
      Strength          .byte \Strength           ; $02
      Magic             .byte \Magic              ; $03
      Skill             .byte \Skill              ; $04
      Speed             .byte \Speed              ; $05
      Defense           .byte \Defense            ; $06
      Resistance        .byte \Resistance         ; $07
      Luck              .byte \Luck               ; $08
      Class             .byte \Class              ; $09
      Level             .byte \Level              ; $0A
      LeadershipStars   .byte \LeadershipStars    ; $0B
      Money             .byte \Money              ; $0C
      .dstruct structCharacterConstantData        ; $0D - $21
      .dstruct structCharacterEquipmentROMEntry   ; $23 - $24
      UniqueEquipment   .byte \UniqueEquipment    ; $25
    .endstruct

    structDynamicCharacterROMEntry .struct Type, Class, Level, CharacterID, CharacterName, UnitNumber, Gender, Equipment1, Equipment2, MajorInfluence
      .dstruct structCharacterROMEntry            ; $00
      Class             .byte \Class              ; $01
      Level             .byte \Level              ; $02
      CharacterID       .word \CharacterID        ; $03
      CharacterName     .word \CharacterName      ; $05
      UnitNumber        .byte \UnitNumber         ; $07
      Gender            .byte \Gender             ; $08
      .dstruct structCharacterEquipmentROMEntry   ; $09 - $0A
      MajorInfluence    .byte \MajorInfluence     ; $0B
    .endstruct

    structEnemyCharacterROMEntry .struct Type, CharacterID, CharacterName, Class, Gender, Level, LeadershipStars, UnitNumber, Equipment1, Equipment2, Drops
      .dstruct structCharacterROMEntry            ; $00
      CharacterID       .word \CharacterID        ; $01
      CharacterName     .word \CharacterName      ; $03
      Class             .byte \Class              ; $05
      Gender            .byte \Gender             ; $06
      Level             .byte \Level              ; $07
      LeadershipStars   .byte \LeadershipStars    ; $08
      UnitNumber        .byte \UnitNumber         ; $09
      .dstruct structCharacterEquipmentROMEntry   ; $0A - $0B
      Drops             .byte \Drops              ; $0C
    .endstruct





    structClassROMEntry .struct PromotionLevel, HP, Strength, Magic, Skill, Speed, Defense, Resistance, HPGrowth, StrengthGrowth, MagicGrowth, SkillGrowth, SpeedGrowth, DefenseGrowth, ResistanceGrowth, SwordRank, LanceRank, AxeRank, BowRank, StaffRank, FireRank, ThunderRank, WindRank, LightRank, DarkRank, Movement, MovementType, TerrainBonusType, Skills, Money
      PromotionLevel    .byte \PromotionLevel   ; $00
      HP                .byte \HP               ; $01
      Strength          .byte \Strength         ; $02
      Magic             .byte \Magic            ; $03
      Skill             .byte \Skill            ; $04
      Speed             .byte \Speed            ; $05
      Defense           .byte \Defense          ; $06
      Resistance        .byte \Resistance       ; $07
      HPGrowth          .byte \HPGrowth         ; $08
      StrengthGrowth    .byte \StrengthGrowth   ; $09
      MagicGrowth       .byte \MagicGrowth      ; $0A
      SkillGrowth       .byte \SkillGrowth      ; $0B
      SpeedGrowth       .byte \SpeedGrowth      ; $0C
      DefenseGrowth     .byte \DefenseGrowth    ; $0D
      ResistanceGrowth  .byte \ResistanceGrowth ; $0E
      .union
        WeaponRanks      .fill 10               ; $0F
        .struct
          SwordRank     .byte \SwordRank        ; $0F
          LanceRank     .byte \LanceRank        ; $10
          AxeRank       .byte \AxeRank          ; $11
          BowRank       .byte \BowRank          ; $12
          StaffRank     .byte \StaffRank        ; $13
          FireRank      .byte \FireRank         ; $14
          ThunderRank   .byte \ThunderRank      ; $15
          WindRank      .byte \WindRank         ; $16
          LightRank     .byte \LightRank        ; $17
          DarkRank      .byte \DarkRank         ; $18
        .endstruct
      .endunion
      Movement          .byte \Movement         ; $19
      MovementType      .byte \MovementType     ; $1A
      TerrainBonusType  .byte \TerrainBonusType ; $1B
      Skills            .word \Skills           ; $1C
      Money             .byte \Money            ; $1E
    .endstruct

    structWeaponStaffROMEntry .struct Name, EquipmentType, Durability, Cost, StatBonuses, StaffEffect, WeaponRank, Skills, WeaponType, Might, Accuracy, Weight, MinRange, MaxRange, Effectiveness, Traits, AlternateID
      .dstruct structItemROMEntry             ; $00 - $09
      WeaponType      .byte \WeaponType       ; $0A
      Might           .byte \Might            ; $0B
      Accuracy        .byte \Accuracy         ; $0C
      Weight          .byte \Weight           ; $0D
      MinRange        .byte \MinRange         ; $0E
      MaxRange        .byte \MaxRange         ; $0F
      Effectiveness   .byte \Effectiveness    ; $10
      Traits          .byte \Traits           ; $11
      AlternateID     .byte \AlternateID      ; $12
    .endstruct

    structItemROMEntry .struct Name, EquipmentType, Durability, Cost, StatBonuses, StaffEffect, WeaponRank, Skills
      Name            .byte \Name             ; $00
      EquipmentType   .byte \EquipmentType    ; $01
      Durability      .byte \Durability       ; $02
      Cost            .word \Cost             ; $03
      StatBonuses     .byte \StatBonuses      ; $05
      StaffEffect     .byte \StaffEffect      ; $06
      WeaponRank      .byte \WeaponRank       ; $07
      Skills          .word \Skills           ; $08
    .endstruct


    structBrokenWeaponEntry .struct HolyRank, ARank, BRank, CRank
      HolyRank  .byte \HolyRank
      ARank     .byte \ARank   
      BRank     .byte \BRank   
      CRank     .byte \CRank   
    .endstruct

    structPlayerItemEntry .struct Item
      Item  .byte \Item   
    .endstruct

    structLoverID .struct UnitID
      UnitID .word \UnitID
    .endstruct











    structRAMStructHeader .struct
      CurrentStructCount  .byte ? ; $00
      MaxStructCount      .byte ? ; $01
      StructSize          .byte ? ; $02
      Unknown             .byte ? ; $03
    .endstruct

    structItemRAMEntry .struct
      ItemID            .byte ? ; $00
      Durability        .byte ? ; $01
      Unknown1          .byte ? ; $02 - item state? 1- in player inv, 7 - unobtained
      Owner             .word ? ; $03
      KillCount         .byte ? ; $05
    .endstruct

    structCharacterDataRAM .struct
      Type                    .byte ? ; $00
      PersonalData            .long ? ; $01
      ExtendedPersonalData    .long ? ; $04
      ConstantData            .long ? ; $07
      EnemyROMData            .long ? ; $0A
      InventoryData           .long ? ; $0D
      LoverData               .long ? ; $10
    .endstruct

    structPersonalCharacterDataRAM .struct 
      UnitStates            .word ? ; $00 - lowest 3 bits are arena level
      LoverID               .byte ? ; $02
      Unknown2              .byte ? ; $03
      Unknown3              .byte ? ; $04 - some $FF
      Unknown4              .byte ? ; $05
      Faction               .byte ? ; $06
      Unknown6              .byte ? ; $07
      Status                .byte ? ; $08
      Unknown8              .byte ? ; $09
      RingStatBonusBitfield .byte ? ; $0A
      WeaponStatBonus       .byte ? ; $0B
      StatusDuration        .byte ? ; $0C
      CurrentHP             .byte ? ; $0D
      ClassMoney            .byte ? ; $0E
    .endstruct

    structExtendedPersonalCharacterDataRAM .struct
      HP                .byte ? ; $00
      Strength          .byte ? ; $01
      Magic             .byte ? ; $02
      Skill             .byte ? ; $03
      Speed             .byte ? ; $04
      Defense           .byte ? ; $05
      Resistance        .byte ? ; $06
      Luck              .byte ? ; $07
      Class             .byte ? ; $08
      Level             .byte ? ; $09
      LeadershipStars   .byte ? ; $0A
      Money             .word ? ; $0B
      Experience        .byte ? ; $0D
      Unknown13         .byte ? ; $0E
    .endstruct


    structParentExtendedCharacterData .struct
      HP          .word ?   ; $00
      Strength    .word ?   ; $02
      Magic       .word ?   ; $04
      Skill       .word ?   ; $06
      Speed       .word ?   ; $08
      Defense     .word ?   ; $0A
      Resistance  .word ?   ; $0C
      Luck        .word ?   ; $0E
      Class       .word ?   ; $10
      Level       .word ?   ; $12
                  .word ?   ; $14
      Money       .word ?   ; $16
      Unknown1    .word ?   ; $18
      Unknown2    .word ?   ; $1A
      Unknown3    .word ?   ; $1C
    .endstruct

    structParentCharacterROMData .struct
      CharacterID       .word ?   ; $00
      CharacterName     .word ?   ; $02
                        .word ?   ; $04
      Gender            .word ?   ; $06
      FatherID          .word ?   ; $08
      HPGrowth          .word ?   ; $0A
      StrengthGrowth    .word ?   ; $0C
      MagicGrowth       .word ?   ; $0E
      SkillGrowth       .word ?   ; $10
      SpeedGrowth       .word ?   ; $12
      DefenseGrowth     .word ?   ; $14
      ResistanceGrowth  .word ?   ; $16
      LuckGrowth        .word ?   ; $18
      Skills1           .byte ?   ; $1A
      Skills2           .byte ?   ; $1B
      Skills3           .byte ?   ; $1C
                        .byte ?   ; $1D
      HolyBlood1        .word ?   ; $1E
      HolyBlood2        .word ?   ; $20
    .endstruct




    structInventoryDataRAM .struct
      EquippedWeaponBitfield          .byte ? ; $00
      .dstruct structRAMStructHeader          ; $01 - $04
      Slot .rept 8                            ; $05 - $0D
        .byte ?
      .endrept
    .endstruct

    structLoverDataRAM .struct
      LoveValue .brept 15
        .word ? 
      .endrept
    .endstruct



    ; so form what i can tell:
    ; each ram area for units, items, etc
    ; starts with a header that defines the total size
    ; for this area and the endpoint (and other stuff)
    ; then it sets the first entry header with flag $80
    ; that flag serves as a guide, when adding a new entry it looks
    ; at the offset in that entry header, puts its entry where the offset leads 
    ; and then reduces this offset by the size of what got added
    ; the entry header is also used for stuff that got added, using flag $40
    ; i assume that the given offset then acts as a protected area
    ; when all but one slot is filled it starts overwriting the first $80 flagged
    ; entry with a $40 one

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







    structTerrainEntry .struct Unknown1, Unknown2, Unknown3, Unknown4, Unknown5, Unknown6, Unknown7, Unknown8, Unknown9, Unknown10, Unknown11, Unknown12, Unknown13, Unknown14, Unknown15, Unknown16, Unknown17, Unknown18, Unknown19, Unknown20, Unknown21, Unknown22, Unknown23, Unknown24, Unknown25, Unknown26
      Unknown1  .char \Unknown1
      Unknown2  .char \Unknown2
      Unknown3  .char \Unknown3
      Unknown4  .char \Unknown4
      Unknown5  .char \Unknown5
      Unknown6  .char \Unknown6
      Unknown7  .char \Unknown7
      Unknown8  .char \Unknown8
      Unknown9  .char \Unknown9
      Unknown10 .char \Unknown10
      Unknown11 .char \Unknown11
      Unknown12 .char \Unknown12
      Unknown13 .char \Unknown13
      Unknown14 .char \Unknown14
      Unknown15 .char \Unknown15
      Unknown16 .char \Unknown16
      Unknown17 .char \Unknown17
      Unknown18 .char \Unknown18
      Unknown19 .char \Unknown19
      Unknown20 .char \Unknown20
      Unknown21 .char \Unknown21
      Unknown22 .char \Unknown22
      Unknown23 .char \Unknown23
      Unknown24 .char \Unknown24
      Unknown25 .char \Unknown25
      Unknown26 .char \Unknown26
    .endstruct




    structGen1LoveEntry .struct Sigurd, Naoise, Alec, Arden, Finn, Quan, Midayle, Lewyn, Chulainn, Azelle, Jamke, Claud, Beowulf, Lex, Dew
      Sigurd      .char \Sigurd
      Naoise      .char \Naoise
      Alec        .char \Alec
      Arden       .char \Arden
      Finn        .char \Finn
      Quan        .char \Quan
      Midayle     .char \Midayle
      Lewyn       .char \Lewyn
      Chulainn    .char \Chulainn
      Azelle      .char \Azelle
      Jamke       .char \Jamke
      Claud       .char \Claud
      Beowulf     .char \Beowulf
      Lex         .char \Lex
      Dew         .char \Dew
    .endstruct

    structGen2LoveEntry .struct Seliph, Shannan, Dalvin, Asaello, Leif, Iuchar, Charlot, Hawk, Tristan, OldFinn, Deimne, Hannibal, Ares, Amid, Oifey, Iucharba, Scathach, Febail, Coirpre, Ced, Diarmuid, Lester, Arthur
      Seliph      .char \Seliph
      Shannan     .char \Shannan
      Dalvin      .char \Dalvin
      Asaello     .char \Asaello
      Leif        .char \Leif
      Iuchar      .char \Iuchar
      Charlot     .char \Charlot
      Hawk        .char \Hawk
      Tristan     .char \Tristan
      OldFinn     .char \OldFinn
      Deimne      .char \Deimne
      Hannibal    .char \Hannibal
      Ares        .char \Ares
      Amid        .char \Amid
      Oifey       .char \Oifey
      Iucharba    .char \Iucharba
      Scathach    .char \Scathach
      Febail      .char \Febail
      Coirpre     .char \Coirpre
      Ced         .char \Ced
      Diarmuid    .char \Diarmuid
      Lester      .char \Lester
      Arthur      .char \Arthur
    .endstruct












    structActionStructEntry .struct
      DeploymentNumber      .word ? ; $00
      XPosition             .word ? ; $02
      YPosition             .word ? ; $04
      UnitRAMPointer        .word ? ; $06
      CharacterID           .word ? ; $08
      ClassID               .word ? ; $0A
      Gender                .word ? ; $0C
      TerrainID             .word ? ; $0E
      CurrentHP             .word ? ; $10
      MaxHP                 .word ? ; $12
      Level                 .word ? ; $14
      GainedLevels          .word ? ; $16
      StartingExperience    .word ? ; $18
      GainedExperience      .word ? ; $1A
      ObtainedItem          .word ? ; $1C
      ObtainedStealMoney    .word ? ; $1E
      ObtainedArenaMoney    .word ? ; $20
                            .word ? ; $22 - sometimes has an $08
      TriggerableSkills     .word ? ; $24
      WeaponInventorySlot   .word ? ; $26
      WeaponID              .word ? ; $28
      WeaponType            .word ? ; $2A
      WeaponMinRange        .word ? ; $2C
      WeaponMaxRange        .word ? ; $2E
      BattleAttackSpeed     .word ? ; $30
      BattleAdjustedHit     .word ? ; $32
      BattleHit             .word ? ; $34
      BattleAvoid           .word ? ; $36
      BattleCrit            .word ? ; $38
      BattleMight           .word ? ; $3A
      BattleDefense         .word ? ; $3C
      BattleBonusAtkDef     .word ? ; $3E
      LevelUpData .dstruct structLevelUpStats ; $40 - $5E

    .endstruct



    structLevelUpStats .struct
      HP              .word ? ; $00
      Strength        .word ? ; $02
      Magic           .word ? ; $04
      Skill           .word ? ; $06
      Speed           .word ? ; $08
      Defense         .word ? ; $0A
      Resistance      .word ? ; $0C
      Luck            .word ? ; $0E
      HPGain          .word ? ; $10
      StrengthGain    .word ? ; $12
      MagicGain       .word ? ; $14
      SkillGain       .word ? ; $16
      SpeedGain       .word ? ; $18
      DefenseGain     .word ? ; $1A
      ResistanceGain  .word ? ; $1C
      LuckGain        .word ? ; $1E
    .endstruct


    structFactionHeader .struct
      Unknown1  .byte ? ; $00 - factionID? for $86C784
      Unknown2  .byte ? ; $01 - hostility 1
      Unknown3  .byte ? ; $02 - hostility 2
      Unknown4  .byte ? ; $03
      UnitCount .byte ? ; $04
    .endstruct













