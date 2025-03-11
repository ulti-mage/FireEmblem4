cd %~dp0TEXT\DIALOGUE

for /d %%f in (*.*) do (


	for %%t in (%%f\*.dialogue.txt) do (
		del %%t
	)

)

pause