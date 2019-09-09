    package  com.frogsing.file.utils;
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class FILECol {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
/**文件字典表**/
//public static final String wj_filedirection="wj_filedirection" ;
public static class wj_filedirection {
public static XSpec<com.frogsing.file.po.FileDirection> xspec() {
    return new XSpec<com.frogsing.file.po.FileDirection>(com.frogsing.file.po.FileDirection.class);
    }
    public static final String tablename="wj_filedirection";
            /**单据ID**/
            public static final String sbillid="sbillid" ;
            /**序号**/
            public static final String isort="isort" ;
            /**文件路径**/
            public static final String sfilepath="sfilepath" ;
            /**文件名**/
            public static final String sfilename="sfilename" ;
            /**是否默认**/
            public static final String bisdefault="bisdefault" ;
            /**是否已使用**/
            public static final String bisused="bisused" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**单据ID**/
            public static  Path<String> sbillid(Root<?> root){return root.get("sbillid");}
            /**序号**/
            public static  Path<Integer> isort(Root<?> root){return root.get("isort");}
            /**文件路径**/
            public static  Path<String> sfilepath(Root<?> root){return root.get("sfilepath");}
            /**文件名**/
            public static  Path<String> sfilename(Root<?> root){return root.get("sfilename");}
            /**是否默认**/
            public static  Path<Integer> bisdefault(Root<?> root){return root.get("bisdefault");}
            /**是否已使用**/
            public static  Path<Integer> bisused(Root<?> root){return root.get("bisused");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}

    }
/**文件存储表**/
//public static final String wj_filestore="wj_filestore" ;
public static class wj_filestore {
public static XSpec<com.frogsing.file.po.FileStore> xspec() {
    return new XSpec<com.frogsing.file.po.FileStore>(com.frogsing.file.po.FileStore.class);
    }
    public static final String tablename="wj_filestore";
            /**文件名**/
            public static final String sfilename="sfilename" ;
            /**文件类型**/
            public static final String ifiletype="ifiletype" ;
            /**文件内容**/
            public static final String gfilecontent="gfilecontent" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**文件名**/
            public static  Path<String> sfilename(Root<?> root){return root.get("sfilename");}
            /**文件类型**/
            public static  Path<Integer> ifiletype(Root<?> root){return root.get("ifiletype");}
            /**文件内容**/
            public static  Path<byte[]> gfilecontent(Root<?> root){return root.get("gfilecontent");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}

    }
/**系统文件表**/
//public static final String cs_sysfile="cs_sysfile" ;
public static class cs_sysfile {
public static XSpec<com.frogsing.file.po.SysFile> xspec() {
    return new XSpec<com.frogsing.file.po.SysFile>(com.frogsing.file.po.SysFile.class);
    }
    public static final String tablename="cs_sysfile";
            /**编号**/
            public static final String scode="scode" ;
            /**系统文件**/
            public static final String isysfiletype="isysfiletype" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**修改时间**/
            public static final String dmoddate="dmoddate" ;
            /**修改人**/
            public static final String smodsuserid="smodsuserid" ;
            /**备注**/
            public static final String sreamrk="sreamrk" ;
            /**文件地址**/
            public static final String surl="surl" ;
            /**文件名称**/
            public static final String sfilename="sfilename" ;
            /**编号**/
            public static  Path<String> scode(Root<?> root){return root.get("scode");}
            /**系统文件**/
            public static  Path<Integer> isysfiletype(Root<?> root){return root.get("isysfiletype");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**修改时间**/
            public static  Path<Date> dmoddate(Root<?> root){return root.get("dmoddate");}
            /**修改人**/
            public static  Path<String> smodsuserid(Root<?> root){return root.get("smodsuserid");}
            /**备注**/
            public static  Path<String> sreamrk(Root<?> root){return root.get("sreamrk");}
            /**文件地址**/
            public static  Path<String> surl(Root<?> root){return root.get("surl");}
            /**文件名称**/
            public static  Path<String> sfilename(Root<?> root){return root.get("sfilename");}

    }

    }
