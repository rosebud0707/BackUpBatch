@echo off
rem カレントディレクトリに変更
cd /d %~dp0

echo ========================================
echo         Backup Script v1.0
echo ========================================

rem ログファイル(yyyyMMdd.log)
set logpath=%date:~0,4%%date:~5,2%%date:~8,2%.log

rem 設定ファイルがバッチと同ディレクトリにない場合はエラー
if not exist setting.ini ( 
    echo [ERROR][%date% %time%]設定ファイルが存在しません。 >> %logpath%
    goto ERROR
) 

rem 設定ファイルの読み込み
for /f "tokens=1,2 delims==" %%i in (setting.ini) do (
    if %%i==[source] (
        set source=%%j
    ) else if %%i==[destination] (
        set destination=%%j
    ) else if %%i==[option] (
        set option=%%j
    )
)

rem 保存元/先フォルダの存在チェック
if not exist %source% (
    echo [ERROR][%date% %time%]保存元フォルダが存在しません。 >> %logpath%
    goto ERROR
)
if not exist %destination% (
    echo [ERROR][%date% %time%]保存先フォルダが存在しません。 >> %logpath%
    goto ERROR
)

rem 実行確認
set select=
if "%select%"=="" (
    goto YN_SELECT
)
:YN_SELECT
echo 次の設定でデータバックアップを行いますか？(Y/N)
echo 保存元フォルダ:%source%
echo 保存先フォルダ:%destination%
echo オプション:%option%
set /p select=

rem 入力値がYの場合は処理。Nの場合は処理中止。それ以外の場合は再度選択させる。
if /I %select%==Y (
    goto MAIN_PROCESS
) else if /I %select%==N (
    echo [INFO][%date% %time%]処理中止を受け付けました。 >> %logpath%
    goto NORMAL
) else (
    echo [WARN][%date% %time%]入力値に誤りがあります。 >> %logpath%
    goto YN_SELECT
)

rem メイン処理
:MAIN_PROCESS
robocopy %source% %destination% %option% /LOG+:%logpath%
rem リターンコード確認
if %errorlevel%==0 (
    echo [INFO][%date% %time%]変更はありません。 >> %logpath%
    goto NORMAL
)
else if %errorlevel%==1 (
    echo [INFO][%date% %time%]バックアップが完了しました。 >> %logpath%
    goto NORMAL
)
else if %errorlevel% geq 8 (
    echo [ERROR][%date% %time%]バックアップが失敗しました。詳細はログファイルをご確認ください。 >> %logpath%
    goto ERROR
)
else (
    echo [INFO][%date% %time%]バックアップが完了しました。一部変更がないファイルがあります。詳細はログファイルをご確認ください。 >> %logpath%
    goto NORMAL
)

:NORMAL
echo [INFO][%date% %time%]処理を終了します。 >> %logpath%
exit /b errorlevel

:ERROR
echo [ERROR][%date% %time%]エラーが発生したため、処理を終了します。 >> %logpath%
exit /b errorlevel