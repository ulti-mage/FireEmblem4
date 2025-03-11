
    .weak

      FlagChapter05_LubeckSeizedCheck             :=  0
      FlagChapter05_PhinoraSeizedCheck            :=  1
      FlagChapter05_LexLombardBattleQuote         :=  2
      FlagChapter05_TailtiuReptorBattleQuote      :=  3
      FlagChapter05_BrigidLoverTalkSet            :=  4
      FlagChapter05_AndreyCharge                  :=  5
      FlagChapter05_BelhallaConversation          :=  6
      FlagChapter05_LubeckSeized                  :=  7
      FlagChapter05_PhinoraSpawn                  :=  8
      FlagChapter05_LeonsterSpawn                 :=  9
      FlagChapter05_ThraciaSpawn                  := 10
      FlagChapter05_EthlynDied                    := 11
      FlagChapter05_QuanAndEthlynDead             := 12
      FlagChapter05_SigurdMagornBattleQuote       := 13
      FlagChapter05_ReptorCharge                  := 14
      FlagChapter05_AidaBetrayal                  := 15
      FlagChapter05_ReptorBetrayalResponse        := 16
      FlagChapter05_SigurdReptorBattleQuote       := 17
      FlagChapter05_AnyoneAidaTalk                := 18
      FlagChapter05_AidaReptorBattleQuote         := 19
      FlagChapter05_SlayderBattleQuote            := 20
      FlagChapter05_ByronSlayderBattleQuote       := 21
      FlagChapter05_ByronLubeckBattleQuote        := 22
      FlagChapter05_AndreyBattleQuote             := 23
      FlagChapter05_EdainAndreyBattleQuote        := 24
      FlagChapter05_BrigidAndreyBattleQuote       := 25
      FlagChapter05_LombardBattleQuote            := 26
      FlagChapter05_SigurdLombardBattleQuote      := 27
      FlagChapter05_VajaBattleQuote               := 28
      FlagChapter05_EthlynThraciaBattleQuote      := 29
      FlagChapter05_QuanThraciaBattleQuoteCheck   := 30
      FlagChapter05_TravantBattleQuote            := 31
      FlagChapter05_MagornBattleQuote             := 32
      FlagChapter05_ReptorBattleQuoteCheck        := 33
      FlagChapter05_LubeckRampart                 := 34
      FlagChapter05_VelthomerRampart              := 35
      FlagChapter05_BelhallaRampart               := 36
      FlagChapter05_SigurdByronTalk               := 37
      FlagChapter05_SigurdAidaTalk                := 38

      FlagChapter05_AnyoneAidaTalkCheck           := 40
      FlagChapter05_QuanDiedCheck                 := 41
      FlagChapter05_EthlynDiedCheck               := 42
      FlagChapter05_SlayderDied                   := 43
      FlagChapter05_ReptorDied                    := 44

      FlagChapter05_ReptorChargeTrigger           := 46
      FlagChapter05_EnabledSigurdAidaTalk         := 47
      FlagChapter05_AndreyDied                    := 48
      FlagChapter05_EndChapter                    := 49
      FlagChapter05_ArdenOnCliff                  := 50
      FlagChapter05_ByronAliveWhenSeizingLubeck   := 51
      FlagChapter05_QuanBattleQuote               := 52

      FlagChapter05_ReptorBattleQuote             := 54
      FlagChapter05_ReptorDeathQuoteCheck         := 55
      FlagChapter05_ReptorDeathQuote              := 56
      FlagChapter05_ArdenOnCliffCheck             := 57
      FlagChapter05_ClaudLoverTalkSet             := 58
      FlagChapter05_TailtiuLoverTalkSet           := 59
      FlagChapter05_ErinysLoverTalkSet            := 60
      FlagChapter05_SilviaLoverTalkSet            := 61
      FlagChapter05_LachesisLoverTalkSet          := 62
      FlagChapter05_AyraLoverTalkSet              := 63
      FlagChapter05_StartPlayerPhase              := 64

      FlagChapter05EndAlive_Naoise    := 20
      FlagChapter05EndAlive_Alec      := 21
      FlagChapter05EndAlive_Arden     := 22
      FlagChapter05EndAlive_Midir     := 23
      FlagChapter05EndAlive_Lewyn     := 24
      FlagChapter05EndAlive_Chulainn  := 25
      FlagChapter05EndAlive_Azelle    := 26
      FlagChapter05EndAlive_Jamke     := 27
      FlagChapter05EndAlive_Claud     := 28
      FlagChapter05EndAlive_Beowulf   := 29
      FlagChapter05EndAlive_Lex       := 30
      FlagChapter05EndAlive_Dew       := 31
      FlagChapter05EndAlive_Lachesis  := 32
      FlagChapter05EndAlive_Ayra      := 33
      FlagChapter05EndAlive_Erinys    := 37
      FlagChapter05EndAlive_Silvia    := 41
      FlagChapter05EndAlive_Edain     := 42
      FlagChapter05EndAlive_Brigid    := 43
      FlagChapter05EndAlive_Tailtiu   := 44


      FS_Player                         :=  0
      FS_Ch05Byron                      :=  1
      FS_Ch05Lubeck                     :=  2
      FS_Ch05Phinora                    :=  3
      FS_Ch05Velthomer                  :=  4
      FS_Ch05Friege                     :=  5
      FS_Ch05Belhalla                   :=  6

      FS_Ch05Leonster                   :=  1
      FS_Ch05Thracia                    :=  2

    .endweak

    .section Chapter05EventsSection

      aChapter05EventHeader ; 86/DE41

        .word Chapter05
        .long aChapter05OpeningEvent
        .long aChapter05MapEvents

      aChapter05OpeningEvent ; 86/DE49

        LOAD_FACTION_GROUP FS_Player,         FG_Ch05Sigurd
        LOAD_FACTION_GROUP FS_Ch05Byron,      FG_Ch05Byron
        LOAD_FACTION_GROUP FS_Ch05Lubeck,     FG_Ch05Lubeck
        LOAD_FACTION_GROUP FS_Ch05Phinora,    FG_Ch05Phinora
        LOAD_FACTION_GROUP FS_Ch05Velthomer,  FG_Ch05Velthomer
        LOAD_FACTION_GROUP FS_Ch05Friege,     FG_Ch05Friege
        LOAD_FACTION_GROUP FS_Ch05Belhalla,   FG_Ch05Belhalla

        macroSetFactionsAllies  [FS_Player,         FS_Ch05Byron]
        macroSetFactionsEnemies [FS_Player,         FS_Ch05Lubeck]
        macroSetFactionsEnemies [FS_Player,         FS_Ch05Phinora]
        macroSetFactionsEnemies [FS_Player,         FS_Ch05Velthomer]
        macroSetFactionsEnemies [FS_Player,         FS_Ch05Friege]
        macroSetFactionsNeutral [FS_Player,         FS_Ch05Belhalla]
        macroSetFactionsEnemies [FS_Ch05Lubeck,     FS_Ch05Byron]
        macroSetFactionsAllies  [FS_Ch05Lubeck,     FS_Ch05Phinora]
        macroSetFactionsAllies  [FS_Ch05Lubeck,     FS_Ch05Velthomer]
        macroSetFactionsAllies  [FS_Ch05Lubeck,     FS_Ch05Friege]
        macroSetFactionsAllies  [FS_Ch05Lubeck,     FS_Ch05Belhalla]
        macroSetFactionsEnemies [FS_Ch05Phinora,    FS_Ch05Byron]
        macroSetFactionsAllies  [FS_Ch05Phinora,    FS_Ch05Velthomer]
        macroSetFactionsAllies  [FS_Ch05Phinora,    FS_Ch05Friege]
        macroSetFactionsAllies  [FS_Ch05Phinora,    FS_Ch05Belhalla]
        macroSetFactionsEnemies [FS_Ch05Velthomer,  FS_Ch05Byron]
        macroSetFactionsAllies  [FS_Ch05Velthomer,  FS_Ch05Friege]
        macroSetFactionsAllies  [FS_Ch05Velthomer,  FS_Ch05Belhalla]
        macroSetFactionsEnemies [FS_Ch05Belhalla,   FS_Ch05Byron]
        macroSetFactionsAllies  [FS_Ch05Belhalla,   FS_Ch05Friege]
        macroSetFactionsEnemies [FS_Ch05Byron,      FS_Ch05Friege]

        SET_FLAG FlagChapter05_SigurdAidaTalk

        EVENT FlagAlways, EventChapter05Opening

        END_CHAPTER_EVENTS

      aChapter05MapEvents ; 86/DEBA

        CHECK_SEIZING_CASTLE FlagChapter05_LubeckSeizedCheck, FS_Player, Ch05_Lubeck
          EC_NOP_00

        CHECK_SEIZING_CASTLE FlagChapter05_PhinoraSeizedCheck, FS_Player, Ch05_Phinora
          EVENT FlagAlways, EventChapter05PhinoraSeized

        CHECK_SEIZING_CASTLE FlagAlways, FS_Player, Ch05_Velthomer
          EVENT FlagAlways, EventChapter05VelthomerSeized

        CHECK_TALK FlagChapter05_SigurdByronTalk, Sigurd, Byron
          EVENT FlagAlways, EventChapter05SigurdByronTalk

        CHECK_TALK FlagChapter05_SigurdByronTalk, Byron, Sigurd
          EVENT FlagAlways, EventChapter05SigurdByronTalk

        CHECK_TALK FlagChapter05_SigurdAidaTalk, Sigurd, Aida
          SET_FLAG FlagChapter05_EndChapter

        CHECK_TALK FlagChapter05_AnyoneAidaTalkCheck, AnyCharacter, Aida
          EVENT FlagChapter05_AnyoneAidaTalk, EventChapter05AnyoneAidaTalk

        CHECK_UNIT_IN_AREA FlagChapter05_ArdenOnCliffCheck, Arden, pack([36, 22]), pack([37, 22]), AnyFactionSlot
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter05_SlayderDied, Slayder, AnyFactionSlot
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter05_AndreyDied, AndreyCh05, AnyFactionSlot
          SET_TALK_TARGET Edain, None

        CHECK_UNIT_DIED FlagChapter05_EthlynDiedCheck, Ethlyn, AnyFactionSlot
          EVENT FlagChapter05_EthlynDied, EventChapter05EthlynDied

        CHECK_UNIT_DIED FlagChapter05_QuanDiedCheck, Quan, AnyFactionSlot
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter05_ReptorDied, ReptorCh05, AnyFactionSlot
          EVENT FlagAlways, EventChapter05ReptorDied

        CHECK_TALK FlagAlways, Edain, Brigid
          EVENT FlagAlways, EventChapter05EdainBrigidTalk

        CHECK_TALK FlagAlways, Claud, Edain
          EVENT FlagAlways, EventChapter05ClaudEdainTalk

        CHECK_TALK FlagAlways, Dew, Jamke
          EVENT FlagAlways, EventChapter05DewJamkeTalk

        CHECK_TALK FlagAlways, Alec, Naoise
          EVENT FlagAlways, EventChapter05AlecNaoiseTalk

        CHECK_TALK FlagAlways, Lex, Azelle
          EVENT FlagAlways, EventChapter05LexAzelleTalk

        CHECK_TALK FlagAlways, Sigurd, Ayra
          EVENT FlagAlways, EventChapter05SigurdAyraTalk

        CHECK_TALK FlagAlways, Tailtiu, Azelle
          EVENT FlagAlways, EventChapter05TailtiuAzelleTalk

        CHECK_TALK FlagAlways, Tailtiu, Claud
          EVENT FlagAlways, EventChapter05TailtiuClaudTalk

        CHECK_TALK FlagAlways, Tailtiu, Lex
          EVENT FlagAlways, EventChapter05TailtiuLexTalk

        CHECK_TALK FlagAlways, Erinys, Lewyn
          EVENT FlagAlways, EventChapter05ErinysLewynTalk

        CHECK_TALK FlagAlways, Erinys, Arden
          EVENT FlagAlways, EventChapter05ErinysArdenTalk

        CHECK_TALK FlagAlways, Erinys, Naoise
          EVENT FlagAlways, EventChapter05ErinysNaoiseTalk

        CHECK_TALK FlagAlways, Silvia, Claud
          EVENT FlagAlways, EventChapter05SilviaClaudTalk

        CHECK_TALK FlagAlways, Silvia, Lewyn
          EVENT FlagAlways, EventChapter05SilviaLewynTalk

        CHECK_TALK FlagAlways, Silvia, Alec
          EVENT FlagAlways, EventChapter05SilviaAlecTalk

        CHECK_TALK FlagAlways, Lachesis, Beowulf
          EVENT FlagAlways, EventChapter05LachesisBeowulfTalk

        CHECK_TALK FlagAlways, Lachesis, Naoise
          EVENT FlagAlways, EventChapter05LachesisNaoiseTalk

        CHECK_TALK FlagAlways, Lachesis, Dew
          EVENT FlagAlways, EventChapter05LachesisDewTalk

        CHECK_TALK FlagAlways, Ayra, Lex
          EVENT FlagAlways, EventChapter05AyraLexTalk

        CHECK_TALK FlagAlways, Ayra, Chulainn
          EVENT FlagAlways, EventChapter05AyraChulainnTalk

        CHECK_TALK FlagAlways, Ayra, Arden
          EVENT FlagAlways, EventChapter05AyraArdenTalk

        CHECK_TALK FlagAlways, Brigid, Alec
          EVENT FlagAlways, EventChapter05BrigidAlecTalk

        CHECK_TALK FlagAlways, Brigid, Jamke
          EVENT FlagAlways, EventChapter05BrigidJamkeTalk

        CHECK_TALK FlagAlways, Brigid, Midir
          EVENT FlagAlways, EventChapter05BrigidMidirTalk

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch05_Village1
          EVENT FlagAlways, EventChapter05Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch05_Village2
          EVENT FlagAlways, EventChapter05Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch05_Village3
          EVENT FlagAlways, EventChapter05Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch05_Village4
          EVENT FlagAlways, EventChapter05Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch05_Village5
          EVENT FlagAlways, EventChapter05Village5

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch05_Village6
          EVENT FlagAlways, EventChapter05Village6

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch05_Village7
          EVENT FlagAlways, EventChapter05Village7

        CHECK_UNIT_DIED_TO FlagChapter05_ReptorDeathQuoteCheck, ReptorCh05, AnyCharacter
          EC_NOP_00

        CHECK_UNITS_FIGHTING FlagAlways, AnyFactionSlot, Slayder, AnyFactionSlot, Byron
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_ByronSlayderBattleQuote, dialogueChapter05ByronSlayderBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lex, AnyFactionSlot, LombardCh05
          SET_PRECOMBAT_DIALOGUE FlagChapter05_LexLombardBattleQuote, dialogueChapter05LexLombardBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Tailtiu, AnyFactionSlot, ReptorCh05
          SET_PRECOMBAT_DIALOGUE FlagChapter05_TailtiuReptorBattleQuote, dialogueChapter05TailtiuReptorBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Sigurd, AnyFactionSlot, Magorn
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_SigurdMagornBattleQuote, dialogueChapter05SigurdMagornBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, AnyFactionSlot, LombardCh05, AnyFactionSlot, Sigurd
          SET_PRECOMBAT_DIALOGUE FlagChapter05_SigurdLombardBattleQuote, dialogueChapter05SigurdLombardBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Sigurd, AnyFactionSlot, ReptorCh05
          SET_PRECOMBAT_DIALOGUE FlagChapter05_SigurdReptorBattleQuote, dialogueChapter05SigurdReptorBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Ch05Velthomer, Aida, AnyFactionSlot, ReptorCh05
          SET_PRECOMBAT_DIALOGUE FlagChapter05_AidaReptorBattleQuote, dialogueChapter05AidaReptorBattleQuote, $74

        CHECK_UNITS_FIGHTING FlagAlways, AnyFactionSlot, AndreyCh05, AnyFactionSlot, Edain
          SET_PRECOMBAT_DIALOGUE FlagChapter05_EdainAndreyBattleQuote, dialogueChapter05EdainAndreyBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, AnyFactionSlot, AndreyCh05, AnyFactionSlot, Brigid
          SET_PRECOMBAT_DIALOGUE FlagChapter05_BrigidAndreyBattleQuote, dialogueChapter05BrigidAndreyBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Ch05Leonster, Ethlyn, FS_Ch05Thracia, AnyCharacter
          SET_PRECOMBAT_DIALOGUE FlagChapter05_EthlynThraciaBattleQuote, dialogueChapter05EthlynThraciaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagChapter05_QuanThraciaBattleQuoteCheck, FS_Ch05Leonster, Quan, FS_Ch05Thracia, AnyCharacter
          EC_NOP_00

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Slayder
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_SlayderBattleQuote, dialogueChapter05SlayderBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Ch05Lubeck, AnyCharacter, AnyFactionSlot, Byron
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_ByronLubeckBattleQuote, dialogueChapter05ByronLubeckBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, AndreyCh05
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_AndreyBattleQuote, dialogueChapter05AndreyBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, LombardCh05
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_LombardBattleQuote, dialogueChapter05LombardBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Vaja
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_VajaBattleQuote, dialogueChapter05VajaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Travant
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_TravantBattleQuote, dialogueChapter05TravantBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Magorn
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_MagornBattleQuote, dialogueChapter05MagornBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagChapter05_ReptorBattleQuoteCheck, FS_Player, AnyCharacter, AnyFactionSlot, ReptorCh05
          EC_NOP_00

        BREAK_ACTION_EVENT_CHECKS

        START_PLAYER_PHASE FlagChapter05_StartPlayerPhase, AnyTurn
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter05_ReptorChargeTrigger, AnyCharacter, pack([24, 46]), pack([26, 52]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter05_ReptorChargeTrigger, AnyCharacter, pack([23, 51]), pack([27, 55]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter05_ReptorChargeTrigger, AnyCharacter, pack([16, 52]), pack([28, 57]), FS_Player
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter05_ReptorChargeTrigger, AnyCharacter, pack([29, 55]), pack([29, 56]), FS_Player
          EC_NOP_00

        CHECK_UNITS_FIGHTING FlagChapter05_ReptorChargeTrigger, FS_Player, AnyCharacter, FS_Ch05Friege, AnyCharacter
          EC_NOP_00
        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_QuanBattleQuote
          CHECK_FLAG_SET FlagChapter05_QuanThraciaBattleQuoteCheck
            CHECK_FLAG_UNSET FlagChapter05_EthlynDiedCheck
              SET_PRECOMBAT_DIALOGUE FlagChapter05_QuanBattleQuote, dialogueChapter05QuanBattleQuoteEthlynAlive, $46
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_QuanBattleQuote
          CHECK_FLAG_SET FlagChapter05_QuanThraciaBattleQuoteCheck
            CHECK_FLAG_SET FlagChapter05_EthlynDiedCheck
              SET_PRECOMBAT_DIALOGUE FlagChapter05_QuanBattleQuote, dialogueChapter05QuanBattleQuoteEthlynDead, $46
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_ReptorBattleQuote
          CHECK_FLAG_SET FlagChapter05_ReptorBattleQuoteCheck
            CHECK_FLAG_UNSET FlagChapter05_AidaBetrayal
              SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_ReptorBattleQuote, dialogueChapter05ReptorBattleQuotePreBetrayal, 0
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_ReptorBattleQuote
          CHECK_FLAG_SET FlagChapter05_ReptorBattleQuoteCheck
            CHECK_FLAG_SET FlagChapter05_AidaBetrayal
              SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_ReptorBattleQuote, dialogueChapter05ReptorBattleQuotePostBetrayal, 0
        BREAK_STATE_CHECKS

        UNSET_FLAG FlagChapter05_ReptorBattleQuoteCheck

        CHECK_FLAG_SET FlagChapter05_ReptorDeathQuoteCheck
          CHECK_FLAG_UNSET FlagChapter05_ReptorDeathQuote
            CHECK_FLAG_UNSET FlagChapter05_AidaBetrayal
              SET_BATTLE_OR_DEATH_QUOTE FlagChapter05_ReptorDeathQuote, dialogueDeathQuoteReptorPreBetrayal, 1
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_AndreyBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter05_EdainAndreyBattleQuote, FlagChapter05_BrigidAndreyBattleQuote]
            SET_FLAG FlagChapter05_AndreyBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_LombardBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter05_SigurdLombardBattleQuote, FlagChapter05_LexLombardBattleQuote]
            SET_FLAG FlagChapter05_LombardBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_ReptorBattleQuoteCheck
          CHECK_FLAG_IN_LIST_SET [FlagChapter05_TailtiuReptorBattleQuote, FlagChapter05_SigurdReptorBattleQuote, FlagChapter05_AidaReptorBattleQuote]
            SET_FLAG FlagChapter05_ReptorBattleQuoteCheck
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_MagornBattleQuote
          CHECK_FLAG_SET FlagChapter05_SigurdMagornBattleQuote
            SET_FLAG FlagChapter05_MagornBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch05Lubeck, 7, AnyCharacter
          CHECK_FLAG_SET FlagChapter05_SlayderDied
            CHECK_FLAG_UNSET FlagChapter05_AndreyDied
              EVENT FlagChapter05_AndreyCharge, EventChapter05AndreyCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch05Belhalla
          EVENT FlagChapter05_BelhallaConversation, EventChapter05BelhallaConversation
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter05_LubeckSeized
          CHECK_FLAG_SET FlagChapter05_LubeckSeizedCheck
            CHECK_UNIT_ALIVE Byron
              SET_FLAG FlagChapter05_ByronAliveWhenSeizingLubeck
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter05_LubeckSeizedCheck
          EVENT FlagChapter05_LubeckSeized, EventChapter05LubeckSeized
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch05Phinora
          CHECK_FLAG_SET FlagChapter05_LubeckSeizedCheck
            EVENT FlagChapter05_PhinoraSpawn, EventChapter05PhinoraSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch05Byron
          CHECK_FLAG_UNSET FlagChapter05_LeonsterSpawn
            CHECK_FLAG_SET FlagChapter05_LubeckSeizedCheck
              LOAD_FACTION_GROUP FS_Ch05Leonster, FG_Ch05Leonster
              LOAD_FACTION_GROUP FS_Ch05Thracia, FG_Ch05Thracia

              macroSetFactionsAllies  [FS_Ch05Leonster, FS_Player]
              macroSetFactionsEnemies [FS_Ch05Leonster, FS_Ch05Phinora]
              macroSetFactionsEnemies [FS_Ch05Leonster, FS_Ch05Velthomer]
              macroSetFactionsEnemies [FS_Ch05Leonster, FS_Ch05Friege]
              macroSetFactionsEnemies [FS_Ch05Leonster, FS_Ch05Belhalla]
              macroSetFactionsEnemies [FS_Ch05Leonster, FS_Ch05Thracia]
              macroSetFactionsNeutral [FS_Ch05Thracia,  FS_Player]
              macroSetFactionsEnemies [FS_Ch05Thracia,  FS_Ch05Leonster]
              macroSetFactionsAllies  [FS_Ch05Thracia,  FS_Ch05Phinora]
              macroSetFactionsAllies  [FS_Ch05Thracia,  FS_Ch05Velthomer]
              macroSetFactionsAllies  [FS_Ch05Thracia,  FS_Ch05Friege]
              macroSetFactionsAllies  [FS_Ch05Thracia,  FS_Ch05Belhalla]

              EVENT FlagChapter05_LeonsterSpawn, EventChapter05LeonsterSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch05Thracia
          CHECK_FLAG_SET FlagChapter05_LubeckSeizedCheck
            EVENT FlagChapter05_ThraciaSpawn, EventChapter05ThraciaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapter05_QuanDiedCheck
          CHECK_FLAG_SET FlagChapter05_EthlynDiedCheck
            EVENT FlagChapter05_QuanAndEthlynDead, EventChapter05QuanAndEthlynDead
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter05_QuanDiedCheck
          CHECK_FLAG_UNSET FlagChapter05_EthlynDiedCheck
            SET_FLAG FlagChapter05_QuanAndEthlynDead
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch05Friege, 1, AnyCharacter
          CHECK_FLAG_SET FlagChapter05_AidaBetrayal
            CHECK_FLAG_UNSET FlagChapter05_ReptorDied
              EVENT FlagChapter05_ReptorBetrayalResponse, EventChapter05ReptorBetrayalResponse
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapter05_StartPlayerPhase
          CHECK_FLAG_SET FlagChapter05_ReptorCharge
            EVENT FlagChapter05_AidaBetrayal, EventChapter05AidaBetrayal
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch05Friege
          CHECK_FLAG_SET FlagChapter05_ReptorChargeTrigger
            CHECK_FLAG_UNSET FlagChapter05_AidaBetrayal
              EVENT FlagChapter05_ReptorCharge, EventChapter05ReptorCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapter05_ReptorDied
          CHECK_FLAG_UNSET FlagChapter05_EnabledSigurdAidaTalk
            UNSET_FLAG FlagChapter05_SigurdAidaTalk
            SET_FLAG FlagChapter05_AnyoneAidaTalkCheck
            SET_FLAG FlagChapter05_EnabledSigurdAidaTalk
        BREAK_STATE_CHECKS

        _AliveUnitsFlags := [(Naoise,    FlagChapter05EndAlive_Naoise  )]
        _AliveUnitsFlags..= [(Alec,      FlagChapter05EndAlive_Alec    )]
        _AliveUnitsFlags..= [(Arden,     FlagChapter05EndAlive_Arden   )]
        _AliveUnitsFlags..= [(Midir,     FlagChapter05EndAlive_Midir   )]
        _AliveUnitsFlags..= [(Lewyn,     FlagChapter05EndAlive_Lewyn   )]
        _AliveUnitsFlags..= [(Chulainn,  FlagChapter05EndAlive_Chulainn)]
        _AliveUnitsFlags..= [(Azelle,    FlagChapter05EndAlive_Azelle  )]
        _AliveUnitsFlags..= [(Jamke,     FlagChapter05EndAlive_Jamke   )]
        _AliveUnitsFlags..= [(Claud,     FlagChapter05EndAlive_Claud   )]
        _AliveUnitsFlags..= [(Beowulf,   FlagChapter05EndAlive_Beowulf )]
        _AliveUnitsFlags..= [(Lex,       FlagChapter05EndAlive_Lex     )]
        _AliveUnitsFlags..= [(Dew,       FlagChapter05EndAlive_Dew     )]
        _AliveUnitsFlags..= [(Lachesis,  FlagChapter05EndAlive_Lachesis)]
        _AliveUnitsFlags..= [(Ayra,      FlagChapter05EndAlive_Ayra    )]
        _AliveUnitsFlags..= [(Erinys,    FlagChapter05EndAlive_Erinys  )]
        _AliveUnitsFlags..= [(Tailtiu,   FlagChapter05EndAlive_Tailtiu )]
        _AliveUnitsFlags..= [(Silvia,    FlagChapter05EndAlive_Silvia  )]
        _AliveUnitsFlags..= [(Edain,     FlagChapter05EndAlive_Edain   )]
        _AliveUnitsFlags..= [(Brigid,    FlagChapter05EndAlive_Brigid  )]

        CHECK_FLAG_SET FlagChapter05_EndChapter
          .for _Unit, _Flag in _AliveUnitsFlags
            UNSET_FLAG _Flag
          .endfor
        BREAK_STATE_CHECKS

        .for _Unit, _Flag in _AliveUnitsFlags

          CHECK_FLAG_SET FlagChapter05_EndChapter
            CHECK_UNIT_ALIVE _Unit
              SET_FLAG _Flag
          BREAK_STATE_CHECKS

        .endfor

        CHECK_FLAG_SET FlagChapter05_EndChapter
          EVENT FlagAlways, EventChapter05Ending
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter05_ArdenOnCliffCheck
          CHECK_UNITS_MARRIED Arden, AnyCharacter
            EVENT FlagChapter05_ArdenOnCliff, EventChapter05ArdenOnCliff
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter05_ArdenOnCliffCheck
          CHECK_FLAG_UNSET FlagChapter05_ArdenOnCliff
            UNSET_FLAG FlagChapter05_ArdenOnCliffCheck
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          SET_TALK_TARGET_IF_MARRIED FlagChapter05_ClaudLoverTalkSet, Claud, Edain
          CHECK_FLAG_SET FlagChapter05_PhinoraSeizedCheck
            CHECK_FLAG_UNSET FlagChapter05_ReptorDied
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_TailtiuLoverTalkSet,   Tailtiu,  Azelle
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_TailtiuLoverTalkSet,   Tailtiu,  Claud
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_TailtiuLoverTalkSet,   Tailtiu,  Lex
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_ErinysLoverTalkSet,    Erinys,   Lewyn
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_ErinysLoverTalkSet,    Erinys,   Arden
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_ErinysLoverTalkSet,    Erinys,   Naoise
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_SilviaLoverTalkSet,    Silvia,   Claud
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_SilviaLoverTalkSet,    Silvia,   Lewyn
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_SilviaLoverTalkSet,    Silvia,   Alec
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_LachesisLoverTalkSet,  Lachesis, Beowulf
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_LachesisLoverTalkSet,  Lachesis, Naoise
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_LachesisLoverTalkSet,  Lachesis, Dew
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_AyraLoverTalkSet,      Ayra,     Lex
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_AyraLoverTalkSet,      Ayra,     Chulainn
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_AyraLoverTalkSet,      Ayra,     Arden
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_BrigidLoverTalkSet,    Brigid,   Alec
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_BrigidLoverTalkSet,    Brigid,   Jamke
              SET_TALK_TARGET_IF_MARRIED FlagChapter05_BrigidLoverTalkSet,    Brigid,   Midir
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter05_ReptorDied
            SET_TALK_TARGET Claud, None
            SET_TALK_TARGET Tailtiu, None
            SET_TALK_TARGET Erinys, None
            SET_TALK_TARGET Silvia, None
            SET_TALK_TARGET Lachesis, None
            SET_TALK_TARGET Ayra, None
            SET_TALK_TARGET Brigid, None
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        UNSET_FLAG FlagChapter05_StartPlayerPhase

        END_CHAPTER_EVENTS

    .endsection Chapter05EventsSection

    .section Chapter05EventDataSection

      aChapter05EventData ; 86/E510

        .structChapterEventData aChapter05LocationData, aChapter05MapChangeData, aUnknown86E5AF, aChapter05TalkEvents, None

      aChapter05LocationData ; 86/E51A

        .byte size(aChapter05LocationData._Entries) / size(word)
  
        _Entries .include "../TABLES/CHAPTER/Chapter05LocationData.csv.asm"

      aChapter05ZaxonCastle ; 86/E533

        .structChapterCastleLocationEntry Ch05_Zaxon, ZaxonName, [22, 11], $FC, None

      aChapter05LubeckCastle ; 86/E53B

        .structChapterCastleLocationEntry Ch05_Lubeck, LubeckName, [55, 6], $FC, None

      aChapter05PhinoraCastle ; 86/E543

        .structChapterCastleLocationEntry Ch05_Phinora, PhinoraName, [42, 24], $FC, None

      aChapter05VelthomerCastle ; 86/E54B

        .structChapterCastleLocationEntry Ch05_Velthomer, VelthomerName, [22, 39], $00, None

      aChapter05BelhallaCastle ; 86/E553

        .structChapterCastleLocationEntry Ch05_Belhalla, BelhallaName, [4, 57], $00, None

      aChapter05Village1 ; 86/E55B

        .structChapterVillageLocationEntry Ch05_Village1, [3, 24]

      aChapter05Village2 ; 86/E560

        .structChapterVillageLocationEntry Ch05_Village2, [18, 22]

      aChapter05Village3 ; 86/E565

        .structChapterVillageLocationEntry Ch05_Village3, [19, 6]

      aChapter05Village4 ; 86/E56A

        .structChapterVillageLocationEntry Ch05_Village4, [35, 2]

      aChapter05Village5 ; 86/E56F

        .structChapterVillageLocationEntry Ch05_Village5, [37, 17]

      aChapter05Village6 ; 86/E574

        .structChapterVillageLocationEntry Ch05_Village6, [57, 3]

      aChapter05Village7 ; 86/E579

        .structChapterVillageLocationEntry Ch05_Village7, [60, 12]

      aChapter05MapChangeData ; 86/E57E

        .structChapterMapChangeEntry Chapter05, FlagChapter05_LubeckRampart, [53, 14], aChapter05MapChangeLubeckRampart
        .structChapterMapChangeEntry Chapter05, FlagChapter05_VelthomerRampart, [30, 57], aChapter05MapChangeVelthomerRampart
        .structChapterMapChangeEntry Chapter05, FlagChapter05_BelhallaRampart, [17, 43], aChapter05MapChangeBelhallaRampart
        .word $FFFF

      aChapter05MapChangeLubeckRampart ; 86/E595

        .byte 2
        .byte 2

        .word $008B, $008C
        .word $073A, $073B

      aChapter05MapChangeVelthomerRampart ; 86/E59F

        .byte 1
        .byte 3

        .word $08AE
        .word $08AE
        .word $0A5A

      aChapter05MapChangeBelhallaRampart ; 86/E5A7

        .byte 1
        .byte 3

        .word $08AE
        .word $08AE
        .word $0A5A

      aUnknown86E5AF ; 86/E5AF

        .word <>aUnknown86E5B3
        .word <>aUnknown86E5C3

      aUnknown86E5B3 ; 86/E5B3

        .word $0204
        .word $0206
        .word $0207
        .word $0208
        .word $0209
        .word $020B
        .word $020C
        .word $FFFF

      aUnknown86E5C3 ; 86/E5C3

        .word $0205
        .word $0206
        .word $0207
        .word $0208
        .word $020A
        .word $020B
        .word $020C
        .word $FFFF

      aChapter05TalkEvents ; 86/E5D3

        .structChapterTalkEventEntry Chapter05, 37, Sigurd, Byron
        .structChapterTalkEventEntry Chapter05, 37, Byron, Sigurd
        .structChapterTalkEventEntry Chapter05, 38, Sigurd, Aida
        .structChapterTalkEventEntry Chapter05, 40, $FFFF, Aida
        .word $FFFF

      aFactionGroupData1A ; 86/E5F5

        .structFactionGroupData FactionSigurd, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData1A._Locations, None

        _Locations ; 86/E5FE
        .word Ch05_Zaxon
        .word $FFFF

      aFactionGroupData1B ; 86/E602

        .structFactionGroupData FactionLubeck, BattleHUDColorDarkBlue, BattleBannerDozel, None, aFactionGroupData1B._Locations, aFactionGroupData1B._GroupAI

        _Locations ; 86/E60B
        .word Ch05_Lubeck
        .word $FFFF

        _GroupAI ; 86/E60F
        .long aFactionGroup1BAI1
        .long aFactionGroup1BAI2
        .long aFactionGroup1BAI3
        .long aFactionGroup1BAI4
        .long aFactionGroup1BAI5
        .long aFactionGroup1BAI6
        .long aFactionGroup1BAI7
        .word $FFFF

      aFactionGroupData1C ; 86/E626

        .structFactionGroupData FactionPhinora, BattleHUDColorDarkBlue, BattleBannerVelthomer, None, aFactionGroupData1C._Locations, aFactionGroupData1C._GroupAI

        _Locations ; 86/E62F
        .word Ch05_Phinora
        .word $FFFF

        _GroupAI ; 86/E633
        .long aFactionGroup1CAI1
        .word $FFFF

      aFactionGroupData1D ; 86/E638

        .structFactionGroupData FactionVelthomer1, BattleHUDColorDarkBlue, BattleBannerVelthomer, None, aFactionGroupData1D._Locations, aFactionGroupData1D._GroupAI

        _Locations ; 86/E641
        .word Ch05_Velthomer
        .word $FFFF

        _GroupAI ; 86/E645
        .long aFactionGroup1DAI1
        .long aFactionGroup1DAI2
        .long aFactionGroup1DAI3
        .word $FFFF

      aFactionGroupData1E ; 86/E650

        .structFactionGroupData FactionBelhalla1, BattleHUDColorDarkBlue, BattleBannerBelhalla, None, aFactionGroupData1E._Locations, aFactionGroupData1E._GroupAI

        _Locations ; 86/E659
        .word Ch05_Belhalla
        .word $FFFF

        _GroupAI ; 86/E65D
        .long aFactionGroup1EAI1
        .word $FFFF

      aFactionGroupData1F ; 86/E662

        .structFactionGroupData $FF, BattleHUDColorOrange, BattleBannerDefault, None, None, aFactionGroupData1F._GroupAI

        _GroupAI ; 86/E66B
        .long aFactionGroup1FAI1
        .word $FFFF

      aFactionGroupData20 ; 86/E670

        .structFactionGroupData FactionFriege1, BattleHUDColorDarkBlue, BattleBannerFreege, None, None, aFactionGroupData20._GroupAI

        _GroupAI ; 86/E679
        .long aFactionGroup20AI1
        .word $FFFF

      aFactionGroupData21 ; 86/E67E

        .structFactionGroupData FactionLeonster, BattleHUDColorBrown, BattleBannerLeonster, None, None, aFactionGroupData21._GroupAI

        _GroupAI ; 86/E687
        .long aFactionGroup21AI1
        .word $FFFF

      aFactionGroupData22 ; 86/E68C

        .structFactionGroupData FactionThracia, BattleHUDColorDarkRed, BattleBannerThracia, None, None, aFactionGroupData22._GroupAI

        _GroupAI ; 86/E695
        .long aFactionGroup22AI1
        .long aFactionGroup22AI2
        .word $FFFF

      aFactionGroup1BAI1 ; 86/E69D

        AI_07 Ch05_Lubeck, $05
        AI_END

      aFactionGroup1BAI2 ; 86/E6A1

        AI_SET_FORMATION $08, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch05_Zaxon, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup1BAI3 ; 86/E6AF

        AI_SET_FORMATION $01, $03
        AI_0A
        AI_END

      aFactionGroup1BAI4 ; 86/E6B4

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup1BAI5 ; 86/E6B7

        AI_SET_FORMATION $01, $01
        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_06 Ch05_Zaxon, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup1BAI6 ; 86/E6C1

        AI_0B
        AI_END

      aFactionGroup1BAI7 ; 86/E6C3

        AI_SET_FORMATION $08, $03
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter05, FlagChapter05_SlayderDied, +

          AI_0A
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup1CAI1 ; 86/E6D0

        AI_07 Ch05_Phinora, $05
        AI_END

      aFactionGroup1DAI1 ; 86/E6D4

        AI_0B
        AI_END

      aFactionGroup1DAI2 ; 86/E6D6

        AI_0B
        AI_END

      aFactionGroup1DAI3 ; 86/E6D8

        AI_07 Ch05_Velthomer, $05
        AI_END

      aFactionGroup20AI1 ; 86/E6DC

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter05, FlagChapter05_ReptorChargeTrigger, +

          AI_0B
          AI_END

        +
        AI_02 $07
        AI_TARGET_SPECIFIED_UNIT Sigurd
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup1EAI1 ; 86/E6EB

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup1FAI1 ; 86/E6ED

        AI_02 $03
        AI_INTERACT_WITH_UNIT Sigurd, $0C
        AI_END

      aFactionGroup21AI1 ; 86/E6F4

        AI_06 Ch05_Phinora, $06
        AI_END

      aFactionGroup22AI1 ; 86/E6F8

        AI_SET_FORMATION $06, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup22AI2 ; 86/E6FD

        AI_TARGET_ALL_FOES
        AI_END

    .endsection Chapter05EventDataSection
