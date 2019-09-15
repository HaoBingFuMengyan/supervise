    package  com.frogsing.operator.utils;
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class OPERATORCol {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
/**管理员**/
//public static final String op_operator="op_operator" ;
public static class op_operator {
public static XSpec<com.frogsing.operator.po.Operator> xspec() {
    return new XSpec<com.frogsing.operator.po.Operator>(com.frogsing.operator.po.Operator.class);
    }
    public static final String tablename="op_operator";
            /**管理员编号**/
            public static final String soperatorno="soperatorno" ;
            /**用户名**/
            public static final String susername="susername" ;
            /**密码**/
            public static final String spassword="spassword" ;
            /**部门ID**/
            public static final String sdepartmentid="sdepartmentid" ;
            /**真实姓名**/
            public static final String srealname="srealname" ;
            /**手机**/
            public static final String smobile="smobile" ;
            /**联系电话**/
            public static final String sphone="sphone" ;
            /**联系QQ**/
            public static final String sqq="sqq" ;
            /**邮箱**/
            public static final String semail="semail" ;
            /**是否禁用**/
            public static final String bisfreeze="bisfreeze" ;
            /**是否管理员**/
            public static final String bisadmin="bisadmin" ;
            /**是否删除**/
            public static final String bisdelete="bisdelete" ;
            /**是否客服**/
            public static final String bisservice="bisservice" ;
            /**上次登陆时间**/
            public static final String dlastlogintime="dlastlogintime" ;
            /**最后登陆时间**/
            public static final String dendlogintime="dendlogintime" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**添加人**/
            public static final String saddoperator="saddoperator" ;
            /**修改日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**修改人**/
            public static final String smodifyoperator="smodifyoperator" ;
            /**简拼名**/
            public static final String sjpname="sjpname" ;
            /**全拼名**/
            public static final String spyname="spyname" ;
            /**性别**/
            public static final String isex="isex" ;
            /**分库id**/
            public static final String swarehouseid="swarehouseid" ;
            /**最后登录APP终端**/
            public static final String ilastterminaltype="ilastterminaltype" ;
            /**终端ID**/
            public static final String slastterminalid="slastterminalid" ;
            /**类型**/
            public static final String ioperatortype="ioperatortype" ;
            /**管理员编号**/
            public static  Path<String> soperatorno(Root<?> root){return root.get("soperatorno");}
            /**用户名**/
            public static  Path<String> susername(Root<?> root){return root.get("susername");}
            /**密码**/
            public static  Path<String> spassword(Root<?> root){return root.get("spassword");}
            /**部门ID**/
            public static  Path<String> sdepartmentid(Root<?> root){return root.get("sdepartmentid");}
            /**真实姓名**/
            public static  Path<String> srealname(Root<?> root){return root.get("srealname");}
            /**手机**/
            public static  Path<String> smobile(Root<?> root){return root.get("smobile");}
            /**联系电话**/
            public static  Path<String> sphone(Root<?> root){return root.get("sphone");}
            /**联系QQ**/
            public static  Path<String> sqq(Root<?> root){return root.get("sqq");}
            /**邮箱**/
            public static  Path<String> semail(Root<?> root){return root.get("semail");}
            /**是否禁用**/
            public static  Path<Integer> bisfreeze(Root<?> root){return root.get("bisfreeze");}
            /**是否管理员**/
            public static  Path<Integer> bisadmin(Root<?> root){return root.get("bisadmin");}
            /**是否删除**/
            public static  Path<Integer> bisdelete(Root<?> root){return root.get("bisdelete");}
            /**是否客服**/
            public static  Path<Integer> bisservice(Root<?> root){return root.get("bisservice");}
            /**上次登陆时间**/
            public static  Path<Date> dlastlogintime(Root<?> root){return root.get("dlastlogintime");}
            /**最后登陆时间**/
            public static  Path<Date> dendlogintime(Root<?> root){return root.get("dendlogintime");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**添加人**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**修改日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**修改人**/
            public static  Path<String> smodifyoperator(Root<?> root){return root.get("smodifyoperator");}
            /**简拼名**/
            public static  Path<String> sjpname(Root<?> root){return root.get("sjpname");}
            /**全拼名**/
            public static  Path<String> spyname(Root<?> root){return root.get("spyname");}
            /**性别**/
            public static  Path<Integer> isex(Root<?> root){return root.get("isex");}
            /**分库id**/
            public static  Path<String> swarehouseid(Root<?> root){return root.get("swarehouseid");}
            /**最后登录APP终端**/
            public static  Path<Integer> ilastterminaltype(Root<?> root){return root.get("ilastterminaltype");}
            /**终端ID**/
            public static  Path<String> slastterminalid(Root<?> root){return root.get("slastterminalid");}
            /**类型**/
            public static  Path<Integer> ioperatortype(Root<?> root){return root.get("ioperatortype");}

    }
/**系统管理员登陆信息**/
//public static final String op_loginlog="op_loginlog" ;
public static class op_loginlog {
public static XSpec<com.frogsing.operator.po.LoginLog> xspec() {
    return new XSpec<com.frogsing.operator.po.LoginLog>(com.frogsing.operator.po.LoginLog.class);
    }
    public static final String tablename="op_loginlog";
            /**管理员ID**/
            public static final String soperatorid="soperatorid" ;
            /**用户名**/
            public static final String susername="susername" ;
            /**客户端IP**/
            public static final String sip="sip" ;
            /**登录时间**/
            public static final String dlogintime="dlogintime" ;
            /**退出时间**/
            public static final String dlogouttime="dlogouttime" ;
            /**管理员ID**/
            public static  Path<String> soperatorid(Root<?> root){return root.get("soperatorid");}
            /**用户名**/
            public static  Path<String> susername(Root<?> root){return root.get("susername");}
            /**客户端IP**/
            public static  Path<String> sip(Root<?> root){return root.get("sip");}
            /**登录时间**/
            public static  Path<Date> dlogintime(Root<?> root){return root.get("dlogintime");}
            /**退出时间**/
            public static  Path<Date> dlogouttime(Root<?> root){return root.get("dlogouttime");}

    }
/**操作员角色表**/
//public static final String op_operatorrole="op_operatorrole" ;
public static class op_operatorrole {
public static XSpec<com.frogsing.operator.po.OperatorRole> xspec() {
    return new XSpec<com.frogsing.operator.po.OperatorRole>(com.frogsing.operator.po.OperatorRole.class);
    }
    public static final String tablename="op_operatorrole";
            /**操作员ID**/
            public static final String soperatorid="soperatorid" ;
            /**角色ID**/
            public static final String sroleid="sroleid" ;
            /**操作员ID**/
            public static  Path<String> soperatorid(Root<?> root){return root.get("soperatorid");}
            /**角色ID**/
            public static  Path<String> sroleid(Root<?> root){return root.get("sroleid");}

    }
/**交易系统后台权限码**/
//public static final String op_purview="op_purview" ;
public static class op_purview {
public static XSpec<com.frogsing.operator.po.Purview> xspec() {
    return new XSpec<com.frogsing.operator.po.Purview>(com.frogsing.operator.po.Purview.class);
    }
    public static final String tablename="op_purview";
            /**权限编号**/
            public static final String spurno="spurno" ;
            /**权限码**/
            public static final String spurcode="spurcode" ;
            /**权限名称**/
            public static final String spurname="spurname" ;
            /**父菜单名称**/
            public static final String sparentname="sparentname" ;
            /**父菜单ID**/
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
            /**超级权限**/
            public static final String bissuper="bissuper" ;
            /**权限编号**/
            public static  Path<String> spurno(Root<?> root){return root.get("spurno");}
            /**权限码**/
            public static  Path<String> spurcode(Root<?> root){return root.get("spurcode");}
            /**权限名称**/
            public static  Path<String> spurname(Root<?> root){return root.get("spurname");}
            /**父菜单名称**/
            public static  Path<String> sparentname(Root<?> root){return root.get("sparentname");}
            /**父菜单ID**/
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
            /**超级权限**/
            public static  Path<Integer> bissuper(Root<?> root){return root.get("bissuper");}

    }
/**交易系统后台角色权限分配**/
//public static final String op_rolepurview="op_rolepurview" ;
public static class op_rolepurview {
public static XSpec<com.frogsing.operator.po.RolePurview> xspec() {
    return new XSpec<com.frogsing.operator.po.RolePurview>(com.frogsing.operator.po.RolePurview.class);
    }
    public static final String tablename="op_rolepurview";
            /**角色ID**/
            public static final String sroleid="sroleid" ;
            /**权限码ID**/
            public static final String spurviewid="spurviewid" ;
            /**角色ID**/
            public static  Path<String> sroleid(Root<?> root){return root.get("sroleid");}
            /**权限码ID**/
            public static  Path<String> spurviewid(Root<?> root){return root.get("spurviewid");}

    }
/**系统菜单设置表**/
//public static final String op_menu="op_menu" ;
public static class op_menu {
public static XSpec<com.frogsing.operator.po.Menu> xspec() {
    return new XSpec<com.frogsing.operator.po.Menu>(com.frogsing.operator.po.Menu.class);
    }
    public static final String tablename="op_menu";
            /**菜单编号**/
            public static final String smenuno="smenuno" ;
            /**菜单名称**/
            public static final String sname="sname" ;
            /**菜单标题**/
            public static final String stitle="stitle" ;
            /**是否父节点**/
            public static final String bisroot="bisroot" ;
            /**是否叶子节点**/
            public static final String bisleaf="bisleaf" ;
            /**父节点ID**/
            public static final String sparentid="sparentid" ;
            /**权限ID**/
            public static final String spurid="spurid" ;
            /**菜单阶层**/
            public static final String imenulevel="imenulevel" ;
            /**菜单图标**/
            public static final String simagepath="simagepath" ;
            /**菜单路径**/
            public static final String smenupath="smenupath" ;
            /**是否显示菜单**/
            public static final String bisdisplay="bisdisplay" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**排序编号**/
            public static final String isort="isort" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**菜单编号**/
            public static  Path<String> smenuno(Root<?> root){return root.get("smenuno");}
            /**菜单名称**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**菜单标题**/
            public static  Path<String> stitle(Root<?> root){return root.get("stitle");}
            /**是否父节点**/
            public static  Path<Integer> bisroot(Root<?> root){return root.get("bisroot");}
            /**是否叶子节点**/
            public static  Path<Integer> bisleaf(Root<?> root){return root.get("bisleaf");}
            /**父节点ID**/
            public static  Path<String> sparentid(Root<?> root){return root.get("sparentid");}
            /**权限ID**/
            public static  Path<String> spurid(Root<?> root){return root.get("spurid");}
            /**菜单阶层**/
            public static  Path<Integer> imenulevel(Root<?> root){return root.get("imenulevel");}
            /**菜单图标**/
            public static  Path<String> simagepath(Root<?> root){return root.get("simagepath");}
            /**菜单路径**/
            public static  Path<String> smenupath(Root<?> root){return root.get("smenupath");}
            /**是否显示菜单**/
            public static  Path<Integer> bisdisplay(Root<?> root){return root.get("bisdisplay");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**排序编号**/
            public static  Path<Integer> isort(Root<?> root){return root.get("isort");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}

    }
/**部门表**/
//public static final String op_department="op_department" ;
public static class op_department {
public static XSpec<com.frogsing.operator.po.Department> xspec() {
    return new XSpec<com.frogsing.operator.po.Department>(com.frogsing.operator.po.Department.class);
    }
    public static final String tablename="op_department";
            /**部门名称**/
            public static final String sname="sname" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**父节点ID**/
            public static final String sparentid="sparentid" ;
            /**是否父节点**/
            public static final String bisroot="bisroot" ;
            /**是否叶子节点**/
            public static final String bisleaf="bisleaf" ;
            /**添加日期**/
            public static final String dadddate="dadddate" ;
            /**部门名称**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**父节点ID**/
            public static  Path<String> sparentid(Root<?> root){return root.get("sparentid");}
            /**是否父节点**/
            public static  Path<Integer> bisroot(Root<?> root){return root.get("bisroot");}
            /**是否叶子节点**/
            public static  Path<Integer> bisleaf(Root<?> root){return root.get("bisleaf");}
            /**添加日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}

    }
/**sys角色表**/
//public static final String op_role="op_role" ;
public static class op_role {
public static XSpec<com.frogsing.operator.po.Role> xspec() {
    return new XSpec<com.frogsing.operator.po.Role>(com.frogsing.operator.po.Role.class);
    }
    public static final String tablename="op_role";
            /**角色编号**/
            public static final String srolenum="srolenum" ;
            /**角色名称**/
            public static final String srolename="srolename" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**系统角色类型**/
            public static final String iroletype="iroletype" ;
            /**角色编号**/
            public static  Path<String> srolenum(Root<?> root){return root.get("srolenum");}
            /**角色名称**/
            public static  Path<String> srolename(Root<?> root){return root.get("srolename");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}
            /**系统角色类型**/
            public static  Path<Integer> iroletype(Root<?> root){return root.get("iroletype");}

    }
/**工作流模板明细表**/
//public static final String wf_workflowtemplatedetail="wf_workflowtemplatedetail" ;
public static class wf_workflowtemplatedetail {
public static XSpec<com.frogsing.operator.po.WorkFlowTemplateDetail> xspec() {
    return new XSpec<com.frogsing.operator.po.WorkFlowTemplateDetail>(com.frogsing.operator.po.WorkFlowTemplateDetail.class);
    }
    public static final String tablename="wf_workflowtemplatedetail";
            /**工作流Id**/
            public static final String sworkflowid="sworkflowid" ;
            /**排序号**/
            public static final String iseq="iseq" ;
            /**级别**/
            public static final String ilevel="ilevel" ;
            /**审核人Id**/
            public static final String soperatorid="soperatorid" ;
            /**审核人员**/
            public static final String scheckoperator="scheckoperator" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**工作流Id**/
            public static  Path<String> sworkflowid(Root<?> root){return root.get("sworkflowid");}
            /**排序号**/
            public static  Path<Integer> iseq(Root<?> root){return root.get("iseq");}
            /**级别**/
            public static  Path<Integer> ilevel(Root<?> root){return root.get("ilevel");}
            /**审核人Id**/
            public static  Path<String> soperatorid(Root<?> root){return root.get("soperatorid");}
            /**审核人员**/
            public static  Path<String> scheckoperator(Root<?> root){return root.get("scheckoperator");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}

    }
/**工作流模板主表**/
//public static final String wf_workflowtemplate="wf_workflowtemplate" ;
public static class wf_workflowtemplate {
public static XSpec<com.frogsing.operator.po.WorkFlowTemplate> xspec() {
    return new XSpec<com.frogsing.operator.po.WorkFlowTemplate>(com.frogsing.operator.po.WorkFlowTemplate.class);
    }
    public static final String tablename="wf_workflowtemplate";
            /**模板编号**/
            public static final String sno="sno" ;
            /**模板名称**/
            public static final String sname="sname" ;
            /**模板描述**/
            public static final String sdesc="sdesc" ;
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
            /**模板编号**/
            public static  Path<String> sno(Root<?> root){return root.get("sno");}
            /**模板名称**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**模板描述**/
            public static  Path<String> sdesc(Root<?> root){return root.get("sdesc");}
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
/**工作流明细表**/
//public static final String wf_workflowdetail="wf_workflowdetail" ;
public static class wf_workflowdetail {
public static XSpec<com.frogsing.operator.po.WorkFlowDetail> xspec() {
    return new XSpec<com.frogsing.operator.po.WorkFlowDetail>(com.frogsing.operator.po.WorkFlowDetail.class);
    }
    public static final String tablename="wf_workflowdetail";
            /**工作流Id**/
            public static final String sworkflowid="sworkflowid" ;
            /**排序号**/
            public static final String iseq="iseq" ;
            /**级别**/
            public static final String ilevel="ilevel" ;
            /**节点编号**/
            public static final String sno="sno" ;
            /**节点名称**/
            public static final String sname="sname" ;
            /**节点描述**/
            public static final String sdesc="sdesc" ;
            /**是否激活**/
            public static final String bisactive="bisactive" ;
            /**是否通过**/
            public static final String istatus="istatus" ;
            /**上级节点Id**/
            public static final String spreid="spreid" ;
            /**下级节点Id**/
            public static final String snextid="snextid" ;
            /**处理部门**/
            public static final String sdepartment="sdepartment" ;
            /**处理岗位**/
            public static final String spost="spost" ;
            /**审核人Id**/
            public static final String soperatorid="soperatorid" ;
            /**审核人员**/
            public static final String scheckoperator="scheckoperator" ;
            /**审核日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**审核意见**/
            public static final String scheckinfo="scheckinfo" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**工作流Id**/
            public static  Path<String> sworkflowid(Root<?> root){return root.get("sworkflowid");}
            /**排序号**/
            public static  Path<Integer> iseq(Root<?> root){return root.get("iseq");}
            /**级别**/
            public static  Path<Integer> ilevel(Root<?> root){return root.get("ilevel");}
            /**节点编号**/
            public static  Path<String> sno(Root<?> root){return root.get("sno");}
            /**节点名称**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**节点描述**/
            public static  Path<String> sdesc(Root<?> root){return root.get("sdesc");}
            /**是否激活**/
            public static  Path<Integer> bisactive(Root<?> root){return root.get("bisactive");}
            /**是否通过**/
            public static  Path<Integer> istatus(Root<?> root){return root.get("istatus");}
            /**上级节点Id**/
            public static  Path<String> spreid(Root<?> root){return root.get("spreid");}
            /**下级节点Id**/
            public static  Path<String> snextid(Root<?> root){return root.get("snextid");}
            /**处理部门**/
            public static  Path<String> sdepartment(Root<?> root){return root.get("sdepartment");}
            /**处理岗位**/
            public static  Path<String> spost(Root<?> root){return root.get("spost");}
            /**审核人Id**/
            public static  Path<String> soperatorid(Root<?> root){return root.get("soperatorid");}
            /**审核人员**/
            public static  Path<String> scheckoperator(Root<?> root){return root.get("scheckoperator");}
            /**审核日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**审核意见**/
            public static  Path<String> scheckinfo(Root<?> root){return root.get("scheckinfo");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}

    }
/**工作流主表**/
//public static final String wf_workflow="wf_workflow" ;
public static class wf_workflow {
public static XSpec<com.frogsing.operator.po.WorkFlow> xspec() {
    return new XSpec<com.frogsing.operator.po.WorkFlow>(com.frogsing.operator.po.WorkFlow.class);
    }
    public static final String tablename="wf_workflow";
            /**流程编号**/
            public static final String sno="sno" ;
            /**业务类型**/
            public static final String ibiztype="ibiztype" ;
            /**业务Id**/
            public static final String sbizid="sbizid" ;
            /**业务单据号**/
            public static final String sbizno="sbizno" ;
            /**流程名称**/
            public static final String sname="sname" ;
            /**流程描述**/
            public static final String sdesc="sdesc" ;
            /**是否生效**/
            public static final String bisauth="bisauth" ;
            /**状态**/
            public static final String istatus="istatus" ;
            /**编制人员**/
            public static final String saddoperator="saddoperator" ;
            /**编制日期**/
            public static final String dadddate="dadddate" ;
            /**审核人员**/
            public static final String scheckoperator="scheckoperator" ;
            /**审核日期**/
            public static final String dmodifydate="dmodifydate" ;
            /**备注**/
            public static final String sremark="sremark" ;
            /**流程编号**/
            public static  Path<String> sno(Root<?> root){return root.get("sno");}
            /**业务类型**/
            public static  Path<Integer> ibiztype(Root<?> root){return root.get("ibiztype");}
            /**业务Id**/
            public static  Path<String> sbizid(Root<?> root){return root.get("sbizid");}
            /**业务单据号**/
            public static  Path<String> sbizno(Root<?> root){return root.get("sbizno");}
            /**流程名称**/
            public static  Path<String> sname(Root<?> root){return root.get("sname");}
            /**流程描述**/
            public static  Path<String> sdesc(Root<?> root){return root.get("sdesc");}
            /**是否生效**/
            public static  Path<Integer> bisauth(Root<?> root){return root.get("bisauth");}
            /**状态**/
            public static  Path<Integer> istatus(Root<?> root){return root.get("istatus");}
            /**编制人员**/
            public static  Path<String> saddoperator(Root<?> root){return root.get("saddoperator");}
            /**编制日期**/
            public static  Path<Date> dadddate(Root<?> root){return root.get("dadddate");}
            /**审核人员**/
            public static  Path<String> scheckoperator(Root<?> root){return root.get("scheckoperator");}
            /**审核日期**/
            public static  Path<Date> dmodifydate(Root<?> root){return root.get("dmodifydate");}
            /**备注**/
            public static  Path<String> sremark(Root<?> root){return root.get("sremark");}

    }

    }
