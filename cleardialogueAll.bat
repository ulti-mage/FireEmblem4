cd %~dp0TEXT\DIALOGUE

for /r %%f in (*.dialogue.txt) do (
	del %%f
)

pause