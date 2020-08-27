@echo off
for /F %%I IN ('dir /A:-D /b /s *.zip') DO (
    echo %%I
    "C:\Program Files\7-Zip\7z.exe" x -o"%%~dpnI" "%%I"
	cd "%%~dpnI"


	for /L %%k IN (0,1,15) DO (

		for /F %%J IN ('dir /A:-D /b /s *.zip *.rar *.xz *.tar *.jar *.gzip *.gz') DO (
			"C:\Program Files\7-Zip\7z.exe" x -o"%%~dpnJ" "%%J"
			if ERRORLEVEL 1 (
				echo -------------------->> errors.txt
				echo "Error level %ERRORLEVEL%">> errors.txt
				echo %%J>> errors.txt
				cmd /c "exit /b 0"
			)
			del /F /Q "%%J"
		)
	)
)
