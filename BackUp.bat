@echo off
rem �J�����g�f�B���N�g���ɕύX
cd /d %~dp0

echo ========================================
echo         Backup Script v1.0
echo ========================================

rem ���O�t�@�C��(yyyyMMdd.log)
set logpath=%date:~0,4%%date:~5,2%%date:~8,2%.log

rem �ݒ�t�@�C�����o�b�`�Ɠ��f�B���N�g���ɂȂ��ꍇ�̓G���[
if not exist setting.ini ( 
    echo [ERROR][%date% %time%]�ݒ�t�@�C�������݂��܂���B >> %logpath%
    goto ERROR
) 

rem �ݒ�t�@�C���̓ǂݍ���
for /f "tokens=1,2 delims==" %%i in (setting.ini) do (
    if %%i==[source] (
        set source=%%j
    ) else if %%i==[destination] (
        set destination=%%j
    ) else if %%i==[option] (
        set option=%%j
    )
)

rem �ۑ���/��t�H���_�̑��݃`�F�b�N
if not exist %source% (
    echo [ERROR][%date% %time%]�ۑ����t�H���_�����݂��܂���B >> %logpath%
    goto ERROR
)
if not exist %destination% (
    echo [ERROR][%date% %time%]�ۑ���t�H���_�����݂��܂���B >> %logpath%
    goto ERROR
)

rem ���s�m�F
set select=
if "%select%"=="" (
    goto YN_SELECT
)
:YN_SELECT
echo ���̐ݒ�Ńf�[�^�o�b�N�A�b�v���s���܂����H(Y/N)
echo �ۑ����t�H���_:%source%
echo �ۑ���t�H���_:%destination%
echo �I�v�V����:%option%
set /p select=

rem ���͒l��Y�̏ꍇ�͏����BN�̏ꍇ�͏������~�B����ȊO�̏ꍇ�͍ēx�I��������B
if /I %select%==Y (
    goto MAIN_PROCESS
) else if /I %select%==N (
    echo [INFO][%date% %time%]�������~���󂯕t���܂����B >> %logpath%
    goto NORMAL
) else (
    echo [WARN][%date% %time%]���͒l�Ɍ�肪����܂��B >> %logpath%
    goto YN_SELECT
)

rem ���C������
:MAIN_PROCESS
robocopy %source% %destination% %option% /LOG+:%logpath%
rem ���^�[���R�[�h�m�F
if %errorlevel%==0 (
    echo [INFO][%date% %time%]�ύX�͂���܂���B >> %logpath%
    goto NORMAL
)
else if %errorlevel%==1 (
    echo [INFO][%date% %time%]�o�b�N�A�b�v���������܂����B >> %logpath%
    goto NORMAL
)
else if %errorlevel% geq 8 (
    echo [ERROR][%date% %time%]�o�b�N�A�b�v�����s���܂����B�ڍׂ̓��O�t�@�C�������m�F���������B >> %logpath%
    goto ERROR
)
else (
    echo [INFO][%date% %time%]�o�b�N�A�b�v���������܂����B�ꕔ�ύX���Ȃ��t�@�C��������܂��B�ڍׂ̓��O�t�@�C�������m�F���������B >> %logpath%
    goto NORMAL
)

:NORMAL
echo [INFO][%date% %time%]�������I�����܂��B >> %logpath%
exit /b errorlevel

:ERROR
echo [ERROR][%date% %time%]�G���[�������������߁A�������I�����܂��B >> %logpath%
exit /b errorlevel