
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

    structWeaponStaffROMEntry .struct Name, EquipmentType, Durability, Cost, StatBonuses, StaffEffect, WeaponRank, Skills, WeaponType, Might, Accuracy, Weight, MinRange, MaxRange, Effectiveness, Traits, AdditionalInfo
      .dstruct structItemROMEntry             ; $00 - $09
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
      ItemState         .byte ? ; $02
        ; 1 - in player inv
        ; 2 - in supply
        ; 3 ?
        ; 4 - in shop
        ; 5 - in pawnbroker
        ; 6 ?
        ; 7 - unobtained
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
      TalkTarget        .byte ? ; $0E
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
      EquippedWeaponBitfield .byte ? ; $00
      .dstruct structRAMStructHeader ; $01 - $04
      Slot .rept 8                   ; $05 - $0D
        .byte ?
      .endrept
    .endstruct

    structLoverDataRAM .struct
      LoveValue .brept 15
        .word ? 
      .endrept
    .endstruct



    ; so from what i can tell:
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

    ; Flag $10 = entry just got removed?
    ; Flag $40 = filled?
    ; Flag $80 = empty?

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







    structTerrainEntry .struct Peak, Thicket, Cliff, Plains, Forest, Sea, River, Mountain, Desert, Castle, Fort, House, CastleGate, Rampart, Sand, Bridge, Swamp, CastleGate2, Village, VillageRuins, Store, Ruins2, Church, Shrine, BragiTower, Road
      Peak         .char \Peak         ; $00
      Thicket      .char \Thicket      ; $02
      Cliff        .char \Cliff        ; $04
      Plains       .char \Plains       ; $06
      Forest       .char \Forest       ; $08
      Sea          .char \Sea          ; $0A
      River        .char \River        ; $0C
      Mountain     .char \Mountain     ; $0E
      Desert       .char \Desert       ; $10
      Castle       .char \Castle       ; $12
      Fort         .char \Fort         ; $14
      House        .char \House        ; $16
      CastleGate   .char \CastleGate   ; $18
      Rampart      .char \Rampart      ; $1A
      Sand         .char \Sand         ; $1C
      Bridge       .char \Bridge       ; $1E
      Swamp        .char \Swamp        ; $20
      CastleGate2  .char \CastleGate2  ; $22
      Village      .char \Village      ; $24
      VillageRuins .char \VillageRuins ; $26
      Store        .char \Store        ; $28
      Ruins2       .char \Ruins2       ; $2A
      Church       .char \Church       ; $2C
      Shrine       .char \Shrine       ; $2E
      BragiTower   .char \BragiTower   ; $30
      Road         .char \Road         ; $32
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


    structFactionHeader .struct GroupID, LocationID, HostileFactions, AlliedFactions, UnitCount
      GroupID         .byte \GroupID         ; $00
      LocationID      .byte \LocationID      ; $01
      HostileFactions .byte \HostileFactions ; $02
      AlliedFactions  .byte \AlliedFactions  ; $03
      UnitCount       .byte \UnitCount       ; $04
    .endstruct

    structChapterEventHeader .struct
      Chapter         .word ? ; $00
      OpeningEvents   .long ? ; $02
      MapEvents       .long ? ; $05
    .endstruct

    structChapterEventRAMEntry .struct
      Chapter               .word ? ; $00
      EventPointer          .long ? ; $02
      Unknown2              .word ? ; $05
      TemporaryEventFlags   .fill len(bytes(%1 x 80)) ; $07
    .endstruct


    structClassMapSpriteAssignment .struct CharacterID, Gender, SpriteID
      CharacterID .word \CharacterID
      Gender      .byte \Gender
      SpriteID    .word \SpriteID
    .endstruct



    structChapterEventData .struct LocationDataPointer, MapChangesPointer, Unknown1, TalkEventsPointer, Unknown3
      LocationDataPointer .word <>\LocationDataPointer  ; $00
      MapChangesPointer   .word <>\MapChangesPointer    ; $02
      Unknown1            .word <>\Unknown1             ; $04
      TalkEventsPointer   .word <>\TalkEventsPointer    ; $06
      Unknown3            .word <>\Unknown3             ; $08
    .endstruct

    structChapterLocationEntry .struct ID, NameID, Type, Coordinates
      .if (\ID === ?)
        ID          .byte ?
        NameID      .byte ?
        Type        .byte ?
        XPosition   .byte ?
        YPosition   .byte ?
      .else
        ID          .byte \ID             ; $00
        NameID      .byte \NameID         ; $01
        Type        .byte \Type           ; $02
        XPosition   .byte \Coordinates[0] ; $03
        YPosition   .byte \Coordinates[1] ; $04
      .endif
    .endstruct

    ; Castle coordinates are the guarding spot
    structChapterCastleLocationEntry .struct ID, NameID, Coordinates, Unknown, ShopDataPointer
      .dstruct structChapterLocationEntry, \ID, \NameID, LocationTypeCastle, \Coordinates ; $00 - $04
      Unknown           .byte \Unknown            ; $05
      ShopDataPointer   .word <>\ShopDataPointer  ; $06
    .endstruct

    ; Village coordinates are the visitable tile
    structChapterVillageLocationEntry .struct ID, Coordinates
      .dstruct structChapterLocationEntry, \ID, 0, LocationTypeVillage, \Coordinates ; $00 - $04
    .endstruct

    structEventLocationType .struct BaseMoney, OriginOffset, ModificationOffset, InteractionOffset, DestoyedTileData
      .if (\BaseMoney === ?)
        BaseMoney           .word ?
        OriginXOffset       .char ?
        OriginYOffset       .char ?
        ModificationXOffset .char ?
        ModificationYOffset .char ?
        InteractionXOffset  .char ?
        InteractionYOffset  .char ?
        DestoyedTileData    .word ?
      .else
        BaseMoney           .word \BaseMoney                ; $00
        OriginXOffset       .char \OriginOffset[0]          ; $02
        OriginYOffset       .char \OriginOffset[1]          ; $03
        ModificationXOffset .char \ModificationOffset[0]    ; $04
        ModificationYOffset .char \ModificationOffset[1]    ; $05
        InteractionXOffset  .char \InteractionOffset[0]     ; $06
        InteractionYOffset  .char \InteractionOffset[1]     ; $07
        DestoyedTileData    .word <>\DestoyedTileData       ; $08
      .endif
    .endstruct

    structChapterMapChangeEntry .struct ChapterID, Flag, Coordinates, MapChangeData
      .if (\ChapterID === ?)
        ChapterID       .word ?
        Flag            .byte ?
        XPosition       .byte ?
        YPosition       .byte ?
        MapChangeData   .word ?
      .else
        ChapterID       .word \ChapterID       ; $00
        Flag            .byte \Flag            ; $02
        XPosition       .byte \Coordinates[0]  ; $03
        YPosition       .byte \Coordinates[1]  ; $04
        MapChangeData   .word <>\MapChangeData ; $05
      .endif
    .endstruct

    structFactionGroupData .struct FactionNameID, BattleHUDColorID, BattleBannerID, UnitsPointer, LocationsPointer, GroupAIPointers
      FactionNameID     .byte \FactionNameID      ; $00
      BattleHUDColorID  .byte \BattleHUDColorID   ; $01
      BattleBannerID    .byte \BattleBannerID     ; $02
      UnitsPointer      .word <>\UnitsPointer     ; $03
      LocationsPointer  .word <>\LocationsPointer ; $05
      GroupAIPointers   .word <>\GroupAIPointers  ; $07
    .endstruct

    structChapterTalkEventEntry .struct Chapter, Flag, ActiveUnit, TargetUnit, CostsMoneyFlag=false
      Chapter         .word \Chapter              ; $00
      Flag            .byte \Flag                 ; $02
      ActiveUnit      .sint \ActiveUnit           ; $03
      TargetUnit      .sint \TargetUnit           ; $05
      CostsMoneyFlag  .byte int(\CostsMoneyFlag)  ; $07
      ; This is actually an jsr table index but it only has 2 entries
      ; If its 0, the talk always works, if its 1, it only works with 10k+ gold
    .endstruct

    structAITargetEntry .struct
      UnitRAMPointer    .word ? ; $00
      DeploymentOffset  .byte ? ; $02
      ItemROMPointer    .word ? ; $03
      ItemType          .byte ? ; $05
      BattleMight       .byte ? ; $06
      BattleDefense     .byte ? ; $07
      BattleResistance  .byte ? ; $08
      XPosition         .byte ? ; $09
      YPosition         .byte ? ; $0A
      ThreatRange       .byte ? ; $0B
      TerrainType       .byte ? ; $0C
    .endstruct

    structAIUnitEntry .struct
      UnitRAMPointer    .word ? ; $00
      DeploymentOffset  .byte ? ; $02
      ItemROMPointer    .word ? ; $03
      ItemType          .byte ? ; $05
      BattleMight       .byte ? ; $06
      BattleDefense     .byte ? ; $07
      BattleResistance  .byte ? ; $08
      XPosition         .byte ? ; $09
      YPosition         .byte ? ; $0A
      ThreatRange       .byte ? ; $0B
      XTargetPosition   .byte ? ; $0C
      YTargetPosition   .byte ? ; $0D
    .endstruct

    structUNITEntry .struct CharacterID, DestinationX, DestinationY, GroupLeaderFlag, AI, FactionSlot, FormationID
      .if (\CharacterID === ?)
        CharacterID           .word ? ; $00
        .union
          DestinationCoords   .word ? ; $02
          .struct
            DestinationX      .byte ? ; $02
            DestinationY      .byte ? ; $03
          .endstruct
        .endunion
        GroupLeaderFlag       .byte ? ; $04
        AI                    .byte ? ; $05
        FactionSlot           .byte ? ; $06
        FormationID           .byte ? ; $07
      .else
        CharacterID           .word \CharacterID      ; $00
        DestinationX          .byte \DestinationX     ; $02
        DestinationY          .byte \DestinationY     ; $03
        GroupLeaderFlag       .byte \GroupLeaderFlag  ; $04
        AI                    .byte \AI               ; $05
        FactionSlot           .byte \FactionSlot      ; $06
        FormationID           .byte \FormationID      ; $07
      .endif
    .endstruct


    structScriptedBattle .struct DefenderID, DefenderInventorySlot, AttackerID, BattleQuote, DefeatQuote
      .word \DefenderID             ; $00
      .word \DefenderInventorySlot  ; $02
      .word \AttackerID             ; $04
      .byte 0                       ; $06
      .long \BattleQuote            ; $07
      .long \DefeatQuote            ; $0A
    .endstruct

    structDecompressionEntry .struct
      Source  .long ? ; $00
      Dest    .long ? ; $03
    .endstruct




    structMapMenu .struct PaletteDataPointer, GraphicsDataPointer, TilemapDataPointer, Type, Position, Unknown3
      .if (\PaletteDataPointer === ?)
        PaletteDataPointer  .long ? ; $00
        GraphicsDataPointer .long ? ; $03
        TilemapDataPointer  .long ? ; $06
        Type                .byte ? ; $09
        .union
          Position          .word ? ; $0A
          .struct
            XPosition       .byte ? ; $0A
            YPosition       .byte ? ; $0B
          .endstruct
        .endunion
        Unknown3            .long ? ; $0C
      .else
        PaletteDataPointer  .long \PaletteDataPointer  ; $00
        GraphicsDataPointer .long \GraphicsDataPointer ; $03
        TilemapDataPointer  .long \TilemapDataPointer  ; $06
        Type                .byte \Type                ; $09
        XPosition           .byte \Position[0]         ; $0A
        YPosition           .byte \Position[1]         ; $0B
        Unknown3            .long \Unknown3            ; $0C
      .endif
    .endstruct

    structMapMenuPaletteData .struct Size, Palette, Color, Source
      Size    .word \Size    ; $00
        ; How many color words to copy over.
      Palette .byte \Palette ; $02
      Color   .byte \Color   ; $03
        ; Which palette and which color in the palette to overwrite
      Source  .long \Source  ; $04
    .endstruct

    structMapMenuGraphicsData .struct DMACount, DMADestination, DecompressFlag, DataSource
      DMACount        .word \DMACount       ; $00
      DMADestination  .word \DMADestination ; $02
      DecompressFlag  .byte \DecompressFlag ; $04
      DataSource      .long \DataSource     ; $05
        ; If flag is set, decompress this data, then DMA from decomp buffer to VRAM
        ; If unset, directly DMA this.
    .endstruct

    structMapMenuTilemapData .struct Width, Height, BGBuffer, Unknown1, Unknown2
      .if (\Width === ?)
        .union
          Area        .word ?
          .struct
            Width     .byte ?
            Height    .byte ?
          .endstruct
        .endunion
        BGBuffer      .long ?
        Unknown1      .byte ?
        Unknown2      .long ?
      .else
        Width     .byte \Width    ; $00
        Height    .byte \Height   ; $01
        BGBuffer  .long \BGBuffer ; $02
        Unknown1  .byte \Unknown1 ; $05
        Unknown2  .long \Unknown2 ; $06
      .endif
    .endstruct



    structDeathQuoteEntry .struct CharacterID, DeathQuotePointer
      .word \CharacterID
      .addr \DeathQuotePointer
    .endstruct






