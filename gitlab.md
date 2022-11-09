### 1. バックアップ

#### 1-1. バックアップ先を変更する

###### 設定ファイルのバックアップを取得する

```bash
$ cp -p /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.org
```

###### バックアップ先を変更する

```bash
$ sed -i -e '/^# gitlab_rails\['\''backup_path/s/^# //' \
       -e '/^gitlab_rails\['\''backup_path/s/\/var\/opt\/gitlab\/backups/\/tmp/' /etc/gitlab/gitlab.rb
```

###### バックアップ先が変更されていることを確認する

```bash
$ cat /etc/gitlab/gitlab.rb | grep "'backup_path'"
gitlab_rails['backup_path'] = "/tmp"
```

###### 変更した設定を反映させる

```bash
$ gitlab-ctl reconfigure
```

#### サービスが正常に起動していることを確認する

```bash
$ gitlab-ctl status
run: alertmanager: (pid 20352) 33s; run: log: (pid 13912) 11996s
run: gitaly: (pid 20362) 32s; run: log: (pid 13181) 12117s
run: gitlab-exporter: (pid 20376) 31s; run: log: (pid 13808) 12014s
run: gitlab-kas: (pid 20379) 31s; run: log: (pid 13499) 12099s
run: gitlab-workhorse: (pid 20387) 30s; run: log: (pid 13677) 12036s
run: logrotate: (pid 20397) 30s; run: log: (pid 13078) 12131s
run: nginx: (pid 20403) 30s; run: log: (pid 13708) 12030s
run: node-exporter: (pid 20411) 29s; run: log: (pid 13777) 12019s
run: postgres-exporter: (pid 20416) 29s; run: log: (pid 13950) 11990s
run: postgresql: (pid 20424) 28s; run: log: (pid 13356) 12106s
run: prometheus: (pid 20439) 28s; run: log: (pid 13872) 12002s
run: puma: (pid 20450) 27s; run: log: (pid 13581) 12050s
run: redis: (pid 20455) 26s; run: log: (pid 13132) 12123s
run: redis-exporter: (pid 20461) 26s; run: log: (pid 13837) 12008s
run: sidekiq: (pid 20467) 26s; run: log: (pid 13622) 12042s
```

#### 1-2. GitLabをバックアップする

###### バックアップコマンドを実行する

```bash
$ gitlab-backup create
---
2022-11-09 03:48:57 +0000 -- Backup 1667965732_2022_11_09_15.5.3-ee is done.
2022-11-09 03:48:57 +0000 -- Deleting backup and restore lock file
```

##### バックアップファイルが作成されていることを確認する

```bash
### バックアップファイル: <BACKUP_DIR>/<UNIXTME>_<yyyy>_<mm>_<dd>_<GITLAB_VERSION>_gitlab_backup.tar 
$ ls -l /tmp/1667965732_2022_11_09_15.5.3-ee_gitlab_backup.tar
-rw-------. 1 git git 409600 Nov  9 03:48 /tmp/1667965732_2022_11_09_15.5.3-ee_gitlab_backup.tar
```

#### バックアップ実行時に表示されるメッセージに従い、機密データファイルのバックアップを取得する

```bash
### バックアップ実行時表示されるメッセージ
2022-11-09 03:48:57 +0000 -- Warning: Your gitlab.rb and gitlab-secrets.json files contain sensitive data 
and are not included in this backup. You will need these files to restore a backup.
Please back them up manually.
````

```bash
$ cp -p /etc/gitlab/gitlab-secrets.json /backup
$ cp -p /etc/gitlab/gitlab.rb /backup
```

## 2. リストア

#### 2-1. データベースに接続しているプロセス(=puma, sidekiq)を停止する

###### pumaサービスを停止する

```bash
$ gitlab-ctl stop puma
ok: down: puma: 0s, normally up
```

###### sidekiqサービスを停止する

```bash
$ gitlab-ctl stop sidekiq
ok: down: sidekiq: 0s, normally up
```

###### puma, sidekiqサービスが停止していることを確認する

```bash
$ gitlab-ctl status
run: alertmanager: (pid 20352) 1559s; run: log: (pid 13912) 13522s
run: gitaly: (pid 20362) 1558s; run: log: (pid 13181) 13643s
run: gitlab-exporter: (pid 20376) 1557s; run: log: (pid 13808) 13540s
run: gitlab-kas: (pid 20379) 1557s; run: log: (pid 13499) 13625s
run: gitlab-workhorse: (pid 20387) 1556s; run: log: (pid 13677) 13562s
run: logrotate: (pid 20397) 1556s; run: log: (pid 13078) 13657s
run: nginx: (pid 20403) 1556s; run: log: (pid 13708) 13556s
run: node-exporter: (pid 20411) 1555s; run: log: (pid 13777) 13545s
run: postgres-exporter: (pid 20416) 1555s; run: log: (pid 13950) 13516s
run: postgresql: (pid 20424) 1554s; run: log: (pid 13356) 13632s
run: prometheus: (pid 20439) 1554s; run: log: (pid 13872) 13528s
down: puma: 30s, normally up; run: log: (pid 13581) 13576s
run: redis: (pid 20455) 1552s; run: log: (pid 13132) 13649s
run: redis-exporter: (pid 20461) 1552s; run: log: (pid 13837) 13534s
down: sidekiq: 12s, normally up; run: log: (pid 13622) 13568s
```

#### 2-2. リストア用バックアップファイルをバックアップディレクトリに配置する

```bash
$ cp -p 1667965732_2022_11_09_15.5.3-ee_gitlab_backup.tar /tmp
```

#### 2-3. リストアコマンドを実行する

```bash
$ gitlab-backup restore BACKUP=1667965732_2022_11_09_15.5.3-ee
(省略)
Before restoring the database, we will remove all existing
tables to avoid future upgrade problems. Be aware that if you have
custom tables in the GitLab database these tables and all data will be
removed.

Do you want to continue (yes/no)? yes
Removing all tables. Press `Ctrl-C` within 5 seconds to abort

(省略)
This task will now rebuild the authorized_keys file.
You will lose any data stored in the authorized_keys file.
Do you want to continue (yes/no)? yes

(省略)
2022-11-09 04:27:13 +0000 -- Warning: Your gitlab.rb and gitlab-secrets.json files contain sensitive data 
and are not included in this backup. You will need to restore these files manually.
2022-11-09 04:27:13 +0000 -- Restore task is done.
2022-11-09 04:27:13 +0000 -- Deleting backup and restore lock file
```

:::note info
リストア実行時に表示される以下のエラーメッセージは無視して問題なし
:::

[Restoring database backup using Omnibus packages outputs warnings](https://docs.gitlab.com/ee/raketasks/backup_restore.html#restoring-database-backup-using-omnibus-packages-outputs-warnings "Troubleshooting")

```bash
ERROR: must be owner of extension pg_trgm
ERROR: must be owner of extension btree_gist
ERROR: must be owner of extension plpgsql
WARNING:  no privileges could be revoked for "public" (two occurrences)
WARNING:  no privileges were granted for "public" (two occurrences)
```
