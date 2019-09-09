    package  com.frogsing.project.utils;
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class PROJECTCol {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
/**合约-消息**/
//public static final String xm_contractmsg="xm_contractmsg" ;
public static class xm_contractmsg {
public static XSpec<com.frogsing.project.po.Contractmsg> xspec() {
    return new XSpec<com.frogsing.project.po.Contractmsg>(com.frogsing.project.po.Contractmsg.class);
    }
    public static final String tablename="xm_contractmsg";
            /**指令ID**/
            public static final String scommandid="scommandid" ;
            /**指令名称**/
            public static final String scommandname="scommandname" ;
            /**主力合约名称**/
            public static final String smaincontractname="smaincontractname" ;
            /**主力合约价格**/
            public static final String fmaincontractprice="fmaincontractprice" ;
            /**次主力合约名称**/
            public static final String snextcontractname="snextcontractname" ;
            /**次主力合约价格**/
            public static final String fnextcontractprice="fnextcontractprice" ;
            /**次次主力合约名称**/
            public static final String snextnextcontractname="snextnextcontractname" ;
            /**次次主力合约价格**/
            public static final String fnextnextcontractprice="fnextnextcontractprice" ;
            /**图片**/
            public static final String spic="spic" ;
            /**最新公告**/
            public static final String snewnotice="snewnotice" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**指令ID**/
            public static  Path<String> scommandid(Root<?> root){return root.get("scommandid");}
            /**指令名称**/
            public static  Path<String> scommandname(Root<?> root){return root.get("scommandname");}
            /**主力合约名称**/
            public static  Path<String> smaincontractname(Root<?> root){return root.get("smaincontractname");}
            /**主力合约价格**/
            public static  Path<Double> fmaincontractprice(Root<?> root){return root.get("fmaincontractprice");}
            /**次主力合约名称**/
            public static  Path<String> snextcontractname(Root<?> root){return root.get("snextcontractname");}
            /**次主力合约价格**/
            public static  Path<Double> fnextcontractprice(Root<?> root){return root.get("fnextcontractprice");}
            /**次次主力合约名称**/
            public static  Path<String> snextnextcontractname(Root<?> root){return root.get("snextnextcontractname");}
            /**次次主力合约价格**/
            public static  Path<Double> fnextnextcontractprice(Root<?> root){return root.get("fnextnextcontractprice");}
            /**图片**/
            public static  Path<String> spic(Root<?> root){return root.get("spic");}
            /**最新公告**/
            public static  Path<String> snewnotice(Root<?> root){return root.get("snewnotice");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**指令**/
//public static final String xm_command="xm_command" ;
public static class xm_command {
public static XSpec<com.frogsing.project.po.Command> xspec() {
    return new XSpec<com.frogsing.project.po.Command>(com.frogsing.project.po.Command.class);
    }
    public static final String tablename="xm_command";
            /**指令编号**/
            public static final String sno="sno" ;
            /**指令内容**/
            public static final String scontent="scontent" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**指令编号**/
            public static  Path<String> sno(Root<?> root){return root.get("sno");}
            /**指令内容**/
            public static  Path<String> scontent(Root<?> root){return root.get("scontent");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**持仓-交易**/
//public static final String xm_positiontrans="xm_positiontrans" ;
public static class xm_positiontrans {
public static XSpec<com.frogsing.project.po.Positiontrans> xspec() {
    return new XSpec<com.frogsing.project.po.Positiontrans>(com.frogsing.project.po.Positiontrans.class);
    }
    public static final String tablename="xm_positiontrans";
            /**自营**/
            public static final String sselfsupport="sselfsupport" ;
            /**非自营**/
            public static final String snotselfsupport="snotselfsupport" ;
            /**点价**/
            public static final String fprice="fprice" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**自营**/
            public static  Path<String> sselfsupport(Root<?> root){return root.get("sselfsupport");}
            /**非自营**/
            public static  Path<String> snotselfsupport(Root<?> root){return root.get("snotselfsupport");}
            /**点价**/
            public static  Path<Double> fprice(Root<?> root){return root.get("fprice");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**持仓历史交易记录**/
//public static final String xm_positiontransrecord="xm_positiontransrecord" ;
public static class xm_positiontransrecord {
public static XSpec<com.frogsing.project.po.Positiontransrecord> xspec() {
    return new XSpec<com.frogsing.project.po.Positiontransrecord>(com.frogsing.project.po.Positiontransrecord.class);
    }
    public static final String tablename="xm_positiontransrecord";
            /**持仓ID**/
            public static final String spositiontransid="spositiontransid" ;
            /**交易信息**/
            public static final String scontent="scontent" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**持仓ID**/
            public static  Path<String> spositiontransid(Root<?> root){return root.get("spositiontransid");}
            /**交易信息**/
            public static  Path<String> scontent(Root<?> root){return root.get("scontent");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**采购-销售**/
//public static final String xm_buysale="xm_buysale" ;
public static class xm_buysale {
public static XSpec<com.frogsing.project.po.Buysale> xspec() {
    return new XSpec<com.frogsing.project.po.Buysale>(com.frogsing.project.po.Buysale.class);
    }
    public static final String tablename="xm_buysale";
            /**单日实际采购数量**/
            public static final String ftodayrealitybuyweight="ftodayrealitybuyweight" ;
            /**次日可采购数量**/
            public static final String ftomorrowmaybuyweight="ftomorrowmaybuyweight" ;
            /**次日预计采购数量**/
            public static final String ftomorrowplanbuyweight="ftomorrowplanbuyweight" ;
            /**当周预计采购数量**/
            public static final String fweekplanbuyweight="fweekplanbuyweight" ;
            /**当日采购点价**/
            public static final String ftodaybuyprice="ftodaybuyprice" ;
            /**当日销售点价**/
            public static final String ftodaysaleprice="ftodaysaleprice" ;
            /**采购点价期货套保余额**/
            public static final String fbuypricefuturesbalance="fbuypricefuturesbalance" ;
            /**销售点价期货套保余额**/
            public static final String fsalepricefuturesbalance="fsalepricefuturesbalance" ;
            /**前日生产总数**/
            public static final String fprice="fprice" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**单日实际采购数量**/
            public static  Path<Double> ftodayrealitybuyweight(Root<?> root){return root.get("ftodayrealitybuyweight");}
            /**次日可采购数量**/
            public static  Path<Double> ftomorrowmaybuyweight(Root<?> root){return root.get("ftomorrowmaybuyweight");}
            /**次日预计采购数量**/
            public static  Path<Double> ftomorrowplanbuyweight(Root<?> root){return root.get("ftomorrowplanbuyweight");}
            /**当周预计采购数量**/
            public static  Path<Double> fweekplanbuyweight(Root<?> root){return root.get("fweekplanbuyweight");}
            /**当日采购点价**/
            public static  Path<Double> ftodaybuyprice(Root<?> root){return root.get("ftodaybuyprice");}
            /**当日销售点价**/
            public static  Path<Double> ftodaysaleprice(Root<?> root){return root.get("ftodaysaleprice");}
            /**采购点价期货套保余额**/
            public static  Path<Double> fbuypricefuturesbalance(Root<?> root){return root.get("fbuypricefuturesbalance");}
            /**销售点价期货套保余额**/
            public static  Path<Double> fsalepricefuturesbalance(Root<?> root){return root.get("fsalepricefuturesbalance");}
            /**前日生产总数**/
            public static  Path<Double> fprice(Root<?> root){return root.get("fprice");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**偏离值**/
//public static final String xm_departurevalue="xm_departurevalue" ;
public static class xm_departurevalue {
public static XSpec<com.frogsing.project.po.Departurevalue> xspec() {
    return new XSpec<com.frogsing.project.po.Departurevalue>(com.frogsing.project.po.Departurevalue.class);
    }
    public static final String tablename="xm_departurevalue";
            /**最新交易日偏离值自营**/
            public static final String fnewtradedayself="fnewtradedayself" ;
            /**最新交易日偏离值非自营**/
            public static final String fnewtradedaynotself="fnewtradedaynotself" ;
            /**最新交易流量自营吨数**/
            public static final String fnewtradeflowselfweight="fnewtradeflowselfweight" ;
            /**最新交易流量自营交易额**/
            public static final String fnewtradeflowselfamount="fnewtradeflowselfamount" ;
            /**最新交易流量非自营吨数**/
            public static final String fnewtradeflownotselfweight="fnewtradeflownotselfweight" ;
            /**最新交易流量非自营交易额**/
            public static final String fnewtradeflownotselfamount="fnewtradeflownotselfamount" ;
            /**K11大标题**/
            public static final String fkttitle="fkttitle" ;
            /**K11偏离值子标题**/
            public static final String fkchildtitle="fkchildtitle" ;
            /**K11自营**/
            public static final String fkself="fkself" ;
            /**K11非自营**/
            public static final String fknotself="fknotself" ;
            /**K11流量子标题**/
            public static final String fkflowchildtitle="fkflowchildtitle" ;
            /**K11自营吨数**/
            public static final String fkselfweight="fkselfweight" ;
            /**K11自营交易额**/
            public static final String fkselftradeamount="fkselftradeamount" ;
            /**K11非自营吨数**/
            public static final String fkselftradeweight="fkselftradeweight" ;
            /**K11非自营交易额**/
            public static final String fknotselftradeamount="fknotselftradeamount" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**最新交易日偏离值自营**/
            public static  Path<Double> fnewtradedayself(Root<?> root){return root.get("fnewtradedayself");}
            /**最新交易日偏离值非自营**/
            public static  Path<Double> fnewtradedaynotself(Root<?> root){return root.get("fnewtradedaynotself");}
            /**最新交易流量自营吨数**/
            public static  Path<Double> fnewtradeflowselfweight(Root<?> root){return root.get("fnewtradeflowselfweight");}
            /**最新交易流量自营交易额**/
            public static  Path<Double> fnewtradeflowselfamount(Root<?> root){return root.get("fnewtradeflowselfamount");}
            /**最新交易流量非自营吨数**/
            public static  Path<Double> fnewtradeflownotselfweight(Root<?> root){return root.get("fnewtradeflownotselfweight");}
            /**最新交易流量非自营交易额**/
            public static  Path<Double> fnewtradeflownotselfamount(Root<?> root){return root.get("fnewtradeflownotselfamount");}
            /**K11大标题**/
            public static  Path<String> fkttitle(Root<?> root){return root.get("fkttitle");}
            /**K11偏离值子标题**/
            public static  Path<String> fkchildtitle(Root<?> root){return root.get("fkchildtitle");}
            /**K11自营**/
            public static  Path<Double> fkself(Root<?> root){return root.get("fkself");}
            /**K11非自营**/
            public static  Path<Double> fknotself(Root<?> root){return root.get("fknotself");}
            /**K11流量子标题**/
            public static  Path<String> fkflowchildtitle(Root<?> root){return root.get("fkflowchildtitle");}
            /**K11自营吨数**/
            public static  Path<Double> fkselfweight(Root<?> root){return root.get("fkselfweight");}
            /**K11自营交易额**/
            public static  Path<Double> fkselftradeamount(Root<?> root){return root.get("fkselftradeamount");}
            /**K11非自营吨数**/
            public static  Path<Double> fkselftradeweight(Root<?> root){return root.get("fkselftradeweight");}
            /**K11非自营交易额**/
            public static  Path<Double> fknotselftradeamount(Root<?> root){return root.get("fknotselftradeamount");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**群组持仓信息**/
//public static final String xm_groupposition="xm_groupposition" ;
public static class xm_groupposition {
public static XSpec<com.frogsing.project.po.Groupposition> xspec() {
    return new XSpec<com.frogsing.project.po.Groupposition>(com.frogsing.project.po.Groupposition.class);
    }
    public static final String tablename="xm_groupposition";
            /**群ID**/
            public static final String igroupid="igroupid" ;
            /**持仓信息**/
            public static final String sposition="sposition" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**群ID**/
            public static  Path<Integer> igroupid(Root<?> root){return root.get("igroupid");}
            /**持仓信息**/
            public static  Path<String> sposition(Root<?> root){return root.get("sposition");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**常用指令表**/
//public static final String xm_quicklycommand="xm_quicklycommand" ;
public static class xm_quicklycommand {
public static XSpec<com.frogsing.project.po.Quicklycommand> xspec() {
    return new XSpec<com.frogsing.project.po.Quicklycommand>(com.frogsing.project.po.Quicklycommand.class);
    }
    public static final String tablename="xm_quicklycommand";
            /**指令简称**/
            public static final String sshorname="sshorname" ;
            /**指令内容**/
            public static final String scontent="scontent" ;
            /**是否有效**/
            public static final String ienable="ienable" ;
            /**排序**/
            public static final String isort="isort" ;
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
            /**指令简称**/
            public static  Path<String> sshorname(Root<?> root){return root.get("sshorname");}
            /**指令内容**/
            public static  Path<String> scontent(Root<?> root){return root.get("scontent");}
            /**是否有效**/
            public static  Path<Long> ienable(Root<?> root){return root.get("ienable");}
            /**排序**/
            public static  Path<Long> isort(Root<?> root){return root.get("isort");}
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

    }
