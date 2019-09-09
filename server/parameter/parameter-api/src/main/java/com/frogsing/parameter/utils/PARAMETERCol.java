    package  com.frogsing.parameter.utils;
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class PARAMETERCol {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
/**单据编号表**/
//public static final String cs_sequence="cs_sequence" ;
public static class cs_sequence {
public static XSpec<com.frogsing.parameter.po.Sequence> xspec() {
    return new XSpec<com.frogsing.parameter.po.Sequence>(com.frogsing.parameter.po.Sequence.class);
    }
    public static final String tablename="cs_sequence";
            /**编号**/
            public static final String scode="scode" ;
            /**对象名称**/
            public static final String sobjectname="sobjectname" ;
            /**格式**/
            public static final String sfromat="sfromat" ;
            /**递增大小**/
            public static final String iincrement="iincrement" ;
            /**起始值**/
            public static final String istartno="istartno" ;
            /**当前编号**/
            public static final String icurrentno="icurrentno" ;
            /**前缀**/
            public static final String sprefix="sprefix" ;
            /**后缀**/
            public static final String ssuffix="ssuffix" ;
            /**流水位数**/
            public static final String sseqlength="sseqlength" ;
            /**当前日期**/
            public static final String dcurrentdate="dcurrentdate" ;
            /**是否重新生成编号**/
            public static final String biscycle="biscycle" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**是否结算清零**/
            public static final String bisreset="bisreset" ;
            /**编号**/
            public static  Path<String> scode(Root<?> root){return root.get("scode");}
            /**对象名称**/
            public static  Path<String> sobjectname(Root<?> root){return root.get("sobjectname");}
            /**格式**/
            public static  Path<String> sfromat(Root<?> root){return root.get("sfromat");}
            /**递增大小**/
            public static  Path<Integer> iincrement(Root<?> root){return root.get("iincrement");}
            /**起始值**/
            public static  Path<Integer> istartno(Root<?> root){return root.get("istartno");}
            /**当前编号**/
            public static  Path<Integer> icurrentno(Root<?> root){return root.get("icurrentno");}
            /**前缀**/
            public static  Path<String> sprefix(Root<?> root){return root.get("sprefix");}
            /**后缀**/
            public static  Path<String> ssuffix(Root<?> root){return root.get("ssuffix");}
            /**流水位数**/
            public static  Path<Integer> sseqlength(Root<?> root){return root.get("sseqlength");}
            /**当前日期**/
            public static  Path<String> dcurrentdate(Root<?> root){return root.get("dcurrentdate");}
            /**是否重新生成编号**/
            public static  Path<Integer> biscycle(Root<?> root){return root.get("biscycle");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**是否结算清零**/
            public static  Path<Integer> bisreset(Root<?> root){return root.get("bisreset");}

    }
/**系统参数表**/
//public static final String cs_parameter="cs_parameter" ;
public static class cs_parameter {
public static XSpec<com.frogsing.parameter.po.Parameter> xspec() {
    return new XSpec<com.frogsing.parameter.po.Parameter>(com.frogsing.parameter.po.Parameter.class);
    }
    public static final String tablename="cs_parameter";
            /**参数类型**/
            public static final String iparatype="iparatype" ;
            /**参数值**/
            public static final String sparametervalue="sparametervalue" ;
            /**参数说明**/
            public static final String sremark="sremark" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**参数类型**/
            public static  Path<Integer> iparatype(Root<?> root){return root.get("iparatype");}
            /**参数值**/
            public static  Path<String> sparametervalue(Root<?> root){return root.get("sparametervalue");}
            /**参数说明**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**业务参数表**/
//public static final String cs_businessparameter="cs_businessparameter" ;
public static class cs_businessparameter {
public static XSpec<com.frogsing.parameter.po.BusinessParameter> xspec() {
    return new XSpec<com.frogsing.parameter.po.BusinessParameter>(com.frogsing.parameter.po.BusinessParameter.class);
    }
    public static final String tablename="cs_businessparameter";
            /**排序号**/
            public static final String isort="isort" ;
            /**参数类型**/
            public static final String iparatype="iparatype" ;
            /**参数名称**/
            public static final String sparametername="sparametername" ;
            /**参数值**/
            public static final String sparametervalue="sparametervalue" ;
            /**参数说明**/
            public static final String sremark="sremark" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**排序号**/
            public static  Path<Integer> isort(Root<?> root){return root.get("isort");}
            /**参数类型**/
            public static  Path<Integer> iparatype(Root<?> root){return root.get("iparatype");}
            /**参数名称**/
            public static  Path<String> sparametername(Root<?> root){return root.get("sparametername");}
            /**参数值**/
            public static  Path<String> sparametervalue(Root<?> root){return root.get("sparametervalue");}
            /**参数说明**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**错误消息表**/
//public static final String cs_errormessage="cs_errormessage" ;
public static class cs_errormessage {
public static XSpec<com.frogsing.parameter.po.ErrorMessage> xspec() {
    return new XSpec<com.frogsing.parameter.po.ErrorMessage>(com.frogsing.parameter.po.ErrorMessage.class);
    }
    public static final String tablename="cs_errormessage";
            /**错误代码**/
            public static final String scode="scode" ;
            /**错误消息**/
            public static final String smessage="smessage" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**错误代码**/
            public static  Path<String> scode(Root<?> root){return root.get("scode");}
            /**错误消息**/
            public static  Path<String> smessage(Root<?> root){return root.get("smessage");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**平台交易交易状态**/
//public static final String cs_exchangecenter="cs_exchangecenter" ;
public static class cs_exchangecenter {
public static XSpec<com.frogsing.parameter.po.ExchangeCenter> xspec() {
    return new XSpec<com.frogsing.parameter.po.ExchangeCenter>(com.frogsing.parameter.po.ExchangeCenter.class);
    }
    public static final String tablename="cs_exchangecenter";
            /**是否自动控制**/
            public static final String bisautoctrl="bisautoctrl" ;
            /**交易日期**/
            public static final String dtradedate="dtradedate" ;
            /**状态**/
            public static final String istatus="istatus" ;
            /**分站**/
            public static final String isitetype="isitetype" ;
            /**是否自动控制**/
            public static  Path<Integer> bisautoctrl(Root<?> root){return root.get("bisautoctrl");}
            /**交易日期**/
            public static  Path<Date> dtradedate(Root<?> root){return root.get("dtradedate");}
            /**状态**/
            public static  Path<Integer> istatus(Root<?> root){return root.get("istatus");}
            /**分站**/
            public static  Path<Integer> isitetype(Root<?> root){return root.get("isitetype");}

    }
/**系统交易日表**/
//public static final String cs_tradedate="cs_tradedate" ;
public static class cs_tradedate {
public static XSpec<com.frogsing.parameter.po.TradeDate> xspec() {
    return new XSpec<com.frogsing.parameter.po.TradeDate>(com.frogsing.parameter.po.TradeDate.class);
    }
    public static final String tablename="cs_tradedate";
            /**日期**/
            public static final String ddate="ddate" ;
            /**是否交易日**/
            public static final String bistrade="bistrade" ;
            /**分站**/
            public static final String isitetype="isitetype" ;
            /**日期**/
            public static  Path<Date> ddate(Root<?> root){return root.get("ddate");}
            /**是否交易日**/
            public static  Path<Integer> bistrade(Root<?> root){return root.get("bistrade");}
            /**分站**/
            public static  Path<Integer> isitetype(Root<?> root){return root.get("isitetype");}

    }
/**系统交易开闭市时间表**/
//public static final String cs_exchangestatectrl="cs_exchangestatectrl" ;
public static class cs_exchangestatectrl {
public static XSpec<com.frogsing.parameter.po.ExchangeStateCtrl> xspec() {
    return new XSpec<com.frogsing.parameter.po.ExchangeStateCtrl>(com.frogsing.parameter.po.ExchangeStateCtrl.class);
    }
    public static final String tablename="cs_exchangestatectrl";
            /**i时间**/
            public static final String itime="itime" ;
            /**控制命令**/
            public static final String ictrlcmd="ictrlcmd" ;
            /**分站**/
            public static final String isitetype="isitetype" ;
            /**i时间**/
            public static  Path<Long> itime(Root<?> root){return root.get("itime");}
            /**控制命令**/
            public static  Path<Integer> ictrlcmd(Root<?> root){return root.get("ictrlcmd");}
            /**分站**/
            public static  Path<Integer> isitetype(Root<?> root){return root.get("isitetype");}

    }
/**系统交易开闭市时间历史表**/
//public static final String cs_hexchangestatectrl="cs_hexchangestatectrl" ;
public static class cs_hexchangestatectrl {
public static XSpec<com.frogsing.parameter.po.HExchangeStateCtrl> xspec() {
    return new XSpec<com.frogsing.parameter.po.HExchangeStateCtrl>(com.frogsing.parameter.po.HExchangeStateCtrl.class);
    }
    public static final String tablename="cs_hexchangestatectrl";
            /**i时间**/
            public static final String itime="itime" ;
            /**控制命令**/
            public static final String ictrlcmd="ictrlcmd" ;
            /**分站**/
            public static final String isitetype="isitetype" ;
            /**i时间**/
            public static  Path<Long> itime(Root<?> root){return root.get("itime");}
            /**控制命令**/
            public static  Path<Integer> ictrlcmd(Root<?> root){return root.get("ictrlcmd");}
            /**分站**/
            public static  Path<Integer> isitetype(Root<?> root){return root.get("isitetype");}

    }
/**系统信息**/
//public static final String sys_systempara="sys_systempara" ;
public static class sys_systempara {
public static XSpec<com.frogsing.parameter.po.SystemPara> xspec() {
    return new XSpec<com.frogsing.parameter.po.SystemPara>(com.frogsing.parameter.po.SystemPara.class);
    }
    public static final String tablename="sys_systempara";
            /**名称**/
            public static final String snamepara="snamepara" ;
            /**内容**/
            public static final String svaluepara="svaluepara" ;
            /**说明**/
            public static final String sremarks="sremarks" ;
            /**名称**/
            public static  Path<String> snamepara(Root<?> root){return root.get("snamepara");}
            /**内容**/
            public static  Path<String> svaluepara(Root<?> root){return root.get("svaluepara");}
            /**说明**/
            public static  Path<String> sremarks(Root<?> root){return root.get("sremarks");}

    }

    }
