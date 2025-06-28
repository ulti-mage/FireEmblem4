
    .weak

      FlagChapter06_GaneishireSeizedCheck             :=  0
      FlagChapter06_SofalaSeizedCheck                 :=  1
      FlagChapter06_IsaachSeizedCheck                 :=  2
      FlagChapter06_RibautSeizedCheck                 :=  3
      FlagChapter06_OifeyGroupSpawn                   :=  4

      FlagChapter06_FeeArthurSpawn                    :=  6
      FlagChapter06_SchmidtSpawn                      :=  7
      FlagChapter06_LarceiIucharbaTalk                :=  8
      FlagChapter06_LarceiIucharTalk                  :=  9

      FlagChapter06_HaroldBattleQuote                 := 24
      FlagChapter06_IucharbaBattleQuote               := 25
      FlagChapter06_IucharBattleQuote                 := 26
      FlagChapter06_SchmidtBattleQuote                := 27
      FlagChapter06_DanannBattleQuote                 := 28
      FlagChapter06_LarceiBrothersTalkCheck           := 29
      FlagChapter06_IucharDied                        := 30
      FlagChapter06_IucharbaDied                      := 31

      FlagChapter06_BrotherRecruitedDanannResponse    := 33
      FlagChapter06_JuliaCaptureReturn                := 34
      FlagChapter06_Unknown35                         := 35
      FlagChapter06_DanannDied                        := 36
      FlagChapter06_CreidneIucharbaAdjacent           := 37
      FlagChapter06_CreidneIucharAdjacent             := 38
      FlagChapter06_IsaachTalkCheck                   := 39
      FlagChapter06_SofalaTalkCheck                   := 40
      FlagChapter06_DeimneIsaachVisitCheck            := 41
      FlagChapter06_JuliaSeliphTalk                   := 42
      FlagChapter06_IucharDanannBattleQuote           := 43
      FlagChapter06_IucharbaDanannBattleQuote         := 44
      FlagChapter06_IucharbaIucharBattleQuote         := 45
      FlagChapter06_LarceiIucharBattleQuote           := 46
      FlagChapter06_LarceiIucharbaBattleQuote         := 47
      FlagChapter06_SeliphDanannBattleQuote           := 48

      FS_Player                                       :=  0
      FS_Ch06Ganeshire                                :=  1
      FS_Ch06Sofala                                   :=  2
      FS_Ch06Isaach                                   :=  3
      FS_Ch06Ribaut                                   :=  4

    .endweak

    .section Chapter06EventsSection

      aChapter06EventHeader ; B2/8000

        .word Chapter06
        .long aChapter06OpeningEvent
        .long aChapter06MapEvents


      aChapter06OpeningEvent ; B2/8008

        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter06Start

        LOAD_FACTION_GROUP FS_Player,        FG_Ch06Seliph
        LOAD_FACTION_GROUP FS_Ch06Ganeshire, FG_Ch06Ganeshire
        LOAD_FACTION_GROUP FS_Ch06Sofala,    FG_Ch06Sofala1
        LOAD_FACTION_GROUP FS_Ch06Isaach,    FG_Ch06Isaach1
        LOAD_FACTION_GROUP FS_Ch06Ribaut,    FG_Ch06Ribaut

        macroSetFactionsEnemies [FS_Player,        FS_Ch06Ganeshire]
        macroSetFactionsNeutral [FS_Player,        FS_Ch06Sofala]
        macroSetFactionsNeutral [FS_Player,        FS_Ch06Isaach]
        macroSetFactionsEnemies [FS_Player,        FS_Ch06Ribaut]
        macroSetFactionsNeutral [FS_Ch06Ganeshire, FS_Ch06Sofala]
        macroSetFactionsNeutral [FS_Ch06Ganeshire, FS_Ch06Isaach]
        macroSetFactionsAllies  [FS_Ch06Ganeshire, FS_Ch06Ribaut]
        macroSetFactionsNeutral [FS_Ch06Sofala,    FS_Ch06Isaach]
        macroSetFactionsAllies  [FS_Ch06Sofala,    FS_Ch06Ribaut]
        macroSetFactionsAllies  [FS_Ch06Isaach,    FS_Ch06Ribaut]

        SET_CHAPTER_EVENT_COUNTER 0, 0
        SET_CHAPTER_EVENT_COUNTER 1, 0

        DEPLOY_UNIT_GROUP UNITGroupChapter06Start

        EVENT FlagAlways, EventChapter06Opening

        END_CHAPTER_EVENTS

      aChapter06MapEvents ; B2/804F

        CHECK_SEIZING_CASTLE FlagChapter06_GaneishireSeizedCheck, FS_Player, Ch06_Ganeishire
          EVENT FlagAlways, EventChapter06GaneishireSeized

        CHECK_SEIZING_CASTLE FlagChapter06_IsaachSeizedCheck, FS_Player, Ch06_Isaach
          EVENT FlagAlways, EventChapter06IsaachSeized

        CHECK_SEIZING_CASTLE FlagChapter06_SofalaSeizedCheck, FS_Player, Ch06_Sofala
          EVENT FlagAlways, EventChapter06SofalaSeized

        CHECK_SEIZING_CASTLE FlagChapter06_RibautSeizedCheck, FS_Player, Ch06_Ribaut
          EVENT FlagAlways, EventChapter06Ending

        CHECK_UNIT_DIED FlagAlways, AnyCharacter, FS_Player
          SET_PERMANENT_FLAG PermanentFlagPlayerDeathInGen2

        CHECK_CHILD_TALK FlagChapter06_LarceiBrothersTalkCheck, Creidne, Iucharba
          EVENT FlagChapter06_LarceiIucharbaTalk, EventChapter06LarceiIucharbaTalk

        CHECK_CHILD_TALK FlagChapter06_LarceiBrothersTalkCheck, Creidne, Iuchar
          EVENT FlagChapter06_LarceiIucharTalk, EventChapter06LarceiIucharTalk

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING FlagChapter06_JuliaCaptureReturn, Julia
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter06_IucharDied, Iuchar
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter06_IucharbaDied, Iucharba
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter06_DanannDied, Danann
          EC_NOP_00

        CHECK_TALK FlagAlways, Oifey, Seliph
          EVENT FlagAlways, EventChapter06OifeySeliphTalk

        CHECK_TALK FlagAlways, Lester, Lana
          EVENT FlagAlways, EventChapter06LesterLanaTalk

        CHECK_TALK FlagAlways, Fee, Seliph
          EVENT FlagAlways, EventChapter06FeeSeliphTalk

        CHECK_TALK FlagAlways, Hermina, Seliph
          EVENT FlagAlways, EventChapter06HerminaSeliphTalk

        CHECK_CHILD_TALK FlagAlways, Lana, Julia
          EVENT FlagAlways, EventChapter06LanaJuliaTalk

        CHECK_TALK FlagAlways, Scathach, Larcei
          EVENT FlagAlways, EventChapter06ScathachLarceiTalk

        CHECK_CHILD_TALK FlagAlways, Arthur, Seliph
          EVENT FlagAlways, EventChapter06ArthurSeliphTalk

        CHECK_TALK FlagAlways, Deimne, Muirne
          EVENT FlagAlways, EventChapter06DeimneMuirneTalk

        CHECK_TALK FlagAlways, Dalvin, Creidne
          EVENT FlagAlways, EventChapter06DalvinCreidneTalk

        CHECK_CHILD_TALK FlagAlways, Seliph, Lana
          EVENT FlagAlways, EventChapter06SeliphLanaTalk

        CHECK_TALK FlagAlways, Julia, Seliph
          EVENT FlagChapter06_JuliaSeliphTalk, EventChapter06JuliaSeliphTalk

        CHECK_TALK FlagChapter06_SofalaTalkCheck, AnyCharacter, SofalaFighter
          EVENT FlagAlways, EventChapter06SofalaArmyTalk

        CHECK_TALK FlagChapter06_IsaachTalkCheck, AnyCharacter, IsaachAxeKnight
          EVENT FlagAlways, EventChapter06IsaachArmyTalk

        CHECK_ENTERING_CASTLE_MENU FlagChapter06_DeimneIsaachVisitCheck, Deimne, Ch06_Isaach
          EVENT FlagAlways, EventChapter06DeimneIsaachVisit

        VISIT_VILLAGE FlagAlways, Seliph, Ch06_Village2
          EVENT FlagAlways, EventChapter06Village2Seliph

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch06_Village1
          EVENT FlagAlways, EventChapter06Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch06_Village2
          EVENT FlagAlways, EventChapter06Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch06_Village3
          EVENT FlagAlways, EventChapter06Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch06_Village4
          EVENT FlagAlways, EventChapter06Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch06_VillageSkillRing
          EVENT FlagAlways, EventChapter06VillageSkillRing

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch06_Village5
          EVENT FlagAlways, EventChapter06Village5

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Iuchar, AnyFactionSlot, Danann
          SET_PRECOMBAT_DIALOGUE FlagChapter06_IucharDanannBattleQuote, dialogueChapter06IucharDanannBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Iucharba, AnyFactionSlot, Danann
          SET_PRECOMBAT_DIALOGUE FlagChapter06_IucharbaDanannBattleQuote, dialogueChapter06IucharbaDanannBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, AnyFactionSlot, Iucharba, AnyFactionSlot, Iuchar
          SET_PRECOMBAT_DIALOGUE FlagChapter06_IucharbaIucharBattleQuote, dialogueChapter06IucharIucharbaBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Larcei, AnyFactionSlot, Iucharba
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_LarceiIucharbaBattleQuote, dialogueChapter06LarceiIucharbaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Creidne, AnyFactionSlot, Iucharba
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_LarceiIucharbaBattleQuote, dialogueChapter06LarceiIucharbaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Larcei, AnyFactionSlot, Iuchar
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_LarceiIucharBattleQuote, dialogueChapter06LarceiIucharBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Creidne, AnyFactionSlot, Iuchar
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_LarceiIucharBattleQuote, dialogueChapter06LarceiIucharBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Seliph, AnyFactionSlot, Danann
          SET_PRECOMBAT_DIALOGUE FlagChapter06_SeliphDanannBattleQuote, dialogueChapter06SeliphDanannBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Harold
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_HaroldBattleQuote, dialogueChapter06HaroldBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Iucharba
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_IucharbaBattleQuote, dialogueChapter06IucharbaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Iuchar
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_IucharBattleQuote, dialogueChapter06IucharBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Schmidt
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_SchmidtBattleQuote, dialogueChapter06SchmidtBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Danann
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter06_DanannBattleQuote, dialogueChapter06DanannBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 3, FS_Player
          EVENT FlagChapter06_OifeyGroupSpawn, EventChapter06OifeyGroupSpawn
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter06_GaneishireSeizedCheck
            EVENT FlagChapter06_FeeArthurSpawn, EventChapter06FeeArthurSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch06Ribaut
          CHECK_FLAG_SET FlagChapter06_GaneishireSeizedCheck
            EVENT FlagChapter06_SchmidtSpawn, EventChapter06SchmidtSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch06Ribaut
          CHECK_FLAG_SET FlagChapter06_LarceiBrothersTalkCheck
            EVENT FlagChapter06_BrotherRecruitedDanannResponse, EventChapter06BrotherRecruitedDanannResponse
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapter06_LarceiIucharbaTalk
          CHECK_UNITS_WITHIN_DISTANCE FlagAlways, Iucharba, Creidne, 1
            INCREMENT_CHAPTER_EVENT_COUNTER 1
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        CHECK_CHAPTER_EVENT_COUNTER_EQUAL 1, 10
          EVENT FlagChapter06_CreidneIucharbaAdjacent, EventChapter06CreidneIucharbaAdjacent
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter06_LarceiIucharTalk
          CHECK_UNITS_WITHIN_DISTANCE FlagAlways, Iuchar, Creidne, 1
            INCREMENT_CHAPTER_EVENT_COUNTER 0
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        CHECK_CHAPTER_EVENT_COUNTER_EQUAL 0, 10
          EVENT FlagChapter06_CreidneIucharAdjacent, EventChapter06CreidneIucharAdjacent
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter06ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter06ClearTalksIfMarriedTable ; B2/82F4

        .byte Lana, Seliph
        .byte Muirne, Seliph
        .word $FFFF

    .endsection Chapter06EventsSection

    .section Chapter06EventDataSection

      aChapter06EventData ; B2/82FA 

        .structChapterEventData aChapter06LocationData, aChapter06MapChangeData, None, aChapter06TalkEvents, aUnknownB28461

      aChapter06LocationData ; B2/8304

        .byte size(aChapter06LocationData._Entries) / size(word)
  
        _Entries .include "../TABLES/CHAPTER/Chapter06LocationData.csv.asm"

      aChapter06TirnanogCastle ; B2/831B

        .structChapterCastleLocationEntry Ch06_Tirnanog, TirnanogName, [5, 3], $F8, aChapter06ShopData

      aChapter06GaneishireCastle ; B2/8323

        .structChapterCastleLocationEntry Ch06_Ganeishire, GaneshireName, [56, 14], $F8, None

      aChapter06SofalaCastle ; B2/832B

        .structChapterCastleLocationEntry Ch06_Sofala, SofalaName, [21, 34], $F8, None

      aChapter06IsaachCastle ; B2/8333

        .structChapterCastleLocationEntry Ch06_Isaach, IsaachName, [53, 51], $F8, None

      aChapter06RibautCastle ; B2/833B

        .structChapterCastleLocationEntry Ch06_Ribaut, RibautName, [26, 59], $00, None

      aChapter06Village1 ; B2/8343

        .structChapterVillageLocationEntry Ch06_Village1, [61, 7]

      aChapter06Village2 ; B2/8348

        .structChapterVillageLocationEntry Ch06_Village2, [42, 43]

      aChapter06Village3 ; B2/834D

        .structChapterVillageLocationEntry Ch06_Village3, [30, 39]

      aChapter06Village4 ; B2/8352

        .structChapterVillageLocationEntry Ch06_Village4, [32, 23]

      aChapter06VillageSkillRing ; B2/8357

        .structChapterVillageLocationEntry Ch06_VillageSkillRing, [59, 35]

      aChapter06Village5 ; B2/835C

        .structChapterVillageLocationEntry Ch06_Village5, [25, 51]

      aChapter06ShopData ; B2/8361

        .byte PI_IronSword1
        .byte PI_IronSword3
        .byte PI_IronSword4
        .byte PI_SilverSword1
        .byte PI_IronBlade1
        .byte PI_LightBrand
        .word $FFFF

      aChapter06MapChangeData ; B2/8369

        .word $FFFF

      aFactionGroupData23 ; B2/836B

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData23._Locations, None

        _Locations ; B2/8374
        .word Ch06_Tirnanog
        .word $FFFF

      aFactionGroupData24 ; B2/8378

        .structFactionGroupData FactionGaneishire, BattleHUDColorGray, BattleBannerDozel, None, aFactionGroupData24._Locations, aFactionGroupData24._GroupAI

        _Locations ; B2/8381
        .word Ch06_Ganeishire
        .word $FFFF

        _GroupAI ; B2/8385
        .long aFactionGroup24AI1
        .long aFactionGroup24AI2
        .long aFactionGroup24AI3
        .word $FFFF

      aFactionGroupData25 ; B2/8390

        .structFactionGroupData FactionSofala, BattleHUDColorGray, BattleBannerDozel, None, aFactionGroupData25._Locations, aFactionGroupData25._GroupAI

        _Locations ; B2/8399
        .word Ch06_Sofala
        .word $FFFF

        _GroupAI ; B2/839D
        .long aFactionGroup25AI1
        .long aFactionGroup25AI2
        .word $FFFF

      aFactionGroupData44 ; B2/83A5

        .structFactionGroupData FactionSofala, BattleHUDColorGray, BattleBannerIsaach, None, aFactionGroupData44._Locations, aFactionGroupData44._GroupAI

        _Locations ; B2/83AE
        .word Ch06_Sofala
        .word $FFFF

        _GroupAI ; B2/83B2
        .long aFactionGroup25AI1
        .long aFactionGroup25AI2
        .word $FFFF

      aFactionGroupData26 ; B2/83BA

        .structFactionGroupData FactionIsaach, BattleHUDColorGray, BattleBannerDozel, None, aFactionGroupData26._Locations, aFactionGroupData26._GroupAI

        _Locations ; B2/83C3
        .word Ch06_Isaach
        .word $FFFF

        _GroupAI ; B2/83C7
        .long aFactionGroup26AI1
        .long aFactionGroup26AI2
        .word $FFFF

      aFactionGroupData45 ; B2/83CF

        .structFactionGroupData FactionIsaach, BattleHUDColorGray, BattleBannerIsaach, None, aFactionGroupData45._Locations, aFactionGroupData45._GroupAI

        _Locations ; B2/83D8
        .word Ch06_Isaach
        .word $FFFF

        _GroupAI ; B2/83DC
        .long aFactionGroup26AI1
        .long aFactionGroup26AI2
        .word $FFFF

      aFactionGroupData27 ; B2/83E4

        .structFactionGroupData FactionRibaut, BattleHUDColorGray, BattleBannerDozel, None, aFactionGroupData27._Locations, aFactionGroupData27._GroupAI

        _Locations ; B2/83ED
        .word Ch06_Ribaut
        .word $FFFF

        _GroupAI ; B2/83F1
        .long aFactionGroup27AI1
        .long aFactionGroup27AI2
        .long aFactionGroup27AI3
        .long aFactionGroup27AI4
        .word $FFFF

      aChapter06TalkEvents ; B2/83FF

        .structChapterTalkEventEntry Chapter06, FlagChapter06_LarceiBrothersTalkCheck, Creidne, Iuchar
        .structChapterTalkEventEntry Chapter06, FlagChapter06_LarceiBrothersTalkCheck, Creidne, Iucharba
        .structChapterTalkEventEntry Chapter06, FlagChapter06_LarceiBrothersTalkCheck, Larcei, Iuchar
        .structChapterTalkEventEntry Chapter06, FlagChapter06_LarceiBrothersTalkCheck, Larcei, Iucharba
        .structChapterTalkEventEntry Chapter06, FlagChapter06_IsaachTalkCheck, Tristan, IsaachAxeKnight
        .structChapterTalkEventEntry Chapter06, FlagChapter06_IsaachTalkCheck, Deimne, IsaachAxeKnight
        .structChapterTalkEventEntry Chapter06, FlagChapter06_IsaachTalkCheck, Diarmuid, IsaachAxeKnight
        .structChapterTalkEventEntry Chapter06, FlagChapter06_IsaachTalkCheck, Lester, IsaachAxeKnight
        .structChapterTalkEventEntry Chapter06, FlagChapter06_SofalaTalkCheck, Tristan, SofalaFighter
        .structChapterTalkEventEntry Chapter06, FlagChapter06_SofalaTalkCheck, Deimne, SofalaFighter
        .structChapterTalkEventEntry Chapter06, FlagChapter06_SofalaTalkCheck, Diarmuid, SofalaFighter
        .structChapterTalkEventEntry Chapter06, FlagChapter06_SofalaTalkCheck, Lester, SofalaFighter
        .word $FFFF

      aUnknownB28461 ; B2/8461

        .word $FFFF
        .word $FFFF
        .word $0706
        .word $0706
        .word $FFFF

      aFactionGroup24AI1 ; B2/846B

        AI_07 Ch06_Ganeishire, $05
        AI_END

      aFactionGroup24AI2 ; B2/846F

        AI_JUMP_IF_TURN_REACHED 4, +

          AI_0A
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup24AI3 ; B2/8477

        AI_06 Ch06_Tirnanog, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup25AI1 ; B2/847C

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Creidne_Larcei
        AI_SET_FORMATION $05, $01
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, FlagChapter06_LarceiIucharbaTalk, ++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, FlagChapter06_GaneishireSeizedCheck, +

            AI_END

          +
          AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
          AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
          AI_TARGET_ALL_FOES
          AI_END

        +
        AI_19
        AI_END

      aFactionGroup25AI2 ; B2/8498

        AI_07 Ch06_Sofala, $04
        AI_END

      aFactionGroup26AI1 ; B2/849C

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Creidne_Larcei
        AI_SET_FORMATION $06, $00
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, FlagChapter06_LarceiIucharTalk, ++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, FlagChapter06_GaneishireSeizedCheck, +

            AI_END

          +
          AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
          AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
          AI_TARGET_ALL_FOES
          AI_END

        +
        AI_19
        AI_END

      aFactionGroup26AI2 ; B2/84B8

        AI_07 Ch06_Isaach, $04
        AI_END

      aFactionGroup27AI1 ; B2/84BC

        AI_SET_FORMATION $08, $01
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, FlagChapter06_BrotherRecruitedDanannResponse, ++

          AI_22 +

            AI_0A
            AI_END

          ; tries to set Ch1 flag?
          +
          AI_SET_CHAPTER_EVENT_FLAG Chapter01, FlagChapter06_Unknown35
          AI_0A
          AI_END

        +
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO 0.5 * 256
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch06_Isaach, $01
        AI_06 Ch06_Ganeishire, $01
        AI_06 Ch06_Sofala, $01
        AI_06 Ch06_Tirnanog, $01
        AI_END

      aFactionGroup27AI2 ; B2/84E3

        AI_07 Ch06_Ribaut, $04
        AI_END

      aFactionGroup27AI3 ; B2/84E7

        AI_JUMP_IF_TURN_REACHED 8, +

          AI_0B
          AI_END

        +
        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup27AI4 ; B2/84F0

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, FlagChapter06_GaneishireSeizedCheck, +

          AI_0B
          AI_END

        +
        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

    .endsection Chapter06EventDataSection
