SET c2a=%~dp0tools\c2a.py
SET FE4c2a=%~dp0tools\FE4c2a.py

cd %~dp0TABLES
for /r /d %%f in (*.*) do (
	for %%t in (%%f\*.csv) do (
		python "%c2a%" "%%t" "%%f\%%~nt.csv.asm"
	)
)

cd %~dp0TABLES\CHARACTER
python "%FE4c2a%" "CharacterData.csv" "CharacterDataHelper.h" "CharacterData.csv.asm"

cd %~dp0TABLES\ITEM
python "%FE4c2a%" "ItemData.csv" "ItemDataHelper.h" "ItemData.csv.asm"

cd %~dp0TABLES
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.csv.asm"
)

pause