
    .weak

      FlagChapter01_GenoaSeized                 :=  0
      FlagChapter01_MarphaSeized                :=  1
      FlagChapter01_VerdaneSeized               :=  2
      FlagChapter01_EdainJamkeTalk              :=  3
      FlagChapter01_SigurdAyraTalk              :=  4
      FlagChapter01_SigurdEntersForest          :=  5
      FlagChapter01_OpenForest                  :=  6
      FlagChapter01_AyraDied                    :=  7
      FlagChapter01_SandimaDied                 :=  8
      FlagChapter01_HeirheinFSLoaded            :=  9
      FlagChapter01_GenoaOrMarphaSeized         := 10
      FlagChapter01_MunnirVanguardIncomplete    := 11

      FlagChapter01_FoesNearGenoa               := 13
      FlagChapter01_GenoaSeizedByAyra           := 14

      FlagChapter01_EdainGroupSpawn             := 16

      FlagChapter01_HeirheinSpawned             := 19
      FlagChapter01_NordionSpawned              := 20
      FlagChapter01_VerdaneSpawned              := 21
      FlagChapter01_EldiganRetreat              := 22
      FlagChapter01_MunnirRallyVanguard         := 23
      FlagChapter01_AyraStartsMoving            := 24
      FlagChapter01_GenoaSeizedAyraResponse     := 25
      FlagChapter01_SandimaBattleQuote          := 26
      FlagChapter01_CimbaethBattleQuote         := 27
      FlagChapter01_MunnirBattleQuote           := 28

      FlagChapter01_ElliotBattleQuote           := 30
      FlagChapter01_AyraBattleQuote             := 31
      FlagChapter01_JamkeBattleQuote            := 32
      FlagChapter01_MidirMunnirBattleQuote      := 33
      FlagChapter01_AzelleMunnirBattleQuote     := 34
      FlagChapter01_DeirdreSandimaBattleQuote   := 35
      FlagChapter01_JamkeSandimaBattleQuote     := 36

      FlagChapter01_AnyoneDied                  := 43
      FlagChapter01_DeirdreCaptureReturn        := 44

      FlagChapter01_ElliotRetreats              := 46
      FlagChapter01_LexBraveAxe                 := 47

      FlagChapter01_JamkeRecruitment            := 50
      FlagChapter01_LexOnPeninsula              := 51
      FlagChapter01_CrossKnightTalk             := 52
      FlagChapter01_AyraDestroysGenoa           := 53

      FS_Player                                 :=  0
      FS_Ch01Genoa                              :=  1
      FS_Ch01Marpha                             :=  2
      FS_Ch01Verdane                            :=  3
      FS_Ch01Nordion                            :=  4
      FS_Ch01Heirhein                           :=  5

    .endweak

    .section Chapter01EventsSection

      aChapter01EventHeader ; 86/C85C

        .word Chapter01

        .long aChapter01OpeningEvent
        .long aChapter01MapEvents

      aChapter01OpeningEvent ; 86/C864

        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter01Brigands

        LOAD_FACTION_GROUP FS_Player,     FG_Ch01Sigurd
        LOAD_FACTION_GROUP FS_Ch01Genoa,   FG_Ch01Genoa
        LOAD_FACTION_GROUP FS_Ch01Marpha,  FG_Ch01Marpha
        LOAD_FACTION_GROUP FS_Ch01Verdane, FG_Ch01Verdane
        LOAD_FACTION_GROUP FS_Ch01Nordion, FG_Ch01Nordion

        macroSetFactionsEnemies [FS_Player,      FS_Ch01Genoa]
        macroSetFactionsEnemies [FS_Player,      FS_Ch01Marpha]
        macroSetFactionsEnemies [FS_Player,      FS_Ch01Verdane]
        macroSetFactionsNeutral [FS_Player,      FS_Ch01Nordion]
        macroSetFactionsAllies  [FS_Ch01Genoa,   FS_Ch01Marpha]
        macroSetFactionsAllies  [FS_Ch01Genoa,   FS_Ch01Verdane]
        macroSetFactionsNeutral [FS_Ch01Genoa,   FS_Ch01Nordion]
        macroSetFactionsAllies  [FS_Ch01Marpha,  FS_Ch01Verdane]
        macroSetFactionsNeutral [FS_Ch01Marpha,  FS_Ch01Nordion]
        macroSetFactionsNeutral [FS_Ch01Verdane, FS_Ch01Nordion]

        SET_FLAG FlagChapter01_SigurdAyraTalk

        DEPLOY_UNIT_GROUP UNITGroupChapter01Brigands

        EVENT FlagAlways, EventChapter01Opening

        END_CHAPTER_EVENTS

      aChapter01MapEvents ; 86/C8A7

        CHECK_SEIZING_CASTLE FlagChapter01_GenoaSeized, FS_Player, Ch01_Genoa
          EVENT FlagAlways, EventChapter01GenoaSeized

        CHECK_SEIZING_CASTLE FlagChapter01_MarphaSeized, FS_Player, Ch01_Marpha
          EVENT FlagAlways, EventChapter01MarphaSeized

        CHECK_SEIZING_CASTLE FlagChapter01_VerdaneSeized, FS_Player, Ch01_Verdane
          EVENT FlagAlways, EventChapter01Ending

        CHECK_SEIZING_CASTLE FlagChapter01_GenoaSeizedByAyra, FS_Ch01Verdane, Ch01_Genoa
          EVENT FlagChapter01_AyraDestroysGenoa, EventChapter01AyraDestroysGenoa

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING FlagChapter01_DeirdreCaptureReturn, Deirdre
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter01_SigurdEntersForest, Sigurd, pack([12, 38]), pack([17, 43]), AnyFactionSlot
          EVENT FlagAlways, EventChapter01DeirdreSpawn

        CHECK_UNIT_IN_AREA FlagChapter01_LexOnPeninsula, Lex, pack([28, 37]), pack([28, 37]), AnyFactionSlot
          EVENT FlagChapter01_LexBraveAxe, EventChapter01LexBraveAxe

        CHECK_TALK FlagChapter01_SigurdAyraTalk, Sigurd, Ayra
          EVENT FlagAlways, EventChapter01SigurdAyraTalk

        CHECK_TALK FlagChapter01_EdainJamkeTalk, Edain, Jamke
          EVENT FlagChapter01_JamkeRecruitment, EventChapter01EdainJamkeTalk

        CHECK_UNIT_DIED FlagAlways, Quan
          EVENT FlagAlways, EventChapter01QuanDied

        CHECK_UNIT_DIED FlagAlways, Ethlyn
          EVENT FlagAlways, EventChapter01EthlynDied

        CHECK_UNIT_DIED FlagAlways, Finn
          EVENT FlagAlways, EventChapter01FinnDied

        CHECK_UNIT_DIED FlagChapter01_AyraDied, Ayra
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter01_SandimaDied, Sandima
          EC_NOP_00

        ; Includes enemies.
        CHECK_UNIT_DIED FlagChapter01_AnyoneDied, AnyCharacter
          EC_NOP_00

        CHECK_UNIT_DIED_TO FlagAlways, ElliotCh01, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, ElliotCh01
          EVENT FlagChapter01_ElliotRetreats, EventChapter01ElliotRetreats

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch01_Village1
          EVENT FlagAlways, EventChapter01Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch01_Village2
          EVENT FlagAlways, EventChapter01Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch01_Village3
          EVENT FlagAlways, EventChapter01Village3

        CHECK_TALK FlagAlways, Quan, Finn
          EVENT FlagAlways, EventChapter01QuanFinnTalk

        CHECK_TALK FlagAlways, Midir, Edain
          EVENT FlagAlways, EventChapter01MidirEdainTalk

        CHECK_TALK FlagAlways, Sigurd, Edain
          EVENT FlagAlways, EventChapter01SigurdEdainTalk

        CHECK_TALK FlagAlways, Azelle, Edain
          EVENT FlagAlways, EventChapter01AzelleEdainTalk

        CHECK_TALK FlagAlways, Edain, Ethlyn
          EVENT FlagAlways, EventChapter01EdainEthlynTalk

        CHECK_TALK FlagAlways, Dew, Edain
          EVENT FlagAlways, EventChapter01DewEdainTalk

        CHECK_TALK FlagAlways, Ayra, Quan
          EVENT FlagAlways, EventChapter01AyraQuanTalk

        CHECK_TALK FlagChapter01_CrossKnightTalk, AnyCharacter, CrossKnight
          EVENT FlagAlways, EventChapter01CrossknightTalk

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Midir, AnyFactionSlot, Munnir
          SET_PRECOMBAT_DIALOGUE FlagChapter01_MidirMunnirBattleQuote, dialogueChapter01MidirMunnirBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Azelle, AnyFactionSlot, Munnir
          SET_PRECOMBAT_DIALOGUE FlagChapter01_AzelleMunnirBattleQuote, dialogueChapter01AzelleMunnirBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Deirdre, AnyFactionSlot, Sandima
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter01_DeirdreSandimaBattleQuote, dialogueChapter01DeirdreSandimaBattleQuote, 0

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, Jamke, AnyFactionSlot, Sandima
          SET_PRECOMBAT_DIALOGUE FlagChapter01_JamkeSandimaBattleQuote, dialogueChapter01JamkeSandimaBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Ayra
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter01_AyraBattleQuote, dialogueChapter01AyraBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Cimbaeth
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter01_CimbaethBattleQuote, dialogueChapter01CimbaethBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Munnir
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter01_MunnirBattleQuote, dialogueChapter01MunnirBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, ElliotCh01
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter01_ElliotBattleQuote, dialogueChapter01ElliotBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Sandima
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter01_SandimaBattleQuote, dialogueChapter01SandimaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Jamke
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter01_JamkeBattleQuote, dialogueChapter01JamkeBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter01_MunnirBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter01_MidirMunnirBattleQuote, FlagChapter01_AzelleMunnirBattleQuote]
            SET_FLAG FlagChapter01_MunnirBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter01_SandimaBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter01_DeirdreSandimaBattleQuote, FlagChapter01_JamkeSandimaBattleQuote]
            SET_FLAG FlagChapter01_SandimaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 2, FS_Player
          EVENT FlagChapter01_EdainGroupSpawn, EventChapter01EdainGroupSpawn
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Verdane, 4, AnyCharacter
          CHECK_FLAG_SET FlagChapter01_FoesNearGenoa
            EVENT FlagChapter01_AyraStartsMoving, EventChapter01AyraStartsMoving
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Verdane, 4, AnyCharacter
          CHECK_FLAG_SET FlagChapter01_GenoaSeized
            CHECK_FLAG_UNSET FlagChapter01_SigurdAyraTalk
              CHECK_FLAG_UNSET FlagChapter01_AyraDied
                EVENT FlagChapter01_GenoaSeizedAyraResponse, EventChapter01GenoaSeizedAyraResponse
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Marpha, 1, AnyCharacter
          CHECK_FLAG_SET FlagChapter01_MunnirVanguardIncomplete
            EVENT FlagChapter01_MunnirRallyVanguard, EventChapter01MunnirRallyVanguard
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Verdane
          CHECK_FLAG_IN_LIST_SET [FlagChapter01_GenoaSeized, FlagChapter01_MarphaSeized]
            CHECK_FLAG_UNSET FlagChapter01_HeirheinFSLoaded
              SET_FLAG FlagChapter01_HeirheinFSLoaded
              LOAD_FACTION_GROUP FS_Ch01Heirhein, FG_Ch01Heirhein
              macroSetFactionsEnemies [FS_Ch01Heirhein, FS_Player]
              macroSetFactionsNeutral [FS_Ch01Heirhein, FS_Ch01Genoa]
              macroSetFactionsNeutral [FS_Ch01Heirhein, FS_Ch01Marpha]
              macroSetFactionsNeutral [FS_Ch01Heirhein, FS_Ch01Verdane]
              macroSetFactionsAllies  [FS_Ch01Heirhein, FS_Ch01Nordion]
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Heirhein
          CHECK_FLAG_SET FlagChapter01_GenoaOrMarphaSeized
            EVENT FlagChapter01_HeirheinSpawned, EventChapter01HeirheinSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Nordion
          CHECK_FLAG_SET FlagChapter01_HeirheinSpawned
            EVENT FlagChapter01_NordionSpawned, EventChapter01NordionSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Nordion
          CHECK_FLAG_SET FlagChapter01_HeirheinSpawned
            CHECK_EVERYONE_IN_FACTION_DEAD FS_Ch01Heirhein
              EVENT FlagChapter01_EldiganRetreat, EventChapter01EldiganRetreat
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch01Verdane
          CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter01_GenoaSeized, FlagChapter01_MarphaSeized]
            EVENT FlagChapter01_VerdaneSpawned, EventChapter01VerdaneSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter01ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter01ClearTalksIfMarriedTable ; 86/CB51

        .byte Edain, Midir
        .byte Edain, Azelle
        .byte Edain, Dew
        .word $FFFF

    .endsection Chapter01EventsSection

    .section Chapter01EventDataSection

      aChapter01EventData ; 86/CB59

        .structChapterEventData aChapter01LocationData, aChapter01MapChangeData, aUnknown86CBC0, aChapter01TalkEvents, aUnknown86CC70

      aChapter01LocationData ; 86/CB63

        .byte size(aChapter01LocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/Chapter01LocationData.csv.asm"

      aChapter01EvansCastle ; 86/CB74

        .structChapterCastleLocationEntry Ch01_Evans, EvansName, [46, 11], $FC, aChapter01ShopData

      aChapter01NordionCastle ; 86/CB7C

        .structChapterCastleLocationEntry Ch01_Nordion, NordionName, [14, 3], $FC, None

      aChapter01GenoaCastle ; 86/CB84

        .structChapterCastleLocationEntry Ch01_Genoa, GenoaName, [57, 40], $FC, None

      aChapter01MarphaCastle ; 86/CB8C

        .structChapterCastleLocationEntry Ch01_Marpha, MarphaName, [24, 49], $FC, None

      aChapter01VerdaneCastle ; 86/CB94

        .structChapterCastleLocationEntry Ch01_Verdane, VerdaneName, [9, 24], $00, None

      aChapter01Village1 ; 86/CB9C

        .structChapterVillageLocationEntry Ch01_Village1, [47, 31]

      aChapter01Village2 ; 86/CBA1

        .structChapterVillageLocationEntry Ch01_Village2, [36, 52]

      aChapter01Village3 ; 86/CBA6

        .structChapterVillageLocationEntry Ch01_Village3, [9, 58]

      aChapter01ShopData ; 86/CBAB

        .byte PI_SlimSword2
        .byte PI_IronLance3
        .byte PI_Javelin2
        .byte PI_SteelAxe1
        .word $FFFF

      aChapter01MapChangeData ; 86/CBB1
      
        .structChapterMapChangeEntry Chapter01, FlagChapter01_OpenForest, [14, 43], aChapter01MapChangeOpenForest
        .word $FFFF

      aChapter01MapChangeOpenForest ; 86/CBBA

        .byte 1
        .byte 2

        .word $0112
        .word $0112

      aUnknown86CBC0 ; 86/CBC0

        .word <>aUnknown86CBC4
        .word <>aUnknown86CBD4

      aUnknown86CBC4 ; 86/CBC4

        .word $01E0
        .word $01E1
        .word $01E2
        .word $01E3
        .word $01E5
        .word $01E6
        .word $01E7
        .word $FFFF

      aUnknown86CBD4 ; 86/CBD4

        .word $01E0
        .word $01E1
        .word $01E2
        .word $01E4
        .word $01E5
        .word $01E6
        .word $01E7
        .word $FFFF

      aFactionGroupData04 ; 86/CBE4

        .structFactionGroupData FactionSigurd, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData04._Locations, None

        _Locations ; 86/CBED
        .word Ch01_Evans
        .word $FFFF

      aFactionGroupData05 ; 86/CBF1

        .structFactionGroupData FactionGenoa, BattleHUDColorOrange, BattleBannerDefault, None, aFactionGroupData05._Locations, aFactionGroupData05._GroupAI

        _Locations ; 86/CBFA
        .word Ch01_Genoa
        .word $FFFF

        _GroupAI ; 86/CBFE
        .long aFactionGroup05AI1
        .long aFactionGroup05AI2
        .word $FFFF

      aFactionGroupData06 ; 86/CC06

        .structFactionGroupData FactionMarpha, BattleHUDColorOrange, BattleBannerDefault, None, aFactionGroupData06._Locations, aFactionGroupData06._GroupAI

        _Locations ; 86/CC0F
        .word Ch01_Marpha
        .word $FFFF

        _GroupAI ; 86/CC13
        .long aFactionGroup06AI1
        .long aFactionGroup06AI2
        .word $FFFF

      aFactionGroupData07 ; 86/CC1B

        .structFactionGroupData FactionVerdane, BattleHUDColorOrange, BattleBannerDefault, None, aFactionGroupData07._Locations, aFactionGroupData07._GroupAI

        _Locations ; 86/CC24
        .word Ch01_Verdane
        .word $FFFF

        _GroupAI ; 86/CC28
        .long aFactionGroup07AI1
        .long aFactionGroup07AI2
        .long aFactionGroup07AI3
        .long aFactionGroup07AI4
        .word $FFFF

      aFactionGroupData08 ; 86/CC36

        .structFactionGroupData FactionNordion, BattleHUDColorWhite, BattleBannerNordion, None, aFactionGroupData08._Locations, aFactionGroupData08._GroupAI

        _Locations ; 86/CC3F
        .word Ch01_Nordion
        .word $FFFF

        _GroupAI ; 86/CC43
        .long aFactionGroup08AI1
        .word $FFFF

      aFactionGroupData09 ; 86/CC48

        .structFactionGroupData FactionHeirhein, BattleHUDColorWhite, BattleBannerDefault, None, None, aFactionGroupData09._GroupAI

        _GroupAI ; 86/CC51
        .long aFactionGroup09AI1
        .word $FFFF

      aChapter01TalkEvents ; 86/CC56

        .structChapterTalkEventEntry Chapter01, FlagChapter01_SigurdAyraTalk, Sigurd, Ayra
        .structChapterTalkEventEntry Chapter01, FlagChapter01_EdainJamkeTalk, Edain, Jamke
        .structChapterTalkEventEntry Chapter01, FlagChapter01_CrossKnightTalk, AnyCharacter, CrossKnight
        .word $FFFF

      aUnknown86CC70 ; 86/CC70

        .word $FFFF
        .word $FFFF
        .word $FFFF
        .word $FFFF
        .word $1401
        .word $FFFF

      aFactionGroup05AI1 ; 86/CC7C

        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_SET_FORMATION $01, $00
        AI_06 Ch01_Evans, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup05AI2 ; 86/CC8A

        AI_22 +

          AI_07 Ch01_Genoa, $04
          AI_END

        +
        AI_SET_CHAPTER_EVENT_FLAG Chapter01, FlagChapter01_FoesNearGenoa
        AI_07 Ch01_Genoa, $04
        AI_END

      aFactionGroup06AI1 ; 86/CC99

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT floor(0.9 * 256)
        AI_CHECK_GROUP_COMPLETE_BY_TURN_DIVISIBLE 3
        AI_ASMC_CHECK rsASMC_CheckMunnirVanguardIncomplete, +

          AI_SET_CHAPTER_EVENT_FLAG Chapter01, FlagChapter01_MunnirVanguardIncomplete

        +
        AI_SET_FORMATION $06, $01
        AI_TARGET_ALL_FOES
        AI_END

      rsASMC_CheckMunnirVanguardIncomplete ; 86/CCAC

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        bit #$0080
        beq +

          clc
          rtl

        +
        sec
        rtl

        .databank 0

      aFactionGroup06AI2 ; 86/CCB9

        AI_07 Ch01_Marpha, $04
        AI_END

      aFactionGroup07AI1 ; 86/CCBD

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Edain
        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter01, FlagChapter01_EdainJamkeTalk, +

          AI_SET_FORMATION $02, $02
          AI_TARGET_ALL_FOES
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup07AI2 ; 86/CCCE

        AI_07 Ch01_Verdane, $04
        AI_END

      aFactionGroup07AI3 ; 86/CCD2

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup07AI4 ; 86/CCD5

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Sigurd
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter01, FlagChapter01_FoesNearGenoa, +

          AI_0A
          AI_END

        +
        AI_06 Ch01_Genoa, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup08AI1 ; 86/CCE4

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_UNSET Chapter01, FlagChapter01_HeirheinSpawned, +

          AI_SET_FORMATION $09, $01
          AI_10
          AI_19

        +
        AI_END

      aFactionGroup09AI1 ; 86/CCF0

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $09, $02
        AI_06 Ch01_Evans, $01
        AI_TARGET_ALL_FOES
        AI_END

    .endsection Chapter01EventDataSection
