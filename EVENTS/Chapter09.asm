
    .weak

      FlagChapter09_KapathogiaSeizedCheck         :=  0
      FlagChapter09_LutheciaSeizedCheck           :=  1
      FlagChapter09_GrutiaSeizedCheck             :=  2
      FlagChapter09_ThraciaSeizedCheck            :=  3
      FlagChapter09_AltenaCharge                  :=  4
      FlagChapter09_HannibalDefend                :=  5
      FlagChapter09_CoirpreHostage                :=  6
      FlagChapter09_LeifAltenaTalk                :=  7
      FlagChapter09_AltenaRespawn                 :=  8
      FlagChapter09_TravantSpawnAltenaDead        :=  9
      FlagChapter09_HannibalCharge                := 10
      FlagChapter09_SeliphAltenaTalk              := 11
      FlagChapter09_HannibalNotRecruited          := 12
      FlagChapter09_LutheciaSeized                := 13
      FlagChapter09_CoirpreHannibalTalk           := 14
      FlagChapter09_GrutiaSpawn                   := 15
      FlagChapter09_GrutiaSeized                  := 16
      FlagChapter09_ThraciaSpawn                  := 17
      FlagChapter09_ArionCharge                   := 18

      FlagChapter09_CharlotHannibalAdjacent       := 20

      FlagChapter09_AltenaArionBattleQuote        := 24
      FlagChapter09_AltenaBattleQuote             := 25
      FlagChapter09_HannibalBattleQuote           := 26
      FlagChapter09_KanatzBattleQuote             := 27
      FlagChapter09_DistlerBattleQuote            := 28
      FlagChapter09_MusarBattleQuote              := 29
      FlagChapter09_JudahBattleQuote              := 30
      FlagChapter09_ArionBattleQuote              := 31
      FlagChapter09_TravantBattleQuote            := 32

      FlagChapter09_OifeyAlive                    := 34
      FlagChapter09_LeifFinnAlive                 := 35
      FlagChapter09_HannibalDiedCheck             := 36
      FlagChapter09_TravantDiedCheck              := 37
      FlagChapter09_AltenaDiedCheck               := 38
      FlagChapter09_ArionDiedCheck                := 39
      FlagChapter09_LeifAltenaTalkCheck           := 40
      FlagChapter09_CoirpreHannibalTalkCheck      := 41
      FlagChapter09_SeliphAltenaTalkCheck         := 42
      FlagChapter09_SetRamparts                   := 43
      FlagChapter09_RemoveRamparts                := 44
      FlagChapter09_PlayerNearThracia             := 45
      FlagChapter09_JuliaCaptureReturn            := 46
      FlagChapter09_CharlotHannibalAdjacentCheck  := 47
      FlagChapter09_MusarDiedCheck                := 48
      FlagChapter09_HawkLutheciaVisitCheck        := 49
      FlagChapter09_LeifAltenaBattleQuote         := 50
      FlagChapter09_FinnAltenaBattleQuote         := 51
      FlagChapter09_LeifTravantBattleQuote        := 52
      FlagChapter09_FinnTravantBattleQuote        := 53
      FlagChapter09_SeliphArionBattleQuote        := 54

      FS_Player                                   :=  0
      FS_Ch09Kapathogia                           :=  1
      FS_Ch09Luthecia                             :=  2
      FS_Ch09Grutia                               :=  3
      FS_Ch09Thracia                              :=  4

    .endweak

    .section Chapter09EventsSection

      aChapter09EventHeader ; 86/F4C9

        .word Chapter09
        .long aChapter09OpeningEvent
        .long aChapter09MapEvents

      aChapter09OpeningEvent ; B2/F4D1

        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter09Start

        LOAD_FACTION_GROUP FS_Player, FG_Ch09Seliph
        LOAD_FACTION_GROUP FS_Ch09Kapathogia, FG_Ch09Kapathogia
        LOAD_FACTION_GROUP FS_Ch09Luthecia, FG_Ch09Luthecia
        LOAD_FACTION_GROUP FS_Ch09Grutia, FG_Ch09Grutia
        LOAD_FACTION_GROUP FS_Ch09Thracia, FG_Ch09Thracia

        macroSetFactionsEnemies [FS_Player, FS_Ch09Kapathogia]
        macroSetFactionsEnemies [FS_Player, FS_Ch09Luthecia]
        macroSetFactionsEnemies [FS_Player, FS_Ch09Grutia]
        macroSetFactionsEnemies [FS_Player, FS_Ch09Thracia]
        macroSetFactionsAllies  [FS_Ch09Kapathogia, FS_Ch09Luthecia]
        macroSetFactionsAllies  [FS_Ch09Kapathogia, FS_Ch09Grutia]
        macroSetFactionsAllies  [FS_Ch09Kapathogia, FS_Ch09Thracia]
        macroSetFactionsAllies  [FS_Ch09Luthecia, FS_Ch09Grutia]
        macroSetFactionsAllies  [FS_Ch09Luthecia, FS_Ch09Thracia]
        macroSetFactionsAllies  [FS_Ch09Grutia, FS_Ch09Thracia]

        DEPLOY_UNIT_GROUP UNITGroupChapter09Start

        SET_FLAG FlagChapter09_LeifAltenaTalkCheck
        SET_FLAG FlagChapter09_SeliphAltenaTalkCheck

        CHECK_UNIT_ALIVE Oifey
          SET_FLAG FlagChapter09_OifeyAlive
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE Leif
          CHECK_UNIT_ALIVE AdultFinn
            SET_FLAG FlagChapter09_LeifFinnAlive
            UNSET_FLAG FlagChapter09_LeifAltenaTalkCheck
        BREAK_STATE_CHECKS

        EVENT FlagAlways, EventChapter09Opening

        END_CHAPTER_EVENTS

      aChapter09MapEvents ; 86/F52B

        CHECK_SEIZING_CASTLE FlagChapter09_KapathogiaSeizedCheck, FS_Player, Ch09_Kapathogia
          EC_NOP_00

        CHECK_SEIZING_CASTLE FlagChapter09_LutheciaSeizedCheck, FS_Player, Ch09_Luthecia
          EVENT FlagChapter09_LutheciaSeized, EventChapter09LutheciaSeized

        CHECK_SEIZING_CASTLE FlagChapter09_GrutiaSeizedCheck, FS_Player, Ch09_Grutia
          EVENT FlagChapter09_GrutiaSeized, EventChapter09GrutiaSeized

        CHECK_SEIZING_CASTLE FlagChapter09_ThraciaSeizedCheck, FS_Player, Ch09_Thracia
          EVENT FlagAlways, EventChapter09ThraciaSeized

        CHECK_TALK FlagChapter09_LeifAltenaTalkCheck, Leif, Altena
          EVENT FlagChapter09_LeifAltenaTalk, EventChapter09LeifAltenaTalk

        CHECK_TALK FlagChapter09_SeliphAltenaTalkCheck, Seliph, Altena
          EVENT FlagChapter09_SeliphAltenaTalk, EventChapter09SeliphAltenaTalk

        CHECK_TALK FlagChapter09_SeliphAltenaTalkCheck, Altena, Seliph
          EVENT FlagChapter09_SeliphAltenaTalk, EventChapter09SeliphAltenaTalk

        CHECK_CHILD_TALK FlagChapter09_CoirpreHannibalTalkCheck, Charlot, Hannibal
          EVENT FlagChapter09_CoirpreHannibalTalk, EventChapter09CoirpreHannibalTalk

        CHECK_UNIT_IN_AREA FlagChapter09_PlayerNearThracia, AnyCharacter, pack([42, 36]), pack([62, 55]), FS_Player
          EC_NOP_00

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter09_CharlotHannibalAdjacentCheck, Charlot, Hannibal, 1
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter09_AltenaDiedCheck, Altena
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter09_HannibalDiedCheck, Hannibal
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter09_TravantDiedCheck, TravantCh09
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter09_MusarDiedCheck, Musar
          EC_NOP_00

        CHECK_UNIT_DIED_TO FlagChapter09_ArionDiedCheck, ArionCh09, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, ArionCh09, AnyCharacter
          EVENT FlagAlways, EventChapter09ArionDied

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING FlagChapter09_JuliaCaptureReturn, Julia
          EC_NOP_00

        CHECK_TALK FlagAlways, Febail, Patty
          EVENT FlagAlways, EventChapter09FebailPattyTalk

        CHECK_TALK FlagAlways, Asaello, Daisy
          EVENT FlagAlways, EventChapter09AsaelloDaisyTalk

        CHECK_TALK FlagAlways, Seliph, Hannibal
          EVENT FlagAlways, EventChapter09SeliphHannibalTalk

        CHECK_TALK FlagAlways, Lene, Coirpre
          EVENT FlagAlways, EventChapter09LeneCoirpreTalk

        CHECK_TALK FlagAlways, Laylea, Charlot
          EVENT FlagAlways, EventChapter09LayleaCharlotTalk

        CHECK_TALK FlagAlways, AdultFinn, Altena
          EVENT FlagAlways, EventChapter09FinnAltenaTalk

        CHECK_TALK FlagAlways, Hannibal, Altena
          EVENT FlagAlways, EventChapter09HannibalAltenaTalk

        CHECK_CHILD_TALK FlagAlways, Patty, Coirpre
          EVENT FlagAlways, EventChapter09PattyCoirpreTalk

        CHECK_TALK FlagAlways, Julia, Seliph
          EVENT FlagAlways, EventChapter09JuliaSeliphTalk

        VISIT_VILLAGE FlagAlways, Jeanne, Ch09_Village4
          EVENT FlagAlways, EventChapter09Village4Special

        VISIT_VILLAGE FlagAlways, Hermina, Ch09_Village4
          EVENT FlagAlways, EventChapter09Village4Special

        CHECK_ENTERING_CASTLE_MENU FlagChapter09_HawkLutheciaVisitCheck, Hawk, Ch09_Luthecia
          EVENT FlagAlways, EventChapter09HawkLutheciaVisit

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch09_Village1
          EVENT FlagAlways, EventChapter09Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch09_Village2
          EVENT FlagAlways, EventChapter09Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch09_Village3
          EVENT FlagAlways, EventChapter09Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch09_Village4
          EVENT FlagAlways, EventChapter09Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch09_VillageBarrierRing
          EVENT FlagAlways, EventChapter09VillageBarrierRing

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch09_Village5
          EVENT FlagAlways, EventChapter09Village5

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Altena, AnyFactionSlot, ArionCh09
          SET_PRECOMBAT_DIALOGUE FlagChapter09_AltenaArionBattleQuote, dialogueChapter09AltenaArionBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Leif, AnyFactionSlot, Altena
          SET_PRECOMBAT_DIALOGUE FlagChapter09_LeifAltenaBattleQuote, dialogueChapter09LeifAltenaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AdultFinn, AnyFactionSlot, Altena
          SET_PRECOMBAT_DIALOGUE FlagChapter09_FinnAltenaBattleQuote, dialogueChapter09FinnAltenaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Leif, AnyFactionSlot, TravantCh09
          SET_PRECOMBAT_DIALOGUE FlagChapter09_LeifTravantBattleQuote, dialogueChapter09LeifTravantBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AdultFinn, AnyFactionSlot, TravantCh09
          SET_PRECOMBAT_DIALOGUE FlagChapter09_FinnTravantBattleQuote, dialogueChapter09FinnTravantBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Seliph, AnyFactionSlot, ArionCh09
          SET_PRECOMBAT_DIALOGUE FlagChapter09_SeliphArionBattleQuote, dialogueChapter09SeliphArionBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Altena
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_AltenaBattleQuote, dialogueChapter09AltenaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Hannibal
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_HannibalBattleQuote, dialogueChapter09HannibalBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Kanatz
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_KanatzBattleQuote, dialogueChapter09KanatzBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Distler
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_DistlerBattleQuote, dialogueChapter09DistlerBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Musar
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_MusarBattleQuote, dialogueChapter09MusarBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Judah
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_JudahBattleQuote, dialogueChapter09JudahBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, ArionCh09
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_ArionBattleQuote, dialogueChapter09ArionBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, TravantCh09
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter09_TravantBattleQuote, dialogueChapter09TravantBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter09_AltenaBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter09_LeifAltenaBattleQuote, FlagChapter09_FinnAltenaBattleQuote]
            SET_FLAG FlagChapter09_AltenaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter09_TravantBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter09_LeifTravantBattleQuote, FlagChapter09_FinnTravantBattleQuote]
            SET_FLAG FlagChapter09_TravantBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter09_ArionBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter09_AltenaArionBattleQuote, FlagChapter09_SeliphArionBattleQuote]
            SET_FLAG FlagChapter09_ArionBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch09Thracia, 1, AnyCharacter
          EVENT FlagChapter09_AltenaCharge, EventChapter09AltenaCharge
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch09Kapathogia, 1, AnyCharacter
          EVENT FlagChapter09_HannibalDefend, EventChapter09HannibalDefend
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 2, FS_Ch09Luthecia
          EVENT FlagChapter09_CoirpreHostage, EventChapter09CoirpreHostage
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch09Thracia
          CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter09_TravantDiedCheck, FlagChapter09_LeifAltenaTalk]
            EVENT FlagChapter09_AltenaRespawn, EventChapter09AltenaRespawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch09Thracia
          CHECK_FLAG_SET FlagChapter09_AltenaDiedCheck
            CHECK_FLAG_UNSET FlagChapter09_LeifAltenaTalk
              EVENT FlagChapter09_TravantSpawnAltenaDead, EventChapter09TravantSpawnAltenaDead
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch09Kapathogia
          CHECK_FLAG_IN_LIST_SET [FlagChapter09_LeifAltenaTalk, FlagChapter09_TravantSpawnAltenaDead]
            CHECK_FLAG_UNSET FlagChapter09_HannibalDiedCheck
              CHECK_FLAG_UNSET FlagChapter09_KapathogiaSeizedCheck
                EVENT FlagChapter09_HannibalCharge, EventChapter09HannibalCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapter09_KapathogiaSeizedCheck
          CHECK_FLAG_UNSET FlagChapter09_CoirpreHannibalTalk
            EVENT FlagChapter09_HannibalNotRecruited, EventChapter09HannibalNotRecruited
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch09Grutia
          CHECK_FLAG_SET FlagChapter09_KapathogiaSeizedCheck
            EVENT FlagChapter09_GrutiaSpawn, EventChapter09GrutiaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch09Thracia
          CHECK_FLAG_SET FlagChapter09_GrutiaSeizedCheck
            EVENT FlagChapter09_ThraciaSpawn, EventChapter09ThraciaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch09Thracia
          CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter09_PlayerNearThracia, FlagChapter09_ThraciaSpawn]
            CHECK_FLAG_UNSET FlagChapter09_ArionDiedCheck
              EVENT FlagChapter09_ArionCharge, EventChapter09ArionCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter09_GrutiaSeizedCheck, FlagChapter09_CoirpreHannibalTalk, FlagChapter09_CharlotHannibalAdjacentCheck]
          EVENT FlagChapter09_CharlotHannibalAdjacent, EventChapter09CharlotHannibalAdjacent
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter09_CharlotHannibalAdjacentCheck
          CHECK_FLAG_UNSET FlagChapter09_CharlotHannibalAdjacent
            UNSET_FLAG FlagChapter09_CharlotHannibalAdjacentCheck
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter09ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter09ClearTalksIfMarriedTable ; 86/F861

        .byte Altena, AdultFinn
        .byte Altena, Hannibal
        .byte Patty, Coirpre
        .byte Daisy, Coirpre
        .byte Patty, Charlot
        .byte Daisy, Charlot
        .word $FFFF

    .endsection Chapter09EventsSection

    .section Chapter09EventDataSection

      aChapter09EventData ; 86/F86F

        .structChapterEventData aChapter09LocationData, aChapter09MapChangeData, aUnknown86F92D, aChapter09TalkEvents, None

      aChapter09LocationData ; 86/F879

        .byte size(aChapter09LocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/Chapter09LocationData.csv.asm"

      aChapter09MeathCastle ; 86/F890

        .structChapterCastleLocationEntry Ch09_Meath, MeathName, [52, 2], $FC, aChapter09ShopData

      aChapter09KapathogiaCastle ; 86/F898

        .structChapterCastleLocationEntry Ch09_Kapathogia, KapathogiaName, [32, 17], $FC, None

      aChapter09LutheciaCastle ; 86/F8A0

        .structChapterCastleLocationEntry Ch09_Luthecia, LutheciaName, [10, 27], $FC, None

      aChapter09GrutiaCastle ; 86/F8A8

        .structChapterCastleLocationEntry Ch09_Grutia, GrutiaName, [18, 54], $FC, None

      aChapter09ThraciaCastle ; 86/F8B0

        .structChapterCastleLocationEntry Ch09_Thracia, ThraciaName, [52, 41], $00, None

      aChapter09Village1 ; 86/F8B8

        .structChapterVillageLocationEntry Ch09_Village1, [12, 7]

      aChapter09Village2 ; 86/F8BD

        .structChapterVillageLocationEntry Ch09_Village2, [12, 5]

      aChapter09Village3 ; 86/F8C2

        .structChapterVillageLocationEntry Ch09_Village3, [12, 3]

      aChapter09Village4 ; 86/F8C7

        .structChapterVillageLocationEntry Ch09_Village4, [9, 7]

      aChapter09VillageBarrierRing ; 86/F8CC

        .structChapterVillageLocationEntry Ch09_VillageBarrierRing, [9, 5]

      aChapter09Village5 ; 86/F8D1

        .structChapterVillageLocationEntry Ch09_Village5, [9, 3]

      aChapter09ShopData ; 86/F8D6

        .byte PI_SteelSword3
        .byte PI_SilverSword2
        .byte PI_SlimSword3
        .byte PI_EarthSword
        .byte PI_Wingclipper1
        .byte PI_SilverLance1
        .byte PI_SilverLance2
        .byte PI_Javelin1
        .byte PI_Javelin2
        .byte PI_SilverBow1
        .byte PI_Elfire
        .byte PI_Elwind
        .byte PI_WarpStaff
        .byte PI_RestoreStaff
        .byte PI_Wind2
        .word $FFFF

      aChapter09MapChangeData ; 86/F8E7

        .structChapterMapChangeEntry Chapter09, FlagChapter09_SetRamparts, [5, 6],   aChapter09MapChangeTopLeftRampart
        .structChapterMapChangeEntry Chapter09, FlagChapter09_SetRamparts, [18, 51], aChapter09MapChangeGrutiaTopRampart
        .structChapterMapChangeEntry Chapter09, FlagChapter09_SetRamparts, [17, 57], aChapter09MapChangeGrutiaBottomRampart
        .structChapterMapChangeEntry Chapter09, FlagChapter09_RemoveRamparts, [24, 54], aChapter09MapChangeGrutiaRightRampart
        .word $FFFF

      aChapter09MapChangeTopLeftRampart ; 86/F905

        .byte 2
        .byte 2

        .word $0069, $00AE
        .word $033A, $033B

      aChapter09MapChangeGrutiaTopRampart ; 86/F90F

        .byte 1
        .byte 2

        .word $0122
        .word $0362

      aChapter09MapChangeGrutiaBottomRampart ; 86/F915

        .byte 2
        .byte 3

        .word $01BC, $05BD
        .word $01DC, $06B7
        .word $00AF, $0221

      aChapter09MapChangeGrutiaRightRampart ; 86/F923

        .byte 1
        .byte 4

        .word $0A30
        .word $0650
        .word $04AD
        .word $08AD

      aUnknown86F92D ; 86/F92D

        .word <>aUnknown86F931
        .word <>aUnknown86F941

      aUnknown86F931 ; 86/F931

        .word $021E
        .word $0220
        .word $0221
        .word $0223
        .word $0224
        .word $0225
        .word $0226
        .word $FFFF

      aUnknown86F941 ; 86/F941

        .word $021F
        .word $0220
        .word $0222
        .word $0223
        .word $0224
        .word $0225
        .word $0226
        .word $FFFF

      aChapter09TalkEvents ; 86/F951

        .structChapterTalkEventEntry Chapter09, FlagChapter09_LeifAltenaTalkCheck, Leif, Altena
        .structChapterTalkEventEntry Chapter09, FlagChapter09_CoirpreHannibalTalkCheck, Coirpre, Hannibal
        .structChapterTalkEventEntry Chapter09, FlagChapter09_CoirpreHannibalTalkCheck, Charlot, Hannibal
        .structChapterTalkEventEntry Chapter09, FlagChapter09_SeliphAltenaTalkCheck, Seliph, Altena
        .structChapterTalkEventEntry Chapter09, FlagChapter09_SeliphAltenaTalkCheck, Altena, Seliph
        .word $FFFF

      aFactionGroupData31 ; 86/F97B

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData31._Locations, None

        _Locations ; 86/F984
        .word Ch09_Meath
        .word $FFFF

      aFactionGroupData32 ; 86/F988

        .structFactionGroupData FactionKapathogia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData32._Locations, aFactionGroupData32._GroupAI

        _Locations ; 86/F991
        .word Ch09_Kapathogia
        .word $FFFF

        _GroupAI ; 86/F995
        .long aFactionGroup32AI1
        .long aFactionGroup32AI2
        .word $FFFF

      aFactionGroupData33 ; 86/F99D

        .structFactionGroupData FactionLuthecia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData33._Locations, aFactionGroupData33._GroupAI

        _Locations ; 86/F9A6
        .word Ch09_Luthecia
        .word $FFFF

        _GroupAI ; 86/F9AA
        .long aFactionGroup33AI1
        .long aFactionGroup33AI2
        .long aFactionGroup33AI3
        .word $FFFF

      aFactionGroupData34 ; 86/F9B5

        .structFactionGroupData FactionGrutia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData34._Locations, aFactionGroupData34._GroupAI

        _Locations ; 86/F9BE
        .word Ch09_Grutia
        .word $FFFF

        _GroupAI ; 86/F9C2
        .long aFactionGroup34AI1
        .long aFactionGroup34AI2
        .long aFactionGroup34AI3
        .long aFactionGroup34AI4
        .word $FFFF

      aFactionGroupData35 ; 86/F9D0

        .structFactionGroupData FactionThracia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData35._Locations, aFactionGroupData35._GroupAI

        _Locations ; 86/F9D9
        .word Ch09_Thracia
        .word $FFFF

        _GroupAI ; 86/F9DD
        .long aFactionGroup35AI1
        .long aFactionGroup35AI2
        .long aFactionGroup35AI3
        .long aFactionGroup35AI4
        .long aFactionGroup35AI5
        .long aFactionGroup35AI6
        .long aFactionGroup35AI7
        .word $FFFF

      aFactionGroup32AI1 ; 86/F9F4

        AI_SET_FORMATION $02, $01
        AI_SET_IGNORED_GENERATION_ID GEN_ID_Charlot_Coirpre
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, FlagChapter09_HannibalCharge, +

          AI_0A
          AI_END

        +
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup32AI2 ; 86/FA0C

        AI_07 Ch09_Kapathogia, $04
        AI_END

      aFactionGroup33AI1 ; 86/FA10

        AI_07 Ch09_Luthecia, $04
        AI_END

      aFactionGroup33AI2 ; 86/FA14

        AI_0A
        AI_END

      aFactionGroup33AI3 ; 86/FA16

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup34AI1 ; 86/FA19

        AI_END

      aFactionGroup34AI2 ; 86/FA1A

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup34AI3 ; 86/FA1C

        AI_0B
        AI_END

      aFactionGroup34AI4 ; 86/FA1E

        AI_07 Ch09_Grutia, $04
        AI_END

      aFactionGroup35AI1 ; 86/FA22

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, FlagChapter09_AltenaRespawn, ++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, FlagChapter09_LeifAltenaTalk, +

            AI_06 Ch09_Meath, $01
            AI_TARGET_ALL_FOES
            AI_END

          +
          AI_12
          AI_END

        +
        AI_02 $03
        AI_INTERACT_WITH_UNIT Seliph, $0C
        AI_END

      aFactionGroup35AI2 ; 86/FA41

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI3 ; 86/FA48

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Luthecia, $01
        AI_06 Ch09_Kapathogia, $01
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI4 ; 86/FA5E

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Kapathogia, $01
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI5 ; 86/FA71

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI6 ; 86/FA81

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_SET_FORMATION $03, $00
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, FlagChapter09_PlayerNearThracia, +

          AI_0B
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI7 ; 86/FA96

        AI_07 Ch09_Thracia, $04
        AI_END

    .endsection Chapter09EventDataSection
