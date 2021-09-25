## How to initial setup on "CentOS 7"

#### 1. ロケールを変更する（一時的）

```bash
$ localectl set-locale LANG=ja_JP.utf8
$ localectl
   System Locale: LANG=ja_JP.utf8
       VC Keymap: us
      X11 Layout: n/a

$ source /etc/locale.conf
```

#### 2. IPアドレスを設定する

```bash
### IPアドレスのみ表示
$ ip -4 a | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | tr '\n' '|'
```

## Google Authenticator

#### 1. PAMモジュールをインストールする

```bash
$ yum install -y epel-release
$ yum install -y google-authenticator
```

#### 2. チャレンジレスポンス認証を有効にする

```bash
$ sed -i -e '/^ChallengeResponseAuthentication/s/no/yes/' /etc/ssh/sshd_config

### 追記する（鍵認証の場合）
$ echo "AuthenticationMethods publickey,keyboard-interactive" >>/etc/ssh/sshd_config

### サービスを再起動する
$ systemctl restart sshd
```

#### 3.  認証方式にGoogle Authenticator PAMモジュールを追記する

```bash
### パスワード認証の場合
$ echo "auth required pam_google_authenticator.so nullok echo_verification_code" >>/etc/pam.d/sshd

### 鍵認証の場合
$ sed -i -e '/auth.*sufficient.*pam_unix.so nullok try_first_pass/s/^/# /' /etc/pam.d/password-auth
$ echo "auth sufficient pam_google_authenticator.so nullok echo_verification_code" >>/etc/pam.d/password-auth
```

#### 4. Google Authenticator を設定する

```bash
$ su - <user>
$ google-authenticator

### (y)時間ベースの確認コード, (n)カウンターベースの確認コード
Do you want authentication tokens to be time-based (y/n) y

### Google Authenticator の秘密鍵や設定情報を以下の場所に保存してもいいか確認
Do you want me to update your "/home/vagrant/.google_authenticator" file? (y/n) y

### 同じ確認コードを複数回使うことを禁止（30秒ごとに１回のログインに制限）
Do you want to disallow multiple uses of the same authentication
token? This restricts you to one login about every 30s, but it increases
your chances to notice or even prevent man-in-the-middle attacks (y/n) y

### クライアントとサーバーで最大４分の時間のずれを許容
By default, a new token is generated every 30 seconds by the mobile app.
In order to compensate for possible time-skew between the client and the server,
we allow an extra token before and after the current time. This allows for a
time skew of up to 30 seconds between authentication server and client. If you
experience problems with poor time synchronization, you can increase the window
from its default size of 3 permitted codes (one previous code, the current
code, the next code) to 17 permitted codes (the 8 previous codes, the current
code, and the 8 next codes). This will permit for a time skew of up to 4 minutes
between client and server.
Do you want to do so? (y/n) y

### 30秒ごとに3回までのログイン試行に制限（確認コードを3回間違えるとその確認コードは無効になる）
If the computer that you are logging into isn't hardened against brute-force
login attempts, you can enable rate-limiting for the authentication module.
By default, this limits attackers to no more than 3 login attempts every 30s.
Do you want to enable rate-limiting? (y/n) y
```

## Tips

#### 1. "sudo", "su"コマンドについて

```yaml
su:
  カレントディレクトリ: 変わらない
  環境変数: ほぼすべて引き継がれる
  シェル: デフォルトシェル
  ログインシェル: 起動しない
su -:
  カレントディレクトリ: ユーザーのホーム
  環境変数: "$TERM"のみ引き継がれる
  シェル: デフォルトシェル
  ログインシェル: 起動する
sudo su:
  カレントディレクトリ: 変わらない
  環境変数: 一部引き継がれる
  シェル: デフォルトシェル
  ログインシェル: 起動しない
sudo su -:
  カレントディレクトリ: ユーザーのホーム
  環境変数: "$TERM"のみ引き継がれる
  シェル: デフォルトシェル
  ログインシェル: 起動する
sudo -s:
  カレントディレクトリ: 変わらない
  環境変数: 一部引き継がれる
  シェル: 実行時の"$SHELL"
  ログインシェル: 起動しない
sudo -i:
  カレントディレクトリ: ユーザーのホーム
  環境変数: 一部引き継がれる
  シェル: デフォルトのシェル
  ログインシェル: 起動する
```

#### 2. プロンプト(PS1)を変更する

```bash
$ cp -p $(find / -name "git-completion.bash") ~/.git-completion.bash
$ cp -p $(find / -name "git-prompt.sh" | head -1) ~/.git-prompt.sh
```

```bash
cat <<EOT >>~/.bashrc

source ~/.git-completion.bash
source ~/.git-prompt.sh

export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1

PS1='[\t] \u@\h:\w\[\e[1;33m\]\$(__git_ps1 " (%s)")\[\e[m\] \\$ '
EOT
```

```bash
PS1='[\[\e[1;32m\]\t\[\e[m\] \u@\h:\w]\$ '
PS1='[\t] \u@\h:\w\[\e[1;33m\]$(__git_ps1 " (%s)")\[\e[m\] \$ '
```

```~/.zshrc
### gitブランチを表示する
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr $'%{\e[38;5;195m%}!'
zstyle ':vcs_info:git:*' unstagedstr $'%{\e[38;5;195m%}+'
zstyle ':vcs_info:*' formats $'%{\e[38;5;195m%}(%c%u%{\e[38;5;195m%}%b)'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

PROMPT=$'%{\e[38;5;007m%}%n@%m%{\e[38;5;007m%}: %{\e[38;5;007m%}%~$vcs_info_msg_0_%{\e[38;5;007m%}$ '
```
