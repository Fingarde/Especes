@ECHO OFF
SETLOCAL

echo Si un pessage apparait taper Non
REG ADD HKCU\Console /v CodePage /t REG_DWORD /d 0xfde9

chcp 65001

echo const especes = [ > especes.js
for /f "usebackq delims=|" %%d in (`dir /b "especes"`) do ^
for /f "usebackq delims=|" %%f in (`dir /b "especes/%%d"`) do ^
echo ^
	{"espece": "%%~nf", "ordre": "%%~nd", "image": "especes/%%~nd/%%~nf%%~xf"}, >> especes.js
echo ] >> especes.js

pause