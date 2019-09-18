    package  com.frogsing.member.utils;
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class MEMBERCol {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
/**交易用户**/
//public static final String hy_user="hy_user" ;
public static class hy_user {
public static XSpec<com.frogsing.member.po.User> xspec() {
    return new XSpec<com.frogsing.member.po.User>(com.frogsing.member.po.User.class);
    }
    public static final String tablename="hy_user";
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**交易员编号**/
            public static final String soperatorno="soperatorno" ;
            /**用户名**/
            public static final String susername="susername" ;
            /**用户密码**/
            public static final String spassword="spassword" ;
            /**交易密码**/
            public static final String stradepassword="stradepassword" ;
            /**昵称**/
            public static final String slikename="slikename" ;
            /**姓名**/
            public static final String sname="sname" ;
            /**性别**/
            public static final String isex="isex" ;
            /**电话**/
            public static final String sphone="sphone" ;
            /**传真**/
            public static final String sfax="sfax" ;
            /**手机**/
            public static final String smobile="smobile" ;
            /**Email**/
            public static final String semail="semail" ;
            /**手机号是否已验证**/
            public static final String bisymobile="bisymobile" ;
            /**Email是否已验证**/
            public static final String bisyemail="bisyemail" ;
            /**QQ**/
            public static final String sqq="sqq" ;
            /**Msn**/
            public static final String smsn="smsn" ;
            /**是否有效**/
            public static final String bisvalid="bisvalid" ;
            /**是否管理员**/
            public static final String bisadmin="bisadmin" ;
            /**是否删除**/
            public static final String bisdelete="bisdelete" ;
            /**当天密码错误次数**/
            public static final String ierrorcount="ierrorcount" ;
            /**上次登陆时间**/
            public static final String dlastlogintime="dlastlogintime" ;
            /**最后登陆时间**/
            public static final String dendlogintime="dendlogintime" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**添加人Name**/
            public static final String saddopertaorname="saddopertaorname" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**最后登录成功日期**/
            public static final String dlastloginsuccessdate="dlastloginsuccessdate" ;
            /**最后登录APP终端**/
            public static final String ilastterminaltype="ilastterminaltype" ;
            /**终端ID**/
            public static final String slastterminalid="slastterminalid" ;
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**交易员编号**/
            public static  Path<String> soperatorno(Root<?> root){return root.get("soperatorno");}
            /**用户名**/
            public static  Path<String> susername(Root<?> root){return root.get("susername");}
            /**用户密码**/
            public static  Path<String> spassword(Root<?> root){return root.get("spassword");}
            /**交易密码**/
            public static  Path<String> stradepassword(Root<?> root){return root.get("stradepassword");}
            /**昵称**/
            public static  Path<String> slikename(Root<?> root){return root.get("slikename");}
            /**姓名**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**性别**/
            public static  Path<Integer> isex(Root<?> root){return root.get("isex");}
            /**电话**/
            public static  Path<String> sphone(Root<?> root){return root.get("sphone");}
            /**传真**/
            public static  Path<String> sfax(Root<?> root){return root.get("sfax");}
            /**手机**/
            public static  Path<String> smobile(Root<?> root){return root.get("smobile");}
            /**Email**/
            public static  Path<String> semail(Root<?> root){return root.get("semail");}
            /**手机号是否已验证**/
            public static  Path<Integer> bisymobile(Root<?> root){return root.get("bisymobile");}
            /**Email是否已验证**/
            public static  Path<Integer> bisyemail(Root<?> root){return root.get("bisyemail");}
            /**QQ**/
            public static  Path<String> sqq(Root<?> root){return root.get("sqq");}
            /**Msn**/
            public static  Path<String> smsn(Root<?> root){return root.get("smsn");}
            /**是否有效**/
            public static  Path<Integer> bisvalid(Root<?> root){return root.get("bisvalid");}
            /**是否管理员**/
            public static  Path<Integer> bisadmin(Root<?> root){return root.get("bisadmin");}
            /**是否删除**/
            public static  Path<Integer> bisdelete(Root<?> root){return root.get("bisdelete");}
            /**当天密码错误次数**/
            public static  Path<Integer> ierrorcount(Root<?> root){return root.get("ierrorcount");}
            /**上次登陆时间**/
            public static  Path<Date> dlastlogintime(Root<?> root){return root.get("dlastlogintime");}
            /**最后登陆时间**/
            public static  Path<Date> dendlogintime(Root<?> root){return root.get("dendlogintime");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**添加人Name**/
            public static  Path<String> saddopertaorname(Root<?> root){return root.get("saddopertaorname");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}
            /**最后登录成功日期**/
            public static  Path<Date> dlastloginsuccessdate(Root<?> root){return root.get("dlastloginsuccessdate");}
            /**最后登录APP终端**/
            public static  Path<Integer> ilastterminaltype(Root<?> root){return root.get("ilastterminaltype");}
            /**终端ID**/
            public static  Path<String> slastterminalid(Root<?> root){return root.get("slastterminalid");}

    }
/**会员角色表**/
//public static final String hy_actor="hy_actor" ;
public static class hy_actor {
public static XSpec<com.frogsing.member.po.Actor> xspec() {
    return new XSpec<com.frogsing.member.po.Actor>(com.frogsing.member.po.Actor.class);
    }
    public static final String tablename="hy_actor";
            /**角色编号**/
            public static final String srolecode="srolecode" ;
            /**角色名称**/
            public static final String srolename="srolename" ;
            /**角色类型**/
            public static final String iroletype="iroletype" ;
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**操作员**/
            public static final String suserid="suserid" ;
            /**创建日期**/
            public static final String dinputdate="dinputdate" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**排序号**/
            public static final String isortno="isortno" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**是否系统角色**/
            public static final String bissystem="bissystem" ;
            /**认证类型**/
            public static final String imemberstatus="imemberstatus" ;
            /**是否特殊**/
            public static final String bisspecial="bisspecial" ;
            /**特殊角色id**/
            public static final String sspecialroleid="sspecialroleid" ;
            /**角色编号**/
            public static  Path<String> srolecode(Root<?> root){return root.get("srolecode");}
            /**角色名称**/
            public static  Path<String> srolename(Root<?> root){return root.get("srolename");}
            /**角色类型**/
            public static  Path<Integer> iroletype(Root<?> root){return root.get("iroletype");}
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**操作员**/
            public static  Path<String> suserid(Root<?> root){return root.get("suserid");}
            /**创建日期**/
            public static  Path<Date> dinputdate(Root<?> root){return root.get("dinputdate");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**排序号**/
            public static  Path<Integer> isortno(Root<?> root){return root.get("isortno");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}
            /**是否系统角色**/
            public static  Path<Integer> bissystem(Root<?> root){return root.get("bissystem");}
            /**认证类型**/
            public static  Path<Integer> imemberstatus(Root<?> root){return root.get("imemberstatus");}
            /**是否特殊**/
            public static  Path<Integer> bisspecial(Root<?> root){return root.get("bisspecial");}
            /**特殊角色id**/
            public static  Path<String> sspecialroleid(Root<?> root){return root.get("sspecialroleid");}

    }
/**交易员角色表**/
//public static final String hy_useractor="hy_useractor" ;
public static class hy_useractor {
public static XSpec<com.frogsing.member.po.UserActor> xspec() {
    return new XSpec<com.frogsing.member.po.UserActor>(com.frogsing.member.po.UserActor.class);
    }
    public static final String tablename="hy_useractor";
            /**交易员**/
            public static final String suserid="suserid" ;
            /**角色**/
            public static final String sroleid="sroleid" ;
            /**交易员**/
            public static  Path<String> suserid(Root<?> root){return root.get("suserid");}
            /**角色**/
            public static  Path<String> sroleid(Root<?> root){return root.get("sroleid");}

    }
/**会员权限码管理**/
//public static final String hy_right="hy_right" ;
public static class hy_right {
public static XSpec<com.frogsing.member.po.Right> xspec() {
    return new XSpec<com.frogsing.member.po.Right>(com.frogsing.member.po.Right.class);
    }
    public static final String tablename="hy_right";
            /**权限编号**/
            public static final String spurno="spurno" ;
            /**权限码**/
            public static final String spurcode="spurcode" ;
            /**权限名称**/
            public static final String spurname="spurname" ;
            /**权限类型**/
            public static final String ipurtype="ipurtype" ;
            /**是否父节点**/
            public static final String bisroot="bisroot" ;
            /**是否叶子节点**/
            public static final String bisleaf="bisleaf" ;
            /**父权限**/
            public static final String sparentid="sparentid" ;
            /**访问路径**/
            public static final String surlpath="surlpath" ;
            /**权限说明**/
            public static final String sdescription="sdescription" ;
            /**简拼名**/
            public static final String sjpname="sjpname" ;
            /**全拼名**/
            public static final String spyname="spyname" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**权限编号**/
            public static  Path<String> spurno(Root<?> root){return root.get("spurno");}
            /**权限码**/
            public static  Path<String> spurcode(Root<?> root){return root.get("spurcode");}
            /**权限名称**/
            public static  Path<String> spurname(Root<?> root){return root.get("spurname");}
            /**权限类型**/
            public static  Path<Integer> ipurtype(Root<?> root){return root.get("ipurtype");}
            /**是否父节点**/
            public static  Path<Integer> bisroot(Root<?> root){return root.get("bisroot");}
            /**是否叶子节点**/
            public static  Path<Integer> bisleaf(Root<?> root){return root.get("bisleaf");}
            /**父权限**/
            public static  Path<String> sparentid(Root<?> root){return root.get("sparentid");}
            /**访问路径**/
            public static  Path<String> surlpath(Root<?> root){return root.get("surlpath");}
            /**权限说明**/
            public static  Path<String> sdescription(Root<?> root){return root.get("sdescription");}
            /**简拼名**/
            public static  Path<String> sjpname(Root<?> root){return root.get("sjpname");}
            /**全拼名**/
            public static  Path<String> spyname(Root<?> root){return root.get("spyname");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}

    }
/**角色权限表**/
//public static final String hy_actorright="hy_actorright" ;
public static class hy_actorright {
public static XSpec<com.frogsing.member.po.ActorRight> xspec() {
    return new XSpec<com.frogsing.member.po.ActorRight>(com.frogsing.member.po.ActorRight.class);
    }
    public static final String tablename="hy_actorright";
            /**角色ID**/
            public static final String sroleid="sroleid" ;
            /**权限码ID**/
            public static final String spurviewid="spurviewid" ;
            /**角色ID**/
            public static  Path<String> sroleid(Root<?> root){return root.get("sroleid");}
            /**权限码ID**/
            public static  Path<String> spurviewid(Root<?> root){return root.get("spurviewid");}

    }
/**交易员登录退出日志**/
//public static final String hy_memberloginlog="hy_memberloginlog" ;
public static class hy_memberloginlog {
public static XSpec<com.frogsing.member.po.MemberLoginLog> xspec() {
    return new XSpec<com.frogsing.member.po.MemberLoginLog>(com.frogsing.member.po.MemberLoginLog.class);
    }
    public static final String tablename="hy_memberloginlog";
            /**交易员ID**/
            public static final String suserid="suserid" ;
            /**用户名**/
            public static final String susername="susername" ;
            /**客户端IP**/
            public static final String sip="sip" ;
            /**登录时间**/
            public static final String dlogintime="dlogintime" ;
            /**退出时间**/
            public static final String dlogouttime="dlogouttime" ;
            /**交易员ID**/
            public static  Path<String> suserid(Root<?> root){return root.get("suserid");}
            /**用户名**/
            public static  Path<String> susername(Root<?> root){return root.get("susername");}
            /**客户端IP**/
            public static  Path<String> sip(Root<?> root){return root.get("sip");}
            /**登录时间**/
            public static  Path<Date> dlogintime(Root<?> root){return root.get("dlogintime");}
            /**退出时间**/
            public static  Path<Date> dlogouttime(Root<?> root){return root.get("dlogouttime");}

    }
/**会员相关图片**/
//public static final String hy_memberimage="hy_memberimage" ;
public static class hy_memberimage {
public static XSpec<com.frogsing.member.po.MemberImage> xspec() {
    return new XSpec<com.frogsing.member.po.MemberImage>(com.frogsing.member.po.MemberImage.class);
    }
    public static final String tablename="hy_memberimage";
            /**图片编号**/
            public static final String simageno="simageno" ;
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**图片名称**/
            public static final String simagename="simagename" ;
            /**类型**/
            public static final String iimagetype="iimagetype" ;
            /**图片地址**/
            public static final String saddress="saddress" ;
            /**上传人**/
            public static final String suserid="suserid" ;
            /**上传时间**/
            public static final String daddtime="daddtime" ;
            /**图片编号**/
            public static  Path<String> simageno(Root<?> root){return root.get("simageno");}
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**图片名称**/
            public static  Path<String> simagename(Root<?> root){return root.get("simagename");}
            /**类型**/
            public static  Path<Integer> iimagetype(Root<?> root){return root.get("iimagetype");}
            /**图片地址**/
            public static  Path<String> saddress(Root<?> root){return root.get("saddress");}
            /**上传人**/
            public static  Path<String> suserid(Root<?> root){return root.get("suserid");}
            /**上传时间**/
            public static  Path<Date> daddtime(Root<?> root){return root.get("daddtime");}

    }
/**交易员单点登录表**/
//public static final String hy_singlepointlogin="hy_singlepointlogin" ;
public static class hy_singlepointlogin {
public static XSpec<com.frogsing.member.po.Singlepointlogin> xspec() {
    return new XSpec<com.frogsing.member.po.Singlepointlogin>(com.frogsing.member.po.Singlepointlogin.class);
    }
    public static final String tablename="hy_singlepointlogin";
            /**登录秘钥**/
            public static final String skey="skey" ;
            /**用户名**/
            public static final String susername="susername" ;
            /**有效截止日期**/
            public static final String dvalidtime="dvalidtime" ;
            /**新增时间**/
            public static final String daddtime="daddtime" ;
            /**登录秘钥**/
            public static  Path<String> skey(Root<?> root){return root.get("skey");}
            /**用户名**/
            public static  Path<String> susername(Root<?> root){return root.get("susername");}
            /**有效截止日期**/
            public static  Path<Date> dvalidtime(Root<?> root){return root.get("dvalidtime");}
            /**新增时间**/
            public static  Path<Date> daddtime(Root<?> root){return root.get("daddtime");}

    }
/**会员信息表**/
//public static final String hy_member="hy_member" ;
public static class hy_member {
public static XSpec<com.frogsing.member.po.Member> xspec() {
    return new XSpec<com.frogsing.member.po.Member>(com.frogsing.member.po.Member.class);
    }
    public static final String tablename="hy_member";
            /**企业编号**/
            public static final String smemberno="smemberno" ;
            /**企业名称**/
            public static final String scnname="scnname" ;
            /**英文名称**/
            public static final String senname="senname" ;
            /**中文简称**/
            public static final String sshortname="sshortname" ;
            /**客户来源类型**/
            public static final String iregsource="iregsource" ;
            /**客户来源编码**/
            public static final String sagentid="sagentid" ;
            /**信用值**/
            public static final String icredit="icredit" ;
            /**公司类型**/
            public static final String icompanytype="icompanytype" ;
            /**会员类型**/
            public static final String imembertype="imembertype" ;
            /**经营模式**/
            public static final String sbusinessmode="sbusinessmode" ;
            /**企业性质**/
            public static final String smemberkind="smemberkind" ;
            /**工商执照号**/
            public static final String sbusinessno="sbusinessno" ;
            /**组织机构代码**/
            public static final String sorgcode="sorgcode" ;
            /**执行董事证件号**/
            public static final String slegalpersoncode="slegalpersoncode" ;
            /**税务登记号**/
            public static final String staxno="staxno" ;
            /**执行董事**/
            public static final String slegalperson="slegalperson" ;
            /**员工人数**/
            public static final String iemployeeamount="iemployeeamount" ;
            /**国家**/
            public static final String scountry="scountry" ;
            /**地区区号**/
            public static final String sareaid="sareaid" ;
            /**省份**/
            public static final String sprovince="sprovince" ;
            /**城市**/
            public static final String scity="scity" ;
            /**区县**/
            public static final String sregion="sregion" ;
            /**注册资金货币种类**/
            public static final String sregmoneytype="sregmoneytype" ;
            /**注册资金**/
            public static final String iregmoney="iregmoney" ;
            /**开户银行**/
            public static final String sopenbank="sopenbank" ;
            /**开户名称**/
            public static final String sopenname="sopenname" ;
            /**开户账号**/
            public static final String sopenaccount="sopenaccount" ;
            /**结算银行**/
            public static final String sbalancebank="sbalancebank" ;
            /**联行号**/
            public static final String sunionaccount="sunionaccount" ;
            /**结算户名**/
            public static final String sbalancename="sbalancename" ;
            /**传真**/
            public static final String sfax="sfax" ;
            /**结算行帐号**/
            public static final String sbalanceaccount="sbalanceaccount" ;
            /**是否使用CA**/
            public static final String bcaflag="bcaflag" ;
            /**主营行业大类**/
            public static final String sbusbigtype="sbusbigtype" ;
            /**主营行业小类**/
            public static final String sbussmalltype="sbussmalltype" ;
            /**主营小类名称**/
            public static final String sbussmallname="sbussmallname" ;
            /**注册地址**/
            public static final String sregaddress="sregaddress" ;
            /**经营地址**/
            public static final String sbusaddress="sbusaddress" ;
            /**联系人**/
            public static final String slinkman="slinkman" ;
            /**邮编**/
            public static final String szipcode="szipcode" ;
            /**电话**/
            public static final String sphone="sphone" ;
            /**手机**/
            public static final String smobile="smobile" ;
            /**Email**/
            public static final String semail="semail" ;
            /**公司简介**/
            public static final String scompanydesc="scompanydesc" ;
            /**有效期**/
            public static final String dvaliddate="dvaliddate" ;
            /**状态**/
            public static final String imemberstatus="imemberstatus" ;
            /**服务范围**/
            public static final String iscope="iscope" ;
            /**申请日期**/
            public static final String dapplydate="dapplydate" ;
            /**审核人**/
            public static final String scheckuserid="scheckuserid" ;
            /**审核日期**/
            public static final String dcheckdate="dcheckdate" ;
            /**审核意见**/
            public static final String scheckinfo="scheckinfo" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**是否删除**/
            public static final String bdelete="bdelete" ;
            /**会员LOGO**/
            public static final String slogo="slogo" ;
            /**网站**/
            public static final String sweburl="sweburl" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**添加人**/
            public static final String sadduser="sadduser" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**简称简拼名**/
            public static final String sshortnamejpname="sshortnamejpname" ;
            /**简称全拼名**/
            public static final String sshortnamepyname="sshortnamepyname" ;
            /**简拼名**/
            public static final String sjpname="sjpname" ;
            /**最大交易员数**/
            public static final String imaxoperator="imaxoperator" ;
            /**全拼名**/
            public static final String spyname="spyname" ;
            /**认证类型**/
            public static final String iauthtype="iauthtype" ;
            /**排序号**/
            public static final String isort="isort" ;
            /**地理位置**/
            public static final String slocation="slocation" ;
            /**是否已开通店铺**/
            public static final String bisopenshop="bisopenshop" ;
            /**是否三码合一**/
            public static final String biscardmerged="biscardmerged" ;
            /**统一社会信息用代码**/
            public static final String ssocialcreditno="ssocialcreditno" ;
            /**是否通过企业认证**/
            public static final String bismembercert="bismembercert" ;
            /**是否上上签会员**/
            public static final String bisbestsign="bisbestsign" ;
            /**上上签账号**/
            public static final String ssignaccount="ssignaccount" ;
            /**执行董事证件类型**/
            public static final String ilegaltype="ilegaltype" ;
            /**执行董事是否兼职**/
            public static final String bisjoblegal="bisjoblegal" ;
            /**公司经理姓名**/
            public static final String smanagername="smanagername" ;
            /**公司经理证件号**/
            public static final String smanagerno="smanagerno" ;
            /**公司经理证件类型**/
            public static final String imanagertype="imanagertype" ;
            /**公司经理是否兼职**/
            public static final String bisjobmanager="bisjobmanager" ;
            /**法定代表人**/
            public static final String icorporatetype="icorporatetype" ;
            /**是否初始化**/
            public static final String bisinit="bisinit" ;
            /**企业编号**/
            public static  Path<String> smemberno(Root<?> root){return root.get("smemberno");}
            /**企业名称**/
            public static  Path<String> scnname(Root<?> root){return root.get("scnname");}
            /**英文名称**/
            public static  Path<String> senname(Root<?> root){return root.get("senname");}
            /**中文简称**/
            public static  Path<String> sshortname(Root<?> root){return root.get("sshortname");}
            /**客户来源类型**/
            public static  Path<Integer> iregsource(Root<?> root){return root.get("iregsource");}
            /**客户来源编码**/
            public static  Path<String> sagentid(Root<?> root){return root.get("sagentid");}
            /**信用值**/
            public static  Path<Integer> icredit(Root<?> root){return root.get("icredit");}
            /**公司类型**/
            public static  Path<Integer> icompanytype(Root<?> root){return root.get("icompanytype");}
            /**会员类型**/
            public static  Path<Integer> imembertype(Root<?> root){return root.get("imembertype");}
            /**经营模式**/
            public static  Path<String> sbusinessmode(Root<?> root){return root.get("sbusinessmode");}
            /**企业性质**/
            public static  Path<String> smemberkind(Root<?> root){return root.get("smemberkind");}
            /**工商执照号**/
            public static  Path<String> sbusinessno(Root<?> root){return root.get("sbusinessno");}
            /**组织机构代码**/
            public static  Path<String> sorgcode(Root<?> root){return root.get("sorgcode");}
            /**执行董事证件号**/
            public static  Path<String> slegalpersoncode(Root<?> root){return root.get("slegalpersoncode");}
            /**税务登记号**/
            public static  Path<String> staxno(Root<?> root){return root.get("staxno");}
            /**执行董事**/
            public static  Path<String> slegalperson(Root<?> root){return root.get("slegalperson");}
            /**员工人数**/
            public static  Path<Integer> iemployeeamount(Root<?> root){return root.get("iemployeeamount");}
            /**国家**/
            public static  Path<String> scountry(Root<?> root){return root.get("scountry");}
            /**地区区号**/
            public static  Path<String> sareaid(Root<?> root){return root.get("sareaid");}
            /**省份**/
            public static  Path<String> sprovince(Root<?> root){return root.get("sprovince");}
            /**城市**/
            public static  Path<String> scity(Root<?> root){return root.get("scity");}
            /**区县**/
            public static  Path<String> sregion(Root<?> root){return root.get("sregion");}
            /**注册资金货币种类**/
            public static  Path<String> sregmoneytype(Root<?> root){return root.get("sregmoneytype");}
            /**注册资金**/
            public static  Path<Integer> iregmoney(Root<?> root){return root.get("iregmoney");}
            /**开户银行**/
            public static  Path<String> sopenbank(Root<?> root){return root.get("sopenbank");}
            /**开户名称**/
            public static  Path<String> sopenname(Root<?> root){return root.get("sopenname");}
            /**开户账号**/
            public static  Path<String> sopenaccount(Root<?> root){return root.get("sopenaccount");}
            /**结算银行**/
            public static  Path<String> sbalancebank(Root<?> root){return root.get("sbalancebank");}
            /**联行号**/
            public static  Path<String> sunionaccount(Root<?> root){return root.get("sunionaccount");}
            /**结算户名**/
            public static  Path<String> sbalancename(Root<?> root){return root.get("sbalancename");}
            /**传真**/
            public static  Path<String> sfax(Root<?> root){return root.get("sfax");}
            /**结算行帐号**/
            public static  Path<String> sbalanceaccount(Root<?> root){return root.get("sbalanceaccount");}
            /**是否使用CA**/
            public static  Path<Integer> bcaflag(Root<?> root){return root.get("bcaflag");}
            /**主营行业大类**/
            public static  Path<String> sbusbigtype(Root<?> root){return root.get("sbusbigtype");}
            /**主营行业小类**/
            public static  Path<String> sbussmalltype(Root<?> root){return root.get("sbussmalltype");}
            /**主营小类名称**/
            public static  Path<String> sbussmallname(Root<?> root){return root.get("sbussmallname");}
            /**注册地址**/
            public static  Path<String> sregaddress(Root<?> root){return root.get("sregaddress");}
            /**经营地址**/
            public static  Path<String> sbusaddress(Root<?> root){return root.get("sbusaddress");}
            /**联系人**/
            public static  Path<String> slinkman(Root<?> root){return root.get("slinkman");}
            /**邮编**/
            public static  Path<String> szipcode(Root<?> root){return root.get("szipcode");}
            /**电话**/
            public static  Path<String> sphone(Root<?> root){return root.get("sphone");}
            /**手机**/
            public static  Path<String> smobile(Root<?> root){return root.get("smobile");}
            /**Email**/
            public static  Path<String> semail(Root<?> root){return root.get("semail");}
            /**公司简介**/
            public static  Path<String> scompanydesc(Root<?> root){return root.get("scompanydesc");}
            /**有效期**/
            public static  Path<Date> dvaliddate(Root<?> root){return root.get("dvaliddate");}
            /**状态**/
            public static  Path<Integer> imemberstatus(Root<?> root){return root.get("imemberstatus");}
            /**服务范围**/
            public static  Path<Integer> iscope(Root<?> root){return root.get("iscope");}
            /**申请日期**/
            public static  Path<Date> dapplydate(Root<?> root){return root.get("dapplydate");}
            /**审核人**/
            public static  Path<String> scheckuserid(Root<?> root){return root.get("scheckuserid");}
            /**审核日期**/
            public static  Path<Date> dcheckdate(Root<?> root){return root.get("dcheckdate");}
            /**审核意见**/
            public static  Path<String> scheckinfo(Root<?> root){return root.get("scheckinfo");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**是否删除**/
            public static  Path<Integer> bdelete(Root<?> root){return root.get("bdelete");}
            /**会员LOGO**/
            public static  Path<String> slogo(Root<?> root){return root.get("slogo");}
            /**网站**/
            public static  Path<String> sweburl(Root<?> root){return root.get("sweburl");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**添加人**/
            public static  Path<String> sadduser(Root<?> root){return root.get("sadduser");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}
            /**简称简拼名**/
            public static  Path<String> sshortnamejpname(Root<?> root){return root.get("sshortnamejpname");}
            /**简称全拼名**/
            public static  Path<String> sshortnamepyname(Root<?> root){return root.get("sshortnamepyname");}
            /**简拼名**/
            public static  Path<String> sjpname(Root<?> root){return root.get("sjpname");}
            /**最大交易员数**/
            public static  Path<Integer> imaxoperator(Root<?> root){return root.get("imaxoperator");}
            /**全拼名**/
            public static  Path<String> spyname(Root<?> root){return root.get("spyname");}
            /**认证类型**/
            public static  Path<Integer> iauthtype(Root<?> root){return root.get("iauthtype");}
            /**排序号**/
            public static  Path<Integer> isort(Root<?> root){return root.get("isort");}
            /**地理位置**/
            public static  Path<String> slocation(Root<?> root){return root.get("slocation");}
            /**是否已开通店铺**/
            public static  Path<Integer> bisopenshop(Root<?> root){return root.get("bisopenshop");}
            /**是否三码合一**/
            public static  Path<Integer> biscardmerged(Root<?> root){return root.get("biscardmerged");}
            /**统一社会信息用代码**/
            public static  Path<String> ssocialcreditno(Root<?> root){return root.get("ssocialcreditno");}
            /**是否通过企业认证**/
            public static  Path<Integer> bismembercert(Root<?> root){return root.get("bismembercert");}
            /**是否上上签会员**/
            public static  Path<Integer> bisbestsign(Root<?> root){return root.get("bisbestsign");}
            /**上上签账号**/
            public static  Path<String> ssignaccount(Root<?> root){return root.get("ssignaccount");}
            /**执行董事证件类型**/
            public static  Path<Integer> ilegaltype(Root<?> root){return root.get("ilegaltype");}
            /**执行董事是否兼职**/
            public static  Path<Integer> bisjoblegal(Root<?> root){return root.get("bisjoblegal");}
            /**公司经理姓名**/
            public static  Path<String> smanagername(Root<?> root){return root.get("smanagername");}
            /**公司经理证件号**/
            public static  Path<String> smanagerno(Root<?> root){return root.get("smanagerno");}
            /**公司经理证件类型**/
            public static  Path<Integer> imanagertype(Root<?> root){return root.get("imanagertype");}
            /**公司经理是否兼职**/
            public static  Path<Integer> bisjobmanager(Root<?> root){return root.get("bisjobmanager");}
            /**法定代表人**/
            public static  Path<Integer> icorporatetype(Root<?> root){return root.get("icorporatetype");}
            /**是否初始化**/
            public static  Path<Integer> bisinit(Root<?> root){return root.get("bisinit");}

    }
/**会员认证申请表**/
//public static final String hy_authapply="hy_authapply" ;
public static class hy_authapply {
public static XSpec<com.frogsing.member.po.Authapply> xspec() {
    return new XSpec<com.frogsing.member.po.Authapply>(com.frogsing.member.po.Authapply.class);
    }
    public static final String tablename="hy_authapply";
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**会员编号**/
            public static final String smemberno="smemberno" ;
            /**申请人**/
            public static final String sapplyuserid="sapplyuserid" ;
            /**企业名称**/
            public static final String scnname="scnname" ;
            /**英文名称**/
            public static final String senname="senname" ;
            /**中文简称**/
            public static final String sshortname="sshortname" ;
            /**信用值**/
            public static final String icredit="icredit" ;
            /**公司类型**/
            public static final String icompanytype="icompanytype" ;
            /**会员类型**/
            public static final String imembertype="imembertype" ;
            /**经营模式**/
            public static final String sbusinessmode="sbusinessmode" ;
            /**企业性质**/
            public static final String smemberkind="smemberkind" ;
            /**营业执照副本**/
            public static final String sbusinessno="sbusinessno" ;
            /**组织机构代码**/
            public static final String sorgcode="sorgcode" ;
            /**法人代表身份证号码**/
            public static final String slegalpersoncode="slegalpersoncode" ;
            /**开户银行**/
            public static final String sopenbank="sopenbank" ;
            /**开户名称**/
            public static final String sopenname="sopenname" ;
            /**开户账号**/
            public static final String sopenaccount="sopenaccount" ;
            /**联行号**/
            public static final String sunionaccount="sunionaccount" ;
            /**税务登记证副本**/
            public static final String staxno="staxno" ;
            /**法人**/
            public static final String slegalperson="slegalperson" ;
            /**员工人数**/
            public static final String iemployeeamount="iemployeeamount" ;
            /**国家**/
            public static final String scountry="scountry" ;
            /**地区区号**/
            public static final String sareaid="sareaid" ;
            /**省份**/
            public static final String sprovince="sprovince" ;
            /**城市**/
            public static final String scity="scity" ;
            /**区县**/
            public static final String sregion="sregion" ;
            /**注册资金货币种类**/
            public static final String sregmoneytype="sregmoneytype" ;
            /**注册资金**/
            public static final String iregmoney="iregmoney" ;
            /**传真**/
            public static final String sfax="sfax" ;
            /**主营行业大类**/
            public static final String sbusbigtype="sbusbigtype" ;
            /**主营行业小类**/
            public static final String sbussmalltype="sbussmalltype" ;
            /**主营小类名称**/
            public static final String sbussmallname="sbussmallname" ;
            /**注册地址**/
            public static final String sregaddress="sregaddress" ;
            /**经营地址**/
            public static final String sbusaddress="sbusaddress" ;
            /**联系人**/
            public static final String slinkman="slinkman" ;
            /**邮编**/
            public static final String szipcode="szipcode" ;
            /**电话**/
            public static final String sphone="sphone" ;
            /**手机**/
            public static final String smobile="smobile" ;
            /**Email**/
            public static final String semail="semail" ;
            /**公司简介**/
            public static final String scompanydesc="scompanydesc" ;
            /**状态**/
            public static final String istatus="istatus" ;
            /**申请日期**/
            public static final String dapplydate="dapplydate" ;
            /**审核人**/
            public static final String scheckuser="scheckuser" ;
            /**审核日期**/
            public static final String dcheckdate="dcheckdate" ;
            /**审核意见**/
            public static final String scheckinfo="scheckinfo" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**添加人**/
            public static final String sadduser="sadduser" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**简称简拼名**/
            public static final String sshortnamejpname="sshortnamejpname" ;
            /**简称全拼名**/
            public static final String sshortnamepyname="sshortnamepyname" ;
            /**简拼名**/
            public static final String sjpname="sjpname" ;
            /**全拼名**/
            public static final String spyname="spyname" ;
            /**申请认证类型**/
            public static final String iapplytype="iapplytype" ;
            /**认证类型**/
            public static final String iauthtype="iauthtype" ;
            /**身份证正面**/
            public static final String scardup="scardup" ;
            /**身份证反面**/
            public static final String scarddown="scarddown" ;
            /**当前可用积分**/
            public static final String iintegralavailable="iintegralavailable" ;
            /**总积分**/
            public static final String iintegralamount="iintegralamount" ;
            /**已兑换积分**/
            public static final String iintegralused="iintegralused" ;
            /**排序号**/
            public static final String isort="isort" ;
            /**地理位置**/
            public static final String slocation="slocation" ;
            /**是否营业**/
            public static final String bisstop="bisstop" ;
            /**是否自营**/
            public static final String bisselfsaler="bisselfsaler" ;
            /**是否三码合一**/
            public static final String biscardmerged="biscardmerged" ;
            /**是否三证合一**/
            public static final String bisone="bisone" ;
            /**统一社会信息用代码**/
            public static final String ssocialcreditno="ssocialcreditno" ;
            /**执行董事证件类型**/
            public static final String ilegaltype="ilegaltype" ;
            /**执行董事是否兼职**/
            public static final String bisjoblegal="bisjoblegal" ;
            /**公司经理姓名**/
            public static final String smanagername="smanagername" ;
            /**公司经理证件号**/
            public static final String smanagerno="smanagerno" ;
            /**公司经理证件类型**/
            public static final String imanagertype="imanagertype" ;
            /**公司经理是否兼职**/
            public static final String bisjobmanager="bisjobmanager" ;
            /**法定代表人**/
            public static final String icorporatetype="icorporatetype" ;
            /**企业业务类型**/
            public static final String icorbiztype="icorbiztype" ;
            /**变更状态**/
            public static final String iapprovalstatus="iapprovalstatus" ;
            /**风险监测报告结果**/
            public static final String sriskresult="sriskresult" ;
            /**风险监测报告内文**/
            public static final String srisktext="srisktext" ;
            /**承诺函**/
            public static final String scnuno="scnuno" ;
            /**关系人控制图**/
            public static final String sgxrtno="sgxrtno" ;
            /**法定/委派联系人**/
            public static final String sfdlinkman="sfdlinkman" ;
            /**法定/委派手机号**/
            public static final String sfdsmobile="sfdsmobile" ;
            /**法定/委派邮箱**/
            public static final String sfdemail="sfdemail" ;
            /**控制人联系人**/
            public static final String skzrlinkman="skzrlinkman" ;
            /**控制人手机**/
            public static final String skzrsmobile="skzrsmobile" ;
            /**控制人邮箱**/
            public static final String skzremail="skzremail" ;
            /**审批流**/
            public static final String iprocess="iprocess" ;
            /**是否入住企业**/
            public static final String bisincompany="bisincompany" ;
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**会员编号**/
            public static  Path<String> smemberno(Root<?> root){return root.get("smemberno");}
            /**申请人**/
            public static  Path<String> sapplyuserid(Root<?> root){return root.get("sapplyuserid");}
            /**企业名称**/
            public static  Path<String> scnname(Root<?> root){return root.get("scnname");}
            /**英文名称**/
            public static  Path<String> senname(Root<?> root){return root.get("senname");}
            /**中文简称**/
            public static  Path<String> sshortname(Root<?> root){return root.get("sshortname");}
            /**信用值**/
            public static  Path<Long> icredit(Root<?> root){return root.get("icredit");}
            /**公司类型**/
            public static  Path<Integer> icompanytype(Root<?> root){return root.get("icompanytype");}
            /**会员类型**/
            public static  Path<Integer> imembertype(Root<?> root){return root.get("imembertype");}
            /**经营模式**/
            public static  Path<String> sbusinessmode(Root<?> root){return root.get("sbusinessmode");}
            /**企业性质**/
            public static  Path<String> smemberkind(Root<?> root){return root.get("smemberkind");}
            /**营业执照副本**/
            public static  Path<String> sbusinessno(Root<?> root){return root.get("sbusinessno");}
            /**组织机构代码**/
            public static  Path<String> sorgcode(Root<?> root){return root.get("sorgcode");}
            /**法人代表身份证号码**/
            public static  Path<String> slegalpersoncode(Root<?> root){return root.get("slegalpersoncode");}
            /**开户银行**/
            public static  Path<String> sopenbank(Root<?> root){return root.get("sopenbank");}
            /**开户名称**/
            public static  Path<String> sopenname(Root<?> root){return root.get("sopenname");}
            /**开户账号**/
            public static  Path<String> sopenaccount(Root<?> root){return root.get("sopenaccount");}
            /**联行号**/
            public static  Path<String> sunionaccount(Root<?> root){return root.get("sunionaccount");}
            /**税务登记证副本**/
            public static  Path<String> staxno(Root<?> root){return root.get("staxno");}
            /**法人**/
            public static  Path<String> slegalperson(Root<?> root){return root.get("slegalperson");}
            /**员工人数**/
            public static  Path<Long> iemployeeamount(Root<?> root){return root.get("iemployeeamount");}
            /**国家**/
            public static  Path<String> scountry(Root<?> root){return root.get("scountry");}
            /**地区区号**/
            public static  Path<String> sareaid(Root<?> root){return root.get("sareaid");}
            /**省份**/
            public static  Path<String> sprovince(Root<?> root){return root.get("sprovince");}
            /**城市**/
            public static  Path<String> scity(Root<?> root){return root.get("scity");}
            /**区县**/
            public static  Path<String> sregion(Root<?> root){return root.get("sregion");}
            /**注册资金货币种类**/
            public static  Path<String> sregmoneytype(Root<?> root){return root.get("sregmoneytype");}
            /**注册资金**/
            public static  Path<Long> iregmoney(Root<?> root){return root.get("iregmoney");}
            /**传真**/
            public static  Path<String> sfax(Root<?> root){return root.get("sfax");}
            /**主营行业大类**/
            public static  Path<String> sbusbigtype(Root<?> root){return root.get("sbusbigtype");}
            /**主营行业小类**/
            public static  Path<String> sbussmalltype(Root<?> root){return root.get("sbussmalltype");}
            /**主营小类名称**/
            public static  Path<String> sbussmallname(Root<?> root){return root.get("sbussmallname");}
            /**注册地址**/
            public static  Path<String> sregaddress(Root<?> root){return root.get("sregaddress");}
            /**经营地址**/
            public static  Path<String> sbusaddress(Root<?> root){return root.get("sbusaddress");}
            /**联系人**/
            public static  Path<String> slinkman(Root<?> root){return root.get("slinkman");}
            /**邮编**/
            public static  Path<String> szipcode(Root<?> root){return root.get("szipcode");}
            /**电话**/
            public static  Path<String> sphone(Root<?> root){return root.get("sphone");}
            /**手机**/
            public static  Path<String> smobile(Root<?> root){return root.get("smobile");}
            /**Email**/
            public static  Path<String> semail(Root<?> root){return root.get("semail");}
            /**公司简介**/
            public static  Path<String> scompanydesc(Root<?> root){return root.get("scompanydesc");}
            /**状态**/
            public static  Path<Integer> istatus(Root<?> root){return root.get("istatus");}
            /**申请日期**/
            public static  Path<Date> dapplydate(Root<?> root){return root.get("dapplydate");}
            /**审核人**/
            public static  Path<String> scheckuser(Root<?> root){return root.get("scheckuser");}
            /**审核日期**/
            public static  Path<Date> dcheckdate(Root<?> root){return root.get("dcheckdate");}
            /**审核意见**/
            public static  Path<String> scheckinfo(Root<?> root){return root.get("scheckinfo");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**添加人**/
            public static  Path<String> sadduser(Root<?> root){return root.get("sadduser");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}
            /**简称简拼名**/
            public static  Path<String> sshortnamejpname(Root<?> root){return root.get("sshortnamejpname");}
            /**简称全拼名**/
            public static  Path<String> sshortnamepyname(Root<?> root){return root.get("sshortnamepyname");}
            /**简拼名**/
            public static  Path<String> sjpname(Root<?> root){return root.get("sjpname");}
            /**全拼名**/
            public static  Path<String> spyname(Root<?> root){return root.get("spyname");}
            /**申请认证类型**/
            public static  Path<Integer> iapplytype(Root<?> root){return root.get("iapplytype");}
            /**认证类型**/
            public static  Path<Integer> iauthtype(Root<?> root){return root.get("iauthtype");}
            /**身份证正面**/
            public static  Path<String> scardup(Root<?> root){return root.get("scardup");}
            /**身份证反面**/
            public static  Path<String> scarddown(Root<?> root){return root.get("scarddown");}
            /**当前可用积分**/
            public static  Path<Long> iintegralavailable(Root<?> root){return root.get("iintegralavailable");}
            /**总积分**/
            public static  Path<Long> iintegralamount(Root<?> root){return root.get("iintegralamount");}
            /**已兑换积分**/
            public static  Path<Long> iintegralused(Root<?> root){return root.get("iintegralused");}
            /**排序号**/
            public static  Path<Long> isort(Root<?> root){return root.get("isort");}
            /**地理位置**/
            public static  Path<String> slocation(Root<?> root){return root.get("slocation");}
            /**是否营业**/
            public static  Path<Integer> bisstop(Root<?> root){return root.get("bisstop");}
            /**是否自营**/
            public static  Path<Integer> bisselfsaler(Root<?> root){return root.get("bisselfsaler");}
            /**是否三码合一**/
            public static  Path<Integer> biscardmerged(Root<?> root){return root.get("biscardmerged");}
            /**是否三证合一**/
            public static  Path<Integer> bisone(Root<?> root){return root.get("bisone");}
            /**统一社会信息用代码**/
            public static  Path<String> ssocialcreditno(Root<?> root){return root.get("ssocialcreditno");}
            /**执行董事证件类型**/
            public static  Path<Integer> ilegaltype(Root<?> root){return root.get("ilegaltype");}
            /**执行董事是否兼职**/
            public static  Path<Integer> bisjoblegal(Root<?> root){return root.get("bisjoblegal");}
            /**公司经理姓名**/
            public static  Path<String> smanagername(Root<?> root){return root.get("smanagername");}
            /**公司经理证件号**/
            public static  Path<String> smanagerno(Root<?> root){return root.get("smanagerno");}
            /**公司经理证件类型**/
            public static  Path<Integer> imanagertype(Root<?> root){return root.get("imanagertype");}
            /**公司经理是否兼职**/
            public static  Path<Integer> bisjobmanager(Root<?> root){return root.get("bisjobmanager");}
            /**法定代表人**/
            public static  Path<Integer> icorporatetype(Root<?> root){return root.get("icorporatetype");}
            /**企业业务类型**/
            public static  Path<Integer> icorbiztype(Root<?> root){return root.get("icorbiztype");}
            /**变更状态**/
            public static  Path<Integer> iapprovalstatus(Root<?> root){return root.get("iapprovalstatus");}
            /**风险监测报告结果**/
            public static  Path<String> sriskresult(Root<?> root){return root.get("sriskresult");}
            /**风险监测报告内文**/
            public static  Path<String> srisktext(Root<?> root){return root.get("srisktext");}
            /**承诺函**/
            public static  Path<String> scnuno(Root<?> root){return root.get("scnuno");}
            /**关系人控制图**/
            public static  Path<String> sgxrtno(Root<?> root){return root.get("sgxrtno");}
            /**法定/委派联系人**/
            public static  Path<String> sfdlinkman(Root<?> root){return root.get("sfdlinkman");}
            /**法定/委派手机号**/
            public static  Path<String> sfdsmobile(Root<?> root){return root.get("sfdsmobile");}
            /**法定/委派邮箱**/
            public static  Path<String> sfdemail(Root<?> root){return root.get("sfdemail");}
            /**控制人联系人**/
            public static  Path<String> skzrlinkman(Root<?> root){return root.get("skzrlinkman");}
            /**控制人手机**/
            public static  Path<String> skzrsmobile(Root<?> root){return root.get("skzrsmobile");}
            /**控制人邮箱**/
            public static  Path<String> skzremail(Root<?> root){return root.get("skzremail");}
            /**审批流**/
            public static  Path<Integer> iprocess(Root<?> root){return root.get("iprocess");}
            /**是否入住企业**/
            public static  Path<Integer> bisincompany(Root<?> root){return root.get("bisincompany");}

    }
/**意见反馈表**/
//public static final String hy_feedback="hy_feedback" ;
public static class hy_feedback {
public static XSpec<com.frogsing.member.po.Feedback> xspec() {
    return new XSpec<com.frogsing.member.po.Feedback>(com.frogsing.member.po.Feedback.class);
    }
    public static final String tablename="hy_feedback";
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**会员名称**/
            public static final String smembername="smembername" ;
            /**手机号**/
            public static final String smobile="smobile" ;
            /**反馈时间**/
            public static final String dadddate="dadddate" ;
            /**处理时间**/
            public static final String dhandledate="dhandledate" ;
            /**反馈信息**/
            public static final String sinfo="sinfo" ;
            /**处理意见**/
            public static final String shandleinfo="shandleinfo" ;
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**会员名称**/
            public static  Path<String> smembername(Root<?> root){return root.get("smembername");}
            /**手机号**/
            public static  Path<String> smobile(Root<?> root){return root.get("smobile");}
            /**反馈时间**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**处理时间**/
            public static  Path<Date> dhandledate(Root<?> root){return root.get("dhandledate");}
            /**反馈信息**/
            public static  Path<String> sinfo(Root<?> root){return root.get("sinfo");}
            /**处理意见**/
            public static  Path<String> shandleinfo(Root<?> root){return root.get("shandleinfo");}

    }
/**自然人股东信息表**/
//public static final String hy_naturalholder="hy_naturalholder" ;
public static class hy_naturalholder {
public static XSpec<com.frogsing.member.po.NaturalHolder> xspec() {
    return new XSpec<com.frogsing.member.po.NaturalHolder>(com.frogsing.member.po.NaturalHolder.class);
    }
    public static final String tablename="hy_naturalholder";
            /**股东姓名**/
            public static final String sname="sname" ;
            /**证件类型**/
            public static final String icardtype="icardtype" ;
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**排序号**/
            public static final String isortno="isortno" ;
            /**证件号码**/
            public static final String scardno="scardno" ;
            /**出资额**/
            public static final String famount="famount" ;
            /**是否兼职**/
            public static final String bisjob="bisjob" ;
            /**股东姓名**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**证件类型**/
            public static  Path<Integer> icardtype(Root<?> root){return root.get("icardtype");}
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**排序号**/
            public static  Path<Integer> isortno(Root<?> root){return root.get("isortno");}
            /**证件号码**/
            public static  Path<String> scardno(Root<?> root){return root.get("scardno");}
            /**出资额**/
            public static  Path<Double> famount(Root<?> root){return root.get("famount");}
            /**是否兼职**/
            public static  Path<Integer> bisjob(Root<?> root){return root.get("bisjob");}

    }
/**机构股东信息**/
//public static final String hy_companyholder="hy_companyholder" ;
public static class hy_companyholder {
public static XSpec<com.frogsing.member.po.CompanyHolder> xspec() {
    return new XSpec<com.frogsing.member.po.CompanyHolder>(com.frogsing.member.po.CompanyHolder.class);
    }
    public static final String tablename="hy_companyholder";
            /**股东姓名**/
            public static final String sname="sname" ;
            /**执照类型**/
            public static final String ilicensetype="ilicensetype" ;
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**排序号**/
            public static final String isortno="isortno" ;
            /**社会统一信用代码**/
            public static final String ssocialcreditno="ssocialcreditno" ;
            /**出资额**/
            public static final String famount="famount" ;
            /**是否兼职**/
            public static final String bisjob="bisjob" ;
            /**股东姓名**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**执照类型**/
            public static  Path<Integer> ilicensetype(Root<?> root){return root.get("ilicensetype");}
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**排序号**/
            public static  Path<Integer> isortno(Root<?> root){return root.get("isortno");}
            /**社会统一信用代码**/
            public static  Path<String> ssocialcreditno(Root<?> root){return root.get("ssocialcreditno");}
            /**出资额**/
            public static  Path<Double> famount(Root<?> root){return root.get("famount");}
            /**是否兼职**/
            public static  Path<Integer> bisjob(Root<?> root){return root.get("bisjob");}

    }
/**实际控股人**/
//public static final String hy_controholder="hy_controholder" ;
public static class hy_controholder {
public static XSpec<com.frogsing.member.po.ControHolder> xspec() {
    return new XSpec<com.frogsing.member.po.ControHolder>(com.frogsing.member.po.ControHolder.class);
    }
    public static final String tablename="hy_controholder";
            /**股东姓名**/
            public static final String sname="sname" ;
            /**证件类型**/
            public static final String icardtype="icardtype" ;
            /**会员ID**/
            public static final String smemberid="smemberid" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**排序号**/
            public static final String isortno="isortno" ;
            /**社会统一信用代码**/
            public static final String ssocialcreditno="ssocialcreditno" ;
            /**出资额**/
            public static final String famount="famount" ;
            /**是否兼职**/
            public static final String bisjob="bisjob" ;
            /**公司类型**/
            public static final String icomtype="icomtype" ;
            /**股东姓名**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**证件类型**/
            public static  Path<Integer> icardtype(Root<?> root){return root.get("icardtype");}
            /**会员ID**/
            public static  Path<String> smemberid(Root<?> root){return root.get("smemberid");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**排序号**/
            public static  Path<Integer> isortno(Root<?> root){return root.get("isortno");}
            /**社会统一信用代码**/
            public static  Path<String> ssocialcreditno(Root<?> root){return root.get("ssocialcreditno");}
            /**出资额**/
            public static  Path<Double> famount(Root<?> root){return root.get("famount");}
            /**是否兼职**/
            public static  Path<Integer> bisjob(Root<?> root){return root.get("bisjob");}
            /**公司类型**/
            public static  Path<Integer> icomtype(Root<?> root){return root.get("icomtype");}

    }

    }
