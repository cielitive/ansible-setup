ansible-setup

```
{% if env == 'prduction' %}本番環境{% elif env == 'development' %}検証環境{% endif %}
```

```
ip --oneline -4 addr | egrep -v "^1:" | awk '{print $2":\n  exists: true\n  aadrs:\n  - "$4}'
```

```
ServerLimit (default: 16)
- プロセス数の上限
- ( "MaxRequestWorkers" / "ThreadsPerChild" )より大きい値
StartServers (default: 3)
- 最初に起動するプロセス数
- 起動後すぐ他の設定値(下記の設定値)により変動する
  - StartServers(5), ThreadsPerChild(20), MinSpareThreads(30), MaxSpareThreads(50)の場合: プロセス"2", Idleスレッド数"40"(busy: 1)まで減る
ThreadLimit (default: 64)
- プロセスごとに持てるスレッド数の上限
- "ThreadsPerChild"より大きい値
ThreadsPerChild (default: 25)
- プロセスごとに生成するスレッド数
MaxRequestWorkers (default: "ServerLimit" * "ThreadsPerChild")
- 同時に処理できる最大数 ( =各プロセスごとのスレッド数の和の上限 )
- ( "ServerLimit" * "ThreadsPerChild" )より大きい値
MinSpareThreads (default: 75)
- Idleプロセスの最少数
MaxSpareThreads (default: 250)
- Idleプロセスの最大数
- サーバが暇になってアイドルスレッドが増えた時にこの数まで減らされる
- "MinSpareThreads"と同じ値の場合は、"ThreadsPerChild"の倍数で"MinSpareThreads"を超えた値まで減らされる (="MaxSpareThreads"を超える場合がある)
  - ThreadsPerChild(20), MinSpareThreads(50), MaxSpareThreads(50)の場合: "MaxSpareThreads"を超えてIdleスレッド数は"60(busy: 1)"
MaxConnectionsPerChild (default: 10000)
- プロセスが指定した回数の接続を受け付けたらプロセスを終了する


m2818645114@dea-21olympic.com
- "0"を指定すると終了しない
```

 ```bash
 while true; do for port in "10 20"; do echo "[${port}] -----"; curl http://localhost:${port} -o /dev/null -w '%{http_code}\n' -s; done; sleep 3s; done
 ```
