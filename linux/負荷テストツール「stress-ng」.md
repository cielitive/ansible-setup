## 「stress-ng」コマンドをインストール

```
$ yum install -y epel-release
$ yum install -y stress-ng
```

## CPUに負荷をかける

#### 1. 負荷を掛けるプロセス数を指定して実行する

```
$ stress-ng -c 1 -q

### c: 負荷を掛けるプロセス数
### q:
```

#### 2. 実行時間を指定して実行する

```
$ stress-ng -c 1 -t 5s -q

### t: 実行時間 {s(秒),m(分),d(時),d(日)}
```

#### 3. CPUを指定して実行する

```
$ stress-ng --taskset 0

### --taskset: CPUを指定する
```

#### 4. CPU使用率を指定して実行する

```
$ stress-ng -c 1 -l 50 -q

### l: CPU使用率
```

## MEMORYに負荷をかける

#### 1.

```
$
```
