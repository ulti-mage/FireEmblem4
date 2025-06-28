SET pd=%~dp0tools\process_dialogue.py
SET font=%~dp0TEXT\DIALOGUE\DialogueFont.txt

cd %~dp0TEXT\DIALOGUE

for /d %%f in (*.*) do (

	if %%f equ Convert (

	for %%t in (%%f\*.txt) do (
		python "%pd%" "%%t" "%font%" "%%f\%%~nt.dialogue.txt"
	)
	)

)

pause