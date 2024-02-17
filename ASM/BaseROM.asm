
.weak
  WARNINGS :?= "None"
.endweak

GUARD_FE4_BASEROM :?= false
.if (!GUARD_FE4_BASEROM)
  GUARD_FE4_BASEROM := true

  ; Fill the base ROM in parts to prevent
  ; pc wrap warnings.

  * := $000000

  .for bank in range($000000, $400000, $8000)
    * := bank
    .binary "../base_rom/fe4.sfc", bank, $8000
  .endfor

.endif ; GUARD_FE4_BASEROM
