## 1. 事前準備

#### 1-1. 下記コマンドを実行し、playbookを取得する

```bash
$ git clone <URL>
```

#### 1-2. インベントリファイルを修正する

```bash

```

#### 1-3. 構築対象の変数定義ファイルを準備する

#### 【注意】 変数定義における注意事項は以下となります

- グループ用変数(group_vars/\*)とホスト用変数(host_vars/\*)に定義する内容は、重複しないようにする

```bash
### グループ及び、ホストの変数テンプレートからコピー
$ cp -rp ./production/group_vars/_template ./production/group_vars/<GROUP>
$ cp -rp ./production/host_vars/_template ./production/host_vars/<HOST>
```

