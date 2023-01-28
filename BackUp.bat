@echo off
rem スタートラベル
:START

rem 変数定義エリア
  rem オプション:ミラーリング
  set opMirroring=/MIR
  rem オプション:タイムスタンプ同期
  set opTimestampSync=/DCOPY:DAT
  rem オプション:ログファイル出力
  set opLogfile=/LOG+:
  rem ログファイル名:backuplog_yyyyMMdd.log
  set logFile=\backuplog_%date:~0,4%%date:~5,2%%date:~8,2%.log

rem 外部設定ファイル読み込み
  for /f "tokens=1,2* delims==" %%a in (./setting.ini) do (
      set %%a=%%b
  )

rem ファイルパスチェック
  if not exist %BackupSource% (
    goto SETTING_ERROR
  )
  if not exist %BackupDestination% (
    goto SETTING_ERROR
  )
  if not exist %LogfilePath% (
    goto SETTING_ERROR
  )

rem メッセージ表示
  echo コピー元：%BackupSource%
  echo コピー先：%BackupDestination%
  set /P answer=バックアップを行いますか？ Y/N

rem 処理部
  if %answer%==Y (
    rem ROBOCOPY
    robocopy %BackupSource% %BackupDestination% %opMirroring% %opTimestampSync% %opLogfile%%LogfilePath%%logFile%
    goto STATUS_CHECK
  ) else if %answer%==N (
    echo バックアップを終了します…
    exit
  ) else (
    echo 「Y」または「N」でお答え下さい…
    goto START
  )

rem ステータス確認
  :STATUS_CHECK
  if %ERRORLEVEL%==0 (
    echo 同期されています…
  ) else if %ERRORLEVEL%==1 (
    echo 同期が完了しました…
  ) else (
    echo エラーが発生しました ログファイルを確認してください…
  )
  pause
  exit

rem エラー処理
  :SETTING_ERROR
  echo setting.iniの値に誤りがあります…
  pause