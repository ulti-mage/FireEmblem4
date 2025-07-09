
  UnitTypeStatic          = 0
  UnitTypeDynamic         = 1
  UnitTypeHoly            = 2
  UnitTypeEnemy           = 3

  GenderMale              = $00
  GenderFemale            = $01
  Genderless              = $FF

  UnitSkill1Wrath         = $01
  UnitSkill1Pursuit       = $02
  UnitSkill1Adept         = $04
  UnitSkill1Dismount      = $08
  UnitSkill1Charm         = $10
  UnitSkill1PoW           = $20
  UnitSkill1Nihil         = $40
  UnitSkill1Miracle       = $80

  UnitSkill2Critical      = $01
  UnitSkill2Vantage       = $02
  UnitSkill2Accost        = $04
  UnitSkill2Astra         = $08
  UnitSkill2Luna          = $10
  UnitSkill2Sol           = $20
  UnitSkill2Holy          = $40
  UnitSkill2Darkness      = $80

  UnitSkill3Renewal       = $01
  UnitSkill3Paragon       = $02
  UnitSkill3Escape        = $04
  UnitSkill3Recover       = $08
  UnitSkill3Bargain       = $10
  UnitSkill3Return        = $20

  UnitSkill2NonSword      = $07
  UnitSkillsAll           = $FF


  MinorHolyBlood          = 1
  MajorHolyBlood          = 2

  MinorBaldrBlood         = bits($0001)
  MajorBaldrBlood         = bits($0002)
  MinorNagaBlood          = bits($0004)
  MajorNagaBlood          = bits($0008)
  MinorDainnBlood         = bits($0010)
  MajorDainnBlood         = bits($0020)
  MinorNjorunBlood        = bits($0040)
  MajorNjorunBlood        = bits($0080)
  MinorOdBlood            = bits($0100)
  MajorOdBlood            = bits($0200)
  MinorUllrBlood          = bits($0400)
  MajorUllrBlood          = bits($0800)
  MinorNalBlood           = bits($1000)
  MajorNalBlood           = bits($2000)
  MinorFjalarBlood        = bits($4000)
  MajorFjalarBlood        = bits($8000)
  
  MinorThrudBlood         = bits($0001)
  MajorThrudBlood         = bits($0002)
  MinorForsetiBlood       = bits($0004)
  MajorForsetiBlood       = bits($0008)
  MinorBragiBlood         = bits($0010)
  MajorBragiBlood         = bits($0020)
  MinorHothrBlood         = bits($0040)
  MajorHothrBlood         = bits($0080)
  MinorLoptousBlood       = bits($0100)
  MajorLoptousBlood       = bits($0200)


  StatusHealthy           = 0
  StatusCured             = 1
  StatusFreelancer        = 2
  StatusCaptive           = 3
  StatusSilence           = 4
  StatusSleep             = 5
  StatusBerserk           = 6

  UnitStateArenaLevelMask = bits($0007)
  ; $0008 ; not used?
  ; $0010 ; not used?
  ; $0020 ; not used?
  UnitStateMapAnimation   = bits($0040)
  UnitStateMiracleActive  = bits($0080)
  UnitStateGroupLeader    = bits($0100)
  UnitStateDead           = bits($0200)
  UnitState0400           = bits($0400) ; siege?
  UnitStateCanto          = bits($0800)
  UnitState1000           = bits($1000) ; town?
  UnitStateGuardingCastle = bits($2000)
  UnitStateMoved          = bits($4000)
  UnitStateFielded        = bits($8000)


  GEN_ID_Sigurd           = 1
  GEN_ID_Naoise           = 2
  GEN_ID_Alec             = 3
  GEN_ID_Arden            = 4
  GEN_ID_Finn             = 5
  GEN_ID_Quan             = 6
  GEN_ID_Midir            = 7
  GEN_ID_Lewyn            = 8
  GEN_ID_Chulainn         = 9
  GEN_ID_Azelle           = 10
  GEN_ID_Jamke            = 11
  GEN_ID_Claud            = 12
  GEN_ID_Beowulf          = 13
  GEN_ID_Lex              = 14
  GEN_ID_Dew              = 15
  GEN_ID_Deirdre          = 16
  GEN_ID_Ethlyn           = 17
  GEN_ID_Lachesis         = 18
  GEN_ID_Ayra             = 19
  GEN_ID_Erinys           = 20
  GEN_ID_Tailtiu          = 21
  GEN_ID_Silvia           = 22
  GEN_ID_Edain            = 23
  GEN_ID_Brigid           = 24

  GEN_ID_Seliph           = 1
  GEN_ID_Shannan          = 2
  GEN_ID_Dalvin_Scathach  = 3
  GEN_ID_Asaello_Febail   = 4
  GEN_ID_Leif             = 5
  GEN_ID_Iuchar_Iucharba  = 6
  GEN_ID_Charlot_Coirpre  = 7
  GEN_ID_Hawk_Ced         = 8
  GEN_ID_Tristan_Diarmuid = 9
  GEN_ID_AdultFinn        = 10
  GEN_ID_Deimne_Lester    = 11
  GEN_ID_Hannibal         = 12
  GEN_ID_Ares             = 13
  GEN_ID_Amid_Arthur      = 14
  GEN_ID_Oifey            = 15
  GEN_ID_Daisy_Patty      = 16
  GEN_ID_Creidne_Larcei   = 17
  GEN_ID_Muirne_Lana      = 18
  GEN_ID_Julia            = 19
  GEN_ID_Altena           = 20
  GEN_ID_Hermina_Fee      = 21
  GEN_ID_Linda_Tine       = 22
  GEN_ID_Laylea_Lene      = 23
  GEN_ID_Jeanne_Nanna     = 24

  FS_Player               = 0

  AllegianceOwn           = 0
  AllegianceEnemy         = 1
  AllegianceNeutral       = 2
  AllegianceOther         = 3


  structHolyBloodDataEntry .struct BoostedWeaponRank, HolyWeapon, HPGrowth, StrGrowth, MagGrowth, SklGrowth, SpdGrowth, DefGrowth, ResGrowth, LuckGrowth, StrBoost, MagBoost, SklBoost, SpdBoost, DefBoost, ResBoost
    BoostedWeaponRank .byte \BoostedWeaponRank  ; $00
    HolyWeapon        .byte \HolyWeapon         ; $01
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

  structCharacterConstantData .struct CharacterID, CharacterName, GenerationID, Gender, FatherID, HPGrowth, StrengthGrowth, MagicGrowth, SkillGrowth, SpeedGrowth, DefenseGrowth, ResistanceGrowth, LuckGrowth, Skills1, Skills2, Skills3, HolyBlood1, HolyBlood2
    CharacterID       .word \CharacterID          ; $00
    CharacterName     .word \CharacterName        ; $02
    GenerationID      .byte \GenerationID         ; $04
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

  structStaticCharacterROMEntry .struct Type, HP, Strength, Magic, Skill, Speed, Defense, Resistance, Luck, Class, Level, LeadershipStars, Money, CharacterID, CharacterName, GenerationID, Gender, FatherID, HPGrowth, StrengthGrowth, MagicGrowth, SkillGrowth, SpeedGrowth, DefenseGrowth, ResistanceGrowth, LuckGrowth, Skills1, Skills2, Skills3, HolyBlood1, HolyBlood2, Equipment1, Equipment2, UniqueEquipment
    .dstruct structCharacterROMEntry, \Type     ; $00
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
    .dstruct structCharacterConstantData, \CharacterID, \CharacterName, \GenerationID, \Gender, \FatherID, \HPGrowth, \StrengthGrowth, \MagicGrowth, \SkillGrowth, \SpeedGrowth, \DefenseGrowth, \ResistanceGrowth, \LuckGrowth, \Skills1, \Skills2, \Skills3, \HolyBlood1, \HolyBlood2        ; $0D - $21
    .dstruct structCharacterEquipmentROMEntry, \Equipment1, \Equipment2 ; $23 - $24
    UniqueEquipment   .byte \UniqueEquipment    ; $25
  .endstruct

  structDynamicCharacterROMEntry .struct Type, Class, Level, CharacterID, CharacterName, GenerationID, Gender, Equipment1, Equipment2, MajorInfluence
    .dstruct structCharacterROMEntry, \Type     ; $00
    Class             .byte \Class              ; $01
    Level             .byte \Level              ; $02
    CharacterID       .word \CharacterID        ; $03
    CharacterName     .word \CharacterName      ; $05
    GenerationID      .byte \GenerationID       ; $07
    Gender            .byte \Gender             ; $08
    .dstruct structCharacterEquipmentROMEntry, \Equipment1, \Equipment2 ; $09 - $0A
    MajorInfluence    .byte \MajorInfluence     ; $0B
  .endstruct

  structEnemyCharacterROMEntry .struct Type, CharacterID, CharacterName, Class, Gender, Level, LeadershipStars, GenerationID, Equipment1, Equipment2, Drops
    .dstruct structCharacterROMEntry, \Type     ; $00
    CharacterID       .word \CharacterID        ; $01
    CharacterName     .word \CharacterName      ; $03
    Class             .byte \Class              ; $05
    Gender            .byte \Gender             ; $06
    Level             .byte \Level              ; $07
    LeadershipStars   .byte \LeadershipStars    ; $08
    GenerationID      .byte \GenerationID       ; $09
    .dstruct structCharacterEquipmentROMEntry, \Equipment1, \Equipment2 ; $0A - $0B
    Drops             .byte \Drops              ; $0C
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
    LoveDataID            .byte ? ; $02
      ; This is used to index into the love base and love growth tables.
    LoverGenerationID     .byte ? ; $03
      ; This holds the GenerationID of the unit that this one is married to.
    DeploymentOffset      .byte ? ; $04
    ResidingCastle        .byte ? ; $05
      ; If unit isn't on the field but inside a castle, 
      ; this holds the castle ID
    FactionSlot           .byte ? ; $06
    AI                    .byte ? ; $07
    Status                .byte ? ; $08
    CantoMovement         .byte ? ; $09
    RingStatBonusBitfield .byte ? ; $0A
    WeaponStatBonus       .byte ? ; $0B
    StatusDuration        .byte ? ; $0C
    CurrentHP             .byte ? ; $0D
    ClassMoney            .byte ? ; $0E
  .endstruct

  structPersonalCharacterDataBuffer .struct
    UnitStates              .word ? ; $00
    LoveDataID              .word ? ; $02
    LoverGenerationID       .word ? ; $04
    DeploymentOffset        .word ? ; $06
    ResidingCastle          .word ? ; $08
    FactionSlot             .word ? ; $0A
    AI                      .word ? ; $0C
    Status                  .word ? ; $0E
    RingStatBonusBitfield   .word ? ; $10
    WeaponStatBonus         .word ? ; $12
    CantoMovement           .word ? ; $14
    StatusDuration          .word ? ; $16
    CurrentHP               .word ? ; $18
    ClassMoney              .word ? ; $1A
  .endstruct

  structExtendedCharacterDataRAM .struct
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
    TalkTarget        .byte ? ; $0E
  .endstruct

  structExtendedCharacterDataBuffer .struct
    HP                .word ?   ; $00
    Strength          .word ?   ; $02
    Magic             .word ?   ; $04
    Skill             .word ?   ; $06
    Speed             .word ?   ; $08
    Defense           .word ?   ; $0A
    Resistance        .word ?   ; $0C
    Luck              .word ?   ; $0E
    Class             .word ?   ; $10
    Level             .word ?   ; $12
    LeadershipStars   .word ?   ; $14
    Money             .word ?   ; $16
    Experience        .word ?   ; $18
    TalkTarget        .word ?   ; $1A
    .word ?
  .endstruct

  structCharacterROMDataBuffer .struct
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
    EquippedWeaponBitfield .byte ? ; $00
    .dstruct structRAMStructHeader ; $01 - $04
    Slot .rept 8                   ; $05 - $0D
      .byte ?
    .endrept
  .endstruct

  structInventoryDataBuffer .struct
    EquippedWeaponBitfield .word ?  ; $00
    ItemCount .word ?               ; $02
    Items .rept 7                   ; $04
      .word ?
    .endrept
    .word ?                         ; $12
  .endstruct


  structLoverID .struct UnitID
    UnitID .word \UnitID
  .endstruct

  structLoverDataRAM .struct
    LoveValue .rept 15
      .word ? 
    .endrept
  .endstruct

  structGen1LoveEntry .struct Sigurd, Naoise, Alec, Arden, Finn, Quan, Midir, Lewyn, Chulainn, Azelle, Jamke, Claud, Beowulf, Lex, Dew
    Sigurd      .char \Sigurd
    Naoise      .char \Naoise
    Alec        .char \Alec
    Arden       .char \Arden
    Finn        .char \Finn
    Quan        .char \Quan
    Midir       .char \Midir
    Lewyn       .char \Lewyn
    Chulainn    .char \Chulainn
    Azelle      .char \Azelle
    Jamke       .char \Jamke
    Claud       .char \Claud
    Beowulf     .char \Beowulf
    Lex         .char \Lex
    Dew         .char \Dew
  .endstruct

  structGen2LoveEntry .struct Seliph, Shannan, Dalvin, Asaello, Leif, Iuchar, Charlot, Hawk, Tristan, AdultFinn, Deimne, Hannibal, Ares, Amid, Oifey, Iucharba, Scathach, Febail, Coirpre, Ced, Diarmuid, Lester, Arthur
    Seliph      .char \Seliph
    Shannan     .char \Shannan
    Dalvin      .char \Dalvin
    Asaello     .char \Asaello
    Leif        .char \Leif
    Iuchar      .char \Iuchar
    Charlot     .char \Charlot
    Hawk        .char \Hawk
    Tristan     .char \Tristan
    AdultFinn   .char \AdultFinn
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


  structDeathQuoteEntry .struct CharacterID, DeathQuotePointer
    .word \CharacterID
    .addr \DeathQuotePointer
  .endstruct
