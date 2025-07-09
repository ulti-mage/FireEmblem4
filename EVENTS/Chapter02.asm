
    .weak

      FlagChapter02_HeirheinSeized              :=  0
      FlagChapter02_InfiniSeized                :=  1
      FlagChapter02_MackilySeized               :=  2
      FlagChapter02_AgustiSeized                :=  3
      FlagChapter02_NordionSeized               :=  4

      FlagChapter02_ElliotCharge                :=  6
      FlagChapter02_PhilipDefend                :=  7
      FlagChapter02_LewynSilviaSpawn            :=  8
      FlagChapter02_InfiniSpawn                 :=  9
      FlagChapter02_WaltzCharge                 := 10
      FlagChapter02_MackilySpawn                := 11
      FlagChapter02_ChulainnRecruitment         := 12
      FlagChapter02_AgustiSpawn                 := 13

      FlagChapter02_ErinysGroupArrive           := 17

      FlagChapter02_ArenaChulainnPostDefeat     := 23
      FlagChapter02_SigurdLachesisTalk          := 24
      FlagChapter02_LewynErinysTalk             := 25
      FlagChapter02_ArenaChulainnDefeated       := 26
      FlagChapter02_BeowulfTalkSuccess          := 27
      FlagChapter02_InfiniEngaged               := 28
      FlagChapter02_PlayerAboveNordion          := 29
      FlagChapter02_InfiniDukeKnightNearCastle  := 30
      FlagChapter02_NoCastlesDestroyed          := 31
        ; No clue what the previous 2 were planned for
      FlagChapter02_ElliotBattleQuote           := 32
      FlagChapter02_PhilipBattleQuote           := 33
      FlagChapter02_BordeauxBattleQuote         := 34
      FlagChapter02_MacBethBattleQuote          := 35
      FlagChapter02_WaltzBattleQuote            := 36
      FlagChapter02_BeowulfBattleQuote          := 37
      FlagChapter02_ClementBattleQuote          := 38
      FlagChapter02_ZaneBattleQuote             := 39
      FlagChapter02_ErinysBattleQuote           := 40
      FlagChapter02_ChagallBattleQuote          := 41
      FlagChapter02_ErinysChagallBattleQuote    := 42
      FlagChapter02_LachesisChagallBattleQuote  := 43
      FlagChapter02_LachesisElliotBattleQuote   := 44
      FlagChapter02_ChagallDied                 := 45
      FlagChapter02_DeirdreCaptureReturn        := 46
      FlagChapter02_BeowulfTalkNoMoney          := 47
      FlagChapter02_LewynErinysBattleQuote      := 48
      FlagChapter02_RemoveRamparts              := 49
      FlagChapter02_KnightRingObtainable        := 50
      FlagChapter02_LachesisRecruitment         := 51
      FlagChapter02_BeowulfWaltzBattleQuote     := 52
      FlagChapter02_LewynMacBethBattleQuote     := 53
      FlagChapter02_NextToMountainArmor         := 54
      FlagChapter02_ArdenOnPeninsula            := 55
      FlagChapter02_MountainArmorTalk           := 56
      FlagChapter02_ArdenPursuitRing            := 57

      FS_Player                                 :=  0
      FS_Ch02Nordion                            :=  1
      FS_Ch02Heirhein                           :=  2
      FS_Ch02Infini                             :=  3
      FS_Ch02Mackily                            :=  4
      FS_Ch02Agusti                             :=  5

    .endweak

    .section Chapter02EventsSection

      aChapter02EventHeader ; 86/CCFA

        .word Chapter02
        .long aChapter02OpeningEvent
        .long aChapter02MapEvents

      aChapter02OpeningEvent ; 86/CD02

        LOAD_FACTION_GROUP FS_Player,       FG_Ch02Sigurd
        LOAD_FACTION_GROUP FS_Ch02Nordion,  FG_Ch02Nordion
        LOAD_FACTION_GROUP FS_Ch02Heirhein, FG_Ch02Heirhein
        LOAD_FACTION_GROUP FS_Ch02Infini,   FG_Ch02Infini
        LOAD_FACTION_GROUP FS_Ch02Mackily,  FG_Ch02Mackily
        LOAD_FACTION_GROUP FS_Ch02Agusti,   FG_Ch02Agusti

        macroSetFactionsAllies  [FS_Player,       FS_Ch02Nordion]
        macroSetFactionsEnemies [FS_Player,       FS_Ch02Heirhein]
        macroSetFactionsNeutral [FS_Player,       FS_Ch02Infini]
        macroSetFactionsNeutral [FS_Player,       FS_Ch02Mackily]
        macroSetFactionsEnemies [FS_Player,       FS_Ch02Agusti]
        macroSetFactionsEnemies [FS_Ch02Nordion,  FS_Ch02Heirhein]
        macroSetFactionsNeutral [FS_Ch02Nordion,  FS_Ch02Infini]
        macroSetFactionsNeutral [FS_Ch02Nordion,  FS_Ch02Mackily]
        macroSetFactionsEnemies [FS_Ch02Nordion,  FS_Ch02Agusti]
        macroSetFactionsNeutral [FS_Ch02Heirhein, FS_Ch02Infini]
        macroSetFactionsNeutral [FS_Ch02Heirhein, FS_Ch02Mackily]
        macroSetFactionsAllies  [FS_Ch02Heirhein, FS_Ch02Agusti]
        macroSetFactionsNeutral [FS_Ch02Infini,   FS_Ch02Mackily]
        macroSetFactionsNeutral [FS_Ch02Infini,   FS_Ch02Agusti]
        macroSetFactionsNeutral [FS_Ch02Mackily,  FS_Ch02Agusti]

        SET_TALK_TARGET Deirdre, Ethlyn
        SET_TALK_TARGET Dew, Lachesis

        CLOSE_VILLAGE Ch02_Village1

        EVENT FlagAlways, EventChapter02Opening

        END_CHAPTER_EVENTS

      aChapter02MapEvents ; 86/CD5E

        CHECK_SEIZING_CASTLE FlagChapter02_HeirheinSeized, FS_Player, Ch02_Heirhein
          EVENT FlagAlways, EventChapter02HeirheinSeized

        CHECK_SEIZING_CASTLE FlagChapter02_InfiniSeized, FS_Player, Ch02_Infini
          EVENT FlagAlways, EventChapter02InfiniSeized

        CHECK_SEIZING_CASTLE FlagChapter02_MackilySeized, FS_Player, Ch02_Mackily
          EVENT FlagAlways, EventChapter02MackilySeized

        CHECK_SEIZING_CASTLE FlagChapter02_AgustiSeized, FS_Player, Ch02_Agusti
          EC_NOP_00

        CHECK_SEIZING_CASTLE FlagChapter02_NordionSeized, FS_Player, Ch02_Nordion
          EC_NOP_00

        CHECK_UNITS_FIGHTING FlagChapter02_InfiniEngaged, FS_Player, AnyCharacter, FS_Ch02Infini, AnyCharacter
          EC_NOP_00

        CHECK_UNITS_FIGHTING FlagChapter02_InfiniEngaged, FS_Ch02Infini, AnyCharacter, FS_Player, AnyCharacter
          EC_NOP_00

        CHECK_WON_IN_ARENA FlagChapter02_ArenaChulainnDefeated, AnyCharacter, AnyLocation, Chulainn
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter02_PlayerAboveNordion, AnyCharacter, pack([46, 1]), pack([62, 21]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter02_NextToMountainArmor, AnyCharacter, pack([58, 36]), pack([58, 36]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter02_ArdenOnPeninsula, Arden, pack([7, 51]), pack([7, 51]), FS_Player
          EVENT FlagChapter02_ArdenPursuitRing, EventChapter02ArdenPursuitRing

        CHECK_UNIT_DIED FlagChapter02_ChagallDied, ChagallCh02
          EC_NOP_00

        CHECK_UNIT_DIED FlagAlways, Quan
          EVENT FlagAlways, EventChapter02QuanDied

        CHECK_UNIT_DIED FlagAlways, Ethlyn
          EVENT FlagAlways, EventChapter02EthlynDied

        CHECK_UNIT_DIED FlagAlways, Finn
          EVENT FlagAlways, EventChapter02FinnDied

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_VillageBargainBand
          EVENT FlagAlways, EventChapter02VillageBargainBand

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village1
          EVENT FlagAlways, EventChapter02Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village2
          EVENT FlagAlways, EventChapter02Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village3
          EVENT FlagAlways, EventChapter02Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village4
          EVENT FlagAlways, EventChapter02Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village5
          EVENT FlagAlways, EventChapter02Village5

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village6
          EVENT FlagAlways, EventChapter02Village6

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village7
          EVENT FlagAlways, EventChapter02Village7

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_Village8
          EVENT FlagAlways, EventChapter02Village8

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch02_VillageArmorslayer
          EVENT FlagAlways, EventChapter02VillageArmorslayer

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING FlagChapter02_DeirdreCaptureReturn, Deirdre
          EC_NOP_00

        CHECK_TALK FlagChapter02_BeowulfTalkSuccess, AnyCharacter, Beowulf, 1
          EVENT FlagAlways, EventChapter02BeowulfTalkSuccess

        CHECK_TALK FlagChapter02_BeowulfTalkNoMoney, AnyCharacter, Beowulf
          EVENT FlagAlways, EventChapter02BeowulfTalkNoMoney

        CHECK_TALK FlagChapter02_SigurdLachesisTalk, Sigurd, Lachesis
          EVENT FlagChapter02_LachesisRecruitment, EventChapter02SigurdLachesisTalk

        CHECK_TALK FlagChapter02_LewynErinysTalk, Lewyn, Erinys
          EVENT FlagAlways, EventChapter02LewynErinysTalk

        CHECK_TALK FlagAlways, Dew, Lachesis
          EVENT FlagAlways, EventChapter02DewLachesisTalk

        CHECK_TALK FlagAlways, Deirdre, Ethlyn
          EVENT FlagAlways, EventChapter02DeirdreEthlynTalk

        CHECK_TALK FlagAlways, Quan, Finn
          EVENT FlagAlways, EventChapter02QuanFinnTalk

        CHECK_TALK FlagAlways, Sigurd, Lewyn
          EVENT FlagAlways, EventChapter02SigurdLewynTalk

        CHECK_TALK FlagAlways, Beowulf, Lachesis
          EVENT FlagAlways, EventChapter02BeowulfLachesisTalk

        CHECK_TALK FlagAlways, Alec, Silvia
          EVENT FlagAlways, EventChapter02AlecSilviaTalk

        CHECK_TALK FlagAlways, Silvia, Sigurd
          EVENT FlagAlways, EventChapter02SilviaSigurdTalk

        CHECK_TALK FlagAlways, Erinys, Sigurd
          EVENT FlagAlways, EventChapter02ErinysSigurdTalk

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lewyn, AnyFactionSlot, Erinys
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_LewynErinysBattleQuote, dialogueChapter02LewynErinysBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Erinys, AnyFactionSlot, ChagallCh02
          SET_PRECOMBAT_DIALOGUE FlagChapter02_ErinysChagallBattleQuote, dialogueChapter02ErinysChagallBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lachesis, AnyFactionSlot, ChagallCh02
          SET_PRECOMBAT_DIALOGUE FlagChapter02_LachesisChagallBattleQuote, dialogueChapter02LachesisChagallBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lachesis, AnyFactionSlot, ElliotCh02
          SET_PRECOMBAT_DIALOGUE FlagChapter02_LachesisElliotBattleQuote, dialogueChapter02LachesisElliotBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Beowulf, AnyFactionSlot, Waltz
          SET_PRECOMBAT_DIALOGUE FlagChapter02_BeowulfWaltzBattleQuote, dialogueChapter02BeowulfWaltzBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lewyn, AnyFactionSlot, MacBeth
          SET_PRECOMBAT_DIALOGUE FlagChapter02_LewynMacBethBattleQuote, dialogueChapter02LewynMacBethBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, ElliotCh02
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_ElliotBattleQuote, dialogueChapter02ElliotBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Philip
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_PhilipBattleQuote, dialogueChapter02PhilipBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Bordeaux
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_BordeauxBattleQuote, dialogueChapter02BordeauxBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, MacBeth
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_MacBethBattleQuote, dialogueChapter02MacBethBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Waltz
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_WaltzBattleQuote, dialogueChapter02WaltzBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Beowulf
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_BeowulfBattleQuote, dialogueChapter02BeowulfBattleQuote, 0

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Clement
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_ClementBattleQuote, dialogueChapter02ClementBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Zane
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_ZaneBattleQuote, dialogueChapter02ZaneBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Erinys
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_ErinysBattleQuote, dialogueChapter02ErinysBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, ChagallCh02
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter02_ChagallBattleQuote, dialogueChapter02ChagallBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter02_ErinysBattleQuote
          CHECK_FLAG_SET FlagChapter02_LewynErinysBattleQuote
            SET_FLAG FlagChapter02_ErinysBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter02_ElliotBattleQuote
          CHECK_FLAG_SET FlagChapter02_LachesisElliotBattleQuote
            SET_FLAG FlagChapter02_ElliotBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter02_WaltzBattleQuote
          CHECK_FLAG_SET FlagChapter02_BeowulfWaltzBattleQuote
            SET_FLAG FlagChapter02_WaltzBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter02_MacBethBattleQuote
          CHECK_FLAG_SET FlagChapter02_LewynMacBethBattleQuote
            SET_FLAG FlagChapter02_MacBethBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter02_ChagallBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter02_ErinysChagallBattleQuote, FlagChapter02_LachesisChagallBattleQuote]
            SET_FLAG FlagChapter02_ChagallBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch02Heirhein, 1, AnyCharacter
          EVENT FlagChapter02_ElliotCharge, EventChapter02ElliotCharge
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch02Heirhein, 2, AnyCharacter
          EVENT FlagChapter02_PhilipDefend, EventChapter02PhilipDefend
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch02Infini
          EVENT FlagAlways, EventChapter02InfiniBrigandsSpawn
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch02Mackily
          EVENT FlagAlways, EventChapter02MackilyWorried
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch02Infini
          CHECK_FLAG_SET FlagChapter02_HeirheinSeized
            EVENT FlagChapter02_InfiniSpawn, EventChapter02InfiniSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter02_LewynSilviaSpawn
            EVENT FlagChapter02_ErinysGroupArrive, EventChapter02ErinysGroupArrive
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter02_HeirheinSeized
            EVENT FlagChapter02_LewynSilviaSpawn, EventChapter02LewynSilviaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch02Infini, 2, AnyCharacter
          CHECK_FLAG_SET FlagChapter02_InfiniEngaged
            EVENT FlagChapter02_WaltzCharge, EventChapter02WaltzCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch02Mackily
          CHECK_FLAG_SET FlagChapter02_InfiniSeized
            EVENT FlagChapter02_MackilySpawn, EventChapter02MackilySpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapter02_ArenaChulainnDefeated
          CHECK_ENTERING_CASTLE_MENU FlagChapter02_ArenaChulainnPostDefeat, AnyCharacter, Ch02_Evans
            EVENT FlagChapter02_ChulainnRecruitment, EventChapter02ChulainnRecruitmentEvans
          CHECK_ENTERING_CASTLE_MENU FlagChapter02_ArenaChulainnPostDefeat, AnyCharacter, Ch02_Heirhein
            EVENT FlagChapter02_ChulainnRecruitment, EventChapter02ChulainnRecruitmentHeirhein
          CHECK_ENTERING_CASTLE_MENU FlagChapter02_ArenaChulainnPostDefeat, AnyCharacter, Ch02_Infini
            EVENT FlagChapter02_ChulainnRecruitment, EventChapter02ChulainnRecruitmentInfini
          CHECK_ENTERING_CASTLE_MENU FlagChapter02_ArenaChulainnPostDefeat, AnyCharacter, Ch02_Mackily
            EVENT FlagChapter02_ChulainnRecruitment, EventChapter02ChulainnRecruitmentMackily
          CHECK_ENTERING_CASTLE_MENU FlagChapter02_ArenaChulainnPostDefeat, AnyCharacter, Ch02_Nordion
            EVENT FlagChapter02_ChulainnRecruitment, EventChapter02ChulainnRecruitmentNordion
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch02Agusti
          CHECK_FLAG_SET FlagChapter02_MackilySeized
           EVENT FlagChapter02_AgustiSpawn, EventChapter02AgustiSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapter02_AgustiSeized
          CHECK_NO_CASTLE_DESTROYED
            SET_FLAG FlagChapter02_NoCastlesDestroyed
        BREAK_STATE_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter02_AgustiSeized, FlagChapter02_LachesisRecruitment]
          CHECK_UNIT_ALIVE Lachesis
            CHECK_UNIT_ALIVE Eve
              CHECK_UNIT_ALIVE Eva
                CHECK_UNIT_ALIVE Alva
                  SET_FLAG FlagChapter02_KnightRingObtainable
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter02_AgustiSeized
          EVENT FlagAlways, EventChapter02Ending
        BREAK_STATE_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter02_NextToMountainArmor, FlagChapter02_HeirheinSeized]
          CHECK_FLAG_UNSET FlagChapter02_InfiniSeized
            EVENT FlagChapter02_MountainArmorTalk, EventChapter02MountainArmorTalk
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter02_NextToMountainArmor
          CHECK_FLAG_UNSET FlagChapter02_MountainArmorTalk
            UNSET_FLAG FlagChapter02_NextToMountainArmor
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter02ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter02ClearTalksIfMarriedTable ; 86/D144

        .byte Lachesis, Dew
        .byte Lachesis, Beowulf
        .byte Silvia, Alec
        .word $FFFF

    .endsection Chapter02EventsSection

    .section Chapter02EventDataSection

      aChapter02EventData ; 86/D14C

        .structChapterEventData aChapter02LocationData, aChapter02MapChangeData, aUnknown86D20B, aChapter02TalkEvents, aUnknown86D2E1

      aChapter02LocationData ; 86/D156

        .byte size(aChapter02LocationData._Entries) / size(word)
  
        _Entries .include "../TABLES/CHAPTER/Chapter02LocationData.csv.asm"

      aChapter02EvansCastle ; 86/D177

        .structChapterCastleLocationEntry Ch02_Evans, EvansName, [57, 59], $FC, aChapter02ShopData

      aChapter02NordionCastle ; 86/D17F

        .structChapterCastleLocationEntry Ch02_Nordion, NordionName, [25, 51], $FC, None

      aChapter02HeirheinCastle ; 86/D187

        .structChapterCastleLocationEntry Ch02_Heirhein, HeirheinName, [5, 32], $FC, None

      aChapter02InfiniCastle ; 86/D18F

        .structChapterCastleLocationEntry Ch02_Infini, InfiniName, [12, 3], $FC, None

      aChapter02MackilyCastle ; 86/D197

        .structChapterCastleLocationEntry Ch02_Mackily, MackilyName, [43, 29], $FC, None

      aChapter02AgustiCastle ; 86/D19F

        .structChapterCastleLocationEntry Ch02_Agusti, AgustiName, [53, 6], $00, None

      aChapter02VillageBargainBand ; 86/D1A7

        .structChapterVillageLocationEntry Ch02_VillageBargainBand, [25, 25]

      aChapter02Village1 ; 86/D1AC

        .structChapterVillageLocationEntry Ch02_Village1, [40, 24]

      aChapter02Village2 ; 86/D1B1

        .structChapterVillageLocationEntry Ch02_Village2, [35, 28]

      aChapter02Village3 ; 86/D1B6

        .structChapterVillageLocationEntry Ch02_Village3, [30, 30]

      aChapter02Village4 ; 86/D1BB

        .structChapterVillageLocationEntry Ch02_Village4, [37, 31]

      aChapter02Village5 ; 86/D1C0

        .structChapterVillageLocationEntry Ch02_Village5, [20, 33]

      aChapter02Village6 ; 86/D1C5

        .structChapterVillageLocationEntry Ch02_Village6, [34, 34]

      aChapter02Village7 ; 86/D1CA

        .structChapterVillageLocationEntry Ch02_Village7, [24, 35]

      aChapter02Village8 ; 86/D1CF

        .structChapterVillageLocationEntry Ch02_Village8, [28, 36]

      aChapter02VillageArmorslayer ; 86/D1D4

        .structChapterVillageLocationEntry Ch02_VillageArmorslayer, [27, 39]

      aChapter02ShopData ; 86/D1D9

        .byte PI_SteelLance2
        .byte PI_Thunder2
        .byte PI_SteelBlade1
        .byte PI_SteelBow2
        .word $FFFF

      aChapter02MapChangeData ; 86/D1DF

        .structChapterMapChangeEntry Chapter02, FlagChapter02_RemoveRamparts, [47, 11], aChapter02MapChangeLeftRampart
        .structChapterMapChangeEntry Chapter02, FlagChapter02_RemoveRamparts, [59, 8], aChapter02MapChangeRightRampart
        .word $FFFF

      aChapter02MapChangeLeftRampart ; 86/D1EF

        .byte 2
        .byte 3

        .word $0067, $033C
        .word $00AD, $00AE
        .word $033C, $033C

      aChapter02MapChangeRightRampart ; 86/D1FD

        .byte 2
        .byte 3

        .word $0089, $008E
        .word $00AF, $006A
        .word $033A, $033B

      aUnknown86D20B ; 86/D20B

        .word <>aUnknown86D20F
        .word <>aUnknown86D221

      aUnknown86D20F ; 86/D20F

        .word $01E8
        .word $01E9
        .word $01EA
        .word $01EB
        .word $01ED
        .word $01EE
        .word $0009
        .word $01EF
        .word $FFFF

      aUnknown86D221 ; 86/D221

        .word $01E8
        .word $01E9
        .word $01EA
        .word $01EC
        .word $01ED
        .word $01EE
        .word $01F0
        .word $FFFF

      aFactionGroupData0A ; 86/D231

        .structFactionGroupData FactionSigurd, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData0A._Locations, None

        _Locations ; 86/D23A
        .word Ch02_Evans
        .word $FFFF

      aFactionGroupData0B ; 86/D23E

        .structFactionGroupData FactionNordion, BattleHUDColorWhite, BattleBannerNordion, None, aFactionGroupData0B._Locations, aFactionGroupData0B._GroupAI

        _Locations ; 86/D247
        .word Ch02_Nordion
        .word $FFFF

        _GroupAI ; 86/D24B
        .long aFactionGroup0BAI1
        .word $FFFF

      aFactionGroupData0C ; 86/D250

        .structFactionGroupData FactionHeirhein, BattleHUDColorWhite, BattleBannerDefault, None, aFactionGroupData0C._Locations, aFactionGroupData0C._GroupAI

        _Locations ; 86/D259
        .word Ch02_Heirhein
        .word $FFFF

        _GroupAI ; 86/D25D
        .long aFactionGroup0CAI1
        .long aFactionGroup0CAI2
        .long aFactionGroup0CAI3
        .word $FFFF

      aFactionGroupData0D ; 86/D268

        .structFactionGroupData FactionInfini, BattleHUDColorWhite, BattleBannerDefault, None, aFactionGroupData0D._Locations, aFactionGroupData0D._GroupAI

        _Locations ; 86/D271
        .word Ch02_Infini
        .word $FFFF

        _GroupAI ; 86/D275
        .long aFactionGroup0DAI1
        .long aFactionGroup0DAI2
        .long aFactionGroup0DAI3
        .long aFactionGroup0DAI4
        .long aFactionGroup0DAI5
        .word $FFFF

      aFactionGroupData0E ; 86/D286

        .structFactionGroupData FactionMackily, BattleHUDColorWhite, BattleBannerDefault, None, aFactionGroupData0E._Locations, aFactionGroupData0E._GroupAI

        _Locations ; 86/D28F
        .word Ch02_Mackily
        .word $FFFF

        _GroupAI ; 86/D293
        .long aFactionGroup0EAI1
        .long aFactionGroup0EAI2
        .long aFactionGroup0EAI3
        .word $FFFF

      aFactionGroupData0F ; 86/D29E

        .structFactionGroupData FactionAgusti, BattleHUDColorWhite, BattleBannerDefault, None, aFactionGroupData0F._Locations, aFactionGroupData0F._GroupAI

        _Locations ; 86/D2A7
        .word Ch02_Agusti
        .word $FFFF

        _GroupAI ; 86/D2AB
        .long aFactionGroup0FAI1
        .long aFactionGroup0FAI2
        .long aFactionGroup0FAI3
        .long aFactionGroup0FAI4
        .long aFactionGroup0FAI5
        .long aFactionGroup0FAI6
        .word $FFFF

      aChapter02TalkEvents ; 86/D2BF

        .structChapterTalkEventEntry Chapter02, FlagChapter02_SigurdLachesisTalk, Sigurd, Lachesis
        .structChapterTalkEventEntry Chapter02, FlagChapter02_BeowulfTalkSuccess, AnyCharacter, Beowulf, true
        .structChapterTalkEventEntry Chapter02, FlagChapter02_BeowulfTalkNoMoney, AnyCharacter, Beowulf
        .structChapterTalkEventEntry Chapter02, FlagChapter02_LewynErinysTalk, Lewyn, Erinys
        .word $FFFF

      aUnknown86D2E1 ; 86/D2E1

        .word $FFFF
        .word $FFFF
        .word $FFFF
        .word $FFFF
        .word $0B02
        .word $0B02
        .word $FFFF

      aFactionGroup0BAI1 ; 86/D2EF

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter02, FlagChapter02_SigurdLachesisTalk, +

          AI_07 Ch02_Nordion, $05
          AI_END

        +
        AI_22 +

          AI_02 $07
          AI_INTERACT_WITH_UNIT Lachesis, $00
          AI_END

        +
        AI_19
        AI_END

      aFactionGroup0CAI1 ; 86/D305

        AI_SET_FORMATION $06, $01
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch02_Nordion, $01
        AI_06 Ch02_Evans, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0CAI2 ; 86/D316

        AI_SET_FORMATION $0A, $01
        AI_0A
        AI_END

      aFactionGroup0CAI3 ; 86/D31B

        AI_07 Ch02_Heirhein, $05
        AI_END

      aFactionGroup0DAI1 ; 86/D31F

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter02, FlagChapter02_InfiniEngaged, ++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter02, FlagChapter02_InfiniSpawn, +

            AI_00
            AI_END

          +
          AI_SET_FORMATION $05, $02
          AI_FLAG_IF_LEADER_ON_COORDS Chapter02, FlagChapter02_InfiniDukeKnightNearCastle, [17, 3]
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0DAI2 ; 86/D339

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter02, FlagChapter02_InfiniEngaged, +

          AI_SET_FORMATION $05, $02
          AI_0B
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0DAI5 ; 86/D346

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter02, FlagChapter02_InfiniEngaged, +

          AI_0B
          AI_END

        +
        AI_02 $00
        AI_INTERACT_WITH_UNIT Sigurd, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0DAI3 ; 86/D356

        AI_07 Ch02_Infini, $04
        AI_END

      aFactionGroup0DAI4 ; 86/D35A

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0EAI1 ; 86/D35D

        AI_0B
        AI_END

      aFactionGroup0EAI2 ; 86/D35F

        AI_07 Ch02_Mackily, $04
        AI_END

      aFactionGroup0EAI3 ; 86/D363

        AI_0A
        AI_END

      aFactionGroup0FAI1 ; 86/D365

        AI_0A
        AI_END

      aFactionGroup0FAI2 ; 86/D367

        AI_SET_FORMATION $03, $02
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0FAI3 ; 86/D36C

        AI_SET_FORMATION $03, $02
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0FAI4 ; 86/D371

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Lewyn
        AI_SET_FORMATION $03, $02
        AI_06 Ch02_Evans, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup0FAI5 ; 86/D37B

        AI_07 Ch02_Agusti, $05
        AI_END

      aFactionGroup0FAI6 ; 86/D37F

        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter02, FlagChapter02_PlayerAboveNordion, +

          AI_0A
          AI_END

        +
        AI_06 Ch02_Mackily, $00
        AI_06 Ch02_Evans, $01
        AI_TARGET_ALL_FOES
        AI_END

        ; 86/D395

    .endsection Chapter02EventDataSection
