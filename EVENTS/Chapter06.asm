
    .weak

      Flag_Unknown0                     :=  0
      Flag_Unknown1                     :=  1
      Flag_Unknown2                     :=  2
      Flag_Unknown3                     :=  3
      Flag_Unknown4                     :=  4

      Flag_Unknown6                     :=  6
      Flag_Unknown7                     :=  7
      Flag_Unknown8                     :=  8
      Flag_Unknown9                     :=  9

      Flag_HaroldBattleQuote            := 24
      Flag_IucharbaBattleQuote          := 25
      Flag_IucharBattleQuote            := 26
      Flag_SchmidtBattleQuote           := 27
      Flag_DanannBattleQuote            := 28
      Flag_Unknown29                    := 29
      Flag_IucharDied                   := 30
      Flag_IucharbaDied                 := 31

      Flag_Unknown33                    := 33
      Flag_Unknown34                    := 34

      Flag_DanannDied                   := 36
      Flag_Unknown37                    := 37
      Flag_Unknown38                    := 38
      Flag_IsaachTalkCheck              := 39
      Flag_SofalaTalkCheck              := 40
      Flag_Unknown41                    := 41
      Flag_JuliaSeliphTalk              := 42
      Flag_IucharDanannBattleQuote      := 43
      Flag_IucharbaDanannBattleQuote    := 44
      Flag_IucharbaIucharBattleQuote    := 45
      Flag_LarceiIucharBattleQuote      := 46
      Flag_LarceiIucharbaBattleQuote    := 47
      Flag_SeliphDanannBattleQuote      := 48
    
    .endweak

    .section Chapter06EventsSection

      aChapter06EventHeader ; B2/8000

        .word Chapter06
        .long aChapter06OpeningEvent
        .long aChapter06MapEvents

      aChapter06OpeningEvent ; B2/8008

        REGISTER_UNITGROUP_MAP_SPRITES $1E

        LOAD_FACTION_GROUP 0, FG_Ch06Seliph
        LOAD_FACTION_GROUP 1, FG_Ch06Ganeshire
        LOAD_FACTION_GROUP 2, FG_Ch06Sofala1
        LOAD_FACTION_GROUP 3, FG_Ch06Isaach1
        LOAD_FACTION_GROUP 4, FG_Ch06Ribaut

        macroSetFactionsEnemies [0, 1]
        macroSetFactionsNeutral [0, 2]
        macroSetFactionsNeutral [0, 3]
        macroSetFactionsEnemies [0, 4]
        macroSetFactionsNeutral [1, 2]
        macroSetFactionsNeutral [1, 3]
        macroSetFactionsAllies  [1, 4]
        macroSetFactionsNeutral [2, 3]
        macroSetFactionsAllies  [2, 4]
        macroSetFactionsAllies  [3, 4]

        EC_3B $00, $00
        EC_3B $01, $00

        DEPLOY_UNIT_GROUP $1E

        EVENT $FF, $00D9

        END_CHAPTER_EVENTS

      aChapter06MapEvents ; B2/804F

        CHECK_SEIZING_CASTLE Flag_Unknown0, $0000, $0001
          EVENT $FF, $00DB

        CHECK_SEIZING_CASTLE Flag_Unknown2, $0000, $0003
          EVENT $FF, $00E0

        CHECK_SEIZING_CASTLE Flag_Unknown1, $0000, $0002
          EVENT $FF, $00E1

        CHECK_SEIZING_CASTLE Flag_Unknown3, $0000, $0004
          EVENT $FF, $00E3

        CHECK_UNIT_DIED $FF, $FFFF, $0000
          SET_PERMANENT_FLAG 89

        EC_16 Flag_Unknown29, Creidne, Iucharba
          EVENT Flag_Unknown8, $00DE

        EC_16 Flag_Unknown29, Creidne, Iuchar
          EVENT Flag_Unknown9, $00DF

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING Flag_Unknown34, $002B
          EC_NOP_00

        CHECK_UNIT_DIED Flag_IucharDied, Iuchar, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_IucharbaDied, Iucharba, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_DanannDied, Danann, $FFFF
          EC_NOP_00

        CHECK_TALK $FF, Oifey, Seliph
          EVENT $FF, $01E1

        CHECK_TALK $FF, Lester, Lana
          EVENT $FF, $01E2

        CHECK_TALK $FF, Fee, Seliph
          EVENT $FF, $01E3

        CHECK_TALK $FF, Hermina, Seliph
          EVENT $FF, $022D

        EC_16 $FF, Lana, Julia
          EVENT $FF, $01E4

        CHECK_TALK $FF, Scathach, Larcei
          EVENT $FF, $01E5

        EC_16 $FF, Arthur, Seliph
          EVENT $FF, $01E6

        CHECK_TALK $FF, Deimne, Muirne
          EVENT $FF, $01E7

        CHECK_TALK $FF, Dalvin, Creidne
          EVENT $FF, $01E8

        EC_16 $FF, Seliph, Lana
          EVENT $FF, $01E9

        CHECK_TALK $FF, Julia, Seliph
          EVENT Flag_JuliaSeliphTalk, $01EA

        CHECK_TALK Flag_SofalaTalkCheck, AnyCharacter, SofalaArmy2
          EVENT $FF, $00F2

        CHECK_TALK Flag_IsaachTalkCheck, AnyCharacter, IsaachArmy2
          EVENT $FF, $00F3

        CHECK_ENTERING_CASTLE_MENU Flag_Unknown41, Deimne, $0003
          EVENT $FF, $00F4

        VISIT_VILLAGE $FF, Seliph, $0006
          EVENT $FF, $00F1

        VISIT_VILLAGE $FF, AnyCharacter, $0005
          EVENT $FF, $00E4

        VISIT_VILLAGE $FF, AnyCharacter, $0006
          EVENT $FF, $00E5

        VISIT_VILLAGE $FF, AnyCharacter, $0007
          EVENT $FF, $00E6

        VISIT_VILLAGE $FF, AnyCharacter, $0008
          EVENT $FF, $00E7

        VISIT_VILLAGE $FF, AnyCharacter, $0009
          EVENT $FF, $00E8

        VISIT_VILLAGE $FF, AnyCharacter, $000A
          EVENT $FF, $00E9

        CHECK_UNITS_FIGHTING $FF, $0000, Iuchar, $FFFF, Danann
          SET_PRECOMBAT_DIALOGUE Flag_IucharDanannBattleQuote, $B0DBD0, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Iucharba, $FFFF, Danann
          SET_PRECOMBAT_DIALOGUE Flag_IucharbaDanannBattleQuote, $B0DC39, $0046

        CHECK_UNITS_FIGHTING $FF, $FFFF, Iucharba, $FFFF, Iuchar
          SET_PRECOMBAT_DIALOGUE Flag_IucharbaIucharBattleQuote, $B0DCBE, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, Larcei, $FFFF, Iucharba
          SET_BATTLE_OR_DEATH_QUOTE Flag_LarceiIucharbaBattleQuote, $B0DD77, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Creidne, $FFFF, Iucharba
          SET_BATTLE_OR_DEATH_QUOTE Flag_LarceiIucharbaBattleQuote, $B0DD77, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Larcei, $FFFF, Iuchar
          SET_BATTLE_OR_DEATH_QUOTE Flag_LarceiIucharBattleQuote, $B0DD49, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Creidne, $FFFF, Iuchar
          SET_BATTLE_OR_DEATH_QUOTE Flag_LarceiIucharBattleQuote, $B0DD49, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Seliph, $FFFF, Danann
          SET_PRECOMBAT_DIALOGUE Flag_SeliphDanannBattleQuote, $B0DDA2, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Harold
          SET_BATTLE_OR_DEATH_QUOTE Flag_HaroldBattleQuote, $90E7E2, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Iucharba
          SET_BATTLE_OR_DEATH_QUOTE Flag_IucharbaBattleQuote, $90E800, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Iuchar
          SET_BATTLE_OR_DEATH_QUOTE Flag_IucharBattleQuote, $90E82E, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Schmidt
          SET_BATTLE_OR_DEATH_QUOTE Flag_SchmidtBattleQuote, $90E871, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Danann
          SET_BATTLE_OR_DEATH_QUOTE Flag_DanannBattleQuote, $90E8A1, $00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $03, $00, $00, $0000
          EVENT Flag_Unknown4, $00DA
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CHECK_FLAG_SET Flag_Unknown0
            EVENT Flag_Unknown6, $00DC
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_FLAG_SET Flag_Unknown0
            EVENT Flag_Unknown7, $00DD
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_FLAG_SET Flag_Unknown29
            EVENT Flag_Unknown33, $00E2
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET Flag_Unknown8
          CHECK_UNITS_WITHIN_DISTANCE $FF, Iucharba, Creidne, $01, $FF
            EC_3D $01
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        EC_3F $01, $0A
          EVENT Flag_Unknown37, $00EF
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown9
          CHECK_UNITS_WITHIN_DISTANCE $FF, Iuchar, Creidne, $01, $FF
            EC_3D $00
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        EC_3F $00, $0A
          EVENT Flag_Unknown38, $00F0
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CLEAR_TALK_IF_ONE_MARRIED aUnknownB282F4
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aUnknownB282F4 ; B2/82F4

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

        .structChapterTalkEventEntry Chapter06, 29, Creidne, Iuchar
        .structChapterTalkEventEntry Chapter06, 29, Creidne, Iucharba
        .structChapterTalkEventEntry Chapter06, 29, Larcei, Iuchar
        .structChapterTalkEventEntry Chapter06, 29, Larcei, Iucharba
        .structChapterTalkEventEntry Chapter06, 39, Tristan, IsaachArmy2
        .structChapterTalkEventEntry Chapter06, 39, Deimne, IsaachArmy2
        .structChapterTalkEventEntry Chapter06, 39, Diarmuid, IsaachArmy2
        .structChapterTalkEventEntry Chapter06, 39, Lester, IsaachArmy2
        .structChapterTalkEventEntry Chapter06, 40, Tristan, SofalaArmy2
        .structChapterTalkEventEntry Chapter06, 40, Deimne, SofalaArmy2
        .structChapterTalkEventEntry Chapter06, 40, Diarmuid, SofalaArmy2
        .structChapterTalkEventEntry Chapter06, 40, Lester, SofalaArmy2
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
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, 8, ++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, 0, +

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
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, 9, ++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, 0, +

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
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, 33, ++

          AI_22 +

            AI_0A
            AI_END

          +
          AI_SET_CHAPTER_EVENT_FLAG Chapter01, 35
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

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter06, 0, +

          AI_0B
          AI_END

        +
        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

    .endsection Chapter06EventDataSection
