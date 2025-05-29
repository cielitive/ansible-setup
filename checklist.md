# 作業チェックリスト

## 事前作業

### ⬜ 作業1：〇〇環境のバックアップ

**担当者:** 田中  
**作業時間:** 10:00〜10:30  

**作業内容**  
本番環境の〇〇のバックアップを取得する。バックアップファイルは日付付きで保存し、S3にアップロードすること。  
作業前に対象サービスが動作中であることを確認する。

**使用コマンド**
```bash
tar -czf backup_$(date +%Y%m%d).tar.gz /path/to/data
aws s3 cp backup_$(date +%Y%m%d).tar.gz s3://your-bucket-name/
```

**参照URL**
- [バックアップ手順書](https://example.com/backup-guide)
- [AWS CLIドキュメント](https://docs.aws.amazon.com/cli/latest/reference/s3/cp.html)

---

### ⬜ 作業2：設定ファイル確認・修正

**担当者:** 鈴木  
**作業時間:** 10:30〜11:00  

**作業内容**  
`/etc/sample.conf` の設定内容を確認し、必要に応じてパラメータを修正する。変更後はファイルを保存し、変更内容を記録する。

**使用コマンド**
```bash
vim /etc/sample.conf
```

**参照URL**
- [設定ファイル仕様](https://example.com/config-spec)
- [変更履歴管理ガイドライン](https://example.com/change-log-policy)

---

## 作業

### ⬜ 作業1：サービスの一時停止

**担当者:** 佐藤  
**作業時間:** 11:00〜11:10  

**作業内容**  
サービスを一時停止し、ユーザーアクセスをブロックする。事前にアナウンス済みであることを確認。

**使用コマンド**
```bash
systemctl stop sample-service
```

**参照URL**
- [サービス管理手順](https://example.com/service-stop)

---

## 事後作業

### ⬜ 作業1：サービス再開と確認

**担当者:** 山田  
**作業時間:** 11:30〜12:00  

**作業内容**  
アップデート後にサービスを再起動し、動作確認とログチェックを行う。

**使用コマンド**
```bash
systemctl start sample-service
journalctl -u sample-service --since "10 minutes ago"
```

**参照URL**
- [サービス起動手順](https://example.com/service-start)
- [ログ確認ガイド](https://example.com/log-check)