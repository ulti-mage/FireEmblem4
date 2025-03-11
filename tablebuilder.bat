SET c2a=%~dp0tools\c2a.py
SET FE4c2a=%~dp0tools\FE4c2a.py

cd %~dp0TABLES
for %%t in (*.csv) do (
	if %%t neq CharacterData.csv (
	if %%t neq ItemData.csv (
		python "%c2a%" "%%t" "%%~nt.csv.asm"
	)
	)
)

python "%FE4c2a%" "CharacterData.csv" "CharacterDataHelper.h" "CharacterData.csv.asm"
python "%FE4c2a%" "ItemData.csv" "ItemDataHelper.h" "ItemData.csv.asm"

cd %~dp0TABLES/CHAPTER
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.csv.asm"
)

cd %~dp0TABLES/EVENTUNIT
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.csv.asm"
)

pause