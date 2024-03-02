
; characters

  None           = $0000

  UnitTypeStatic  = $00
  UnitTypeDynamic = $01
  UnitTypeHoly    = $02
  UnitTypeEnemy   = $03

  GenderMale    = $00
  GenderFemale  = $01
  Genderless    = $FF

  MinorHolyBlood = 1
  MajorHolyBlood = 2


  UnitSkill1Wrath         = $01
  UnitSkill1Pursuit       = $02
  UnitSkill1Adept         = $04
  UnitSkill1Dismount      = $08
  UnitSkill1Charm         = $10
  UnitSkill1Unknown2      = $20 ; leave temporarily when klled?
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
  UnitSkill3Unknown1      = $04 ; leave permanently when killed?
  UnitSkill3Recover       = $08
  UnitSkill3Bargain       = $10
  UnitSkill3Return        = $20


  UnitSkill2NonSword = $07
  UnitSkillsAll = $FF


  MinorBaldrBlood   = $0001
  MajorBaldrBlood   = $0002
  MinorNagaBlood    = $0004
  MajorNagaBlood    = $0008
  MinorDainnBlood   = $0010
  MajorDainnBlood   = $0020
  MinorNjorunBlood  = $0040
  MajorNjorunBlood  = $0080
  MinorOdBlood      = $0100
  MajorOdBlood      = $0200
  MinorUllrBlood    = $0400
  MajorUllrBlood    = $0800
  MinorNalBlood     = $1000
  MajorNalBlood     = $2000
  MinorFjalarBlood  = $4000
  MajorFjalarBlood  = $8000
  
  MinorThrudBlood   = $0001
  MajorThrudBlood   = $0002
  MinorForsetiBlood = $0004
  MajorForsetiBlood = $0008
  MinorBragiBlood   = $0010
  MajorBragiBlood   = $0020
  MinorHothrBlood   = $0040
  MajorHothrBlood   = $0080
  MinorLoptousBlood = $0100
  MajorLoptousBlood = $0200


  StatusHealthy    = $00
  StatusCured      = $01
  StatusFreelancer = $02
  StatusCaptive    = $03
  StatusSilence    = $04
  StatusSleep      = $05
  StatusBerserk    = $06



  UnitStateArenaLevelMask = bits($0007)

  UnitStateMapAnimation   = bits($0040)
  UnitStateMiracleActive  = bits($0080)
  UnitStateGroupLeader    = bits($0100)
  UnitStateDead           = bits($0200)
  ; $0400 - siege?
  ; $0800 - side?
  ; $1000 - town?
  UnitStateGuardingCastle = bits($2000)
  UnitStateMoved          = bits($4000)
  UnitStateFielded        = bits($8000)
  
  
  




; class

  WeaponRankHoly = $FF
  WeaponRankA = 0
  WeaponRankB = 1
  WeaponRankC = 2
  WeaponRankNone = 3


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


; items

  NoItem         = $FF

  EquipTypeWeapon = 0
  EquipTypeStaff  = 1
  EquipTypeRing   = 2

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
  ItemSkillUnknown2 = bits($0080)
  ItemSkillRecover  = bits($0100)
  ItemSkillBargain  = bits($0200)
  ItemSkillReturn   = bits($0400)
  ItemSkillPursuit  = bits($0800)
  ItemSkillCanto    = bits($1000)


; deployment table stuff

  DeploymentStateAlive          = bits($0080)
  DeploymentStateHidden         = bits($0040)
  DeploymentStateGrayed         = bits($0008)
  DeploymentStateGuardingCastle = bits($0004)
  DeploymentAllegianceOther     = 3
  DeploymentAllegianceNPC       = 2
  DeploymentAllegianceEnemy     = 1
  DeploymentAllegiancePlayer    = 0


; skills in general

  SkillIDUnknown1  = $00 ; placeholder
  SkillIDCanto     = $01
  SkillIDPavise    = $02
  SkillIDWrath     = $03
  SkillIDPursuit   = $04
  SkillIDAdept     = $05
  SkillIDSteal     = $06
  SkillIDUnknown2  = $07 ; valid class skill
  SkillIDDance     = $08
  SkillIDUnknown3  = $09 ; valid class skill
  SkillIDUnknown4  = $0A ; valid class and item skill
  SkillIDDismount  = $0B
  SkillIDCharm     = $0C
  SkillIDUnknown6  = $0D ; valid personal skill
  SkillIDNihil     = $0E
  SkillIDMiracle   = $0F
  SkillIDCritical  = $10
  SkillIDVantage   = $11
  SkillIDAccost    = $12
  SkillIDAstra     = $13
  SkillIDLuna      = $14
  SkillIDSol       = $15
  SkillIDHoly      = $16
  SkillIDDarkness  = $17
  SkillIDRenewal   = $18
  SkillIDParagon   = $19
  SkillIDUnknown7  = $1A ; valid item and personal skill
  SkillIDRecover   = $1B
  SkillIDBargain   = $1C
  SkillIDReturn    = $1D

; combat

  CombatSkillFlagUnknown    = bits($0001)
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


