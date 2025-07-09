
    .weak

      FlagChapter03_MadinoSeized                        :=  0
      FlagChapter03_SylvaleSeized                       :=  1
      FlagChapter03_OrgahilSeized                       :=  2
      FlagChapter03_Unknown3                            :=  3
      FlagChapter03_SylvaleSpawn                        :=  4

      FlagChapter03_EldiganGone                         := 10
      FlagChapter03_ThraciaSpawn                        := 11

      FlagChapter03_TravantLeave                        := 13
      FlagChapter03_Unknown14                           := 14
      FlagChapter03_ClaudTailiuSpawn                    := 15
      FlagChapter03_OrgahilSpawn                        := 16

      FlagChapter03_LachesisEldiganTalk                 := 23
      FlagChapter03_SigurdEldiganBattleQuote            := 24
      FlagChapter03_BrigidDuvallBattleQuote             := 25
      FlagChapter03_LachesisChagallBattleQuote          := 26
      FlagChapter03_JacobiBattleQuote                   := 27
      FlagChapter03_EldiganBattleQuote                  := 28
      FlagChapter03_ChagallBattleQuote                  := 29
      FlagChapter03_PapilioBattleQuote                  := 30
      FlagChapter03_DuvallBattleQuote                   := 31
      FlagChapter03_PizarreBattleQuote                  := 32
      FlagChapter03_PapilioDied                         := 33
      FlagChapter03_EldiganDied                         := 34

      FlagChapter03_SigurdEldiganCloseBy                := 37
      FlagChapter03_BridgeLowered                       := 38

      FlagChapter03_LachesisEldiganBattleQuote          := 40
      FlagChapter03_ChagallDied                         := 41
      FlagChapter03_SigurdChagallBattleQuote            := 42
      FlagChapter03_SylvaleCommanderTalk                := 43
      FlagChapter03_DewOnBragiTower                     := 44
      FlagChapter03_SigurdChagallBattleQuoteAddition    := 45
      FlagChapter03_LachesisChagallBattleQuoteAddition  := 46
      ; Last 2 flags seem redundant, may have been used for
      ; other stuff earlier in development.

      FS_Player                                         :=  0
      FS_Ch03Sylvale                                    :=  1
      FS_Ch03Madino                                     :=  2
      FS_Ch03Orgahil                                    :=  3
      FS_Ch03DozelFriege                                :=  4

    .endweak

    .section Chapter03EventsSection

      aChapter03EventHeader ; 86/D395

        .word Chapter03
        .long aChapter03OpeningEvent
        .long aChapter03MapEvents

      aChapter03OpeningEvent ; 86/D39D

        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter03Start

        LOAD_FACTION_GROUP FS_Player,       FG_Ch03Sigurd
        LOAD_FACTION_GROUP FS_Ch03Sylvale,  FG_Ch03Sylvale
        LOAD_FACTION_GROUP FS_Ch03Madino,   FG_Ch03Madino
        LOAD_FACTION_GROUP FS_Ch03Orgahil,  FG_Ch03Orgahil

        macroSetFactionsNeutral [FS_Player,       FS_Ch03Sylvale]
        macroSetFactionsEnemies [FS_Player,       FS_Ch03Madino]
        macroSetFactionsEnemies [FS_Player,       FS_Ch03Orgahil]
        macroSetFactionsNeutral [FS_Ch03Sylvale,  FS_Ch03Madino]
        macroSetFactionsNeutral [FS_Ch03Sylvale,  FS_Ch03Orgahil]
        macroSetFactionsAllies  [FS_Ch03Madino,   FS_Ch03Orgahil]

        DEPLOY_UNIT_GROUP UNITGroupChapter03Start

        SET_FLAG FlagChapter03_LachesisChagallBattleQuote
        SET_FLAG FlagChapter03_SigurdChagallBattleQuote

        EVENT FlagAlways, EventChapter03Opening

        END_CHAPTER_EVENTS

      aChapter03MapEvents ; 86/D3CF

        CHECK_SEIZING_CASTLE FlagChapter03_MadinoSeized, FS_Player, Ch03_Madino
          EVENT FlagChapter03_Unknown3, EventChapter03MadinoSeized

        CHECK_SEIZING_CASTLE FlagChapter03_SylvaleSeized, FS_Player, Ch03_Sylvale
          EVENT FlagChapter03_Unknown14, EventChapter03SylvaleSeized

        CHECK_SEIZING_CASTLE FlagChapter03_OrgahilSeized, FS_Player, Ch03_Orgahil
          EVENT FlagAlways, EventChapter03Ending

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter03_SigurdEldiganCloseBy, Sigurd, EldiganCh03, 9
          EVENT FlagAlways, EventChapter03EldiganApproachesSigurd

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter03_SigurdEldiganCloseBy, EldiganCh03, Sigurd, 9
          EVENT FlagAlways, EventChapter03SigurdApproachesEldigan

        CHECK_UNIT_DIED FlagChapter03_EldiganDied, EldiganCh03
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter03_PapilioDied, Papilio
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter03_ChagallDied, ChagallCh03
          SET_FLAG FlagChapter03_LachesisEldiganTalk

        CHECK_UNIT_DIED FlagAlways, Quan
          EVENT FlagAlways, EventChapter03QuanDied

        CHECK_UNIT_DIED FlagAlways, Ethlyn
          EVENT FlagAlways, EventChapter03EthlynDied

        CHECK_UNIT_DIED FlagAlways, Finn
          EVENT FlagAlways, EventChapter03FinnDied

        CHECK_TALK FlagChapter03_LachesisEldiganTalk, Lachesis, EldiganCh03
          EVENT FlagAlways, EventChapter03LachesisEldiganTalk

        CHECK_UNIT_IN_AREA FlagChapter03_DewOnBragiTower, Dew, pack([7, 16]), pack([7, 16]), FS_Player
          EVENT FlagAlways, EventChapter03DewBragiTower

        CHECK_TALK FlagChapter03_SylvaleCommanderTalk, AnyCharacter, SylvaleBlockadeCommanderLanceArmor
          EVENT FlagAlways, EventChapter03SylvaleCommanderTalk

        CHECK_TALK FlagAlways, Lex, Ayra
          EVENT FlagAlways, EventChapter03LexAyraTalk

        CHECK_TALK FlagAlways, Chulainn, Ayra
          EVENT FlagAlways, EventChapter03ChulainnAyraTalk

        CHECK_TALK FlagAlways, Sigurd, Brigid
          EVENT FlagAlways, EventChapter03SigurdBrigidTalk

        CHECK_TALK FlagAlways, Claud, Sigurd
          EVENT FlagAlways, EventChapter03ClaudSigurdTalk

        CHECK_TALK FlagAlways, Midir, Brigid
          EVENT FlagAlways, EventChapter03MidirBrigidTalk

        CHECK_TALK FlagAlways, Ethlyn, Quan
          EVENT FlagAlways, EventChapter03EthlynQuanTalk

        CHECK_TALK FlagAlways, Edain, Brigid
          EVENT FlagAlways, EventChapter03EdainBrigidTalk

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_Village1
          EVENT FlagAlways, EventChapter03Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_Village2
          EVENT FlagAlways, EventChapter03Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_VillageWingclipper
          EVENT FlagAlways, EventChapter03VillageWingclipper

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_Village3
          EVENT FlagAlways, EventChapter03Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_VillageStrength
          EVENT FlagAlways, EventChapter03VillageStrength

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_Village4
          EVENT FlagAlways, EventChapter03Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_VillageDefense
          EVENT FlagAlways, EventChapter03VillageDefense

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch03_VillageRestore
          EVENT FlagAlways, EventChapter03VillageRestore

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lachesis, AnyFactionSlot, EldiganCh03
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter03_LachesisEldiganBattleQuote, dialogueChapter03LachesisEldiganBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Sigurd, AnyFactionSlot, EldiganCh03
          SET_PRECOMBAT_DIALOGUE FlagChapter03_SigurdEldiganBattleQuote, dialogueChapter03SigurdEldiganBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Brigid, AnyFactionSlot, Duvall
          SET_PRECOMBAT_DIALOGUE FlagChapter03_BrigidDuvallBattleQuote, dialogueChapter03BrigidDuvallBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lachesis, AnyFactionSlot, ChagallCh03
          SET_PRECOMBAT_DIALOGUE FlagChapter03_LachesisChagallBattleQuote, dialogueChapter03LachesisChagallBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Sigurd, AnyFactionSlot, ChagallCh03
          SET_PRECOMBAT_DIALOGUE FlagChapter03_SigurdChagallBattleQuote, dialogueChapter03SigurdChagallBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Jacobi
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter03_JacobiBattleQuote, dialogueChapter03JacobiBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, EldiganCh03
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter03_EldiganBattleQuote, dialogueChapter03EldiganBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, ChagallCh03
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter03_ChagallBattleQuote, dialogueChapter03ChagallBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Papilio
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter03_PapilioBattleQuote, dialogueChapter03PapilioBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Duvall
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter03_DuvallBattleQuote, dialogueChapter03DuvallBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Pizare
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter03_PizarreBattleQuote, dialogueChapter03PizareBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter03_EldiganBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter03_LachesisEldiganBattleQuote, FlagChapter03_SigurdEldiganBattleQuote]
            SET_FLAG FlagChapter03_EldiganBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter03_DuvallBattleQuote
          CHECK_FLAG_SET FlagChapter03_BrigidDuvallBattleQuote
            SET_FLAG FlagChapter03_DuvallBattleQuote
        BREAK_STATE_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter03_LachesisChagallBattleQuoteAddition, FlagChapter03_LachesisChagallBattleQuote]
          SET_FLAG FlagChapter03_ChagallBattleQuote
        BREAK_STATE_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter03_SigurdChagallBattleQuoteAddition, FlagChapter03_SigurdChagallBattleQuote]
          SET_FLAG FlagChapter03_ChagallBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch03Sylvale
          CHECK_FLAG_SET FlagChapter03_MadinoSeized
            EVENT FlagChapter03_SylvaleSpawn, EventChapter03SylvaleSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter03_EldiganDied
            CHECK_FLAG_UNSET FlagChapter03_SylvaleSeized
              EVENT FlagChapter03_EldiganGone, EventChapter03EldiganDeathSigurdResponse
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch03Sylvale
          CHECK_FLAG_SET FlagChapter03_EldiganGone
            CHECK_FLAG_UNSET FlagChapter03_ChagallDied
              EVENT FlagChapter03_ThraciaSpawn, EventChapter03ThraciaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch03Sylvale
          CHECK_FLAG_SET FlagChapter03_PapilioDied
            CHECK_FLAG_UNSET FlagChapter03_SylvaleSeized
              EVENT FlagChapter03_TravantLeave, EventChapter03TravantLeave
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter03_SylvaleSeized
            EVENT FlagChapter03_ClaudTailiuSpawn, EventChapter03ClaudTailtiuSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch03Orgahil
          CHECK_FLAG_SET FlagChapter03_SylvaleSeized
            EVENT FlagChapter03_OrgahilSpawn, EventChapter03OrgahilSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter03ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter03ClearTalksIfMarriedTable ; 86/D660

        .byte Ayra, Lex
        .byte Ayra, Chulainn
        .byte Brigid, Midir
        .word $FFFF

    .endsection Chapter03EventsSection

    .section Chapter03EventDataSection

      aChapter03EventData ; 86/D668

        .structChapterEventData aChapter03LocationData, aChapter03MapChangeData, aUnknown86D6E9, aChapter03TalkEvents, aUnknown86D795

      aChapter03LocationData ; 86/D672

        .byte size(aChapter03LocationData._Entries) / size(word)
  
        _Entries .include "../TABLES/CHAPTER/Chapter03LocationData.csv.asm"

      aChapter03AgustiCastle ; 86/D68B

        .structChapterCastleLocationEntry Ch03_Agusti, AgustiName, [36, 59], $FC, aChapter03ShopData

      aChapter03SylvaleCastle ; 86/D693

        .structChapterCastleLocationEntry Ch03_Sylvale, SylvaleName, [7, 43], $FC, None

      aChapter03MadinoCastle ; 86/D69B

        .structChapterCastleLocationEntry Ch03_Madino, MadinoName, [41, 30], $FC, None

      aChapter03OrgahilCastle ; 86/D6A3

        .structChapterCastleLocationEntry Ch03_Orgahil, OrgahilName, [52, 4], $00, None

      aChapter03Village1 ; 86/D6AB

        .structChapterVillageLocationEntry Ch03_Village1, [25, 6]

      aChapter03Village2 ; 86/D6B0

        .structChapterVillageLocationEntry Ch03_Village2, [38, 28]

      aChapter03VillageWingclipper ; 86/D6B5

        .structChapterVillageLocationEntry Ch03_VillageWingclipper, [44, 28]

      aChapter03Village3 ; 86/D6BA

        .structChapterVillageLocationEntry Ch03_Village3, [21, 36]

      aChapter03VillageStrength ; 86/D6BF

        .structChapterVillageLocationEntry Ch03_VillageStrength, [33, 36]

      aChapter03Village4 ; 86/D6C4

        .structChapterVillageLocationEntry Ch03_Village4, [49, 38]

      aChapter03VillageDefense ; 86/D6C9

        .structChapterVillageLocationEntry Ch03_VillageDefense, [8, 40]

      aChapter03VillageRestore ; 86/D6CE

        .structChapterVillageLocationEntry Ch03_VillageRestore, [57, 44]

      aChapter03ShopData ; 86/D6D3

        .byte PI_SilverSword2
        .byte PI_SilverLance2
        .byte PI_SilverAxe
        .byte PI_SilverBow1
        .byte PI_Elfire
        .word $FFFF

      aChapter03MapChangeData ; 86/D6DA

        .structChapterMapChangeEntry Chapter03, FlagChapter03_BridgeLowered, [40, 19], aChapter03MapChangeBridge
        .word $FFFF

      aChapter03MapChangeBridge ; 86/D6E3

        .byte 1
        .byte 2

        .word $009C
        .word $00BB

      aUnknown86D6E9 ; 86/D6E9

        .word <>aUnknown86D6ED
        .word <>aUnknown86D6FD

      aUnknown86D6ED ; 86/D6ED

        .word $01F1
        .word $01F3
        .word $01F4
        .word $01F6
        .word $01F7
        .word $01F8
        .word $01F9
        .word $FFFF

      aUnknown86D6FD ; 86/D6FD

        .word $01F2
        .word $01F3
        .word $01F5
        .word $01F6
        .word $01F7
        .word $01F8
        .word $01FA
        .word $FFFF

      aFactionGroupData10 ; 86/D70D

        .structFactionGroupData FactionSigurd, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData10._Locations, None

        _Locations ; 86/D716
        .word Ch03_Agusti
        .word $FFFF

      aFactionGroupData11 ; 86/D71A

        .structFactionGroupData FactionSylvale, BattleHUDColorWhite, BattleBannerNordion, None, aFactionGroupData11._Locations, aFactionGroupData11._GroupAI

        _Locations ; 86/D723
        .word Ch03_Sylvale
        .word $FFFF

        _GroupAI ; 86/D727
        .long aFactionGroup11AI1
        .long aFactionGroup11AI2
        .long aFactionGroup11AI3
        .long aFactionGroup11AI4
        .word $FFFF

      aFactionGroupData12 ; 86/D735

        .structFactionGroupData FactionMadino, BattleHUDColorWhite, BattleBannerDefault, None, aFactionGroupData12._Locations, aFactionGroupData12._GroupAI

        _Locations ; 86/D73E
        .word Ch03_Madino
        .word $FFFF

        _GroupAI ; 86/D742
        .long aFactionGroup12AI1
        .long aFactionGroup12AI2
        .long aFactionGroup12AI3
        .long aFactionGroup12AI4
        .long aFactionGroup12AI5
        .long aFactionGroup12AI6
        .long aFactionGroup12AI7
        .word $FFFF

      aFactionGroupData13 ; 86/D759

        .structFactionGroupData FactionOrgahil, BattleHUDColorOrange, BattleBannerDefault, None, aFactionGroupData13._Locations, aFactionGroupData13._GroupAI

        _Locations ; 86/D762
        .word Ch03_Orgahil
        .word $FFFF

        _GroupAI ; 86/D766
        .long aFactionGroup13AI1
        .long aFactionGroup13AI2
        .long aFactionGroup13AI3
        .long aFactionGroup13AI4
        .long aFactionGroup13AI5
        .long aFactionGroup13AI6
        .word $FFFF

      aFactionGroupData14 ; 86/D77A

        .structFactionGroupData $FF, BattleHUDColorBlue, BattleBannerVelthomer, None, None, None

      aChapter03TalkEvents ; 86/D783

        .structChapterTalkEventEntry Chapter03, FlagChapter03_LachesisEldiganTalk, Lachesis, EldiganCh03
        .structChapterTalkEventEntry Chapter03, FlagChapter03_SylvaleCommanderTalk, AnyCharacter, SylvaleBlockadeCommanderLanceArmor
        .word $FFFF

      aUnknown86D795 ; 86/D795

        .word $FFFF
        .word $0403
        .word $FFFF
        .word $FFFF
        .word $FFFF

      aFactionGroup11AI1 ; 86/D79F

        AI_0B
        AI_END

      aFactionGroup11AI2 ; 86/D7A1

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Lachesis
        AI_SET_FORMATION $09, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup11AI3 ; 86/D7A8

        AI_07 Ch03_Sylvale, $04
        AI_END

      aFactionGroup11AI4 ; 86/D7AC

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $02, $02
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup12AI1 ; 86/D7B3

        AI_07 Ch03_Madino, $04
        AI_END

      aFactionGroup12AI2 ; 86/D7B7

        AI_SET_FORMATION $05, $02
        AI_JUMP_IF_TURN_REACHED 2, +

          AI_0B
          AI_END

        +
        AI_06 Ch03_Agusti, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup12AI3 ; 86/D7C5

        AI_SET_FORMATION $07, $02
        AI_JUMP_IF_TURN_REACHED 3, +

          AI_0B
          AI_END

        +
        AI_06 Ch03_Agusti, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup12AI4 ; 86/D7D3

        AI_06 Ch03_Agusti, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup12AI5 ; 86/D7D8

        AI_SET_FORMATION $05, $02
        AI_JUMP_IF_TURN_REACHED 4, +

          AI_0B
          AI_END

        +
        AI_06 Ch03_Agusti, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup12AI6 ; 86/D7E6

        AI_SET_FORMATION $07, $01
        AI_JUMP_IF_TURN_REACHED 3, +

          AI_0B
          AI_END

        +
        AI_06 Ch03_Agusti, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup12AI7 ; 86/D7F4

        AI_0A
        AI_END

      aFactionGroup13AI1 ; 86/D7F6

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup13AI2 ; 86/D7F9

        AI_TARGET_SPECIFIED_UNIT Brigid
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup13AI3 ; 86/D7FE

        AI_07 Ch03_Orgahil, $05
        AI_END

      aFactionGroup13AI4 ; 86/D802

        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch03_Madino, $01
        AI_06 Ch03_Agusti, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup13AI5 ; 86/D810

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup13AI6 ; 86/D812

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

    .endsection Chapter03EventDataSection
