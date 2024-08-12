## BackUpBatch  
1.setting.iniの[source]の右辺に保存元ディレクトリ、[destination]の右辺に保存先ディレクトリを記載する。(必須)[option]にはrobocopyのオプションを記載する。(任意)  
2.BackUp.batを叩く。    
3.ログファイルを確認し、実行結果を確認する。  
※注意点   
・ログファイルはBackUp.batを配置しているディレクトリにyyyyMMdd.log形式で出力される。  
・BackUp.bat、setting.ini共に文字コードはSJISとする。  
・ディレクトリに半角スペースを含む場合はパス全体をダブルクォーテーションで括りsetting.iniに記載すること  
・当バッチによってデータが損失した場合、一切の責任は負わない。  
