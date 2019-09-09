create or replace function tp_operatetype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='新增';
    end if;
   if tp=      1 then
      rs_:='修改';
    end if;
   if tp=      2 then
      rs_:='删除';
    end if;
return rs_;
end tp_operatetype;
/
create or replace function tp_sex(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:=',男';
    end if;
   if tp=      1 then
      rs_:='女';
    end if;
return rs_;
end tp_sex;
/
create or replace function tp_filtertype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='不过滤';
    end if;
   if tp=      1 then
      rs_:='会员';
    end if;
   if tp=      2 then
      rs_:='交易员';
    end if;
   if tp=      3 then
      rs_:='管理员';
    end if;
return rs_;
end tp_filtertype;
/
create or replace function tp_filetype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='会员';
    end if;
return rs_;
end tp_filetype;
/
create or replace function tp_materailotherchem(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='EUREACHSVHC';
    end if;
   if tp=      1 then
      rs_:='OTHER';
    end if;
return rs_;
end tp_materailotherchem;
/
