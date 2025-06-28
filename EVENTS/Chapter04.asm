
    .weak

      FlagChapter04_TofaSeized                      :=  0
      FlagChapter04_SilesseSeized                   :=  1
      FlagChapter04_ZaxonSeized                     :=  2
      FlagChapter04_CuvuliCharge                    :=  3
      FlagChapter04_DaccarAndreyPreparing           :=  4
      FlagChapter04_RaiseBridgeTriggered            :=  5
      FlagChapter04_LowerBridgeTriggered            :=  6
      FlagChapter04_PamelaSpawn                     :=  7
      FlagChapter04_AnnandSpawn                     :=  8
      FlagChapter04_AnnandPamelaCloseByTalk         :=  9

      FlagChapter04_AndreySpawn                     := 11
      FlagChapter04_AnnandDeathAndreyResponse       := 12
      FlagChapter04_AnnandDeathPlayerResponses      := 13

      FlagChapter04_ZaxonSpawn                      := 15
      FlagChapter04_DonovanSpawn                    := 16

      FlagChapter04_SilesseSeizedDaccarResponse     := 18

      FlagChapter04_LamiaCharge                     := 23
      FlagChapter04_CuvuliBattleQuote               := 24
      FlagChapter04_DithorbaBattleQuote             := 25
      FlagChapter04_MyosBattleQuote                 := 26
      FlagChapter04_AnnandZaxonBattleQuote          := 27
      FlagChapter04_PamelaBattleQuote               := 28
      FlagChapter04_AndreySilesseBattleQuote        := 29
      FlagChapter04_DonovanBattleQuote              := 30
      FlagChapter04_DaccarBattleQuote               := 31
      FlagChapter04_LamiaBattleQuote                := 32
      FlagChapter04_LewynSilesseVisit               := 33
      FlagChapter04_SilesseSeizedByZaxon            := 34

      FlagChapter04_PamelaOnMountainBelowSafeguard  := 36

      FlagChapter04_AnnandPamelaCloseBy             := 38
      FlagChapter04_AnnandDied                      := 39
      FlagChapter04_PamelaDied                      := 40
      FlagChapter04_LewynAlive                      := 41
      FlagChapter04_ErinysAlive                     := 42

      FlagChapter04_RaiseBridge                     := 44
      FlagChapter04_LowerBridge                     := 45
      FlagChapter04_PlayerBeforeBridge              := 46
      FlagChapter04_PlayerPastBridge                := 47
      FlagChapter04_DewAtBridge                     := 48

      FlagChapter04_Unknown51                       := 51
      FlagChapter04_LamiaDied                       := 52

      FlagChapter04_DaccarDied                      := 55
      FlagChapter04_ErinysSilviaAdjacent            := 56
      FlagChapter04_ErinysSilviaAdjacentEvent       := 57
      FlagChapter04_LewynMyosBattleQuote            := 58
      FlagChapter04_LewynDaccarBattleQuote          := 59
      FlagChapter04_ErinysDithorbaBattleQuote       := 60
      FlagChapter04_ErinysPamelaBattleQuote         := 61
      FlagChapter04_LewynPamelaBattleQuote          := 62
      FlagChapter04_EdainLoverTalkSet               := 63

      FS_Player                                     :=  0
      FS_Ch04Civilians                              :=  1
      FS_Ch04Tofa                                   :=  2
      FS_Ch04Zaxon                                  :=  3
      FS_Ch04Silesse                                :=  4

    .endweak

    .section Chapter04EventsSection

      aChapter04EventHeader ; 86/D815

        .word Chapter04
        .long aChapter04OpeningEvent
        .long aChapter04MapEvents

      aChapter04OpeningEvent ; 86/D81D

        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter04Start

        LOAD_FACTION_GROUP FS_Player, FG_Ch04Sigurd
        LOAD_FACTION_GROUP FS_Ch04Civilians, FG_Ch04Civilians
        LOAD_FACTION_GROUP FS_Ch04Tofa, FG_Ch04Tofa
        LOAD_FACTION_GROUP FS_Ch04Zaxon, FG_Ch04Zaxon
        LOAD_FACTION_GROUP FS_Ch04Silesse, FG_Ch04Silesse

        macroSetFactionsAllies  [FS_Player,       FS_Ch04Civilians]
        macroSetFactionsEnemies [FS_Player,       FS_Ch04Tofa]
        macroSetFactionsEnemies [FS_Player,       FS_Ch04Zaxon]
        macroSetFactionsNeutral [FS_Player,       FS_Ch04Silesse]
        macroSetFactionsNeutral [FS_Ch04Tofa,     FS_Ch04Civilians]
        macroSetFactionsAllies  [FS_Ch04Tofa,     FS_Ch04Zaxon]
        macroSetFactionsNeutral [FS_Ch04Tofa,     FS_Ch04Silesse]
        macroSetFactionsEnemies [FS_Ch04Zaxon,    FS_Ch04Civilians]
        macroSetFactionsEnemies [FS_Ch04Zaxon,    FS_Ch04Silesse]
        macroSetFactionsNeutral [FS_Ch04Silesse,  FS_Ch04Civilians]

        CHECK_UNIT_ALIVE Lewyn
          SET_FLAG FlagChapter04_LewynAlive
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE Erinys
          SET_FLAG FlagChapter04_ErinysAlive
        BREAK_STATE_CHECKS

        UNDEPLOY_UNIT Quan
        UNDEPLOY_UNIT Ethlyn
        UNDEPLOY_UNIT Finn

        EVENT FlagAlways, EventChapter04Opening

        END_CHAPTER_EVENTS

      aChapter04MapEvents ; 86/D875

        CHECK_SEIZING_CASTLE FlagChapter04_TofaSeized, FS_Player, Ch04_Tofa
          EVENT FlagAlways, EventChapter04TofaSeized

        CHECK_SEIZING_CASTLE FlagChapter04_SilesseSeized, FS_Player, Ch04_Silesse
          EVENT FlagAlways, EventChapter04SilesseSeized

        CHECK_SEIZING_CASTLE FlagChapter04_ZaxonSeized, FS_Player, Ch04_Zaxon
          EVENT FlagAlways, EventChapter04Ending

        CHECK_SEIZING_CASTLE FlagChapter04_SilesseSeizedByZaxon, FS_Ch04Zaxon, Ch04_Silesse
          EVENT FlagAlways, EventChapter04AndreyLeave

        CHECK_ENTERING_CASTLE_MENU FlagChapter04_LewynSilesseVisit, Lewyn, Ch04_Silesse
          EVENT FlagAlways, EventChapter04LewynSilesseVisit

        CHECK_UNIT_IN_AREA FlagChapter04_PlayerBeforeBridge, AnyCharacter, pack([44, 1]), pack([53, 13]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter04_PlayerBeforeBridge, AnyCharacter, pack([44, 14]), pack([51, 16]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter04_PlayerBeforeBridge, AnyCharacter, pack([45, 17]), pack([46, 17]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter04_PlayerPastBridge, AnyCharacter, pack([54, 5]), pack([62, 17]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter04_PlayerPastBridge, AnyCharacter, pack([54, 11]), pack([62, 12]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter04_DewAtBridge, Dew, pack([53, 11]), pack([53, 11]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter04_DewAtBridge, Dew, pack([55, 11]), pack([55, 11]), FS_Player
          EC_NOP_00

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter04_AnnandPamelaCloseBy, Pamela, Annand, 9
          EVENT FlagChapter04_AnnandPamelaCloseByTalk, EventChapter04AnnandPamelaCloseByTalk

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter04_AnnandPamelaCloseBy, Annand, Pamela, 9
          EVENT FlagChapter04_AnnandPamelaCloseByTalk, EventChapter04AnnandPamelaCloseByTalk

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter04_ErinysSilviaAdjacent, Erinys, Silvia, 1
          EC_NOP_00

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter04_ErinysSilviaAdjacent, Silvia, Erinys, 1
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter04_AnnandDied, Annand
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter04_PamelaDied, Pamela
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter04_LamiaDied, Lamia
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter04_DaccarDied, Daccar
          EC_NOP_00

        CHECK_TALK FlagAlways, Sigurd, Claud
          EVENT FlagAlways, EventChapter04SigurdClaudTalk

        CHECK_TALK FlagAlways, Tailtiu, Azelle
          EVENT FlagAlways, EventChapter04TailtiuAzelleTalk

        CHECK_TALK FlagAlways, Edain, Jamke
          EVENT FlagAlways, EventChapter04EdainJamkeTalk

        CHECK_TALK FlagAlways, Edain, Midir
          EVENT FlagAlways, EventChapter04EdainMidirTalk

        CHECK_TALK FlagAlways, Edain, Azelle
          EVENT FlagAlways, EventChapter04EdainAzelleTalk

        CHECK_TALK FlagAlways, Silvia, Claud
          EVENT FlagAlways, EventChapter04SilviaClaudTalk

        CHECK_TALK FlagAlways, Lewyn, Sigurd
          EVENT FlagAlways, EventChapter04LewynSigurdTalk

        CHECK_TALK FlagAlways, Erinys, Lewyn
          EVENT FlagAlways, EventChapter04ErinysLewynTalk

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 0
          EVENT FlagAlways, EventChapter04CivilianRescuedA

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 1
          EVENT FlagAlways, EventChapter04CivilianRescuedA

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 2
          EVENT FlagAlways, EventChapter04CivilianRescuedA

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 3
          EVENT FlagAlways, EventChapter04CivilianRescuedB

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 4
          EVENT FlagAlways, EventChapter04CivilianRescuedB

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 5
          EVENT FlagAlways, EventChapter04CivilianRescuedB

        VISIT_VILLAGE FlagAlways, Silvia, Ch04_VillageSafeguard
          EVENT FlagAlways, EventChapter04VillageSafeguardSilvia

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_Village7
          EVENT FlagAlways, EventChapter04Village7

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_Village4
          EVENT FlagAlways, EventChapter04Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_Village5
          EVENT FlagAlways, EventChapter04Village5

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_Village3
          EVENT FlagAlways, EventChapter04Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_Village2
          EVENT FlagAlways, EventChapter04Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_VillageSafeguard
          EVENT FlagAlways, EventChapter04VillageSafeguardAnyone

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_Village6
          EVENT FlagAlways, EventChapter04Village6

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch04_Village1
          EVENT FlagAlways, EventChapter04Village1

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lewyn, AnyFactionSlot, Myos
          SET_PRECOMBAT_DIALOGUE FlagChapter04_LewynMyosBattleQuote, dialogueChapter04LewynMyosBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lewyn, AnyFactionSlot, Daccar
          SET_PRECOMBAT_DIALOGUE FlagChapter04_LewynDaccarBattleQuote, dialogueChapter04LewynDaccarBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Erinys, AnyFactionSlot, Dithorba
          SET_PRECOMBAT_DIALOGUE FlagChapter04_ErinysDithorbaBattleQuote, dialogueChapter04ErinysDithorbaBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Erinys, AnyFactionSlot, Pamela
          SET_PRECOMBAT_DIALOGUE FlagChapter04_ErinysPamelaBattleQuote, dialogueChapter04ErinysPamelaBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lewyn, AnyFactionSlot, Pamela
          SET_PRECOMBAT_DIALOGUE FlagChapter04_LewynPamelaBattleQuote, dialogueChapter04LewynPamelaBattleQuote, $43

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Cuvuli
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_CuvuliBattleQuote, dialogueChapter04CuvuliBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Dithorba
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_DithorbaBattleQuote, dialogueChapter04DithorbaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Myos
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_MyosBattleQuote, dialogueChapter04MyosBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Ch04Zaxon, AnyCharacter, AnyFactionSlot, Annand
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_AnnandZaxonBattleQuote, dialogueChapter04ZaxonAnnandBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Pamela
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_PamelaBattleQuote, dialogueChapter04PamelaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Ch04Silesse, AnyCharacter, AnyFactionSlot, AndreyCh04
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_AndreySilesseBattleQuote, dialogueChapter04SilesseAndreyBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Donovan
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_DonovanBattleQuote, dialogueChapter04DonovanBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Daccar
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_DaccarBattleQuote, dialogueChapter04DaccarBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Lamia
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter04_LamiaBattleQuote, dialogueChapter04LamiaBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter04_DaccarBattleQuote
          CHECK_FLAG_SET FlagChapter04_LewynMyosBattleQuote
            SET_FLAG FlagChapter04_DaccarBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter04_MyosBattleQuote
          CHECK_FLAG_SET FlagChapter04_LewynDaccarBattleQuote
            SET_FLAG FlagChapter04_MyosBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter04_DithorbaBattleQuote
          CHECK_FLAG_SET FlagChapter04_ErinysDithorbaBattleQuote
            SET_FLAG FlagChapter04_DithorbaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter04_PamelaBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter04_ErinysPamelaBattleQuote, FlagChapter04_LewynPamelaBattleQuote]
            SET_FLAG FlagChapter04_PamelaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Tofa, 3, AnyCharacter
          EVENT FlagChapter04_CuvuliCharge, EventChapter04CuvuliCharge
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch04Zaxon
          EVENT FlagChapter04_DaccarAndreyPreparing, EventChapter04DaccarAndreyPreparing
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Tofa
          CHECK_FLAG_SET FlagChapter04_PlayerBeforeBridge
            CHECK_FLAG_UNSET FlagChapter04_PlayerPastBridge
              CHECK_FLAG_UNSET FlagChapter04_TofaSeized
                EVENT FlagChapter04_RaiseBridgeTriggered, EventChapter04RaiseBridge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter04_DewAtBridge, FlagChapter04_RaiseBridgeTriggered]
          EVENT FlagChapter04_LowerBridgeTriggered, EventChapter04LowerBridge
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Zaxon
          CHECK_FLAG_SET FlagChapter04_PamelaSpawn
            EVENT FlagChapter04_AndreySpawn, EventChapter04AndreySpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Zaxon
          CHECK_FLAG_SET FlagChapter04_TofaSeized
            EVENT FlagChapter04_PamelaSpawn, EventChapter04PamelaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Silesse
          CHECK_FLAG_SET FlagChapter04_TofaSeized
            EVENT FlagChapter04_AnnandSpawn, EventChapter04AnnandSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Zaxon
          CHECK_FLAG_SET FlagChapter04_AnnandDied
            EVENT FlagChapter04_AnnandDeathAndreyResponse, EventChapter04AnnandDeathAndreyResponse
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter04_AnnandDeathPlayerResponses
          CHECK_FLAG_SET FlagChapter04_AnnandDied
            CHECK_UNIT_ALIVE Lewyn
              SET_FLAG FlagChapter04_LewynAlive
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter04_AnnandDeathPlayerResponses
          CHECK_FLAG_SET FlagChapter04_AnnandDied
            CHECK_UNIT_ALIVE Erinys
              SET_FLAG FlagChapter04_ErinysAlive
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter04_AnnandDied
            EVENT FlagChapter04_AnnandDeathPlayerResponses, EventChapter04AnnandDeathPlayerResponses
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Zaxon, 8, AnyCharacter
          CHECK_FLAG_SET FlagChapter04_ZaxonSpawn
            EVENT FlagChapter04_DonovanSpawn, EventChapter04DonovanSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter04_SilesseSeizedByZaxon
            EVENT FlagChapter04_ZaxonSpawn, EventChapter04ZaxonSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Zaxon
          CHECK_FLAG_SET FlagChapter04_SilesseSeized
            CHECK_FLAG_UNSET FlagChapter04_DaccarDied
              EVENT FlagChapter04_SilesseSeizedDaccarResponse, EventChapter04SilesseSeizedDaccarResponse
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch04Zaxon, 8, AnyCharacter
          CHECK_FLAG_SET FlagChapter04_SilesseSeized
            CHECK_FLAG_UNSET FlagChapter04_DaccarDied
              CHECK_FLAG_UNSET FlagChapter04_LamiaDied
                EVENT FlagChapter04_LamiaCharge, EventChapter04LamiaCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_UNITS_MARRIED Lewyn, AnyCharacter
          SET_FLAG FlagChapter04_ErinysSilviaAdjacentEvent
        BREAK_STATE_CHECKS

        CHECK_UNITS_MARRIED Erinys, AnyCharacter
          SET_FLAG FlagChapter04_ErinysSilviaAdjacentEvent
        BREAK_STATE_CHECKS

        CHECK_UNITS_MARRIED Silvia, AnyCharacter
          SET_FLAG FlagChapter04_ErinysSilviaAdjacentEvent
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter04_ErinysSilviaAdjacent
          CHECK_UNIT_ALIVE Lewyn
            EVENT FlagChapter04_ErinysSilviaAdjacentEvent, EventChapter04ErinysSilviaAdjacent
        BREAK_STATE_CHECKS

        SET_TALK_TARGET_IF_MARRIED FlagChapter04_EdainLoverTalkSet, Edain, Jamke
        SET_TALK_TARGET_IF_MARRIED FlagChapter04_EdainLoverTalkSet, Edain, Midir
        SET_TALK_TARGET_IF_MARRIED FlagChapter04_EdainLoverTalkSet, Edain, Azelle

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter04ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter04ClearTalksIfMarriedTable ; 86/DC71

        .byte Azelle, Tailtiu
        .byte Silvia, Claud
        .byte Lewyn, Erinys
        .word $FFFF

    .endsection Chapter04EventsSection

    .section Chapter04EventDataSection

      aChapter04EventData ; 86/DC79

        .structChapterEventData aChapter04LocationData, aChapter04MapChangeData, aUnknown86DD01, None, aUnknown86DDA3

      aChapter04LocationData ; 86/DC83

        .byte size(aChapter04LocationData._Entries) / size(word)
  
        _Entries .include "../TABLES/CHAPTER/Chapter04LocationData.csv.asm"

      aChapter04SailaneCastle ; 86/DC9C

        .structChapterCastleLocationEntry Ch04_Sailane, SailaneName, [5, 39], $FC, aChapter04ShopData

      aChapter04TofaCastle ; 86/DCA4

        .structChapterCastleLocationEntry Ch04_Tofa, TofaName, [59, 7], $FC, None

      aChapter04SilesseCastle ; 86/DCAC

        .structChapterCastleLocationEntry Ch04_Silesse, SilesseName, [28, 58], $FC, None

      aChapter04ZaxonCastle ; 86/DCB4

        .structChapterCastleLocationEntry Ch04_Zaxon, ZaxonName, [59, 43], $00, None

      aChapter04Village1 ; 86/DCBC

        .structChapterVillageLocationEntry Ch04_Village1, [47, 8]

      aChapter04VillageSafeguard ; 86/DCC1

        .structChapterVillageLocationEntry Ch04_VillageSafeguard, [39, 10]

      aChapter04Village2 ; 86/DCC6

        .structChapterVillageLocationEntry Ch04_Village2, [30, 14]

      aChapter04Village3 ; 86/DCCB

        .structChapterVillageLocationEntry Ch04_Village3, [26, 14]

      aChapter04Village4 ; 86/DCD0

        .structChapterVillageLocationEntry Ch04_Village4, [18, 21]

      aChapter04Village5 ; 86/DCD5

        .structChapterVillageLocationEntry Ch04_Village5, [23, 27]

      aChapter04Village6 ; 86/DCDA

        .structChapterVillageLocationEntry Ch04_Village6, [35, 30]

      aChapter04Village7 ; 86/DCDF

        .structChapterVillageLocationEntry Ch04_Village7, [22, 37]

      aChapter04ShopData ; 86/DCE4

        .byte PI_Wind1
        .byte PI_RecoverStaff1
        .byte PI_ReturnBand2
        .word $FFFF

      aChapter04MapChangeData ; 86/DCE9

        .structChapterMapChangeEntry Chapter04, FlagChapter04_RaiseBridge, [54, 11], aChapter04MapChangeRaiseBridge
        .structChapterMapChangeEntry Chapter04, FlagChapter04_LowerBridge, [54, 11], aChapter04MapChangeLowerBridge
        .word $FFFF

      aChapter04MapChangeRaiseBridge ; 86/DCF9

        .byte 1
        .byte 1

        .word $031E

      aChapter04MapChangeLowerBridge ; 86/DCFD
      
        .byte 1
        .byte 1

        .word $00BD

      aUnknown86DD01 ; 86/DD01

        .word <>aUnknown86DD05
        .word <>aUnknown86DD15

      aUnknown86DD05 ; 86/DD05

        .word $01FB
        .word $01FC
        .word $01FE
        .word $01FF
        .word $0201
        .word $0202
        .word $0203
        .word $FFFF

      aUnknown86DD15 ; 86/DD15

        .word $01FB
        .word $01FD
        .word $01FE
        .word $0200
        .word $0201
        .word $0202
        .word $0203
        .word $FFFF

      aFactionGroupData15 ; 86/DD25

        .structFactionGroupData FactionSigurd, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData15._Locations, None

        _Locations ; 86/DD2E
        .word Ch04_Sailane
        .word $FFFF

      aFactionGroupData16 ; 86/DD32

        .structFactionGroupData FactionTofa, BattleHUDColorGreen, BattleBannerSilesse, None, aFactionGroupData16._Locations, aFactionGroupData16._GroupAI

        _Locations ; 86/DD3B
        .word Ch04_Tofa
        .word $FFFF

        _GroupAI ; 86/DD3F
        .long aFactionGroup16AI1
        .long aFactionGroup16AI2
        .long aFactionGroup16AI3
        .long aFactionGroup16AI4
        .long aFactionGroup16AI5
        .long aFactionGroup16AI6
        .long aFactionGroup16AI7
        .word $FFFF

      aFactionGroupData17 ; 86/DD56

        .structFactionGroupData FactionZaxon, BattleHUDColorGreen, BattleBannerSilesse, None, aFactionGroupData17._Locations, aFactionGroupData17._GroupAI

        _Locations ; 86/DD5F
        .word Ch04_Zaxon
        .word $FFFF

        _GroupAI ; 86/DD63
        .long aFactionGroup17AI1
        .long aFactionGroup17AI2
        .long aFactionGroup17AI3
        .long aFactionGroup17AI4
        .long aFactionGroup17AI5
        .long aFactionGroup17AI6
        .long aFactionGroup17AI7
        .long aFactionGroup17AI8
        .word $FFFF

      aFactionGroupData18 ; 86/DD7D

        .structFactionGroupData FactionSilesse, BattleHUDColorGreen, BattleBannerSilesse, None, aFactionGroupData18._Locations, aFactionGroupData18._GroupAI

        _Locations ; 86/DD86
        .word Ch04_Silesse
        .word $FFFF

        _GroupAI ; 86/DD8A
        .long aFactionGroup18AI1
        .long aFactionGroup18AI2
        .long aFactionGroup18AI3
        .word $FFFF

      aFactionGroupData19 ; 86/DD95

        .structFactionGroupData $FF, BattleHUDColorGreen, BattleBannerDefault, None, None, aFactionGroupData19._GroupAI

        _GroupAI
        .long aFactionGroup19AI1
        .word $FFFF

      aUnknown86DDA3 ; 86/DDA3

        .word $FFFF
        .word $0204
        .word $FFFF
        .word $0704
        .word $0804

      aFactionGroup16AI1 ; 86/DDAD

        AI_07 Ch04_Tofa, $04
        AI_END

      aFactionGroup16AI2 ; 86/DDB1

        AI_0A
        AI_END

      aFactionGroup16AI3 ; 86/DDB3

        AI_SET_FORMATION $0C, $03
        AI_06 Ch04_Sailane, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup16AI4 ; 86/DDBB

        AI_0B
        AI_END

      aFactionGroup16AI5 ; 86/DDBD

        AI_0B
        AI_END

      aFactionGroup16AI6 ; 86/DDBF

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup16AI7 ; 86/DDC2

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT floor(0.9 * 256)
        AI_SET_FORMATION $03, $02
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_06 Ch04_Sailane, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup17AI1 ; 86/DDCE

        AI_07 Ch04_Zaxon, $05
        AI_END

      aFactionGroup17AI2 ; 86/DDD2

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.7 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_SET_FORMATION $02, $03
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter04, FlagChapter04_SilesseSeized, +

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter04, FlagChapter04_PamelaOnMountainBelowSafeguard, +++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter04, FlagChapter04_AnnandDied, ++

        +
        AI_06 Ch04_Silesse, $01
        AI_TARGET_ALL_FOES
        AI_END

        +
        AI_FLAG_IF_LEADER_ON_COORDS Chapter04, FlagChapter04_PamelaOnMountainBelowSafeguard, [47, 24]

        +
        AI_06 Ch04_Tofa, $00
        AI_06 Ch04_Silesse, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup17AI3 ; 86/DE02

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT floor(0.9 * 256)
        AI_SET_FORMATION $09, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter04, FlagChapter04_AnnandDied, +

          AI_TARGET_ALL_FOES
          AI_END

        +
        AI_06 Ch04_Silesse, $01
        AI_END

      aFactionGroup17AI4 ; 86/DE15

        AI_07 Ch04_Silesse, $04
        AI_END

      aFactionGroup17AI5 ; 86/DE19

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup17AI6 ; 86/DE1B

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup17AI7 ; 86/DE1D

        AI_0B
        AI_END

      aFactionGroup17AI8 ; 86/DE1F

        AI_SET_FORMATION $02, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter04, FlagChapter04_SilesseSeized, +

          AI_0A
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup18AI1 ; 86/DE2E

        AI_END

      aFactionGroup18AI2 ; 86/DE2F

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $02, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup18AI3 ; 86/DE36

        AI_07 Ch04_Silesse, $04
        AI_END

      aFactionGroup19AI1 ; 86/DE3A

        AI_FLAG_IF_LEADER_ON_COORDS Chapter04, FlagChapter04_Unknown51, [9, 34]
        AI_END

    .endsection Chapter04EventDataSection
