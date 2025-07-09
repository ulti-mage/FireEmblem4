
  NoItem            = $FF

  EquipTypeWeapon   = 0
  EquipTypeStaff    = 1
  EquipTypeRing     = 2

  WeaponTypeSword   = 0
  WeaponTypeLance   = 1
  WeaponTypeAxe     = 2
  WeaponTypeBow     = 3
  WeaponTypeStaff   = 4
  WeaponTypeFire    = 5
  WeaponTypeThunder = 6
  WeaponTypeWind    = 7
  WeaponTypeLight   = 8
  WeaponTypeDark    = 9

  WeaponTraitRangedMagicSword     = $01
  WeaponTraitPermanentMagicSword  = $02
  WeaponTraitLifeSteal            = $03
  WeaponTraitBrave                = $04
  WeaponTraitUncounterable        = $05
  WeaponTraitStatusSword          = $06
  WeaponTraitHalveAttack          = $07
  WeaponTraitNegateHalveAttack    = $08
  WeaponTraitHelEffect            = $09
  WeaponTraitFemaleOnly           = $0A

  TyrfingStatBoost      = $01
  NagaStatBoost         = $02
  GungnirStatBoost      = $03
  GaeBolgStatBoost      = $04
  BalmungStatBoost      = $05
  YewfelleStatBoost     = $06
  HelswathStatBoost     = $07
  ValflameStatBoost     = $08
  MjolnirStatBoost      = $09
  ForsetiStatBoost      = $0A

  MystletainnStatBoost  = $0C
  LoptousStatBoost      = $0D
  SafeguardStatBoost    = $0E
  BarrierBladeStatBoost = $0F

  SpeedRingStatBoost    = $01
  MagicRingStatBoost    = $02
  PowerRingStatBoost    = $03
  ShieldRingStatBoost   = $04
  BarrierRingStatBoost  = $05
  LegRingStatBoost      = $06
  SkillRingStatBoost    = $07


  CavalierEffectiveness = bits($01)
  FlierEffectiveness    = bits($02)
  DragonEffectiveness   = bits($04)
  ArmorEffectiveness    = bits($08)
  MageEffectiveness     = bits($10)


  ItemSkillSteal    = bits($0001)
  ItemSkillUnknown1 = bits($0002)
  ; $0004 not assigned
  ItemSkillMiracle  = bits($0008)
  ItemSkillCritical = bits($0010)
  ItemSkillRenewal  = bits($0020)
  ItemSkillParagon  = bits($0040)
  ItemSkillEscape   = bits($0080)
  ItemSkillRecover  = bits($0100)
  ItemSkillBargain  = bits($0200)
  ItemSkillReturn   = bits($0400)
  ItemSkillPursuit  = bits($0800)
  ItemSkillCanto    = bits($1000)

  ItemStateInventory  = 1
  ItemStateSupply     = 2
  ItemStateUnknwon3   = 3
  ItemStateShop       = 4
  ItemStatePawnbroker = 5
  ItemStateUnknown6   = 6
  ItemStateUnobtained = 7


  structWeaponStaffROMEntry .struct Name, EquipmentType, Durability, Cost, StatBonuses, StaffEffect, WeaponRank, Skills, WeaponType, Might, Accuracy, Weight, MinRange, MaxRange, Effectiveness, Traits, AdditionalInfo
    .dstruct structItemROMEntry, \Name, \EquipmentType, \Durability, \Cost, \StatBonuses, \StaffEffect, \WeaponRank, \Skills ; $00 - $09
    WeaponType      .byte \WeaponType       ; $0A
    Might           .byte \Might            ; $0B
    Accuracy        .byte \Accuracy         ; $0C
    Weight          .byte \Weight           ; $0D
    MinRange        .byte \MinRange         ; $0E
    MaxRange        .byte \MaxRange         ; $0F
    Effectiveness   .byte \Effectiveness    ; $10
    Traits          .byte \Traits           ; $11
    AdditionalInfo  .byte \AdditionalInfo   ; $12
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

  structItemRAMEntry .struct
    ItemID                  .byte ? ; $00
    Durability              .byte ? ; $01
    ItemState               .byte ? ; $02
    .union
      OwnerRAMPointer       .word ? ; $03
      OwnerID_InventorySlot .word ? ; $03
      ; Only used briefly during a save file load/save
      ; %00000000_00111111 - ID
      ; %00000001_11000000 - Inv slot
    .endunion
    KillCount               .byte ? ; $05
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
