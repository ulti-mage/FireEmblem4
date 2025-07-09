
    .weak

      FlagPrologue_YngviSeized                :=  0
      FlagPrologue_EvansSeized                :=  1
      FlagPrologue_EdainAbducted              :=  2
      FlagPrologue_QuanGroupSpawned           :=  3
      FlagPrologue_LexGroupSpawned            :=  4

      FlagPrologue_EvansSpawned               :=  6
      FlagPrologue_ArvisSpawned               :=  7

      FlagPrologue_MidirGerrardBattleQuote    := 10

      FlagPrologue_SigurdArvisTalk            := 19
      FlagPrologue_MidirCutsceneDeath         := 20

      FlagPrologue_BridgeLowered              := 22
      FlagPrologue_BridgeRaised               := 23
      FlagPrologue_SigurdReturnedHome         := 24

      FlagPrologue_AzelleDied                 := 26
      FlagPrologue_MidirDied                  := 27

      FlagPrologue_DiMaggioBattleQuote        := 29
      FlagPrologue_GerrardBattleQuote         := 30

      FS_Player                               :=  0
      FS_PrologueEvans                        :=  1
      FS_PrologueYngvi                        :=  2
      FS_PrologueArvis                        :=  3

    .endweak

    .section ChapterPrologueEventsSection

      aChapterPrologueEventHeader ; 90/8000

        .word ChapterPrologue
        .long aChapterPrologueOpeningEvent
        .long aChapterPrologueMapEvents

      aChapterPrologueOpeningEvent ; 90/8008

        SET_PERMANENT_FLAG PermanentFlagSeliphExists

        LOAD_FACTION_GROUP FS_Player,         FG_PrologueSigurd
        LOAD_FACTION_GROUP FS_PrologueEvans,  FG_PrologueEvans
        LOAD_FACTION_GROUP FS_PrologueYngvi,  FG_PrologueYngvi
        LOAD_FACTION_GROUP FS_PrologueArvis,  FG_PrologueArvis

        macroSetFactionsAllies  [FS_Player,         FS_PrologueYngvi]
        macroSetFactionsEnemies [FS_Player,         FS_PrologueEvans]
        macroSetFactionsAllies  [FS_Player,         FS_PrologueArvis]
        macroSetFactionsEnemies [FS_PrologueYngvi,  FS_PrologueEvans]
        macroSetFactionsAllies  [FS_PrologueYngvi,  FS_PrologueArvis]
        macroSetFactionsEnemies [FS_PrologueEvans,  FS_PrologueArvis]

        SET_UNIT_POSITION Sigurd, ChP_Chalphy
        SET_UNIT_POSITION Naoise, ChP_Chalphy
        SET_UNIT_POSITION Alec, ChP_Chalphy

        EVENT FlagAlways, EventPrologueOpening

        END_CHAPTER_EVENTS

      aChapterPrologueMapEvents ; 90/8046

        CHECK_SEIZING_CASTLE FlagPrologue_YngviSeized, FS_Player, ChP_Yngvi
          EVENT FlagAlways, EventPrologueYngviSeized

        CHECK_SEIZING_CASTLE FlagPrologue_EvansSeized, FS_Player, ChP_Evans
          EVENT FlagAlways, EventPrologueEnding

        CHECK_ENTERING_HOME_CASTLE FlagPrologue_SigurdReturnedHome, Sigurd, ChP_Chalphy
          EVENT FlagAlways, EventPrologueSigurdHomeCastle

        CHECK_UNIT_DIED FlagPrologue_MidirDied, Midir
          EC_NOP_00

        CHECK_UNIT_DIED FlagPrologue_AzelleDied, Azelle
          EC_NOP_00

        CHECK_UNIT_DIED FlagAlways, Quan
          EVENT FlagAlways, EventPrologueQuanDied

        CHECK_UNIT_DIED FlagAlways, Ethlyn
          EVENT FlagAlways, EventPrologueEthlynDied

        CHECK_UNIT_DIED FlagAlways, Finn
          EVENT FlagAlways, EventPrologueFinnDied

        CHECK_TALK FlagAlways, Ethlyn, Sigurd
          EVENT FlagAlways, EventPrologueEthlynSigurdTalk

        CHECK_TALK FlagAlways, Azelle, Sigurd
          EVENT FlagAlways, EventPrologueAzelleSigurdTalk

        CHECK_TALK FlagAlways, Lex, Sigurd
          EVENT FlagAlways, EventPrologueLexSigurdTalk

        CHECK_TALK FlagAlways, Quan, Sigurd
          EVENT FlagAlways, EventPrologueQuanSigurdTalk

        CHECK_TALK FlagPrologue_SigurdArvisTalk, Sigurd, ArvisChPrologue
          EVENT FlagAlways, EventPrologueSigurdArvisTalk

        CHECK_TALK FlagPrologue_SigurdArvisTalk, ArvisChPrologue, Sigurd
          EVENT FlagAlways, EventPrologueSigurdArvisTalk

        VISIT_VILLAGE FlagAlways, AnyCharacter, ChP_Village1
          EVENT FlagAlways, EventPrologueVillage1

        VISIT_VILLAGE FlagAlways, AnyCharacter, ChP_Village2
          EVENT FlagAlways, EventPrologueVillage2

        VISIT_VILLAGE FlagAlways, AnyCharacter, ChP_Village3
          EVENT FlagAlways, EventPrologueVillage3

        VISIT_VILLAGE FlagAlways, AnyCharacter, ChP_Village4
          EVENT FlagAlways, EventPrologueVillage4

        VISIT_VILLAGE FlagAlways, AnyCharacter, ChP_VillageSpeedRing
          EVENT FlagAlways, EventPrologueVillageSpeedRing

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Midir, AnyFactionSlot, Gerrard
          SET_PRECOMBAT_DIALOGUE FlagPrologue_MidirGerrardBattleQuote, dialogueChapterPrologueMidirGerrardBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, DiMaggio
          SET_BATTLE_OR_DEATH_QUOTE FlagPrologue_DiMaggioBattleQuote, dialogueChapterPrologueDiMaggioBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Gerrard
          SET_BATTLE_OR_DEATH_QUOTE FlagPrologue_GerrardBattleQuote, dialogueChapterPrologueGerrardBattleQuote, 0

        CHECK_UNIT_DIED_TO FlagPrologue_MidirCutsceneDeath, Midir, AnyCharacter
          SET_BATTLE_OR_DEATH_QUOTE FlagAlways, dialogueChapterPrologueMidirCutsceneDeath, 1

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagPrologue_GerrardBattleQuote
          CHECK_FLAG_SET FlagPrologue_MidirGerrardBattleQuote
            SET_FLAG FlagPrologue_GerrardBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_PrologueEvans
          EVENT FlagPrologue_EdainAbducted, EventPrologueEdainAbduction
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_PrologueEvans
          CHECK_FLAG_SET FlagPrologue_YngviSeized
            EVENT FlagPrologue_EvansSpawned, EventPrologueEvansSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 3, FS_Player
          EVENT FlagPrologue_QuanGroupSpawned, EventPrologueQuanGroupSpawn
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 2, FS_Player
          EVENT FlagPrologue_LexGroupSpawned, EventPrologueLexAzelleSpawn
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_PrologueArvis
          CHECK_FLAG_SET FlagPrologue_YngviSeized
            EVENT FlagPrologue_ArvisSpawned, EventPrologueArvisSpawn
          BREAK_STATE_CHECKS 
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

    .endsection ChapterPrologueEventsSection

    .section ChapterPrologueEventDataSection

      aFactionGroup02AI1 ; 90/81A0

        AI_06 ChP_Yngvi, $01
        AI_06 ChP_Chalphy, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup02AI2 ; 90/81A8

        AI_JUMP_IF_TURN_REACHED 3, +

          AI_0A
          AI_END

        +
        AI_06 ChP_Yngvi, $01
        AI_06 ChP_Chalphy, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup02AI3 ; 90/81B6

        AI_JUMP_IF_TURN_REACHED 5, +

          AI_0A
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup02AI4 ; 90/81BE

        AI_0A
        AI_END

      aFactionGroup02AI5 ; 90/81C0

        AI_JUMP_IF_TURN_REACHED 8, +

          AI_0A
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup02AI6 ; 90/81C8

        AI_07 ChP_Yngvi, $05
        AI_END

      aFactionGroup02AI7 ; 90/81CC

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET ChapterPrologue, FlagPrologue_EvansSpawned, +

          AI_END

        +
        AI_0A
        AI_END

      aFactionGroup02AI8 ; 90/81D5

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup03AI1 ; 90/81D8

        AI_02 $07
        AI_INTERACT_WITH_UNIT Sigurd, $0C
        AI_END

      aChapterPrologueEventData ; 90/81DF

        .structChapterEventData aChapterPrologueLocationData, aChapterPrologueMapChangeData, None, aChapterPrologueTalkEvents, None

      aChapterPrologueLocationData ; 90/81E9

        .byte size(aChapterPrologueLocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/ChapterPrologueLocationData.csv.asm"

      aChapterPrologueChalphyCastle ; 90/81FA

        .structChapterCastleLocationEntry ChP_Chalphy, ChalphyName, [60, 10], $78, None

      aChapterPrologueYngviCastle ; 90/8202

        .structChapterCastleLocationEntry ChP_Yngvi, YngviName, [33, 23], $78, None

      aChapterPrologueEvansCastle ; 90/820A

        .structChapterCastleLocationEntry ChP_Evans, EvansName, [5, 13], $00, None

      aChapterPrologueVillage1 ; 90/8212

        .structChapterVillageLocationEntry ChP_Village1, [49, 7]

      aChapterPrologueVillage2 ; 90/8217

        .structChapterVillageLocationEntry ChP_Village2, [40, 2]

      aChapterPrologueVillage3 ; 90/821C

        .structChapterVillageLocationEntry ChP_Village3, [22, 15]

      aChapterPrologueVillage4 ; 90/8221

        .structChapterVillageLocationEntry ChP_Village4, [20, 2]

      aChapterPrologueVillageSpeedRing ; 90/8226

        .structChapterVillageLocationEntry ChP_VillageSpeedRing, [28, 30]

      aChapterPrologueMapChangeData ; 90/822B

        .structChapterMapChangeEntry ChapterPrologue, FlagPrologue_BridgeRaised, [12, 15], aChapterPrologueMapChangeRaisedBridge
        .structChapterMapChangeEntry ChapterPrologue, FlagPrologue_BridgeLowered, [12, 15], aChapterPrologueMapChangeLoweredBridge
        .word $FFFF

      aChapterPrologueMapChangeRaisedBridge ; 90/823B

        .byte 1
        .byte 1

        .word $02D1

      aChapterPrologueMapChangeLoweredBridge ; 90/823F

        .byte 1
        .byte 1

        .word $00BD

      aFactionGroupData00 ; 90/8243

        .structFactionGroupData FactionSigurd, BattleHUDColorBlue, BattleBannerChalphy, aFactionGroupData00._Units, aFactionGroupData00._Locations, None

        _Units ; 90/824C
        .word Sigurd
        .word Naoise
        .word Alec
        .word Arden
        .word $FFFF

        _Locations ; 90/8256
        .word ChP_Chalphy
        .word $FFFF

      aFactionGroupData01 ; 90/825A

        .structFactionGroupData FactionYngvi1, BattleHUDColorDarkBlue, BattleBannerYngvi, None, aFactionGroupData01._Locations, None

        _Locations ; 90/8263
        .word ChP_Yngvi
        .word $FFFF

      aFactionGroupData02 ; 90/8267

        .structFactionGroupData FactionEvans, BattleHUDColorOrange, BattleBannerDefault, None, aFactionGroupData02._Locations, aFactionGroupData02._GroupAI

        _Locations ; 90/8270
        .word ChP_Evans
        .word $FFFF

        _GroupAI ; 90/8274
        .long aFactionGroup02AI1
        .long aFactionGroup02AI2
        .long aFactionGroup02AI3
        .long aFactionGroup02AI4
        .long aFactionGroup02AI5
        .long aFactionGroup02AI6
        .long aFactionGroup02AI7
        .long aFactionGroup02AI8
        .word $FFFF

      aFactionGroupData03 ; 90/828E

        .structFactionGroupData $FF, BattleHUDColorDarkBlue, BattleBannerFreege, None, None, aFactionGroupData03._GroupAI

        _GroupAI ; 90/8297
        .long aFactionGroup03AI1
        .word $FFFF

      aChapterPrologueTalkEvents ; 90/829C

        .structChapterTalkEventEntry ChapterPrologue, FlagPrologue_SigurdArvisTalk, Sigurd, ArvisChPrologue
        .structChapterTalkEventEntry ChapterPrologue, FlagPrologue_SigurdArvisTalk, ArvisChPrologue, Sigurd
        .word $FFFF

    .endsection ChapterPrologueEventDataSection
