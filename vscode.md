```bash
$ USERNAME=""
$ PASSWORD=""
# subscription-manager register --username [username] --password [password] --name [SYSTEM_NAME]
$ subscription-manager register --username ${USERNAME} --password ${PASSWORD}
登録中: subscription.rhsm.redhat.com:443/subscription
このシステムは、次の ID で登録されました: XXXXXXXX-XXXXXXXXXXXX
登録したシステム名: XXXXXXXX
```

```bash
$ subscription-manager list
+-------------------------------------------+
    インストール済み製品のステータス
+-------------------------------------------+
製品名:           Red Hat Enterprise Linux for x86_64
製品 ID:          479
バージョン:       8.3
アーキテクチャー: x86_64
状態:             サブスクライブなし
状態の詳細:       Not supported by a valid subscription.
開始:
終了:

$ subscription-manager list --available
$ subscription-manager list --available --pool-only

$ POOL_NUM=""
$ subscription-manager attach --pool ${POOL_NUM}
サブスクリプションが正しく割り当てられました: Red Hat Developer Subscription

$ subscription-manager list
+-------------------------------------------+
    インストール済み製品のステータス
+-------------------------------------------+
製品名:           Red Hat Enterprise Linux for x86_64
製品 ID:          479
バージョン:       8.3
アーキテクチャー: x86_64
状態:             サブスクライブ済み
状態の詳細:
開始:             2021年07月28日
終了:             2022年07月28日
```
