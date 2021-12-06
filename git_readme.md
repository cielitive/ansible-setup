## *Git Tutorial*

### 1. Gitの設定変更

###### 1-1. ```name``` , ```email``` を登録する

```bash
$ git config --global user.name "name"
$ git config --global user.email "test@example.com"
```

###### 1-2. 登録内容を確認する

```bash
$ git config --list
$ git config --system --list
$ git config --global --list
$ git config --local --list

### 特定の項目のみ
$ git config [key]
```

###### 1-3. エイリアスを設定する

```bash
### 設定ファイル
$ ~/.gitconfig
$ ./.git/config
```

```bash
[alias]
    now = rev-parse --abbrev-ref HEAD
    prune = fetch --prune
    undo = reset --soft HEAD^
    glog = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
```

### 2. リポジトリ作成

###### 2-1. リポジトリを作成する

```bash
### 初期化
$ mkdir [directory] && cd $_
$ git init

### リモートリポジトリを登録
$ git remote add origin [remote repository]

### リモートリポジトリからクローンする場合
$ git clone [remote repository]

### 【参考】 サブモジュールもクローンする場合
$ git clone --recursive [remote repository]
```

###### 2-2. ローカルリポジトリを最新化する

```bash
$ git pull origin [branch]

### pull = fetch & marge
$ git fetch origin [branch]
$ git merge FETCH_HEAD
```

###### 2-3. リモートとの変更点を確認する (pullする前)

```bash
$ git diff HEAD..[remote]/[branch]
$ git diff HEAD..origin/main
```

### 3. 作業用ブランチ作成

###### 3-1. 作業用ブランチを作成する

```bash
$ git checkout -b [branch]
$ git switch -c [branch]

### リモートブランチから作業用ブランチを作成する
$ git branch [branch] origin/main
$ git checkout [branch]
$ git switch -c [branch] [origin/branch]
```

```bash
### ブランチの名前を変更
$ git branch -m [new branch]
$ git branch -m [old branch] [new branch]

### リモートブランチの名前を変更
$ git remote rename [old branch] [new branch]
```

###### 3-2. ブランチを切り替える

```bash
$ git checkout [branch]
$ git switch [branch]

### 直前のブランチに切り替える
$ git checkout -
$ git switch -
```

###### 3-3. ブランチ一覧を確認する

```bash
### ローカル
$ git branch
* main
### リモート
$ git branch -r
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/develop
  remotes/origin/feature
### すべて
$ git branch -a
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/develop
  remotes/origin/feature
```

###### 3-4. ブランチを削除する

```bash
### ローカルブランチを削除
$ git branch -D [branch]

### リモートブランチを削除
$ git push --delete origin [branch]

### リモートで削除されたブランチ情報を削除
$ git fetch --prune
```

### 4. ファイル作成・修正

###### 4-1. ファイルを作成・編集する

```bash
$ echo "HelloWorld" >[file]
```

###### 4-2. ワーキングツリーとステージングの差分を比較する

```bash
$ git diff

### インデックスから変更をもとに戻す
$ git checkout [directory|file|.]

### 新規作成ファイルも削除
$ git clean -df .
```

###### 4-3. ワーキングツリーと最新コミットオブジェクトの差分を比較する

```bash
$ git diff HEAD

### 最新コミットオブジェクトから変更をもとに戻す
### インデックスを戻す (HEAD -> index)
$ git reset HEAD
### ワーキングツリーを戻す (index.file -> work.file)
$ git checkout [directory|file|.]
$ git restore [directory|file|.]
```

###### 4-4. コミットしていない（コミットはしたくない）内容を一時退避する

```bash
### 一時退避
$ git stash
### 退避した内容を確認
$ git stash show
### 避した内容を戻す
$ git stash pop
```

```bash
### (ブランチ間違えた場合)ブランチ変更
$ git stash
$ git checkout [branch]

### 退避した内容を適用
$ git stash apply
```

### 5. ステージング作業

###### 5-1. 変更ファイルをインデックスに追加する

```bash
$ git add [file]

### 変更ファイルのみ
$ git add -u

### すべてのファイル
$ git add .
```

###### 5-2. インデックスと最新コミットオブジェクトの差分を比較する

```bash
$ git diff --cached
```

###### 5-3. インデックス追加を取り消す

```bash
### (HEAD -> index)
$ git reset --mixed HEAD
### オプションなしでも同じ
$ git reset HEAD

### 最初の"add"を取り消す
$ git rm --cached [file]
$ git rm --cached -r [derectory]
```

### 6. コミットオブジェクト作成

###### 6-1. 新しいコミットオブジェクトを作成する

```bash
$ git commit -m "[commit message]"

### Unixtime
$ git commit -m $(date +%s)
```

###### 6-2. コミットメッセージを修正する

```bash
$ git commit --amend
$ git commit --amend -m "[comment]"

### コミット後に修正漏れに気付いた場合（ファイル修正後）
$ git add .
$ git commit --amend
```

###### 6-3. ブランチ間の差分を比較する

```bash
### mainブランチと比較
$ git diff main 

### 各ブランチの最新コミットを比較
$ git diff [branch_A]..[branch_B]
$ git diff [branch_A] [branch_B]

### ファイル名のみ表示
$ git diff --name-only [branch_A] [branch_B]

### 特定ファイルの差分表示
$ git diff [branch A]:[file A] [branch B]:[file B]
$ git diff [branch A] [branch B] [file]
```

###### 6-4. ```commit``` を取り消す

```bash
### "commit"を取り消し (HEAD^ -> HEAD)
$ git reset --soft HEAD^

### "commit"と"add"を取り消し (HEAD^ -> HEAD,index)
$ git reset --soft HEAD^
$ git reset HEAD

$ git reset --mixed HEAD

### "commit"と"add"と"ワーキングツリーの変更"を取り消し (HEAD^ -> HEAD,index,work)
$ git reset --hard HEAD^
```

###### 6-5. 特定のコミットまで戻す

```bash
### 対象のコミットを検索
$ git log -p -2

### 特定のファイルのみ戻す
$ git checkout [commit hash] [file]
$ git restore -s [commit hash] [file]

### カレントディレクトリ配下すべて
$ git restore -s [commit hash] .
```

```bash
### "commit"と"add"と"ワーキングツリー変更"の取り消しを取り消し
### 取り消し前の"commit"を確認
$ git reflog

### 取り消し (commit -> HEAD,index,work)
$ git reset --hard [commit hash]
```

###### 6-6. リモートリポジトリの内容でローカルリポジトリを上書きする

```bash
### リモートの最新情報取得
$ git fetch origin [branch]
### ローカルを追跡ブランチの内容で上書き (origin/branch -> HEAD,index,work)
$ git reset --hard [origin/branch]
```

### 7. リモートリポジトリの変更履歴更新

###### 7-1. リモートリポジトリへ ```push``` する

```bash
$ git push --set-upstream origin [branch]
###  -u, --set-upstream: 成功した場合、上位ブランチとして設定
```

###### 7-2. リモートリポジトリと最新コミットオブジェクトの差分を比較する

```bash
### リモートとの変更点を確認 ("push"する前)
$ git diff [remote]/[branch]..HEAD
$ git diff origin/main..HEAD
```

```bash
### リモートブランチと差分比較
$ git diff [remote branch] [local branch]
```

###### 7-3. リモートリポジトリへ ```push``` を取り消す

```bash
### 直前の"push"を取り消す
$ git log --pretty="%h: %s"
$ git revert [commit hash]
$ git push 
```

###### 7-4. （プルリクエストの前に）派生元ブランチの内容を取り込む

```bash
$ git checkout [branch]
$ git pull --rebase origin [source_branch]
```

### 8. ブランチのマージ

###### 8-1. ブランチを ```merge``` する 

```bash
$ git branch -a
  develop
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main

$ git merge develop
```

###### 8-2. ```merge``` を取り消す

```bash
### "merge"を取り消す
### コンフリクトした場合（編集前）
$ git merge --abort
### コンフリクトした場合（編集後）
$ git reset --hard HEAD
### "merge"が成功した場合
$ git reset --hard ORIG_HEAD

### HEAD: 最新のコミットハッシュ値
### ORIG_HEAD: 最新の一つ前のコミットハッシュ値
```

## *Command Example*

### 1. git log

###### 1-1. コミットログの一覧を表示する

```bash
$ git log --oneline
```

###### 1-2. コミットログの一覧を表示する

```bash
### --since, --before: 特定の日時以降のものに絞る
$ git log —-since 'yyyy/mm/dd'
### --until, --after: 特定の日時以前のものに絞る
$ git log —-until 'yyyy/mm/dd'

$ git log —-since 'yyyy/mm/dd' —-until 'yyyy/mm/dd'
```

###### 1-3. ファイル名も表示する

```bash
### "commit"したのときの表示
$ git log --stat
commit a09a9218855088c61b0261ddf9f461b4d6bfd37b
Author: local <local@exmple.com>
Date:   Thu Nov 4 16:24:36 2021 +0900

    feat

 feat/feat | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

### "pull"したのときの表示
$ git log --name-status
commit a09a9218855088c61b0261ddf9f461b4d6bfd37b
Author: local <local@exmple.com>
Date:   Thu Nov 4 16:24:36 2021 +0900

    feat

A       feat/feat
```

### 2. git grep

###### 2-1. ファイル検索

```bash
### [-i]: 大文字・小文字の区別を無視
### [-P]: Perl互換の正規表現
$ git grep [-i] [-P] <pattern> [--and|--or|--not <pattern>...]

### git管理外
$ git grep --no-index
```

### 3. git cat-file

###### 3-1. ハッシュオブジェクトの内容を表示する

```bash
### [-t]: ハッシュオブジェクトの種別 (commit, tree, blob, tag)
$ git cat-file -t [hash]

### [-s]: オブジェクトのサイズ
$ git cat-file -s [hash]

### [-t]: 指定したオブジェクトの内容
$ git cat-file -p [hash]
```

### 4. git cherry-pick

###### 4-1. 特定のブランチから必要なコミットをコピーする

```bash
### [-x]: コミットメッセージに「cherry picked from commit xxxxx」を追加
### [-n]: 作業ディレクトリにのみコピー（コミットしない）

### 最新(先頭にある)コミット
$ git cherry-pick [branch]
### 指定したコミット
$ git cherry-pick [commit hash]
### 指定した間のコミット
$ git cherry-pick [commit hash]..[commit hash]
```

```bash
### コンフリクトが発生した場合（=止まっていた"cherry-pick"を再開）
$ git cherry-pick --continue
```

## 困ったときのTips

#### ファイルをgit管理対象外にする

```bash
$ vim .gitignore
$ cat .gitignore
# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*
```

#### 過去のコミットログをすべて削除する（=同じ名前の新しいブランチを作成する）

```bash
### --orphan: 独立したブランチ作成（親ブランチを共有しない）
$ git checkout --orphan tmp
### 最初のコミット
$ git commit -m "Initial Commit"
### "tmp"ブランチで上書き
$ git checkout -B [branch]
### "tmp"ブランチ削除
$ git branch -d tmp
### "remote"も上書き
$ git push --force origin [branch]
```

#### fork元の変更を取り込む

```bash
### fork元のリモートリポジトリを登録
$ git remote add upstream [repository]

### upstreamのmainブランチの変更分をローカルに取り込む
$ git fetch upstream main

### 変更分をローカルのmainに反映
$ git merge upstream/main

### *自分のリモートリポジトリに反映
$ git push origin main
```

## エラー出力とトラブルシューティング

#### 【ERROR】.

```bash
$ git push origin main
To https://github.com/xxxx/xxxxx.git
 ! [rejected]        main -> main (fetch first)
error: failed to push some refs to 'https://github.com/xxxx/xxxxx.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

aaa

```bash
$ git fetch
$ git merge --allow-unrelated-histories origin/main
```
