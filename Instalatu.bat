@echo off
cls

rem aldagaiak ----------------------------------------------------------------------------------

rem Instalatu nahi den LibreOffice bertsioa. Aldatu behar da
set bertsioa=5.4.0

rem instalazio bide izenak: Windows10
ver | findstr /i "10\.0\." > nul
IF %ERRORLEVEL% EQU 0 (
	echo.
	set bits=x64
	set string={992C4FE4-C278-4B62-A8B1-6FACB8E62980}
	echo Windows 10 ...
	echo.

)
rem instalazio bide izenak: windows 7
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 (
	echo.
	set bits=x64
	set string={992C4FE4-C278-4B62-A8B1-6FACB8E62980}
	echo Windows 7 ...
	echo.

)
rem Windows XP
ver | findstr /i "5\.1\." > nul
	IF %ERRORLEVEL% EQU 0 (
	echo.
	set bits=x86
	set string={A58CEA35-2B5F-4720-B5BE-D0B6A1E645FB}
	echo windows XP ...
	echo.
	f:\LibreOffice\xp.bat
	goto End
)


:start

echo.
echo.Programa guztiak itxi eta sakatu edozein tekla Libreoffice instalatzeko 
echo.
echo Cierre todos los programas y presione cualquier tecla para instalar LibreOffice
echo.
pause > nul

cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 instalatzen ...

f:\Libreoffice\Erabilgarriak\vcredist_%bits%_2012.exe /quiet /norestart
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 instalatzen ...

f:\Libreoffice\Erabilgarriak\vcredist_%bits%_2015.exe /q /norestart
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java instalatzen ...


If not exist "c:\Program Files\Java" (
f:\LibreOffice\Erabilgarriak\jre-8u131-windows-x64.exe /s
)
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java ------------------- Instalatua
echo Libreoffice instalatzen ...

msiexec /qr /i f:\Libreoffice\LibreOffice\LibreOffice_%bertsioa%_Win_%bits%.msi UI_LANGS=es,eu ALLUSERS=1 ISCHECKFORPRODUCTUPDATES=0 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=1 /NORESTART
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java ------------------- Instalatua
echo Libreoffice ------------ Instalatua
echo Laguntza euskaraz instalatzen ...

msiexec /qr /i f:\Libreoffice\LibreOffice\LibreOffice_%bertsioa%_Win_%bits%_helppack_es.msi
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java ------------------- Instalatua
echo Libreoffice ------------ Instalatua
echo Laguntza euskaraz ------ Instalatua
echo Laguntza gazteleraz instalatzen ...

msiexec /qr /i f:\Libreoffice\LibreOffice\LibreOffice_%bertsioa%_Win_%bits%_helppack_eu.msi
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java ------------------- Instalatua
echo Libreoffice ------------ Instalatua
echo Laguntza euskaraz ------ Instalatua
echo libreoffice gazteleraz - Instalatua
echo Hedapenak instalatzen ...

rem Garbitu ------------------------------------------------------------------------------------------
"c:\program files\Libreoffice 5\program\unopkg.exe" remove --shared es.binovo.uzei.hobelex
"c:\program files\Libreoffice 5\program\unopkg.exe" remove --shared Gida.from.cim l
"c:\program files\Libreoffice 5\program\unopkg.exe" remove --shared net.eleka.xuxen_eu
"c:\program files\Libreoffice 5\program\unopkg.exe" remove --shared Cim.from.cim
"c:\program files\Libreoffice 5\program\unopkg.exe" remove --shared Hiztegiaklite.from.cim
"c:\program files\Libreoffice 5\program\unopkg.exe" remove --shared Hiztegiak.from.cim

rem Hedapenak instalatzen ditu ----------------------------------------------------------------------
echo.

"c:\program files\Libreoffice 5\program\unopkg.exe" add --shared --suppress-license "f:\Libreoffice\Hedapenak\hobelex_libreoffice.oxt"
"c:\program files\Libreoffice 5\program\unopkg.exe" add --shared "f:\Libreoffice\Hedapenak\gida.oxt"
"c:\program files\Libreoffice 5\program\unopkg.exe" add --shared "f:\Libreoffice\Hedapenak\cim.oxt"
"c:\program files\Libreoffice 5\program\unopkg.exe" add --shared "f:\Libreoffice\Hedapenak\udal_Hiztegiak.oxt" >nul
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java ------------------- Instalatua
echo Libreoffice ------------ Instalatua
echo Laguntza euskaraz ------ Instalatua
echo Laguntza gazteleraz ---- Instalatua
echo Hedapenak -------------- Instalatua
echo Profila instalatzen ...

rem Profil lehenetsia konfiguratzen du --------------------------------------------------------------
echo.
rem Interfazearen ikonoen tamaina (txikia)
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Common\Misc\SymbolSet" /v Value /d 0 /f > nul

rem Interfazearen Hizkuntza
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Linguistic\General\UILocale" /v Value /d eu /f > nul

rem Hizkuntza Lehenetsia
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Linguistic\General\DefaultLocale" /v Value /d eu /f > nul

rem Lokalak
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Setup\L10N\ooSetupSystemLocale" /v Value /d eu /f > nul

rem Hybrid PDF
rem reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Common\Filter\PDF\Export\IsAddStream" /v Value /d true /f > nul

rem Imprimagailuen ezarpenak dokumentuan ez
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Common\Save\Document\LoadPrinter" /v Value /d false /f > nul

rem Hiztegiak aukeratu
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Linguistic\General\DictionaryList\ActiveDictionaries" /v Value /t REG_MULTI_SZ /d "Donostia.dic ZenbakiDeklinatuak.dic" /f > nul

rem Hiztegiak erabiltzea aktibatu
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Linguistic\General\DictionaryList\IsUseDictionaryList" /v Value /d true /f > nul

rem zenbakiak zuzendu
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Linguistic\SpellChecking\IsSpellWithDigits" /v  Value /d true /f  > nul

rem Gaitu hitz-osatzea desgaitua
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Writer\AutoFunction\Completion\Enable" /v Value /d false /f > nul

rem Hobelex lehenetsi
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Linguistic\ServiceManager\SpellCheckerList\eu-ES" /v Value /t REG_MULTI_SZ /d "es.binovo.hobelex.spellchecker org.openoffice.lingu.MySpellSpellChecker" /f > nul
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Linguistic\ServiceManager\LastFoundSpellCheckers\eu-ES" /v Value /t REG_MULTI_SZ /d "es.binovo.hobelex.spellchecker org.openoffice.lingu.MySpellSpellChecker" /f > nul
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo.
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java ------------------- Instalatua
echo Libreoffice ------------ Instalatua
echo Laguntza euskaraz ------ Instalatua
echo Laguntza gazteleraz ---- Instalatua
echo Hedapenak -------------- Instalatua
echo Profila ---------------- Instalatua
echo Ezarpenak instalatzen ...


rem Ezarpen Bereziak ---------------------------------------------------------------

If exist "K:/NORMA/PLANTILL/libreoffice/normal.ott" (

rem Dokumentuak gordetzeko bide izena
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Common\Path\Current\Work" /v Value /d file:///K:/ /f > nul

rem txantiloien  bide-izena
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Paths\Paths\Template\WritePath" /v Value /d file:///K:/NORMA/PLANTILL/Libreoffice/ /f > nul

rem txantiloi lehenetsia
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Setup\Office\Factories\com.sun.star.text.TextDocument\ooSetupFactoryTemplateFile" /v Value /d file:///K:/Norma/Plantill/LibreOffice/normal.ott /f > nul

rem txantiloi lehenetsia aldatua
reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Setup\Office\Factories\com.sun.star.text.TextDocument\ooSetupFactorySystemDefaultTemplateChanged" /v Value /d true /f > nul

)


rem Ezarpen Orokorrak ---------------------------------------------------------------------


If exist G:\NORMA\PLANTILL\libreoffice\normal.ott (

reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Common\Path\Current\Work" /v Value /d file:///G:/ /f > nul

reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Office.Paths\Paths\Template\WritePath" /v Value /d file:///G:/NORMA/PLANTILL/Libreoffice/ /f > nul

reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Setup\Office\Factories\com.sun.star.text.TextDocument\ooSetupFactoryTemplateFile" /v Value /d file:///G:/Norma/Plantill/LibreOffice/normal.ott /f > nul

reg add "HKLM\SOFTWARE\Policies\Libreoffice\org.openoffice.Setup\Office\Factories\com.sun.star.text.TextDocument\ooSetupFactorySystemDefaultTemplateChanged" /v Value /d true /f > nul


)


echo.
cls
echo Instalazioak minutu batzuk beharko ditu, bukatu arte ez itxi leiho hau mesedez
echo.
echo La instalaci¢n durara unos minutos, no cierre la ventana por favor..
echo.
echo.
echo. 
echo Vcredist 2012 ---------- Instalatua
echo Vcredist 2015 ---------- Instalatua
echo Java ------------------- Instalatua
echo Libreoffice ------------ Instalatua
echo Laguntza euskaraz ------ Instalatua
echo Laguntza gazteleraz ---- Instalatua
echo Hedapenak -------------- Instalatua
echo Profila ---------------- Instalatua
echo Ezarpenak -------------- Instalatua
echo.
ping localhost -n 4 >nul

:End

cls
echo.
echo Bukatzeko sakatu edozein tekla...
echo.
echo Para terminar presione cualquier tecla .....
pause > nul
