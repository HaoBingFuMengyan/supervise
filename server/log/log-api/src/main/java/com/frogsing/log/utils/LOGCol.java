    package  com.frogsing.log.utils;
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class LOGCol {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
/**操作日志**/
//public static final String lg_operatelog="lg_operatelog" ;
public static class lg_operatelog {
public static XSpec<com.frogsing.log.po.OperateLog> xspec() {
    return new XSpec<com.frogsing.log.po.OperateLog>(com.frogsing.log.po.OperateLog.class);
    }
    public static final String tablename="lg_operatelog";
            /**级别**/
            public static final String ilevel="ilevel" ;
            /**操作记录主键**/
            public static final String soperatekey="soperatekey" ;
            /**操作备注**/
            public static final String soperateremark="soperateremark" ;
            /**操作人**/
            public static final String saddoperator="saddoperator" ;
            /**操作日期**/
            public static final String dadddate="dadddate" ;
            /**级别**/
            public static  Path<Integer> ilevel(Root<?> root){return root.get("ilevel");}
            /**操作记录主键**/
            public static  Path<String> soperatekey(Root<?> root){return root.get("soperatekey");}
            /**操作备注**/
            public static  Path<String> soperateremark(Root<?> root){return root.get("soperateremark");}
            /**操作人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**操作日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}

    }
/**系统日志**/
//public static final String lg_systemlog="lg_systemlog" ;
public static class lg_systemlog {
public static XSpec<com.frogsing.log.po.SystemLog> xspec() {
    return new XSpec<com.frogsing.log.po.SystemLog>(com.frogsing.log.po.SystemLog.class);
    }
    public static final String tablename="lg_systemlog";
            /**日志编号**/
            public static final String slogno="slogno" ;
            /**日志时间**/
            public static final String slogtime="slogtime" ;
            /**会员企业**/
            public static final String smemberid="smemberid" ;
            /**交易员名**/
            public static final String slogusername="slogusername" ;
            /**日志类型**/
            public static final String ilogtype="ilogtype" ;
            /**日志级别**/
            public static final String iloglevel="iloglevel" ;
            /**日志信息**/
            public static final String sloginfo="sloginfo" ;
            /**操作地址**/
            public static final String surl="surl" ;
            /**操作名**/
            public static final String soperatename="soperatename" ;
            /**操作IP**/
            public static final String soperateip="soperateip" ;
            /**日志编号**/
            public static  Path<String> slogno(Root<?> root){return root.get("slogno");}
            /**日志时间**/
            public static  Path<Date> slogtime(Root<?> root){return root.get("slogtime");}
            /**会员企业**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**交易员名**/
            public static  Path<String> slogusername(Root<?> root){return root.get("slogusername");}
            /**日志类型**/
            public static  Path<Integer> ilogtype(Root<?> root){return root.get("ilogtype");}
            /**日志级别**/
            public static  Path<Integer> iloglevel(Root<?> root){return root.get("iloglevel");}
            /**日志信息**/
            public static  Path<String> sloginfo(Root<?> root){return root.get("sloginfo");}
            /**操作地址**/
            public static  Path<String> surl(Root<?> root){return root.get("surl");}
            /**操作名**/
            public static  Path<String> soperatename(Root<?> root){return root.get("soperatename");}
            /**操作IP**/
            public static  Path<String> soperateip(Root<?> root){return root.get("soperateip");}

    }
/**后台访问日志**/
//public static final String lg_visitlog="lg_visitlog" ;
public static class lg_visitlog {
public static XSpec<com.frogsing.log.po.VisitLog> xspec() {
    return new XSpec<com.frogsing.log.po.VisitLog>(com.frogsing.log.po.VisitLog.class);
    }
    public static final String tablename="lg_visitlog";
            /**权限码**/
            public static final String spurviewcode="spurviewcode" ;
            /**访问路径**/
            public static final String spurviewpath="spurviewpath" ;
            /**操作人**/
            public static final String soperator="soperator" ;
            /**操作日期**/
            public static final String ddate="ddate" ;
            /**权限码**/
            public static  Path<String> spurviewcode(Root<?> root){return root.get("spurviewcode");}
            /**访问路径**/
            public static  Path<String> spurviewpath(Root<?> root){return root.get("spurviewpath");}
            /**操作人**/
            public static  Path<String> soperator(Root<?> root){return root.get("soperator");}
            /**操作日期**/
            public static  Path<Date> ddate(Root<?> root){return root.get("ddate");}

    }
/**单据审核信息**/
//public static final String lg_billcheck="lg_billcheck" ;
public static class lg_billcheck {
public static XSpec<com.frogsing.log.po.BillCheck> xspec() {
    return new XSpec<com.frogsing.log.po.BillCheck>(com.frogsing.log.po.BillCheck.class);
    }
    public static final String tablename="lg_billcheck";
            /**单据ID**/
            public static final String sbillid="sbillid" ;
            /**单据编号**/
            public static final String sbillno="sbillno" ;
            /**操作人ID**/
            public static final String soperatorid="soperatorid" ;
            /**操作员名称**/
            public static final String soperator="soperator" ;
            /**操作会员名称**/
            public static final String soperatormember="soperatormember" ;
            /**状态**/
            public static final String istatus="istatus" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**操作时间**/
            public static final String daddtime="daddtime" ;
            /**单据ID**/
            public static  Path<String> sbillid(Root<?> root){return root.get("sbillid");}
            /**单据编号**/
            public static  Path<String> sbillno(Root<?> root){return root.get("sbillno");}
            /**操作人ID**/
            public static  Path<String> soperatorid(Root<?> root){return root.get("soperatorid");}
            /**操作员名称**/
            public static  Path<String> soperator(Root<?> root){return root.get("soperator");}
            /**操作会员名称**/
            public static  Path<String> soperatormember(Root<?> root){return root.get("soperatormember");}
            /**状态**/
            public static  Path<Integer> istatus(Root<?> root){return root.get("istatus");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**操作时间**/
            public static  Path<Date> daddtime(Root<?> root){return root.get("daddtime");}

    }

    }
