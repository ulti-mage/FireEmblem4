
  .virtual $306000

    aSRAM .block

      aSaveSlot1 .structSaveDataEntry ; $306000
      wLastUsedOptions .word ?        ; $3067FE
      aSaveSlot2 .structSaveDataEntry ; $306800
      wRankingScore .word ?           ; $306FFE
      aSaveSlot3 .structSaveDataEntry ; $307000
      wUnknown3077FE .word ?          ; $3077FE
      aSaveSlot4 .structSaveDataEntry ; $307800
      wUnknown307FFE .word ?          ; $307FFE

    .bend

  .endvirtual
