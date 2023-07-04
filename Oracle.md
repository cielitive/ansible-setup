```bash
$ sqlplus / as sysdba
SQL> exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT ();
SQL> exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT ();

SQL> @?/rdbms/admin/awrrpt.sql

$ start_time='2023/07/04 10:32'
$ end_time='2023/07/04 10:43'

$ echo "select snap_id, to_char(begin_interval_time, 'yyyy/mm/dd hh24:mi') from DBA_HIST_SNAPSHOT order by snap_id;" | sqlplus -s / as sysdba | grep "${start_time}" | awk '{print $1}'
$ echo "select snap_id, to_char(begin_interval_time, 'yyyy/mm/dd hh24:mi') from DBA_HIST_SNAPSHOT order by snap_id;" | sqlplus -s / as sysdba | grep "${end_time}" | awk '{print $1}'

$ echo -ne "set heading off\n set feedback off\n select snap_id, to_char(begin_interval_time, 'yyyy/mm/dd hh24:mi') from DBA_HIST_SNAPSHOT order by snap_id;" | sqlplus -s / as sysdba
```
