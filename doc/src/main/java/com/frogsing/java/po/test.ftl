prompt PL/SQL Developer import file
prompt Created on 2011年4月15日 星期五 by Administrator
set feedback off
set define off
prompt Loading DS_PLANJOB...
delete from ds_planjob;
<#list 1..10000 as t>
<#assign l=t%60 />
<#assign ll=t%60 />
insert into DS_PLANJOB (SGUID, SNAME, ITASKTYPE, DPLANEXECTIME, DEXECTIME, SPARAMETER, BISOVER, DADDDATE, SADDOPERATOR, DMODIFYDATE, SMODIFYOPERATOR, BISDELETE)
values ('${t}', '${t?string}', 1, to_date('15-04-2011 09:30:${l?string("00")}', 'dd-mm-yyyy hh24:mi:ss'), null, null, 0, null, null, null, null, 0);
</#list>
commit;
prompt 1 records loaded
set feedback on
set define on
prompt Done.
