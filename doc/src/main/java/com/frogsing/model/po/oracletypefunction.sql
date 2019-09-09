create or replace function tp_glassamount(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
return rs_;
end tp_glassamount;
/
create or replace function tp_ordercanceltype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='没作废';
    end if;
   if tp=      1 then
      rs_:='买方作废';
    end if;
   if tp=      2 then
      rs_:='卖方作废';
    end if;
   if tp=      3 then
      rs_:='撤牌作废';
    end if;
   if tp=      4 then
      rs_:='过期作废';
    end if;
return rs_;
end tp_ordercanceltype;
/
create or replace function tp_billpaytype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='自有资金支付';
    end if;
   if tp=      1 then
      rs_:='融资贷款支付';
    end if;
return rs_;
end tp_billpaytype;
/
create or replace function tp_orderstatus(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='等待处理中';
    end if;
   if tp=      1 then
      rs_:='已发货';
    end if;
   if tp=      2 then
      rs_:='作废';
    end if;
   if tp=      3 then
      rs_:='订单完成';
    end if;
return rs_;
end tp_orderstatus;
/
create or replace function tp_versionno(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
return rs_;
end tp_versionno;
/
create or replace function tp_currentversion(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
return rs_;
end tp_currentversion;
/
create or replace function tp_resourcestatus(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='挂牌中';
    end if;
   if tp=      1 then
      rs_:='暂停';
    end if;
   if tp=      2 then
      rs_:='已撤牌';
    end if;
   if tp=      3 then
      rs_:='销售完成';
    end if;
return rs_;
end tp_resourcestatus;
/
create or replace function tp_fullorbatch(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='全款';
    end if;
   if tp=      1 then
      rs_:='分批';
    end if;
return rs_;
end tp_fullorbatch;
/
create or replace function tp_warranty(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='无';
    end if;
   if tp=      1 then
      rs_:='有';
    end if;
   if tp=      2 then
      rs_:='未知';
    end if;
return rs_;
end tp_warranty;
/
create or replace function tp_resourcetype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='钢材';
    end if;
   if tp=      1 then
      rs_:='红酒';
    end if;
   if tp=      2 then
      rs_:='不限';
    end if;
return rs_;
end tp_resourcetype;
/
create or replace function tp_channel(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      1 then
      rs_:=' 资讯';
    end if;
   if tp=      2 then
      rs_:=' 商铺';
    end if;
   if tp=      3 then
      rs_:='仓库';
    end if;
return rs_;
end tp_channel;
/
create or replace function tp_advertisstatus(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='已过期';
    end if;
   if tp=      1 then
      rs_:='投放中';
    end if;
   if tp=      2 then
      rs_:='待投放';
    end if;
   if tp=      3 then
      rs_:='暂停';
    end if;
return rs_;
end tp_advertisstatus;
/
create or replace function tp_exceptionaccount(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='一天10次';
    end if;
   if tp=      1 then
      rs_:='一天5IP';
    end if;
   if tp=      3 then
      rs_:='密码锁定';
    end if;
return rs_;
end tp_exceptionaccount;
/
create or replace function tp_membervisibility(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='全部  ';
    end if;
   if tp=      1 then
      rs_:='区域   ';
    end if;
   if tp=      2 then
      rs_:='主营产品    ';
    end if;
   if tp=      3 then
      rs_:='公司内部 ';
    end if;
return rs_;
end tp_membervisibility;
/
create or replace function tp_servicearea(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      1 then
      rs_:='交易';
    end if;
return rs_;
end tp_servicearea;
/
create or replace function tp_orgtype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='总部';
    end if;
   if tp=      1 then
      rs_:='分行';
    end if;
   if tp=      2 then
      rs_:='支行';
    end if;
return rs_;
end tp_orgtype;
/
create or replace function tp_memberstatus(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='待激活';
    end if;
   if tp=      1 then
      rs_:='待审核';
    end if;
   if tp=      2 then
      rs_:='被拒绝';
    end if;
   if tp=      3  then
      rs_:='正式会员';
    end if;
   if tp=      4  then
      rs_:='冻结';
    end if;
   if tp=      5 then
      rs_:='待完善资料';
    end if;
return rs_;
end tp_memberstatus;
/
create or replace function tp_membertype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='本公司';
    end if;
   if tp=      1 then
      rs_:='交易会员';
    end if;
   if tp=      2 then
      rs_:='仓库';
    end if;
   if tp=      3 then
      rs_:='银行';
    end if;
   if tp=      4 then
      rs_:='物流单位';
    end if;
   if tp=      5 then
      rs_:='保险公司';
    end if;
   if tp=      6  then
      rs_:='担保公司';
    end if;
   if tp=      7 then
      rs_:='代理市场';
    end if;
   if tp=      8 then
      rs_:='监管公司';
    end if;
   if tp=      9 then
      rs_:='商协会';
    end if;
return rs_;
end tp_membertype;
/
create or replace function tp_sex(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='男';
    end if;
   if tp=      1 then
      rs_:='女';
    end if;
return rs_;
end tp_sex;
/
create or replace function tp_loglevel(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='信息';
    end if;
   if tp=      1 then
      rs_:='警告';
    end if;
   if tp=      2 then
      rs_:='错误';
    end if;
   if tp=      3 then
      rs_:='严重';
    end if;
   if tp=      4 then
      rs_:='瘫痪';
    end if;
return rs_;
end tp_loglevel;
/
create or replace function tp_logtype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      1 then
      rs_:='系统日志';
    end if;
   if tp=      2 then
      rs_:='安全日志';
    end if;
   if tp=      3 then
      rs_:='应用日志';
    end if;
   if tp=      4 then
      rs_:='其它日志';
    end if;
return rs_;
end tp_logtype;
/
create or replace function tp_long(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
return rs_;
end tp_long;
/
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
create or replace function tp_shangjitype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='供应';
    end if;
   if tp=      1 then
      rs_:='求购';
    end if;
   if tp=      2 then
      rs_:='合作';
    end if;
   if tp=      3 then
      rs_:='代理';
    end if;
return rs_;
end tp_shangjitype;
/
create or replace function tp_baojiavalidity(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='一周';
    end if;
   if tp=      1 then
      rs_:='一月';
    end if;
   if tp=      2 then
      rs_:='一个半月';
    end if;
   if tp=      3  then
      rs_:='三个月';
    end if;
   if tp=      4  then
      rs_:='六个月';
    end if;
   if tp=      5 then
      rs_:='一年';
    end if;
   if tp=      6 then
      rs_:='长期';
    end if;
return rs_;
end tp_baojiavalidity;
/
create or replace function tp_glassesgender(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      1 then
      rs_:='Women';
    end if;
   if tp=      2 then
      rs_:='Men';
    end if;
   if tp=      3 then
      rs_:='Children';
    end if;
return rs_;
end tp_glassesgender;
/
create or replace function tp_paystatus(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='待支付';
    end if;
   if tp=      1 then
      rs_:='已支付';
    end if;
   if tp=      2 then
      rs_:='支付异常';
    end if;
return rs_;
end tp_paystatus;
/
create or replace function tp_mailexpress(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='EMS';
    end if;
   if tp=      1 then
      rs_:='UPS';
    end if;
   if tp=      2 then
      rs_:='DHL';
    end if;
return rs_;
end tp_mailexpress;
/
create or replace function tp_glassesorderstatus(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='INIT';
    end if;
   if tp=      1 then
      rs_:='PAYING';
    end if;
   if tp=      2 then
      rs_:='PAID';
    end if;
   if tp=      3 then
      rs_:='SENDING';
    end if;
   if tp=      4 then
      rs_:='CANCEL';
    end if;
   if tp=      5 then
      rs_:='FINISH';
    end if;
return rs_;
end tp_glassesorderstatus;
/
create or replace function tp_paymethod(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='CreditCard';
    end if;
   if tp=      1 then
      rs_:='PayPal';
    end if;
return rs_;
end tp_paymethod;
/
create or replace function tp_glassesrim(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Full-Rim';
    end if;
   if tp=      1 then
      rs_:='Semi-Rim';
    end if;
   if tp=      2 then
      rs_:='Rimless';
    end if;
return rs_;
end tp_glassesrim;
/
create or replace function tp_glassesshape(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Rectangle';
    end if;
   if tp=      1 then
      rs_:='Oval	   ';
    end if;
   if tp=      2 then
      rs_:='Square   ';
    end if;
   if tp=      3 then
      rs_:='Round	   ';
    end if;
   if tp=      4 then
      rs_:='Wayfarer ';
    end if;
return rs_;
end tp_glassesshape;
/
create or replace function tp_glassesadvanced(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Fashion';
    end if;
   if tp=      1 then
      rs_:='Classic	';
    end if;
   if tp=      2 then
      rs_:='DesignerNew	';
    end if;
   if tp=      3 then
      rs_:='Lightweight	';
    end if;
   if tp=      4 then
      rs_:='PartyGlasses';
    end if;
return rs_;
end tp_glassesadvanced;
/
create or replace function tp_glassesstyle(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Fashion';
    end if;
   if tp=      1 then
      rs_:='Classic	';
    end if;
   if tp=      2 then
      rs_:='DesignerNew	';
    end if;
   if tp=      3 then
      rs_:='Lightweight	';
    end if;
   if tp=      4 then
      rs_:='PartyGlasses';
    end if;
return rs_;
end tp_glassesstyle;
/
create or replace function tp_glassesmeterial(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Plastic  ';
    end if;
   if tp=      1 then
      rs_:='Metal    ';
    end if;
   if tp=      2 then
      rs_:='Flexlite ';
    end if;
   if tp=      3 then
      rs_:='Titanium ';
    end if;
return rs_;
end tp_glassesmeterial;
/
create or replace function tp_glassescolor(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Red      ';
    end if;
   if tp=      1 then
      rs_:='Pink     ';
    end if;
   if tp=      2 then
      rs_:='Blue     ';
    end if;
   if tp=      3 then
      rs_:='Brown    ';
    end if;
   if tp=      4 then
      rs_:='Grey     ';
    end if;
   if tp=      5 then
      rs_:='Golden   ';
    end if;
   if tp=      6 then
      rs_:='Silver   ';
    end if;
   if tp=      7 then
      rs_:='Black    ';
    end if;
   if tp=      8 then
      rs_:='White    ';
    end if;
   if tp=      9 then
      rs_:='Purple   ';
    end if;
   if tp=      10 then
      rs_:='Clear   ';
    end if;
   if tp=      11 then
      rs_:='Green   ';
    end if;
   if tp=      12 then
      rs_:='Yellow';
    end if;
return rs_;
end tp_glassescolor;
/
create or replace function tp_framesbp(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Single Version';
    end if;
   if tp=      1 then
      rs_:='Bifocal';
    end if;
   if tp=      2 then
      rs_:='Progressive';
    end if;
return rs_;
end tp_framesbp;
/
create or replace function tp_framesml(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='Small';
    end if;
   if tp=      1 then
      rs_:='Medium';
    end if;
   if tp=      2 then
      rs_:='Large';
    end if;
return rs_;
end tp_framesml;
/
create or replace function tp_title(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      1 then
      rs_:='Mr.';
    end if;
   if tp=      0 then
      rs_:='Ms.';
    end if;
return rs_;
end tp_title;
/
create or replace function tp_viewtype(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      0 then
      rs_:='默认';
    end if;
   if tp=      1 then
      rs_:='指定FTL';
    end if;
   if tp=      2 then
      rs_:='重定向';
    end if;
return rs_;
end tp_viewtype;
/
create or replace function tp_versionno2(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
return rs_;
end tp_versionno2;
/
create or replace function tp_versionno3(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
return rs_;
end tp_versionno3;
/
create or replace function tp_usefor(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
   if tp=      3 then
      rs_:='Single vision (General use) FREE';
    end if;
   if tp=      376 then
      rs_:='Both distance and reading with a line';
    end if;
   if tp=      377 then
      rs_:='Multifocal without a line $39';
    end if;
   if tp=      2 then
      rs_:='Computer (Intermediate) FREE';
    end if;
   if tp=      1 then
      rs_:='Night driving lenses';
    end if;
return rs_;
end tp_usefor;
/
