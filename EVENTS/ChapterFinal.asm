
    .weak

      Flag_Unknown0                     :=  0
      Flag_Unknown1                     :=  1
      Flag_Unknown2                     :=  2
      Flag_Unknown3                     :=  3
      Flag_Unknown4                     :=  4
      Flag_Unknown5                     :=  5
      Flag_Unknown6                     :=  6
      Flag_IucharBrianBattleQuote       :=  7
      Flag_Unknown8                     :=  8
      Flag_Unknown9                     :=  9
      Flag_IucharbaBrianBattleQuote     := 10
      Flag_Unknown11                    := 11
      Flag_Unknown12                    := 12
      Flag_TineHildaBattleQuote         := 13
      Flag_SeliphJuliaTalk1             := 14
      Flag_AltenaArionTalk              := 15
      Flag_ArthurHildaBattleQuote       := 16
      Flag_FebailScipioBattleQuote      := 17
      Flag_LesterScipioBattleQuote      := 18
      Flag_TineIshtarBattleQuote        := 19
      Flag_SeliphManfroyBattleQuote     := 20
      Flag_SeliphJuliaTalk2             := 21
      Flag_AltenaArionBattleQuote       := 22
      Flag_JuliusDied                   := 23

      Flag_RobertoBattleQuote           := 35
      Flag_BoyceBattleQuote             := 36
      Flag_RodanBattleQuote             := 37
      Flag_JuphielBattleQuote           := 38
      Flag_FisherBattleQuote            := 39
      Flag_BrianBattleQuote             := 40
      Flag_DagonBattleQuote             := 41
      Flag_HildaBattleQuote             := 42
      Flag_ScipioBattleQuote            := 43
      Flag_BaranBattleQuote             := 44
      Flag_MengBattleQuote              := 45
      Flag_MabelBattleQuote             := 46
      Flag_BlegBattleQuote              := 47
      Flag_ArionBattleQuote             := 48
      Flag_IshtarBattleQuote            := 49
      Flag_ManfroyBattleQuote           := 50
      Flag_JuliaBattleQuote             := 51
      Flag_JuliusBattleQuote            := 52
      Flag_JuliaJuliusBattleQuote       := 53
      Flag_SeliphJuliusBattleQuote      := 54
      Flag_Unknown55                    := 55
      Flag_Unknown56                    := 56

      Flag_ManfroyDied                  := 58

      Flag_SeliphJuliaTalkCheck1        := 60
      Flag_AltenaArionTalkCheck         := 61
      Flag_Unknown62                    := 62

      Flag_Unknown68                    := 68
      Flag_Unknown69                    := 69
      Flag_Unknown70                    := 70
      Flag_Unknown71                    := 71
      Flag_Unknown72                    := 72
      Flag_SeliphJuliaTalkCheck2        := 73
      Flag_Unknown74                    := 74
      Flag_Unknown75                    := 75

      Flag_HildaDied                    := 78

    .endweak

    .section ChapterFinalEventsSection

      aChapterFinalEventHeader ; B1/A378

        .word ChapterFinal
        .long aChapterFinalOpeningEvent
        .long aChapterFinalMapEvents

      aChapterFinalOpeningEvent ; B1/A380

        LOAD_FACTION_GROUP 0, FG_FinalSeliph
        LOAD_FACTION_GROUP 1, FG_FinalEdda
        LOAD_FACTION_GROUP 2, FG_FinalDozel
        LOAD_FACTION_GROUP 3, FG_FinalFriege
        LOAD_FACTION_GROUP 5, FG_FinalVelthomer
        LOAD_FACTION_GROUP 6, FG_FinalBelhalla

        macroSetFactionsEnemies [0, 1]
        macroSetFactionsEnemies [0, 2]
        macroSetFactionsEnemies [0, 3]
        macroSetFactionsEnemies [0, 5]
        macroSetFactionsEnemies [0, 6]
        macroSetFactionsAllies  [1, 2]
        macroSetFactionsAllies  [1, 3]
        macroSetFactionsAllies  [1, 5]
        macroSetFactionsAllies  [1, 6]
        macroSetFactionsAllies  [3, 2]
        macroSetFactionsAllies  [3, 5]
        macroSetFactionsAllies  [3, 6]
        macroSetFactionsAllies  [2, 5]
        macroSetFactionsAllies  [2, 6]
        macroSetFactionsAllies  [5, 6]

        SET_FLAG Flag_SeliphJuliaTalkCheck1

        EVENT $FF, $018E

        END_CHAPTER_EVENTS

      aChapterFinalMapEvents ; B1/A3D6

        CHECK_SEIZING_CASTLE Flag_Unknown0, $0000, $0001
          EC_NOP_00

        CHECK_SEIZING_CASTLE Flag_Unknown1, $0000, $0002
          EVENT $FF, $0191

        CHECK_SEIZING_CASTLE Flag_Unknown2, $0000, $0003
          EVENT $FF, $0194

        CHECK_SEIZING_CASTLE Flag_Unknown3, $0000, $0004
          EVENT $FF, $019A

        CHECK_SEIZING_CASTLE Flag_Unknown4, $0000, $0005
          EVENT $FF, $019C

        CHECK_UNIT_IN_AREA Flag_Unknown62, $FFFF, $1101, $1E0D, $FF
          EC_NOP_00

        CHECK_UNIT_IN_AREA Flag_Unknown62, $FFFF, $1301, $1C11, $FF
          EC_NOP_00

        CHECK_UNIT_IN_AREA Flag_Unknown62, $FFFF, $1F01, $2307, $FF
          EC_NOP_00

        CHECK_TALK Flag_SeliphJuliaTalkCheck1, Seliph, Julia
          EVENT Flag_SeliphJuliaTalk1, $0198

        CHECK_TALK Flag_SeliphJuliaTalkCheck2, Seliph, Julia
          EVENT Flag_SeliphJuliaTalk2, $019F

        CHECK_TALK Flag_AltenaArionTalkCheck, Altena, Arion2
          EVENT Flag_AltenaArionTalk, $0199

        CHECK_UNIT_DIED Flag_HildaDied, Hilda2, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_ManfroyDied, Manfroy, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED $FF, Arion2, $FFFF
          SET_PERMANENT_FLAG 96

        CHECK_ENTERING_CASTLE_MENU Flag_Unknown55, Julia, $0004
          EVENT $FF, $019B

        CHECK_UNIT_DIED_TO Flag_Unknown56, Julia, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED_TO Flag_Unknown71, Julius2, Seliph
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED_TO Flag_Unknown72, Julius2, Julia
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED_TO $FF, Julius2, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED $FF, Julius2, $FFFF
          EVENT Flag_JuliusDied, $01A0

        CHECK_TALK $FF, Arthur, Tine
          EVENT $FF, $022A

        CHECK_TALK $FF, Amid, Linda
          EVENT $FF, $022B

        EC_16 $FF, Tine, Seliph
          EVENT $FF, $0213

        EC_16 $FF, Tine, Ced
          EVENT $FF, $0214

        EC_16 $FF, Tine, Leif
          EVENT $FF, $0215

        CHECK_TALK $FF, Daisy, Deimne
          EVENT $FF, $0216

        CHECK_TALK $FF, Jeanne, Leif
          EVENT $FF, $0217

        CHECK_TALK $FF, Muirne, Asaello
          EVENT $FF, $0218

        EC_16 $FF, Lana, Seliph
          EVENT $FF, $0219

        CHECK_TALK $FF, Lana, Febail
          EVENT $FF, $021A

        EC_16 $FF, Lana, Scathach
          EVENT $FF, $021B

        EC_16 $FF, Larcei, Seliph
          EVENT $FF, $021C

        EC_16 $FF, Larcei, Iuchar
          EVENT $FF, $021D

        EC_16 $FF, Larcei, Iucharba
          EVENT $FF, $021E

        EC_16 $FF, Larcei, Shannan
          EVENT $FF, $021F

        EC_16 $FF, Patty, Seliph
          EVENT $FF, $0220

        EC_16 $FF, Patty, Shannan
          EVENT $FF, $0221

        CHECK_TALK $FF, Patty, Lester
          EVENT $FF, $0222

        EC_16 $FF, Nanna, Seliph
          EVENT $FF, $0223

        CHECK_TALK $FF, Nanna, Ares
          EVENT $FF, $0224

        CHECK_TALK $FF, Nanna, Leif
          EVENT $FF, $0225

        EC_16 $FF, Fee, Seliph
          EVENT $FF, $0226

        EC_16 $FF, Fee, Arthur
          EVENT $FF, $0227

        CHECK_TALK $FF, Fee, Oifey
          EVENT $FF, $0228

        CHECK_UNITS_FIGHTING_1TO2RANGE $FF, $0000, Seliph, $FFFF, Julius2
          SET_PRECOMBAT_DIALOGUE Flag_SeliphJuliusBattleQuote, $B2BB14, $0083

        CHECK_UNITS_FIGHTING_1TO2RANGE $FF, $0000, Julia, $FFFF, Julius2
          SET_PRECOMBAT_DIALOGUE Flag_JuliaJuliusBattleQuote, $B2BAE9, $0083

        CHECK_UNITS_FIGHTING $FF, $0000, Iuchar, $FFFF, Brian
          SET_PRECOMBAT_DIALOGUE Flag_IucharBrianBattleQuote, $B0E769, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Iucharba, $FFFF, Brian
          SET_PRECOMBAT_DIALOGUE Flag_IucharbaBrianBattleQuote, $B0E7F7, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Tine, $FFFF, Hilda2
          SET_PRECOMBAT_DIALOGUE Flag_TineHildaBattleQuote, $B0E889, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Linda, $FFFF, Hilda2
          SET_PRECOMBAT_DIALOGUE Flag_TineHildaBattleQuote, $B0E889, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Arthur, $FFFF, Hilda2
          SET_PRECOMBAT_DIALOGUE Flag_ArthurHildaBattleQuote, $B0E906, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Febail, $FFFF, Scipio
          SET_PRECOMBAT_DIALOGUE Flag_FebailScipioBattleQuote, $B0E99D, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, Lester, $FFFF, Scipio
          SET_PRECOMBAT_DIALOGUE Flag_LesterScipioBattleQuote, $B0EA3C, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, Tine, $FFFF, Ishtar3
          SET_PRECOMBAT_DIALOGUE Flag_TineIshtarBattleQuote, $B0EADE, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Linda, $FFFF, Ishtar3
          SET_PRECOMBAT_DIALOGUE Flag_TineIshtarBattleQuote, $B0EADE, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Seliph, $FFFF, Manfroy
          SET_PRECOMBAT_DIALOGUE Flag_SeliphManfroyBattleQuote, $B0EB80, $007A

        CHECK_UNITS_FIGHTING $FF, $0000, Altena, $FFFF, Arion2
          SET_PRECOMBAT_DIALOGUE Flag_AltenaArionBattleQuote, $B0ED61, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Roberto
          SET_BATTLE_OR_DEATH_QUOTE Flag_RobertoBattleQuote, $B2B84B, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Boyce
          SET_BATTLE_OR_DEATH_QUOTE Flag_BoyceBattleQuote, $B2B878, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Rodan
          SET_BATTLE_OR_DEATH_QUOTE Flag_RodanBattleQuote, $B2B899, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Juphiel
          SET_BATTLE_OR_DEATH_QUOTE Flag_JuphielBattleQuote, $B2B8B6, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Fisher
          SET_BATTLE_OR_DEATH_QUOTE Flag_FisherBattleQuote, $B2B8E5, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Brian
          SET_BATTLE_OR_DEATH_QUOTE Flag_BrianBattleQuote, $B2B908, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Dagon
          SET_BATTLE_OR_DEATH_QUOTE Flag_DagonBattleQuote, $B2B93E, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Hilda2
          SET_BATTLE_OR_DEATH_QUOTE Flag_HildaBattleQuote, $B2B96D, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Scipio
          SET_BATTLE_OR_DEATH_QUOTE Flag_ScipioBattleQuote, $B2B98E, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Baran
          SET_BATTLE_OR_DEATH_QUOTE Flag_BaranBattleQuote, $B2B9B9, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Meng
          SET_BATTLE_OR_DEATH_QUOTE Flag_MengBattleQuote, $B2B9E8, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Mabel
          SET_BATTLE_OR_DEATH_QUOTE Flag_MabelBattleQuote, $B2BA02, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Bleg
          SET_BATTLE_OR_DEATH_QUOTE Flag_BlegBattleQuote, $B2BA1C, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Arion2
          SET_BATTLE_OR_DEATH_QUOTE Flag_ArionBattleQuote, $B2BA2F, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Ishtar3
          SET_BATTLE_OR_DEATH_QUOTE Flag_IshtarBattleQuote, $B2BA41, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Julia
          SET_BATTLE_OR_DEATH_QUOTE Flag_JuliaBattleQuote, $B2BB68, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Manfroy
          SET_BATTLE_OR_DEATH_QUOTE Flag_ManfroyBattleQuote, $B2BA83, $00

        CHECK_UNITS_FIGHTING_1TO2RANGE $FF, $0000, $FFFF, $FFFF, Julius2
          SET_BATTLE_OR_DEATH_QUOTE Flag_JuliusBattleQuote, $B2BABF, $00

        VISIT_VILLAGE $FF, AnyCharacter, $0006
          EVENT $FF, $019D

        VISIT_VILLAGE $FF, AnyCharacter, $0007
          EVENT $FF, $019E

        BREAK_ACTION_EVENT_CHECKS

        CHECK_UNITS_FIGHTING Flag_Unknown62, $0000, $FFFF, $0003, $FFFF
          EC_NOP_00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET Flag_BrianBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_IucharBrianBattleQuote, Flag_IucharbaBrianBattleQuote]
            SET_FLAG Flag_BrianBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_HildaBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_TineHildaBattleQuote, Flag_ArthurHildaBattleQuote]
            SET_FLAG Flag_HildaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_ScipioBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_FebailScipioBattleQuote, Flag_LesterScipioBattleQuote]
            SET_FLAG Flag_ScipioBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_IshtarBattleQuote
          CHECK_FLAG_SET Flag_TineIshtarBattleQuote
            SET_FLAG Flag_IshtarBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_ManfroyBattleQuote
          CHECK_FLAG_SET Flag_SeliphManfroyBattleQuote
            SET_FLAG Flag_ManfroyBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_ArionBattleQuote
          CHECK_FLAG_SET Flag_AltenaArionBattleQuote
            SET_FLAG Flag_ArionBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_JuliusBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_JuliaJuliusBattleQuote, Flag_SeliphJuliusBattleQuote]
            SET_FLAG Flag_JuliusBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_ManfroyDied
          CHECK_FLAG_UNSET Flag_Unknown74
            UNSET_FLAG Flag_SeliphJuliaTalkCheck1
            SET_FLAG Flag_SeliphJuliaTalkCheck2
            SET_FLAG Flag_Unknown74
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_Unknown69
          CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown56, Flag_SeliphJuliaTalk1]
            CHECK_FLAG_UNSET Flag_Unknown75
              SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown69, $8EDFEE, $01
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown56
          CHECK_FLAG_UNSET Flag_Unknown69
            CHECK_FLAG_UNSET Flag_SeliphJuliaTalk1
              SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown69, $8EE091, $01
        BREAK_STATE_CHECKS

        CHECK_UNITS_MARRIED $2B, $FF
          SET_FLAG Flag_Unknown75
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown71
          CHECK_FLAG_UNSET Flag_Unknown70
            SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown70, $8EF165, $01
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown72
          CHECK_FLAG_UNSET Flag_Unknown70
            SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown70, $8EF134, $01
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown0
          CHECK_FLAG_UNSET Flag_Unknown5
            EC_47 $000C
              SET_FLAG Flag_Unknown68
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown0
          EVENT Flag_Unknown5, $018F
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $02, $00, $0000
          CHECK_FLAG_SET Flag_Unknown0
            EVENT Flag_Unknown6, $0190
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $03, $00, $0000
          CHECK_FLAG_SET Flag_Unknown1
            EVENT Flag_Unknown8, $0192
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown62, Flag_Unknown8]
            CHECK_FLAG_UNSET Flag_Unknown2
              EVENT Flag_Unknown9, $0193
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $01, $00, $0000
          CHECK_FLAG_SET Flag_Unknown11
            EVENT Flag_Unknown12, $0196
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $05, $00, $0000
          CHECK_FLAG_SET Flag_Unknown2
            EVENT Flag_Unknown11, $0195
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_UNIT_ALIVE Julia
          UNSET_FLAG Flag_Unknown56
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          SET_TALK_TARGET_IF_MARRIED $19, $28, $23
          EC_6C $1B, $39, $19, $39, $19
          EC_6C $1B, $39, $1A, $39, $1A
          SET_TALK_TARGET_IF_MARRIED $1B, $39, $37
          EC_6C $1F, $3D, $19, $2E, $19
          EC_6C $1F, $3D, $35, $2E, $20
          EC_6C $1F, $3D, $1D, $2E, $1D
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CHECK_FLAG_SET Flag_Unknown0
            SET_TALK_TARGET_IF_MARRIED $1C, $30, $1D
            SET_TALK_TARGET_IF_MARRIED $1D, $2A, $1C
            EC_6C $1E, $3F, $19, $30, $19
            SET_TALK_TARGET_IF_MARRIED $1E, $3F, $25
            SET_TALK_TARGET_IF_MARRIED $1E, $3F, $1D
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CHECK_FLAG_SET Flag_Unknown1
            EC_6C $1D, $3B, $19, $2A, $19
            SET_TALK_TARGET_IF_MARRIED $1D, $3B, $33
            EC_6C $1D, $3B, $32, $2A, $1B
            EC_6C $1A, $3A, $19, $29, $19
            EC_6C $1A, $3A, $1E, $29, $1E
            EC_6C $1A, $3A, $31, $29, $31
            EC_6C $1A, $3A, $1A, $29, $1A
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CHECK_FLAG_SET Flag_Unknown2
            EC_6C $20, $3C, $19, $2D, $19
            EC_6C $20, $3C, $38, $2D, $26
            SET_TALK_TARGET_IF_MARRIED $20, $3C, $27
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET Flag_HildaDied
          SET_TALK_TARGET $38, $00
          SET_TALK_TARGET $26, $00
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_JuliusDied
          SET_TALK_TARGET $3D, $00
          SET_TALK_TARGET $2E, $00
          SET_TALK_TARGET $39, $00
          SET_TALK_TARGET $28, $00
          SET_TALK_TARGET $3B, $00
          SET_TALK_TARGET $2A, $00
          SET_TALK_TARGET $3A, $00
          SET_TALK_TARGET $29, $00
          SET_TALK_TARGET $3C, $00
          SET_TALK_TARGET $2D, $00
          SET_TALK_TARGET $3F, $00
          SET_TALK_TARGET $30, $00
        BREAK_STATE_CHECKS

        END_CHAPTER_EVENTS

    .endsection ChapterFinalEventsSection

    .section ChapterFinalEventDataSection

      aChapterFinalEventData ; B1/A9A1

        .structChapterEventData aChapterFinalLocationData, aChapterFinalMapChangeData, aUnknownB1AA9F, aChapterFinalTalkEvents, None

      aChapterFinalLocationData ; B1/A9AB

        .byte size(aChapterFinalLocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/ChapterFinalLocationData.csv.asm"

      aChapterFinalChalphyCastle ; B1/A9BC

        .structChapterCastleLocationEntry ChFinal_Chalphy, ChalphyName, [33, 57], $FC, None

      aChapterFinalEddaCastle ; B1/A9C4

        .structChapterCastleLocationEntry ChFinal_Edda, EddaName, [60, 43], $FC, None

      aChapterFinalDozelCastle ; B1/A9CC

        .structChapterCastleLocationEntry ChFinal_Dozel, DozelName, [31, 34], $FC, None

      aChapterFinalFriegeCastle ; B1/A9D4

        .structChapterCastleLocationEntry ChFinal_Friege, FriegeName, [8, 20], $FC, None

      aChapterFinalVelthomerCastle ; B1/A9DC

        .structChapterCastleLocationEntry ChFinal_Velthomer, VelthomerName, [61, 4], $FC, None

      aChapterFinalBelhallaCastle ; B1/A9E4

        .structChapterCastleLocationEntry ChFinal_Belhalla, BelhallaName, [42, 22], $00, None

      aChapterFinalVillage1 ; B1/A9EC

        .structChapterVillageLocationEntry ChFinal_Village1, [13, 48]

      aChapterFinalVillage2 ; B1/A9F1

        .structChapterVillageLocationEntry ChFinal_Village2, [21, 54]

      aChapterFinalMapChangeData ; B1/A9F6

        .structChapterMapChangeEntry ChapterFinal, 63, [28, 50], aChapter10MapChangeChalphyRampart
        .structChapterMapChangeEntry ChapterFinal, 64, [51, 36], aChapter10MapChangeEddaRampart
        .structChapterMapChangeEntry ChapterFinal, 65, [4, 37], aChapter10MapChangeDozelRampart
        .structChapterMapChangeEntry ChapterFinal, 66, [14, 19], aChapter10MapChangeFriegeLeftRampart
        .structChapterMapChangeEntry ChapterFinal, 66, [24, 12], aChapter10MapChangeFriegeRightRampart
        .structChapterMapChangeEntry ChapterFinal, 67, [37, 28], aChapter10MapChangeBelhallaLeftPath
        .structChapterMapChangeEntry ChapterFinal, 67, [46, 27], aChapter10MapChangeBelhallaRightPath
        .word $FFFF

      aChapter10MapChangeChalphyRampart ; B1/AA29

        .byte 2
        .byte 2

        .word $00AF, $033B
        .word $033B, $033B

      aChapter10MapChangeEddaRampart ; B1/AA33

        .byte 1
        .byte 3

        .word $0143
        .word $033C
        .word $035C

      aChapter10MapChangeDozelRampart ; B1/AA3B

        .byte 2
        .byte 2

        .word $035A, $0362
        .word $033A, $033B

      aChapter10MapChangeFriegeLeftRampart ; B1/AA45

        .byte 2
        .byte 3

        .word $01BC, $01BD
        .word $01DC, $01DD
        .word $0062, $0069

      aChapter10MapChangeFriegeRightRampart ; B1/AA53

        .byte 1
        .byte 3

        .word $033A
        .word $033A
        .word $035A

      aChapter10MapChangeBelhallaLeftPath ; B1/AA5B

        .byte 4
        .byte 4

        .word $033B, $00AE, $00A7, $033B
        .word $0230, $008A, $0087, $01BC
        .word $0250, $008E, $0066, $01DC
        .word $0088, $0067, $033B, $00A8

      aChapter10MapChangeBelhallaRightPath ; B1/AA7D

        .byte 4
        .byte 4

        .word $0068, $03F9, $0087, $0251
        .word $033C, $00A8, $023C, $0087
        .word $01B6, $01B6, $0080, $008D
        .word $0061, $0119, $00A8, $008D

      aUnknownB1AA9F ; B1/AA9F

        .word <>aUnknownB1AAA3
        .word <>aUnknownB1AAB3

      aUnknownB1AAA3 ; B1/AAA3

        .word $0230
        .word $0231
        .word $0233
        .word $0235
        .word $0237
        .word $0238
        .word $0239
        .word $FFFF

      aUnknownB1AAB3 ; B1/AAB3

        .word $0230
        .word $0232
        .word $0234
        .word $0236
        .word $0237
        .word $0238
        .word $0239
        .word $FFFF

      aChapterFinalTalkEvents ; B1/AAC3

        .structChapterTalkEventEntry ChapterFinal, 60, Seliph, Julia
        .structChapterTalkEventEntry ChapterFinal, 73, Seliph, Julia
        .structChapterTalkEventEntry ChapterFinal, 61, Altena, Arion2
        .word $FFFF

      aFactionGroupData3C ; B1/AADD

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData3C._Locations, None

        _Locations ; B1/AAE6
        .word ChFinal_Chalphy
        .word $FFFF

      aFactionGroupData3D ; B1/AAEA

        .structFactionGroupData FactionEdda2, BattleHUDColorDarkBlue, BattleBannerEdda, None, aFactionGroupData3D._Locations, aFactionGroupData3D._GroupAI

        _Locations ; B1/AAF3
        .word ChFinal_Edda
        .word $FFFF

        _GroupAI ; B1/AAF7
        .long aFactionGroup3DAI1
        .long aFactionGroup3DAI2
        .long aFactionGroup3DAI3
        .long aFactionGroup3DAI4
        .word $FFFF

      aFactionGroupData3F ; B1/AB05

        .structFactionGroupData FactionDozel2, BattleHUDColorDarkBlue, BattleBannerDozel, None, aFactionGroupData3F._Locations, aFactionGroupData3F._GroupAI

        _Locations ; B1/AB0E
        .word ChFinal_Dozel
        .word $FFFF

        _GroupAI ; B1/AB12
        .long aFactionGroup3FAI1
        .long aFactionGroup3FAI2
        .long aFactionGroup3FAI3
        .long aFactionGroup3FAI4
        .word $FFFF

      aFactionGroupData3E ; B1/AB20

        .structFactionGroupData FactionFriege2, BattleHUDColorDarkBlue, BattleBannerFreege, None, aFactionGroupData3E._Locations, aFactionGroupData3E._GroupAI

        _Locations ; B1/AB29
        .word ChFinal_Friege
        .word $FFFF

        _GroupAI ; B1/AB2D
        .long aFactionGroup3EAI1
        .long aFactionGroup3EAI2
        .word $FFFF

      aFactionGroupData40 ; B1/AB35

        .structFactionGroupData FactionVelthomer2, BattleHUDColorDarkBlue, BattleBannerLoptr, None, aFactionGroupData40._Locations, aFactionGroupData40._GroupAI

        _Locations ; B1/AB3E
        .word ChFinal_Velthomer
        .word $FFFF

        _GroupAI ; B1/AB42
        .long aFactionGroup40AI1
        .word $FFFF

      aFactionGroupData41 ; B1/AB47

        .structFactionGroupData FactionBelhalla2, BattleHUDColorDarkBlue, BattleBannerLoptr, None, aFactionGroupData41._Locations, aFactionGroupData41._GroupAI

        _Locations ; B1/AB50
        .word ChFinal_Belhalla
        .word $FFFF

        _GroupAI ; B1/AB54
        .long aFactionGroup41AI1
        .long aFactionGroup41AI2
        .long aFactionGroup41AI3
        .long aFactionGroup41AI4
        .long aFactionGroup41AI5
        .word $FFFF

      aFactionGroupData42 ; B1/AB65

        .structFactionGroupData FactionYngvi2, BattleHUDColorDarkBlue, BattleBannerYngvi, None, None, aFactionGroupData42._GroupAI

        _GroupAI ; B1/AB6E
        .long aFactionGroup42AI1
        .word $FFFF

      aFactionGroupData43 ; B1/AB73

        .structFactionGroupData FactionThracia, BattleHUDColorDarkRed, BattleBannerThracia, None, None, aFactionGroupData43._GroupAI

        _GroupAI ; B1/AB7C
        .long aFactionGroup43AI1
        .word $FFFF

      aFactionGroup3DAI1 ; B1/AB81

        AI_SET_FORMATION $02, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3DAI2 ; B1/AB8C

        AI_SET_FORMATION $05, $03
        AI_0A
        AI_END

      aFactionGroup3DAI3 ; B1/AB91

        AI_0B
        AI_END

      aFactionGroup3DAI4 ; B1/AB93

        AI_07 ChFinal_Edda, $04
        AI_END

      aFactionGroup3FAI1 ; B1/AB97

        AI_0B
        AI_END

      aFactionGroup3FAI2 ; B1/AB99

        AI_SET_FORMATION $08, $01
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 ChFinal_Edda, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3FAI3 ; B1/ABA7

        AI_SET_FORMATION $0B, $02
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3FAI4 ; B1/ABB2

        AI_07 ChFinal_Dozel, $04
        AI_END

      aFactionGroup3EAI1 ; B1/ABB6

        AI_SET_FORMATION $01, $02
        AI_0A
        AI_END

      aFactionGroup3EAI2 ; B1/ABBB

        AI_07 ChFinal_Friege, $04
        AI_END

      aFactionGroup42AI1 ; B1/ABBF

        AI_SET_FORMATION $01, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup40AI1 ; B1/ABC4

        AI_07 ChFinal_Velthomer, $04
        AI_END

      aFactionGroup41AI1 ; B1/ABC8

        AI_SET_FORMATION $0B, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup41AI2 ; B1/ABD3

        AI_1D
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup41AI3 ; B1/ABD6

        AI_SET_FORMATION $0E, $00
        AI_07 ChFinal_Belhalla, $04
        AI_END

      aFactionGroup41AI4 ; B1/ABDD

        AI_0B
        AI_END

      aFactionGroup41AI5 ; B1/ABDF

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup43AI1 ; B1/ABE1

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $05, $03
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET ChapterFinal, 61, +

          AI_SET_IGNORED_GENERATION_ID GEN_ID_Altena
          AI_06 ChFinal_Chalphy, $01
          AI_TARGET_ALL_FOES
          AI_END

        +
        AI_02 $07
        AI_22 +

          AI_TARGET_SPECIFIED_UNIT Altena
          AI_END

        +
        AI_05
        AI_TARGET_SPECIFIED_UNIT Altena
        AI_END

    .endsection ChapterFinalEventDataSection
