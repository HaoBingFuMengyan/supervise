    package  com.frogsing.message.utils;
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class MESSAGECol {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
/**站内信明细表**/
//public static final String cx_messagedetail="cx_messagedetail" ;
public static class cx_messagedetail {
public static XSpec<com.frogsing.message.po.MessageDetail> xspec() {
    return new XSpec<com.frogsing.message.po.MessageDetail>(com.frogsing.message.po.MessageDetail.class);
    }
    public static final String tablename="cx_messagedetail";
            /**发送人ID**/
            public static final String ssenderid="ssenderid" ;
            /**发送人类型**/
            public static final String isendertype="isendertype" ;
            /**接收人ID**/
            public static final String sreceiveid="sreceiveid" ;
            /**接收人类型**/
            public static final String ireceivetype="ireceivetype" ;
            /**是否已读**/
            public static final String bisread="bisread" ;
            /**发送时间**/
            public static final String dsenddatetime="dsenddatetime" ;
            /**标题**/
            public static final String stitle="stitle" ;
            /**内容**/
            public static final String scontext="scontext" ;
            /**阅读次数**/
            public static final String icount="icount" ;
            /**是否删除**/
            public static final String bisdelete="bisdelete" ;
            /**是否已发送**/
            public static final String bissendok="bissendok" ;
            /**MessageID**/
            public static final String smessageid="smessageid" ;
            /**回复ID**/
            public static final String sreplyid="sreplyid" ;
            /**发送人ID**/
            public static  Path<String> ssenderid(Root<?> root){return root.get("ssenderid");}
            /**发送人类型**/
            public static  Path<Integer> isendertype(Root<?> root){return root.get("isendertype");}
            /**接收人ID**/
            public static  Path<String> sreceiveid(Root<?> root){return root.get("sreceiveid");}
            /**接收人类型**/
            public static  Path<Integer> ireceivetype(Root<?> root){return root.get("ireceivetype");}
            /**是否已读**/
            public static  Path<Integer> bisread(Root<?> root){return root.get("bisread");}
            /**发送时间**/
            public static  Path<Date> dsenddatetime(Root<?> root){return root.get("dsenddatetime");}
            /**标题**/
            public static  Path<String> stitle(Root<?> root){return root.get("stitle");}
            /**内容**/
            public static  Path<String> scontext(Root<?> root){return root.get("scontext");}
            /**阅读次数**/
            public static  Path<Integer> icount(Root<?> root){return root.get("icount");}
            /**是否删除**/
            public static  Path<Integer> bisdelete(Root<?> root){return root.get("bisdelete");}
            /**是否已发送**/
            public static  Path<Integer> bissendok(Root<?> root){return root.get("bissendok");}
            /**MessageID**/
            public static  Path<String> smessageid(Root<?> root){return root.get("smessageid");}
            /**回复ID**/
            public static  Path<String> sreplyid(Root<?> root){return root.get("sreplyid");}

    }
/**站内信表**/
//public static final String cx_message="cx_message" ;
public static class cx_message {
public static XSpec<com.frogsing.message.po.Message> xspec() {
    return new XSpec<com.frogsing.message.po.Message>(com.frogsing.message.po.Message.class);
    }
    public static final String tablename="cx_message";
            /**发送人ID**/
            public static final String ssenderid="ssenderid" ;
            /**发送人类型**/
            public static final String isendertype="isendertype" ;
            /**接收人ID**/
            public static final String sreceiveid="sreceiveid" ;
            /**接收人类型**/
            public static final String ireceivetype="ireceivetype" ;
            /**发送时间**/
            public static final String dsenddatetime="dsenddatetime" ;
            /**发送人ID**/
            public static  Path<String> ssenderid(Root<?> root){return root.get("ssenderid");}
            /**发送人类型**/
            public static  Path<Integer> isendertype(Root<?> root){return root.get("isendertype");}
            /**接收人ID**/
            public static  Path<String> sreceiveid(Root<?> root){return root.get("sreceiveid");}
            /**接收人类型**/
            public static  Path<Integer> ireceivetype(Root<?> root){return root.get("ireceivetype");}
            /**发送时间**/
            public static  Path<Date> dsenddatetime(Root<?> root){return root.get("dsenddatetime");}

    }

    }
