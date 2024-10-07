aws ec2 describe-instances --instance-ids <インスタンスID> --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value, SubnetId]' --output text | while read name subnet; do echo "Instance Name: $name"; echo "Subnet CIDR: $(aws ec2 describe-subnets --subnet-ids $subnet --query "Subnets[*].CidrBlock" --output text)"; done





SELECT relname AS table_name
FROM pg_trigger t
JOIN pg_class c ON t.tgrelid = c.oid
WHERE t.tgname LIKE 'repack_%';  -- repackトリガーを対象にしている場合


DROP TRIGGER IF EXISTS repack_insert_trigger ON your_table;

aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,EngineVersion]" --output json




aws ec2 describe-instances --instance-ids <インスタンスID> --query 'Reservations[*].Instances[*].[VpcId]' --output text

aws ec2 describe-vpcs --vpc-ids <VPC ID> --query 'Vpcs[*].CidrBlock' --output text

aws ec2 describe-security-groups --group-ids <セキュリティグループID> --query 'SecurityGroups[*].VpcId' --output text


aws iam list-attached-role-policies --role-name <ロール名>
aws iam list-role-policies --role-name <ロール名>

aws iam list-attached-user-policies --user-name my-user
aws iam list-user-policies --user-name my-user




eventName = AssumeRole AND requestParameters.roleSessionName = "13456655"












