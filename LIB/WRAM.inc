

  .virtual $00070

    bBufferINIDISP   .byte ? ; $000070
    bBufferOBSEL     .byte ? ; $000071
    wBufferOAMADD    .word ? ; $000072
    bBufferBGMODE    .byte ? ; $000074
    bBufferMOSAIC    .byte ? ; $000075
    bBufferBG1SC     .byte ? ; $000076
    bBufferBG2SC     .byte ? ; $000077
    bBufferBG3SC     .byte ? ; $000078
    bBufferBG4SC     .byte ? ; $000079
    bBufferBG12NBA   .byte ? ; $00007A
    bBufferBG34NBA   .byte ? ; $00007B
    bBufferM7SEL     .byte ? ; $00007C
    bBufferW12SEL    .byte ? ; $00007D
    bBufferW34SEL    .byte ? ; $00007E
    wBufferBG1HOFS   .word ? ; $00007F
    wBufferBG1VOFS   .word ? ; $000081
    wBufferBG2HOFS   .word ? ; $000083
    wBufferBG2VOFS   .word ? ; $000085
    wBufferBG3HOFS   .word ? ; $000087
    wBufferBG3VOFS   .word ? ; $000089
    wBufferBG4HOFS   .word ? ; $00008B
    wBufferBG4VOFS   .word ? ; $00008D
    bBufferWOBJSEL   .byte ? ; $00008F
    bBufferWH0       .byte ? ; $000090
    bBufferWH1       .byte ? ; $000091
    bBufferWH2       .byte ? ; $000092
    bBufferWH3       .byte ? ; $000093
    bBufferWBGLOG    .byte ? ; $000094
    bBufferWOBJLOG   .byte ? ; $000095
    bBufferTM        .byte ? ; $000096
    bBufferTS        .byte ? ; $000097
    bBufferTMW       .byte ? ; $000098
    bBufferTSW       .byte ? ; $000099
    bBufferCGWSEL    .byte ? ; $00009A
    bBufferCGADSUB   .byte ? ; $00009B
    bBufferCOLDATA_0 .byte ? ; $00009C
    bBufferCOLDATA_1 .byte ? ; $00009D
    bBufferCOLDATA_2 .byte ? ; $00009E
    bBufferCOLDATA_3 .byte ? ; $00009F
    bBufferSETINI    .byte ? ; $0000A0

  .endvirtual

  .virtual $000B1

    bBufferNMITIMEN .byte ? ; $0000B1
    bBufferVTIMEL   .byte ? ; $0000B2
    bBufferVTIMEH   .byte ? ; $0000B3
    bBufferHTIMEL   .byte ? ; $0000B4
    bBufferHTIMEH   .byte ? ; $0000B5
    bBufferHDMAEN   .byte ? ; $0000B6
    bBufferMEMSEL   .byte ? ; $0000B7

  .endvirtual



  .virtual $0004A6

    lBlockCopySource .long ?      ; $0004A6
    lBlockCopyDestination .long ? ; $0004A9
    wBlockCopySize .word ?        ; $0004AC
    rsBlockCopyMVNRAM .block      ; $0004AE
      mvn #$00,#$00
      rts
    .endblock
    rsBlockCopyMVPRAM .block      ; $0004B2
      mvp #$00,#$00
      rts
    .endblock

  .endvirtual

















  .virtual $00054A

    lStructPointer1 .word ?       ; $00054A
    ; For saving, this is the data source.
    ; For loading, this is the destination.

  .endvirtual

  .virtual $000550

    wStructIndex .word ?          ; $000550
    ; Is 1 indexed instead of 0 indexed.

  .endvirtual

  .virtual $000554

    wStructSize .word ?           ; $000554

  .endvirtual

  .virtual $00055C

    lStructPointer2 .word ?       ; $00055C
    ; For saving, this is the destination.
    ; For loading, this is the data source.

  .endvirtual


  .virtual $000565

    lRAMAreaPointer .long ?       ; $00565

  .endvirtual


  ; $056D - $0590 is some current character stuff, gets cleared before loading a unit



  .virtual $00056F

    wSelectedUnitDataRAMPointer .word ? ; $00056F

  .endvirtual


  ; $000574 - for basically everything


  .virtual $00057A

    wCurrentClassDataROMPointer .word ? ; $00057A

  .endvirtual

  .virtual $000587

    wCurrentItemDataRAMPointer .word ? ; $000587

  .endvirtual

  .virtual $000583

    wCurrentItemDataROMPointer .word ? ; $000583

  .endvirtual


  .virtual $000D6A

    wCurrentChapter .word ? ; $000D6A

  .endvirtual





  .virtual $7E2000 ; some general use ram

    wDebugMenuSkillCounter .word ? ; $7E2000
    aDebugMenuSkillFlags .block    ; $7E2002
      bUnknown1     .byte ?
      bCanto        .byte ?
      bPavise       .byte ?
      bWrath        .byte ?
      bPursuit      .byte ?
      bAdept        .byte ?
      bSteal        .byte ?
      bUnknown2     .byte ?
      bDance        .byte ?
      bUnknown3     .byte ?
      bUnknown4     .byte ?
      bUnknown5     .byte ?
      bCharm        .byte ?
      bUnknown6     .byte ?
      bNihil        .byte ?
      bMiracle      .byte ?
      bCritical     .byte ?
      bVantage      .byte ?
      bAccost       .byte ?
      bAstra        .byte ?
      bLuna         .byte ?
      bSol          .byte ?
      bHoly         .byte ?
      bDarkness     .byte ?
      bRenewal      .byte ?
      bParagon      .byte ?
      bUnknown7     .byte ?
      bUnknown8     .byte ?
      bBargain      .byte ?
      bUnknown9     .byte ?
    .bend
  .endvirtual





  .virtual $7E2180
    aFactionArea        ; $7E2180
      ; has 8 faction offsets, each offset with its own header and then ram pointers to units

  .endvirtual


  .virtual $7E2243

    aUnitRAMPointers .block                ; $7E2243
      _Header .dstruct structRAMStructHeader 
      _Entry .brept 72
        .word ?
      .endrept
    .bend

    aUnitRAMArea .block                    ; $7E22D7
      _Header .dstruct structRAMAreaHeader  
      _Entry .brept 72
        .dstruct structRAMAreaEntryHeader
        .dstruct structCharacterDataRAM
      .endrept
    .bend

    aStaticUnitRAMArea .block              ; $7E29E7
      _Header .dstruct structRAMAreaHeader
      _Entry .brept 24
        .dstruct structRAMAreaEntryHeader
        .dstruct structPersonalCharacterDataRAM
        .dstruct structExtendedPersonalCharacterDataRAM
      .endrept
    .bend

    aDynamicUnitRAMArea .block             ; $7E2D4F
      _Header .dstruct structRAMAreaHeader
      _Entry .brept 17
        .dstruct structRAMAreaEntryHeader
        .dstruct structPersonalCharacterDataRAM
        .dstruct structExtendedPersonalCharacterDataRAM
        .dstruct structCharacterConstantData
      .endrept
    .bend

    aHolyAndEnemyRAMArea .block            ; $7E3131
      _Header .dstruct structRAMAreaHeader
      _Entry .brept 63
        .dstruct structRAMAreaEntryHeader
        .dstruct structPersonalCharacterDataRAM
      .endrept
    .bend

    aInventoryRAMArea .block               ; $7E3664
      _Header .dstruct structRAMAreaHeader
      _Entry .brept 72+1
        .dstruct structRAMAreaEntryHeader
        .dstruct structInventoryDataRAM
      .endrept
    .bend

    aLoverRAMArea .block                    ; $7E3BD7
      _Header .dstruct structRAMAreaHeader
      _Entry .brept 9
        .dstruct structLoverDataRAM
      .endrept
      .fill 9 * 6
    .bend

  .endvirtual

  ; 7E3D23 - 100 bytes until items

  .virtual $7E3D87

    aItemRAMData .block
      _Header .dstruct structRAMStructHeader ; $7E3D87
      _Entry .brept 256
        .dstruct structItemRAMEntry
      .endrept
    .bend

    aDeploymentTable .block 
      _Status .brept 72       ; $7E438B
        .word ?
      .endrept
      _XPosition .brept 72    ; $7E441B
        .word ?
      .endrept
      _YPosition .brept 72    ; $7E44AB
        .word ?
      .endrept
    .bend

    ; 7E453B


    ; +$240
    ; $7E46EB - table with unit ram pointers

  .endvirtual



  .virtual $7E4EA9

    wBattleType .byte ? ; $7E4EA9
      ; 0 = normal
      ; 1 = arena
      ; 3 = ?
    wBattleStatus   .byte ? ; $7E4EAA
      ; $20 - ?
      ; $10 - ?
      ; $08 - siege offense (guard attacks)
      ; $04 - siege defense (guard defends)
      ; $01 - enemy initiator
      ; $00 - player initiator

    wBattleDistance .word ? ; $7E4EAB

  .endvirtual


  .virtual $7E4EB3
      
    wBattleSong .word ? ; $7E4EB3

    aActionStructUnit1 .dstruct structActionStructEntry ; $7E4EB5
    aActionStructUnit2 .dstruct structActionStructEntry ; $7E4F15

    ; 7E4F75
  .endvirtual


  .virtual $7E4F81

    aBattleRoundsData .block
      _Header .dstruct structRAMStructHeader ; 7E4F81
      _Entry .brept 40 *2
        .word ?
      .endrept
    .bend
    atestbyte .byte ?

  .endvirtual


  .virtual $7E4EC5

    ; This overlaps with aActionStructUnit1

    aChildAverageLevelStats .block
      HP          .word ? ; 7E4EC5
      Strength    .word ? ; 7E4EC7
      Magic       .word ? ; 7E4EC9
      Skill       .word ? ; 7E4ECB
      Speed       .word ? ; 7E4ECD
      Defense     .word ? ; 7E4ECF
      Resistance  .word ? ; 7E4ED1
      Luck        .word ? ; 7E4ED3
    .bend
  .endvirtual






  .virtual $7ECCC6

    wActionStructAttackerDeploymentNumber .word ? ; $7ECCC6
    wActionStructDefenderDeploymentNumber .word ? ; $7ECCC8
    wActionStructUnit1DeploymentNumber    .word ? ; $7ECCCA
    wActionStructUnit2DeploymentNumber    .word ? ; $7ECCCC

  .endvirtual





  .virtual $7ECCD6

    wBattleAttackerIndex    .word ? ; $7ECCD6
      ; 0 = player
      ; 1 = enemy
    wActionStructAttacker   .word ? ; $7ECCD8
    wActionStructDefender   .word ? ; $7ECCDA
    wBattleActivatedSkill   .word ? ; $7ECCDC

  .endvirtual

  .virtual $7ECCDE

    bBattleRoundFlags .byte ? ; $7ECCDE
      ; "ＥＭＴＤＤＣＡＴ"
      ; $00 = player
      ; $01 = enemy
      ; $02 = staff action?
      ; $04 = crit?
      ; $08 = miss?
      ; $10 = vs julius, arena and not trigger skill 1 set?
      ; $20 = ranged
      ; $40 = magic

  .endvirtual

  ; $7ECCE8 - various things



  .virtual $7F8402

    wDebugMenuScreenIndex .word ? ; 7F8402

  .endvirtual

  .virtual $7FEB66

    aMotherData .block
      _Personal .dstruct structParentExtendedCharacterData  ; $7FEB66
      _ROM      .dstruct structParentCharacterROMData       ; $7FEB84
    .bend
  .endvirtual
    ; 7FEBA6


  .virtual $7FEBF4

    aFatherData .block
      _Personal .dstruct structParentExtendedCharacterData  ; $7FEBF4
      _ROM      .dstruct structParentCharacterROMData       ; $7FEC12
    .bend
  .endvirtual
    ; 7FEC34
