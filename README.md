# BackUpBatch
●データバックアップを行うバッチファイルです  
・使い方  
&nbsp;&nbsp;&nbsp;&nbsp;1.BackUp.batとsetting.iniは同じディレクトリに配置してください。  
&nbsp;&nbsp;&nbsp;&nbsp;2.setting.iniの「BackupSource」の右辺にバックアップしたいフォルダのディレクトリ、「BackupDestination」の右辺に  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;バックアップ先、「LogfilePath」の右辺にログファイルを保存したいディレクトリを指定し、保存してください。  
&nbsp;&nbsp;&nbsp;&nbsp;3.BackUp.batをクリックし、実行してください。コマンドプロンプト上にコピー元、コピー先が表示されます。  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.にて指定したコピー元、コピー先であることを確認後、「Y」を入力し、Enterを押下してください。  
&nbsp;&nbsp;&nbsp;&nbsp;4.バックアップが開始されます。  
&nbsp;&nbsp;&nbsp;&nbsp;5.コピー元とコピー先が同じである場合「同期されています…」、バックアップが完了した場合、「同期が完了しました…」、  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;エラーが発生した場合、「エラーが発生しました。ログファイルを確認してください…」のメッセージを表示後、  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当バッチが終了します。  
    
・注意点  
&nbsp;&nbsp;&nbsp;&nbsp;当バッチはWindows機でのみ実行可能です。保存先はLinuxを指定することが可能です。  
&nbsp;&nbsp;&nbsp;&nbsp;.batファイル、.iniファイルともに文字コードは「Shift-JIS」です。「setting.ini」を保存する際は「Shift-JIS」形式にて保存してください。  
&nbsp;&nbsp;&nbsp;&nbsp;ミラーリングによるバックアップです。コピー元に空フォルダを指定し、コピー先にデータが存在するフォルダを指定した場合は  
&nbsp;&nbsp;&nbsp;&nbsp;コピー先のデータが削除(空フォルダ)となります。一度試した上での本実行をお勧めします。  
&nbsp;&nbsp;&nbsp;&nbsp;当バッチを実行したことによるトラブル、損害、損失には一切責任を負いません。  
