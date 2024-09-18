SELECT relname AS table_name
FROM pg_trigger t
JOIN pg_class c ON t.tgrelid = c.oid
WHERE t.tgname LIKE 'repack_%';  -- repackトリガーを対象にしている場合


aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,EngineVersion]" --output json