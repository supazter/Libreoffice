@echo off
cls

rem Libreofice instalatzailearen kokapena
set bidea=%cd%

rem Instalatutako libreoffice-ren kokapena
set libreoffice=%ProgramFiles%\LibreOffice 5

rem Xuxen eta hobelex kendu
"%libreOffice%\program\unopkg.exe" remove --shared net.eleka.xuxen_eu
"%libreOffice%\program\unopkg.exe" remove --shared es.binovo.uzei.hobelex

rem Xuxen azkeneko bertsioa instalatu
"%libreOffice%\program\unopkg.exe" add --shared "%bidea%\Hedapenak\xuxen.oxt"
