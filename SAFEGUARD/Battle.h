
  CombatSkillFlagStayOnMap  = bits($0001)
    ; Prevents the map fade after one of the combatants die, used for events where bosses run or warp away.
  CombatSkillFlagDance      = bits($0002)
  CombatSkillFlagDarkness   = bits($0004)
  CombatSkillFlagHoly       = bits($0008)
  CombatSkillFlagSol        = bits($0010)
  CombatSkillFlagLuna       = bits($0020)
  CombatSkillFlagAstra      = bits($0040)
  CombatSkillFlagSteal      = bits($0080)
  CombatSkillFlagPavise     = bits($0100)
  CombatSkillFlagAccost     = bits($0200)
  CombatSkillFlagVantage    = bits($0400)
  CombatSkillFlagMiracle    = bits($0800)
  CombatSkillFlagNihil      = bits($1000)
  CombatSkillFlagAdept      = bits($2000)
  CombatSkillFlagPursuit    = bits($4000)
  CombatSkillFlagWrath      = bits($8000)

  ; Scripted Battles

  SB_AttackerFirst   = $01
  SB_Unknown02       = $02
  SB_GuaranteedCrit  = $04
  SB_GuaranteedHit   = $08
  SB_ApplyGuarantees = $10


  BattleHUDColorDarkRed     = 0
  BattleHUDColorGray        = 1
  BattleHUDColorGreen       = 2
  BattleHUDColorPurple      = 3 ; unused
  BattleHUDColorWhite       = 4
  BattleHUDColorBrown       = 5
  BattleHUDColorBlue        = 6
  BattleHUDColorOrange      = 7
  BattleHUDColorDarkBlue    = 8

  BattleBannerLeonster      =  0
  BattleBannerDozel         =  1
  BattleBannerYngvi         =  2
  BattleBannerChalphy       =  3
  BattleBannerNordion       =  4
  BattleBannerIsaach        =  5
  BattleBannerThracia       =  6
  BattleBannerVelthomer     =  7
  BattleBannerFreege        =  8
  BattleBannerSilesse       =  9
  BattleBannerEdda          = 10
  BattleBannerBelhalla      = 11
  BattleBannerLoptr         = 12
  BattleBannerDefault       = 13

  structActionStructEntry .struct
    DeploymentNumber      .word ? ; $00
    XPosition             .word ? ; $02
    YPosition             .word ? ; $04
    UnitRAMPointer        .word ? ; $06
    CharacterID           .word ? ; $08
    ClassID               .word ? ; $0A
    Gender                .word ? ; $0C
    TerrainType           .word ? ; $0E
    CurrentHP             .word ? ; $10
    MaxHP                 .word ? ; $12
    Level                 .word ? ; $14
    GainedLevels          .word ? ; $16
    StartingExperience    .word ? ; $18
    GainedExperience      .word ? ; $1A
    ObtainedItem          .word ? ; $1C
    ObtainedStealMoney    .word ? ; $1E
    ObtainedArenaMoney    .word ? ; $20
    Unknown               .word ? ; $22 - sometimes has an $08
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

  structScriptedBattle .struct DefenderID, DefenderInventorySlot, AttackerID, BattleQuote, DefeatQuote
    .word \DefenderID             ; $00
    .word \DefenderInventorySlot  ; $02
    .word \AttackerID             ; $04
    .byte 0                       ; $06
    .long \BattleQuote            ; $07
    .long \DefeatQuote            ; $0A
  .endstruct

  structScriptedMapAttack .struct
    wDeploymentOffset .word ? ; $00
    wXTilePosition .word ?    ; $02
    wYTilePosition .word ?    ; $04
    wClass .word ?            ; $06
    .word ?                   ; $08
    .word ?                   ; $0A
    .word ?                   ; $0C
    .word ?                   ; $0E
    .word ?                   ; $10
    wCharacterID .word ?      ; $12
    wGender .word ?           ; $14
    .word ?                   ; $16
    .word ?                   ; $18
  .endstruct
