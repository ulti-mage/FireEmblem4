
; General stuff

  None                = 0
  Factionless         = 7
  NoDeploymentOffset  = $FF



; Unit data

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


  UnitSkill2NonSword = $07
  UnitSkillsAll      = $FF


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

  GEN_ID_Sigurd   = 1
  GEN_ID_Naoise   = 2
  GEN_ID_Alec     = 3
  GEN_ID_Arden    = 4
  GEN_ID_Finn     = 5
  GEN_ID_Quan     = 6
  GEN_ID_Midir    = 7
  GEN_ID_Lewyn    = 8
  GEN_ID_Chulainn = 9
  GEN_ID_Azelle   = 10
  GEN_ID_Jamke    = 11
  GEN_ID_Claud    = 12
  GEN_ID_Beowulf  = 13
  GEN_ID_Lex      = 14
  GEN_ID_Dew      = 15
  GEN_ID_Deirdre  = 16
  GEN_ID_Ethlyn   = 17
  GEN_ID_Lachesis = 18
  GEN_ID_Ayra     = 19
  GEN_ID_Erinys   = 20
  GEN_ID_Tailtiu  = 21
  GEN_ID_Silvia   = 22
  GEN_ID_Edain    = 23
  GEN_ID_Brigid   = 24

  GEN_ID_Seliph           = 1
  GEN_ID_Shannan          = 2
  GEN_ID_Dalvin_Scathach  = 3
  GEN_ID_Asaello_Febail   = 4
  GEN_ID_Leif             = 5
  GEN_ID_Iuchar_Iucharba  = 6
  GEN_ID_Charlot_Coirpre  = 7
  GEN_ID_Hawk_Ced         = 8
  GEN_ID_Tristan_Diarmuid = 9
  GEN_ID_OldFinn          = 10
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

  Player  = 0
  Enemy   = 1
  NPC     = 2
  Others  = 3

  AllegianceOwn     = 0
  AllegianceEnemy   = 1
  AllegianceNeutral = 2
  AllegianceOther   = 3

  ; Allegiances that are saved in the deployment table are relative to the
  ; player faction. In other cases, they are relative to the two 
  ; factions its evaluated for.

; Deployment table stuff

  DeploymentAllegianceMask      = $03

  DeploymentStateGuardingCastle = bits($0004)
  DeploymentStateGrayed         = bits($0008)
  DeploymentStateCanto          = bits($0010)
  DeploymentStateDefeated       = bits($0020)
    ; Sets when a unit dies or they are defeated in the arena
  DeploymentStateHidden         = bits($0040)
  DeploymentStateAlive          = bits($0080)
  DeploymentFormationID         = $1F00 >> 8
  DeploymentStateAsleep         = bits($2000)
  ; $4000 ; not used?
  ; $8000 ; not used?



; Class

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


; Items

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
  ItemSkillEscape   = bits($0080)
  ItemSkillRecover  = bits($0100)
  ItemSkillBargain  = bits($0200)
  ItemSkillReturn   = bits($0400)
  ItemSkillPursuit  = bits($0800)
  ItemSkillCanto    = bits($1000)

; Skills in general

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
  SkillIDPoW       = $0D ; valid personal skill
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
  SkillIDEscape    = $1A ; valid item and personal skill
  SkillIDRecover   = $1B
  SkillIDBargain   = $1C
  SkillIDReturn    = $1D


; Combat

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

; Terrain

  TerrainPeak            = $00
  TerrainThicket         = $01
  TerrainCliff           = $02
  TerrainPlains          = $03
  TerrainForest          = $04
  TerrainSea             = $05
  TerrainRiver           = $06
  TerrainMountain        = $07
  TerrainDesert          = $08
  TerrainCastle          = $09 ; the guarding spot
  TerrainFort            = $0A ; a weird tile that looks like a blockade
  TerrainHouse           = $0B ; unused?
  TerrainCastleGate      = $0C
  TerrainRampart         = $0D ; blockades in Ch2 and castle walls
  TerrainSand            = $0E
  TerrainBridge          = $0F
  TerrainSwamp           = $10 ; unused
  TerrainCastleGate2     = $11 ; unsure
  TerrainVillage         = $12
  TerrainVillageRuins    = $13
  TerrainStore           = $14 ; unused
  TerrainRuins2          = $15 ; unused?
  TerrainChurch          = $16
  TerrainShrine          = $17 ; unused
  TerrainBragiTower      = $18
  TerrainRoad            = $19


; Locations

  LocationFactionSlotOwnerMask  = $07

  LocationDestroyed             = $08
  VillageClosed                 = $20
  LocationState40               = $40
  CastleGuarded                 = $80

  LocationTypeCastle    = 0
  LocationTypeVillage   = 2



; Scripted Battles

  SB_AttackerFirst   = $01
  SB_Unknown02       = $02
  SB_GuaranteedCrit  = $04
  SB_GuaranteedHit   = $08
  SB_ApplyGuarantees = $10


  ActiveSpriteEngineInactive           = $0001

  ActiveSpriteEngine2000               = $2000
  ActiveSpriteEngineRenderOnScreenOnly = $4000
  ActiveSpriteEngineEnabled            = $8000







 

