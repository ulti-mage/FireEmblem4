
  WeaponRankHoly  = $FF
  WeaponRankA     = 0
  WeaponRankB     = 1
  WeaponRankC     = 2
  WeaponRankNone  = 3


  ClassSkillCanto     = bits($0001)
  ClassSkillPavise    = bits($0002)
  ClassSkillWrath     = bits($0004)
  ClassSkillPursuit   = bits($0008)
  ClassSkillAdept     = bits($0010)
  ClassSkillSteal     = bits($0020)
  ClassSkillUnknown1  = bits($0040)
  ClassSkillDance     = bits($0080)
  ClassSkillUnknown2  = bits($0100)
  ClassSkillUnknown3  = bits($0200)
  ClassSkillDismount  = bits($0400)
  ClassSkillCharm     = bits($0800)
  ClassSkillCritical  = bits($1000)


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

  structClassMapSpriteAssignment .struct CharacterID, Gender, SpriteID
    CharacterID .word \CharacterID
    Gender      .byte \Gender
    SpriteID    .word \SpriteID
  .endstruct
