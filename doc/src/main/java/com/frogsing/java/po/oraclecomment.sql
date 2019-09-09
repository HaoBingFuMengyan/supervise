COMMENT ON COLUMN 	sys_sequence.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_sequence.scode is '编号/50/';
COMMENT ON COLUMN 	sys_sequence.sobjectname is '对象名称/100/';
COMMENT ON COLUMN 	sys_sequence.sfromat is '格式/100/';
COMMENT ON COLUMN 	sys_sequence.iincrement is '递增大小//';
COMMENT ON COLUMN 	sys_sequence.istartno is '起始值//';
COMMENT ON COLUMN 	sys_sequence.icurrentno is '当前编号//';
COMMENT ON COLUMN 	sys_sequence.sprefix is '前缀/50/';
COMMENT ON COLUMN 	sys_sequence.ssuffix is '后缀/50/';
COMMENT ON COLUMN 	sys_sequence.sseqlength is '流水位数//';
COMMENT ON COLUMN 	sys_sequence.dcurrentdate is '当前日期/50/';
COMMENT ON COLUMN 	sys_sequence.biscycle is '是否重新生成编号/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_sequence.sremark is '备注/500/';
COMMENT ON COLUMN 	sys_sequence.bisreset is '是否结算清零/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_parameter.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_parameter.iparatype is '参数类型/10:ImgPosition:图片绝对路径
20:ImgUrl:图片Url路径
30:ContractDelivery:合同交收期限
40:MsgSendTime:短信发送时间节点
41:MsgEndSendTime:短信最晚可发送时间点
42:PlanJobFailTime:定时任务失败执行次数
70:FRETC:上海国际木材交易中心电子融资平台
80:FeeSeller:卖家交易手续费
81:FeeBuyer:买家交易手续费
90:DeliveryScale:收货划款比例
100:ReportStock:股票图默认品名
101:ViewGoodsScale:看货保证金比例
102:AipComFundInFee:通联企业入金费率
103:AipPerFundInFee:通联个人入金费率
104:AipFundOutFee:通联出金费率
105:JpFundNotIn:禁止交纳竞拍保证金分钟
/';
COMMENT ON COLUMN 	sys_parameter.sparametervalue is '参数值/100/';
COMMENT ON COLUMN 	sys_parameter.sremark is '参数说明/2000/';
COMMENT ON COLUMN 	sys_parameter.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_parameter.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_parameter.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	sys_parameter.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	sys_businessparameter.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_businessparameter.isort is '排序号//';
COMMENT ON COLUMN 	sys_businessparameter.iparatype is '参数类型/100:CompanyKind:企业性质
101:EmployeeAmount:企业员工人数
102:BusinessMode:经营模式
200:FTPInfo:Ftp配置
300:ResouceExcel:资源单标题别名
310:NumberUnit:数量单位
320:WoodLevel:等级
400:ReportColumn:柱图默认品种
/';
COMMENT ON COLUMN 	sys_businessparameter.sparametername is '参数名称/50/';
COMMENT ON COLUMN 	sys_businessparameter.sparametervalue is '参数值/100/';
COMMENT ON COLUMN 	sys_businessparameter.sremark is '参数说明/2000/';
COMMENT ON COLUMN 	sys_businessparameter.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_businessparameter.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_businessparameter.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	sys_businessparameter.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	sys_filestore.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_filestore.sfilename is '文件名/100/';
COMMENT ON COLUMN 	sys_filestore.ifiletype is '文件类型/0:MEMBER:会员
1:PAYMENT:付款凭证/';
COMMENT ON COLUMN 	sys_filestore.gfilecontent is '文件内容//';
COMMENT ON COLUMN 	sys_filestore.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_filestore.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_filestore.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	sys_filestore.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	sys_errormessage.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_errormessage.scode is '错误代码/50/';
COMMENT ON COLUMN 	sys_errormessage.smessage is '错误消息/500/';
COMMENT ON COLUMN 	sys_errormessage.sremark is '备注/500/';
COMMENT ON COLUMN 	sys_errormessage.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_errormessage.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_errormessage.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	sys_errormessage.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	sys_operator.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_operator.soperatorno is '管理员编号/50/';
COMMENT ON COLUMN 	sys_operator.susername is '用户名/50/';
COMMENT ON COLUMN 	sys_operator.spassword is '密码/50/';
COMMENT ON COLUMN 	sys_operator.sdepartmentid is '部门ID/32/';
COMMENT ON COLUMN 	sys_operator.srealname is '真实姓名/50/';
COMMENT ON COLUMN 	sys_operator.smobile is '手机/20/';
COMMENT ON COLUMN 	sys_operator.sphone is '联系电话/20/';
COMMENT ON COLUMN 	sys_operator.sqq is '联系QQ/50/';
COMMENT ON COLUMN 	sys_operator.semail is '邮箱/100/';
COMMENT ON COLUMN 	sys_operator.bisfreeze is '是否禁用/0:NO:否
1:YES:是
/0：禁用
1：启用';
COMMENT ON COLUMN 	sys_operator.bisadmin is '是否管理员/0:NO:否
1:YES:是
/0 no
1 yes';
COMMENT ON COLUMN 	sys_operator.bisdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_operator.dlastlogintime is '上次登陆时间//';
COMMENT ON COLUMN 	sys_operator.dendlogintime is '最后登陆时间//';
COMMENT ON COLUMN 	sys_operator.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_operator.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_operator.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	sys_operator.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	sys_operator.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sys_operator.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sys_operator.isex is '性别/0:MAN:男
1:WOMAN:女/';
COMMENT ON COLUMN 	sys_loginlog.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_loginlog.soperatorid is '管理员ID/32/';
COMMENT ON COLUMN 	sys_loginlog.susername is '用户名/50/';
COMMENT ON COLUMN 	sys_loginlog.sip is '客户端IP/300/';
COMMENT ON COLUMN 	sys_loginlog.dlogintime is '登录时间//';
COMMENT ON COLUMN 	sys_loginlog.dlogouttime is '退出时间//';
COMMENT ON COLUMN 	sys_operatorrole.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_operatorrole.soperatorid is '操作员ID/32/';
COMMENT ON COLUMN 	sys_operatorrole.sroleid is '角色ID/32/';
COMMENT ON COLUMN 	sys_purview.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_purview.spurno is '权限编号/50/';
COMMENT ON COLUMN 	sys_purview.spurcode is '权限码/50/根据用户登录时判断页面的操作时否显示';
COMMENT ON COLUMN 	sys_purview.spurname is '权限名称/50/';
COMMENT ON COLUMN 	sys_purview.sparentname is '父菜单名称/50/';
COMMENT ON COLUMN 	sys_purview.sparentid is '父菜单ID/32/';
COMMENT ON COLUMN 	sys_purview.surlpath is '访问路径/300/';
COMMENT ON COLUMN 	sys_purview.sdescription is '权限说明/500/';
COMMENT ON COLUMN 	sys_purview.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sys_purview.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sys_purview.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_rolepurview.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_rolepurview.sroleid is '角色ID/32/';
COMMENT ON COLUMN 	sys_rolepurview.spurviewid is '权限码ID/32/';
COMMENT ON COLUMN 	sys_menu.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_menu.smenuno is '菜单编号/50/';
COMMENT ON COLUMN 	sys_menu.sname is '菜单名称/50/';
COMMENT ON COLUMN 	sys_menu.stitle is '菜单标题/100/';
COMMENT ON COLUMN 	sys_menu.bisroot is '是否父节点/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_menu.bisleaf is '是否叶子节点/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_menu.sparentid is '父节点ID/32/';
COMMENT ON COLUMN 	sys_menu.spurid is '权限ID/32/';
COMMENT ON COLUMN 	sys_menu.imenulevel is '菜单阶层//';
COMMENT ON COLUMN 	sys_menu.simagepath is '菜单图标/300/';
COMMENT ON COLUMN 	sys_menu.smenupath is '菜单路径/300/';
COMMENT ON COLUMN 	sys_menu.bisdisplay is '是否显示菜单/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_menu.sremark is '备注/500/';
COMMENT ON COLUMN 	sys_menu.isort is '排序编号//';
COMMENT ON COLUMN 	sys_menu.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_department.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_department.sname is '部门名称/50/';
COMMENT ON COLUMN 	sys_department.sremark is '备注/500/';
COMMENT ON COLUMN 	sys_role.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_role.srolename is '角色名称/50/';
COMMENT ON COLUMN 	sys_role.sremark is '备注/2000/';
COMMENT ON COLUMN 	xw_comment.sguid is '主键ID/32/';
COMMENT ON COLUMN 	xw_comment.sarticleid is '文章id/32/';
COMMENT ON COLUMN 	xw_comment.stitle is '标题/300/';
COMMENT ON COLUMN 	xw_comment.scontent is '评论内容/4000/';
COMMENT ON COLUMN 	xw_comment.sadmincontent is '管理员回复/4000/';
COMMENT ON COLUMN 	xw_comment.ddate is '评论时间//';
COMMENT ON COLUMN 	xw_comment.sreplyid is '回复ID/32/';
COMMENT ON COLUMN 	xw_comment.dreplydate is '回复时间//';
COMMENT ON COLUMN 	xw_comment.soparetorid is '评论者id/32/';
COMMENT ON COLUMN 	xw_comment.bisforbidden is '是否禁用/0:NO:否
1:YES:是
/0：否
1：是';
COMMENT ON COLUMN 	xw_comment.bisrecommend is '是否推荐/0:NO:否
1:YES:是
/0：否
1：是';
COMMENT ON COLUMN 	xw_comment.sserialno is '流水号/20/';
COMMENT ON COLUMN 	xw_articlecontent.sguid is '主键ID/32/';
COMMENT ON COLUMN 	xw_articlecontent.bcontent is '内容//';
COMMENT ON COLUMN 	xw_articlecontent.sarticleid is '文章字段id/32/';
COMMENT ON COLUMN 	xw_usernavigation.sguid is '主键ID/32/';
COMMENT ON COLUMN 	xw_usernavigation.soperatorid is '用户ID/32/';
COMMENT ON COLUMN 	xw_usernavigation.snavigateid is '栏目ID/32/';
COMMENT ON COLUMN 	sys_operatelog.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_operatelog.ioperatetype is '操作类型/0:ADD:新增
1:MODIFY:修改
2:DELETE:删除
/';
COMMENT ON COLUMN 	sys_operatelog.soperatekey is '操作记录主键/32/';
COMMENT ON COLUMN 	sys_operatelog.soperateremark is '操作备注/2000/';
COMMENT ON COLUMN 	sys_operatelog.saddoperator is '操作人/50/';
COMMENT ON COLUMN 	sys_operatelog.dadddate is '操作日期//';
COMMENT ON COLUMN 	sys_filedirection.sfiledir is '子目录/100/';
COMMENT ON COLUMN 	sys_filedirection.sfilename is '文件名/100/';
COMMENT ON COLUMN 	sys_filedirection.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_filedirection.bisused is '是否已使用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_filedirection.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_filedirection.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_systemlog.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_systemlog.slogno is '日志编号/50/记录所操作的数据库表和记录编号，';
COMMENT ON COLUMN 	sys_systemlog.slogtime is '日志时间//';
COMMENT ON COLUMN 	sys_systemlog.smemberid is '会员企业/32/';
COMMENT ON COLUMN 	sys_systemlog.slogusername is '交易员名/50/';
COMMENT ON COLUMN 	sys_systemlog.ilogtype is '日志类型/1:SYSTEM:系统日志
2:SECRITY:安全日志
3:BUSINESS:应用日志
4:OTHER:其它日志/1:系统日志、
2:安全日志、
3:应用日志、
4:其它日志';
COMMENT ON COLUMN 	sys_systemlog.iloglevel is '日志级别/0:INFO:信息
1:WARNING:警告
2:ERROR:错误
3:CRUEL:严重
4:DEAD:瘫痪/0：信息
1：警告
2：错误
3：严重
4：瘫痪';
COMMENT ON COLUMN 	sys_systemlog.sloginfo is '日志信息/2000/日志描述，越具体越好，有两种用途(1)我们去查错时，查看日志，(2)用户自己要掌握操作员在系统中做了些什么。
         最好能在后面带上当时操作记录的可唯一标识记录的编号.';
COMMENT ON COLUMN 	sys_systemlog.surl is '操作地址/300/';
COMMENT ON COLUMN 	sys_systemlog.soperatename is '操作名/100/';
COMMENT ON COLUMN 	sys_systemlog.soperateip is '操作IP/300/';
COMMENT ON COLUMN 	sys_parametergroup.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_parametergroup.sgroupno is '组编号/50/';
COMMENT ON COLUMN 	sys_parametergroup.sgroupname is '组名称/50/';
COMMENT ON COLUMN 	sys_parametergroup.sremark is '说明/500/';
COMMENT ON COLUMN 	sys_parametergroup.biscanmodify is '是否可修改/0:NO:否
1:YES:是
/是否可供用户修改';
COMMENT ON COLUMN 	sys_parametergroupdetail.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_parametergroupdetail.sname is '参数名称/50/';
COMMENT ON COLUMN 	sys_parametergroupdetail.svalue is '参数值/100/';
COMMENT ON COLUMN 	sys_parametergroupdetail.sremark is '参数说明/500/';
COMMENT ON COLUMN 	sys_parametergroupdetail.isort is '排序号//';
COMMENT ON COLUMN 	sys_parametergroupdetail.sgroupid is '主表主键/32/';
COMMENT ON COLUMN 	sys_visitvolume.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_visitvolume.sip is '访问IP/50/';
COMMENT ON COLUMN 	sys_visitvolume.scity is '所属城市/50/';
COMMENT ON COLUMN 	sys_visitvolume.surl is 'URL/300/';
COMMENT ON COLUMN 	sys_visitvolume.icount is '访问次数//';
COMMENT ON COLUMN 	sys_visitvolume.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	sys_visitvolume.soperatorid is '交易员ID/32/';
COMMENT ON COLUMN 	sys_visitvolume.dlastvisitdate is '最后访问时间//';
COMMENT ON COLUMN 	sys_visitvolume.svisitnavigationid is '访问栏目ID(前期为空)/32/';
COMMENT ON COLUMN 	sys_visitvolume.sremark is '备注/500/';
COMMENT ON COLUMN 	sys_domain.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_domain.sname is '市场名称/100/0：表示所有联盟体仓库都能调用的SQL
联盟体仓库编号：表示只有该联盟体仓库才能调用的SQL';
COMMENT ON COLUMN 	sys_domain.imembertype is '会员类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/0、本公司
1、交易会员
2仓库
3银行
4物流单位
5 保险公司
6 担保公司
7 代理市场';
COMMENT ON COLUMN 	sys_domain.sremark is '备注/500/';
COMMENT ON COLUMN 	sys_domain.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_domain.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_domain.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	sys_domain.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	sys_domaindetail.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_domaindetail.sdomainguid is '域名主表ID/32/';
COMMENT ON COLUMN 	sys_domaindetail.imembertype is '会员类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/0、本公司
1、交易会员
2仓库
3银行
4物流单位
5 保险公司
6 担保公司
7 代理市场';
COMMENT ON COLUMN 	sys_domaindetail.sdomainaddress is '域名地址/100/0：表示所有联盟体仓库都能调用的SQL
联盟体仓库编号：表示只有该联盟体仓库才能调用的SQL';
COMMENT ON COLUMN 	sys_domaindetail.sdomainremark is '域名说明/2000/';
COMMENT ON COLUMN 	sys_domaindetail.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	sys_domaindetail.dadddate is '添加日期//';
COMMENT ON COLUMN 	sys_domaindetail.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	sys_domaindetail.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	sys_authorize.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_authorize.soperatorid is '授权人/32/';
COMMENT ON COLUMN 	sys_authorize.spassword is '授权密码/50/';
COMMENT ON COLUMN 	sys_authorize.spurviewid is '权限码ID/32/';
COMMENT ON COLUMN 	sys_authorize.sremark is '备注/500/';
COMMENT ON COLUMN 	sys_visitlog.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_visitlog.spurviewcode is '权限码/500/';
COMMENT ON COLUMN 	sys_visitlog.spurviewpath is '访问路径/1000/';
COMMENT ON COLUMN 	sys_visitlog.soperator is '操作人/300/';
COMMENT ON COLUMN 	sys_visitlog.ddate is '操作日期//';
COMMENT ON COLUMN 	sp_category.sguid is '主键/32/';
COMMENT ON COLUMN 	sp_category.ssystemcode is '系统编码/100/';
COMMENT ON COLUMN 	sp_category.sname is '品种名称/50/';
COMMENT ON COLUMN 	sp_category.slocalname is '俗名/50/';
COMMENT ON COLUMN 	sp_category.senname is '英文名/300/';
COMMENT ON COLUMN 	sp_category.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	sp_category.sdescription is '品种介绍//';
COMMENT ON COLUMN 	sp_category.sparentid is '父品种/32/';
COMMENT ON COLUMN 	sp_category.isort is '排序号//';
COMMENT ON COLUMN 	sp_category.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sp_category.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sp_category.biscommon is '是否常用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sp_category.sremark is '说明/500/';
COMMENT ON COLUMN 	sp_commodity.sguid is '品名ID/32/';
COMMENT ON COLUMN 	sp_commodity.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	sp_commodity.scommoditysystemcode is '品名系统编码/100/';
COMMENT ON COLUMN 	sp_commodity.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	sp_commodity.sname is '品名/50/';
COMMENT ON COLUMN 	sp_commodity.slocalname is '俗名/50/';
COMMENT ON COLUMN 	sp_commodity.senname is '英文名/300/';
COMMENT ON COLUMN 	sp_commodity.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	sp_commodity.sdescription is '品种介绍//';
COMMENT ON COLUMN 	sp_commodity.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sp_commodity.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sp_commodity.saddress is '图片地址/300/';
COMMENT ON COLUMN 	sp_commodity.biscommon is '是否常用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sp_commodity.fpricemax is '价格上限//';
COMMENT ON COLUMN 	sp_commodity.fpricemin is '价格下限//';
COMMENT ON COLUMN 	sp_commodity.sspecset is '规格设置/100/';
COMMENT ON COLUMN 	sp_commodity.sweightunit is '计量单位/100/';
COMMENT ON COLUMN 	sp_specs.sguid is '主键/32/';
COMMENT ON COLUMN 	sp_specs.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	sp_specs.sname is '规格名称/50/';
COMMENT ON COLUMN 	sp_specs.sparaa is '规格参数1/50/';
COMMENT ON COLUMN 	sp_specs.sparab is '规格参数2/50/';
COMMENT ON COLUMN 	sp_specs.sparac is '规格参数3/50/';
COMMENT ON COLUMN 	sp_specs.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sp_specs.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sp_material.sguid is '主键/32/';
COMMENT ON COLUMN 	sp_material.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	sp_material.sname is '材质名称/50/';
COMMENT ON COLUMN 	sp_material.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sp_material.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sp_productor.sguid is '主键/32/';
COMMENT ON COLUMN 	sp_productor.sname is '厂家名称/50/';
COMMENT ON COLUMN 	sp_productor.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sp_productor.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sp_productor.biscommon is '是否常用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sp_productor.isort is '显示顺序//';
COMMENT ON COLUMN 	hy_user.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_user.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	hy_user.soperatorno is '交易员编号/50/';
COMMENT ON COLUMN 	hy_user.susername is '用户名/50/';
COMMENT ON COLUMN 	hy_user.spassword is '用户密码/50/';
COMMENT ON COLUMN 	hy_user.stradepassword is '交易密码/50/';
COMMENT ON COLUMN 	hy_user.slikename is '昵称/50/';
COMMENT ON COLUMN 	hy_user.sname is '姓名/50/';
COMMENT ON COLUMN 	hy_user.isex is '性别/0:MAN:男
1:WOMAN:女/';
COMMENT ON COLUMN 	hy_user.sphone is '电话/20/';
COMMENT ON COLUMN 	hy_user.sfax is '传真/32/';
COMMENT ON COLUMN 	hy_user.smobile is '手机/20/';
COMMENT ON COLUMN 	hy_user.semail is 'Email/100/';
COMMENT ON COLUMN 	hy_user.bisymobile is '手机号是否已验证/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_user.bisyemail is 'Email是否已验证/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_user.sqq is 'QQ/50/';
COMMENT ON COLUMN 	hy_user.smsn is 'Msn/50/';
COMMENT ON COLUMN 	hy_user.bisvalid is '是否有效/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_user.bisadmin is '是否管理员/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_user.bisdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_user.ierrorcount is '当天密码错误次数//';
COMMENT ON COLUMN 	hy_user.dlastlogintime is '上次登陆时间//';
COMMENT ON COLUMN 	hy_user.dendlogintime is '最后登陆时间//';
COMMENT ON COLUMN 	hy_user.sremark is '备注/500/';
COMMENT ON COLUMN 	hy_user.dadddate is '添加日期//';
COMMENT ON COLUMN 	hy_user.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	hy_user.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	hy_user.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	hy_user.dlastloginsuccessdate is '最后登录成功日期//';
COMMENT ON COLUMN 	hy_actor.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_actor.srolename is '角色名称/50/';
COMMENT ON COLUMN 	hy_actor.iroletype is '角色类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/';
COMMENT ON COLUMN 	hy_actor.smemberid is '会员ID/32/如果角色类型为0，会员ID无效';
COMMENT ON COLUMN 	hy_actor.suserid is '操作员/32/';
COMMENT ON COLUMN 	hy_actor.dinputdate is '创建日期//';
COMMENT ON COLUMN 	hy_actor.sremark is '备注/2000/';
COMMENT ON COLUMN 	hy_actor.isortno is '排序号//';
COMMENT ON COLUMN 	hy_actor.dadddate is '添加日期//';
COMMENT ON COLUMN 	hy_actor.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	hy_actor.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	hy_actor.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	hy_actor.bissystem is '是否系统角色/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_actor.imemberstatus is '认证类型/0:No:注册会员
2:Company:交易会员
3:VIP:挂牌交易会员
4:PROXY:合作方/';
COMMENT ON COLUMN 	hy_actor.iorgtype is '机构类型/0:HQ:总部
1:SUBBANK:分行
2:BRANCH:支行/';
COMMENT ON COLUMN 	hy_actor.bisspecial is '是否特殊/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_actor.sspecialroleid is '特殊角色id/32/';
COMMENT ON COLUMN 	hy_useractor.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_useractor.suserid is '交易员/32/';
COMMENT ON COLUMN 	hy_useractor.sroleid is '角色/32/';
COMMENT ON COLUMN 	hy_right.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_right.spurno is '权限编号/50/';
COMMENT ON COLUMN 	hy_right.spurcode is '权限码/50/根据用户登录时判断页面的操作时否显示';
COMMENT ON COLUMN 	hy_right.spurname is '权限名称/50/';
COMMENT ON COLUMN 	hy_right.ipurtype is '权限类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/0 系统
1 交易员
2 银行
3 仓库
4担保
5物流';
COMMENT ON COLUMN 	hy_right.bisroot is '是否父节点/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_right.bisleaf is '是否叶子节点/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_right.sparentid is '父权限/32/';
COMMENT ON COLUMN 	hy_right.surlpath is '访问路径//';
COMMENT ON COLUMN 	hy_right.sdescription is '权限说明/2000/';
COMMENT ON COLUMN 	hy_right.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	hy_right.spyname is '全拼名/100/';
COMMENT ON COLUMN 	hy_right.dadddate is '添加日期//';
COMMENT ON COLUMN 	hy_member.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_member.sgpmemberid is '挂牌交易会员ID/32/';
COMMENT ON COLUMN 	hy_member.bismembercert is '是否通过企业认证/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.smemberno is '企业编号/50/用来和仓储系统中的往来单位进行挂钩';
COMMENT ON COLUMN 	hy_member.scnname is '企业名称/100/';
COMMENT ON COLUMN 	hy_member.senname is '英文名称/50/';
COMMENT ON COLUMN 	hy_member.sshortname is '中文简称/50/';
COMMENT ON COLUMN 	hy_member.iregsource is '客户来源类型/1:FREEREG:自主注册
2:PARTNER:合作网站
3:OTHER:其他来源/';
COMMENT ON COLUMN 	hy_member.sagentid is '客户来源编码/32/';
COMMENT ON COLUMN 	hy_member.fbondamount is '保证金额//';
COMMENT ON COLUMN 	hy_member.bisbond is '是否已缴保证金/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.icredit is '信用值//';
COMMENT ON COLUMN 	hy_member.imembertype is '会员类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/';
COMMENT ON COLUMN 	hy_member.sbusinessmode is '经营模式/50/（关联基础数据表）

生产
贸易
服务
其他
';
COMMENT ON COLUMN 	hy_member.smemberkind is '企业性质/50/（关联基础数据表）

有限责任公司
股份有限公司
外商投资企业
外国企业常驻代表机构
外国企业分支机构
合伙企业
个人独资企业
非法人公司企业
国有企业';
COMMENT ON COLUMN 	hy_member.sbusinessno is '工商执照号/50/';
COMMENT ON COLUMN 	hy_member.sorgcode is '组织机构代码/50/';
COMMENT ON COLUMN 	hy_member.slegalpersoncode is '法定代表人身份证/50/';
COMMENT ON COLUMN 	hy_member.staxno is '税务登记号/50/';
COMMENT ON COLUMN 	hy_member.slegalperson is '法人/50/';
COMMENT ON COLUMN 	hy_member.iemployeeamount is '员工人数//';
COMMENT ON COLUMN 	hy_member.scountry is '国家/50/';
COMMENT ON COLUMN 	hy_member.sareaid is '地区区号/30/';
COMMENT ON COLUMN 	hy_member.sprovince is '省份/50/';
COMMENT ON COLUMN 	hy_member.scity is '城市/50/';
COMMENT ON COLUMN 	hy_member.sregmoneytype is '注册资金货币种类//（关联基础数据表）

1 人民币
2 美元
3 欧元
4 日元
5 其他';
COMMENT ON COLUMN 	hy_member.iregmoney is '注册资金//';
COMMENT ON COLUMN 	hy_member.sopenbank is '开户银行/50/';
COMMENT ON COLUMN 	hy_member.sopenname is '开户名称/50/';
COMMENT ON COLUMN 	hy_member.sopenaccount is '开户账号/50/';
COMMENT ON COLUMN 	hy_member.sbalancebank is '结算银行/50/（关联基础数据表）
';
COMMENT ON COLUMN 	hy_member.sbalancename is '结算户名/50/';
COMMENT ON COLUMN 	hy_member.sfax is '传真/32/';
COMMENT ON COLUMN 	hy_member.sbalanceaccount is '结算行帐号/50/';
COMMENT ON COLUMN 	hy_member.bcaflag is '是否使用CA/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.sbusbigtype is '主营行业大类/500/钢铁大类';
COMMENT ON COLUMN 	hy_member.sbussmalltype is '主营行业小类/2000/钢铁小类';
COMMENT ON COLUMN 	hy_member.sbussmallname is '主营小类名称/2000/';
COMMENT ON COLUMN 	hy_member.sregaddress is '注册地址/300/';
COMMENT ON COLUMN 	hy_member.sbusaddress is '经营地址/200/';
COMMENT ON COLUMN 	hy_member.slinkman is '联系人/100/';
COMMENT ON COLUMN 	hy_member.szipcode is '邮编/10/';
COMMENT ON COLUMN 	hy_member.sphone is '电话/20/电话有可以填多个，如果要输入多个号码，用"/"、","、";"分隔；分机号码用"-"分隔 ';
COMMENT ON COLUMN 	hy_member.smobile is '手机/20/';
COMMENT ON COLUMN 	hy_member.semail is 'Email/100/';
COMMENT ON COLUMN 	hy_member.scompanydesc is '公司简介/4000/';
COMMENT ON COLUMN 	hy_member.dvaliddate is '有效期//';
COMMENT ON COLUMN 	hy_member.imemberstatus is '状态/0:WAIT:待激活
1:CHECK:待审核
2: REJECT:被拒绝
3 :NORMAL:正常
4 :FLEEZE:冻结
5:EDIT:待完善资料/0待激活
1待审核
2 被拒绝
3 正式会员
4 冻结
5 待完善资料
';
COMMENT ON COLUMN 	hy_member.iscope is '服务范围/1:TRADE:交易:INIT/1-资讯会员
2-交易会员
3-交易会员与资讯会员
（默认为 资讯会员）';
COMMENT ON COLUMN 	hy_member.dapplydate is '申请日期//';
COMMENT ON COLUMN 	hy_member.scheckuserid is '审核人/32/';
COMMENT ON COLUMN 	hy_member.dcheckdate is '审核日期//';
COMMENT ON COLUMN 	hy_member.scheckinfo is '审核意见/2000/';
COMMENT ON COLUMN 	hy_member.sremark is '备注/2000/';
COMMENT ON COLUMN 	hy_member.bdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.sinvoicephone is '开票电话/20/';
COMMENT ON COLUMN 	hy_member.sinvoiceaddress is '开票地址/200/';
COMMENT ON COLUMN 	hy_member.slogo is '会员LOGO/300/';
COMMENT ON COLUMN 	hy_member.sweburl is '网站/300/';
COMMENT ON COLUMN 	hy_member.dadddate is '添加日期//';
COMMENT ON COLUMN 	hy_member.sadduser is '添加人/50/';
COMMENT ON COLUMN 	hy_member.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	hy_member.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	hy_member.sshortnamejpname is '简称简拼名/50/';
COMMENT ON COLUMN 	hy_member.sshortnamepyname is '简称全拼名/100/';
COMMENT ON COLUMN 	hy_member.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	hy_member.imaxoperator is '最大交易员数//';
COMMENT ON COLUMN 	hy_member.imembervisibility is '会员可见范围/0:ALL:全部  
1:AREA:区域   
2:PRODUCT:主营产品    
3:COMPANY:公司内部 
/';
COMMENT ON COLUMN 	hy_member.spyname is '全拼名/100/';
COMMENT ON COLUMN 	hy_member.iauthtype is '认证类型/0:No:注册会员
2:Company:交易会员
3:VIP:挂牌交易会员
4:PROXY:合作方/';
COMMENT ON COLUMN 	hy_member.imaxtopresource is '最大推荐资源数//';
COMMENT ON COLUMN 	hy_member.bisseller is '是否分销商/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.bisspread is '是否推广协议/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.sgpurl is '挂牌excel路径/300/';
COMMENT ON COLUMN 	hy_member.sgqurl is '资源单excel路径/300/';
COMMENT ON COLUMN 	hy_member.iintegralavailable is '当前可用积分//';
COMMENT ON COLUMN 	hy_member.iintegralamount is '总积分//';
COMMENT ON COLUMN 	hy_member.iintegralused is '已兑换积分//';
COMMENT ON COLUMN 	hy_member.sgpfilename is '挂牌excel源文件名/300/';
COMMENT ON COLUMN 	hy_member.sgqfilename is '供应excel源文件名/300/';
COMMENT ON COLUMN 	hy_member.scontractterms is '合同默认条款//';
COMMENT ON COLUMN 	hy_member.bisgangchang is '是否钢厂/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.bisbaojia is '是否报价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_member.isort is '排序号//';
COMMENT ON COLUMN 	hy_member.slocation is '地理位置/300/';
COMMENT ON COLUMN 	hy_actorright.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_actorright.sroleid is '角色ID/32/';
COMMENT ON COLUMN 	hy_actorright.spurviewid is '权限码ID/32/';
COMMENT ON COLUMN 	hy_message.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_message.ssenderid is '发送人ID/32/';
COMMENT ON COLUMN 	hy_message.isendertype is '发送人类型/0:OPERATOR:交易员
1:ADMIN:管理员/0：交易员
1：管理员';
COMMENT ON COLUMN 	hy_message.sreceiveid is '接收人ID/32/';
COMMENT ON COLUMN 	hy_message.ireceivetype is '接收人类型/0:MEMBER:会员
1:TRADER:交易员
2:ADMIN:管理员/0 交易员
1 会员
2 管理员';
COMMENT ON COLUMN 	hy_message.bisread is '是否已读/0:NO:否
1:YES:是
/0：未读
1：已读
2：已删除';
COMMENT ON COLUMN 	hy_message.dsenddatetime is '发送时间//';
COMMENT ON COLUMN 	hy_message.stitle is '标题/300/';
COMMENT ON COLUMN 	hy_message.scontext is '内容/4000/';
COMMENT ON COLUMN 	hy_message.icount is '阅读次数//';
COMMENT ON COLUMN 	hy_message.bisdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_message.bissendok is '是否已发送/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_message.sresourceid is '资源ID/32/
';
COMMENT ON COLUMN 	hy_message.sreplyid is '回复ID/32/站内信回复ID';
COMMENT ON COLUMN 	hy_memberloginlog.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_memberloginlog.suserid is '交易员ID/32/';
COMMENT ON COLUMN 	hy_memberloginlog.susername is '用户名/50/';
COMMENT ON COLUMN 	hy_memberloginlog.sip is '客户端IP/300/';
COMMENT ON COLUMN 	hy_memberloginlog.dlogintime is '登录时间//';
COMMENT ON COLUMN 	hy_memberloginlog.dlogouttime is '退出时间//';
COMMENT ON COLUMN 	hy_memberimage.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_memberimage.simageno is '图片编号/50/根据用户登录时判断页面的操作时否显示';
COMMENT ON COLUMN 	hy_memberimage.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	hy_memberimage.simagename is '图片名称/300/';
COMMENT ON COLUMN 	hy_memberimage.iimagetype is '类型/0:BUSINESSNO:营业执照副本
1:ORGCODE:组织机构代码
2:TAXNO:税务登记证副本
3:LEGALPERSONCODE:法人身份证
4:STAMPER:预留印鉴
5:COMPANYIMAGE:公司图片
6:OPENS:开户许可证
7:AUTHBOOK:授权书
8:CARDUP:身份证正面
9:CARDDOWN:身份证反面/';
COMMENT ON COLUMN 	hy_memberimage.saddress is '图片地址/300/';
COMMENT ON COLUMN 	hy_memberimage.suserid is '上传人/32/';
COMMENT ON COLUMN 	hy_memberimage.daddtime is '上传时间//';
COMMENT ON COLUMN 	hy_onlineuser.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_onlineuser.suserid is '交易员ID/32/';
COMMENT ON COLUMN 	hy_onlineuser.susername is '交易员用户名/32/';
COMMENT ON COLUMN 	hy_onlineuser.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	hy_onlineuser.imembertype is '会员类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/';
COMMENT ON COLUMN 	hy_onlineuser.sip is '登陆IP/300/';
COMMENT ON COLUMN 	hy_onlineuser.scity is '所属城市/50/';
COMMENT ON COLUMN 	hy_onlineuser.dlogintime is '登录时间//';
COMMENT ON COLUMN 	hy_onlineuser.doperatortime is '最后操作时间//';
COMMENT ON COLUMN 	hy_memberagreement.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_memberagreement.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	hy_memberagreement.iimagetype is '类型/0:BUSINESSNO:营业执照副本
1:ORGCODE:组织机构代码
2:TAXNO:税务登记证副本
3:LEGALPERSONCODE:法人身份证
4:STAMPER:预留印鉴
5:COMPANYIMAGE:公司图片
6:OPENS:开户许可证
7:AUTHBOOK:授权书
8:CARDUP:身份证正面
9:CARDDOWN:身份证反面/';
COMMENT ON COLUMN 	hy_memberagreement.sadduserid is '签署人/32/';
COMMENT ON COLUMN 	hy_memberagreement.daddtime is '签署时间//';
COMMENT ON COLUMN 	zy_saleresource.sguid is '主键/32/';
COMMENT ON COLUMN 	zy_saleresource.ixsfs is '销售方式/0:JIAN:件
1:KUNBAO:捆包/';
COMMENT ON COLUMN 	zy_saleresource.isitetype is '分站/0:GC:钢铁
1:NCP:农产品
2:YS:有色
3:SH:石化/';
COMMENT ON COLUMN 	zy_saleresource.ilight is '验证类型/0:GREEN:绿灯
1:YELLOW:黄灯
2:RED:红灯
3:BLUE:蓝灯
4:WHITE:白灯/';
COMMENT ON COLUMN 	zy_saleresource.sfriendno is '仓库资源code/50/';
COMMENT ON COLUMN 	zy_saleresource.bisprotocal is '是否协议资源/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_saleresource.sresourceno is '编号/50/';
COMMENT ON COLUMN 	zy_saleresource.sbalecode is '捆包号/50/';
COMMENT ON COLUMN 	zy_saleresource.idiscounttype is '优惠方式/0:PRICE:单价优惠
1:WEIGHT:吨位优惠/';
COMMENT ON COLUMN 	zy_saleresource.fdiscountamount is '优惠幅度//';
COMMENT ON COLUMN 	zy_saleresource.bisfixedprice is '是否一口价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_saleresource.icredit is '诚信分//';
COMMENT ON COLUMN 	zy_saleresource.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zy_saleresource.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zy_saleresource.suserid is '交易员ID/32/';
COMMENT ON COLUMN 	zy_saleresource.susername is '交易员登录名/50/';
COMMENT ON COLUMN 	zy_saleresource.smembername is '企业名称/100/';
COMMENT ON COLUMN 	zy_saleresource.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	zy_saleresource.scommoditysystemcode is '品名系统编码/100/';
COMMENT ON COLUMN 	zy_saleresource.sbigcategorysystemcode is '品种大类系统编码/100/';
COMMENT ON COLUMN 	zy_saleresource.sbigcategoryid is '品种大类ID/32/';
COMMENT ON COLUMN 	zy_saleresource.sbigcategoryname is '品种大类名称/100/';
COMMENT ON COLUMN 	zy_saleresource.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	zy_saleresource.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	zy_saleresource.scategory is '品种名称/100/';
COMMENT ON COLUMN 	zy_saleresource.scommodityname is '品名/100/';
COMMENT ON COLUMN 	zy_saleresource.slocalname is '俗名/100/';
COMMENT ON COLUMN 	zy_saleresource.senname is '英文名/300/';
COMMENT ON COLUMN 	zy_saleresource.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	zy_saleresource.sclassification is '所属分类/100/';
COMMENT ON COLUMN 	zy_saleresource.sbigpic is '大图片/300/';
COMMENT ON COLUMN 	zy_saleresource.stinypic is '小图片/300/';
COMMENT ON COLUMN 	zy_saleresource.ilcfs is '量尺方式/1:STANDARD:标准
0:NONSTANDARD:非标
/0:STANDARD:标准
1:NONSTANDARD:非标';
COMMENT ON COLUMN 	zy_saleresource.swoodlevel is '等级/300/业务参数';
COMMENT ON COLUMN 	zy_saleresource.sspec is '规格/50/';
COMMENT ON COLUMN 	zy_saleresource.sspeca is '规格参数1/50/';
COMMENT ON COLUMN 	zy_saleresource.sspecb is '规格参数2/50/';
COMMENT ON COLUMN 	zy_saleresource.sspecc is '规格参数3/50/';
COMMENT ON COLUMN 	zy_saleresource.smaterial is '材质/50/';
COMMENT ON COLUMN 	zy_saleresource.sorigincountryid is '产地国家id/32/';
COMMENT ON COLUMN 	zy_saleresource.soriginareaid is '产地地区id/32/';
COMMENT ON COLUMN 	zy_saleresource.sorigincountry is '产地国家/100/';
COMMENT ON COLUMN 	zy_saleresource.soriginarea is '产地地区/100/';
COMMENT ON COLUMN 	zy_saleresource.sbrand is '品牌/100/';
COMMENT ON COLUMN 	zy_saleresource.sproducer is '生产厂家/50/';
COMMENT ON COLUMN 	zy_saleresource.spacking is '包装/100/';
COMMENT ON COLUMN 	zy_saleresource.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	zy_saleresource.sstandard is '技术标准/50/';
COMMENT ON COLUMN 	zy_saleresource.smeasurement is '计量方式/50/';
COMMENT ON COLUMN 	zy_saleresource.dproductiondate is '生产日期//';
COMMENT ON COLUMN 	zy_saleresource.iwarranty is '质保书/0:NO:无
1:YES:有
2:UNKNOW:未知/0无，1有，2未知';
COMMENT ON COLUMN 	zy_saleresource.sprovince is '交货省份/50/';
COMMENT ON COLUMN 	zy_saleresource.scity is '交货城市/50/';
COMMENT ON COLUMN 	zy_saleresource.saddress is '交货地址/200/';
COMMENT ON COLUMN 	zy_saleresource.swarehouse is '交货仓库/100/';
COMMENT ON COLUMN 	zy_saleresource.swarehouseid is '仓库ID/32/';
COMMENT ON COLUMN 	zy_saleresource.iupdown is '涨跌//';
COMMENT ON COLUMN 	zy_saleresource.fprice is '挂牌价格//';
COMMENT ON COLUMN 	zy_saleresource.fprotocolprice is '协议价格//';
COMMENT ON COLUMN 	zy_saleresource.fbrokerage is '佣金//';
COMMENT ON COLUMN 	zy_saleresource.fweight is '重量//';
COMMENT ON COLUMN 	zy_saleresource.inumber is '件数//';
COMMENT ON COLUMN 	zy_saleresource.fnumberweight is '单件重量//';
COMMENT ON COLUMN 	zy_saleresource.fminbuyamount is '最小购买重量//';
COMMENT ON COLUMN 	zy_saleresource.denddate is '挂牌结束时间//';
COMMENT ON COLUMN 	zy_saleresource.fmatchweight is '成交量//';
COMMENT ON COLUMN 	zy_saleresource.ideliverydays is '交货期限//';
COMMENT ON COLUMN 	zy_saleresource.ddeliverydate is '交货日期//';
COMMENT ON COLUMN 	zy_saleresource.dbegindate is '挂牌日期//';
COMMENT ON COLUMN 	zy_saleresource.istatus is '状态/0:NORMAL:未挂牌
1:ONSALE:挂牌中
2:CANCEL:已撤牌
3:OVER:销售完成/';
COMMENT ON COLUMN 	zy_saleresource.bisdelete is '是否删除/0:NO:否
1:YES:是
/0：未删除
1：已删除';
COMMENT ON COLUMN 	zy_saleresource.ihitcount is '点击量//';
COMMENT ON COLUMN 	zy_saleresource.iversion is '版本号//';
COMMENT ON COLUMN 	zy_saleresource.sserviceman is '联系人/50/';
COMMENT ON COLUMN 	zy_saleresource.sservicetel is '联系电话/50/';
COMMENT ON COLUMN 	zy_saleresource.sserviceqq is '联系QQ/50/';
COMMENT ON COLUMN 	zy_saleresource.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	zy_saleresource.dadddate is '添加日期//';
COMMENT ON COLUMN 	zy_saleresource.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	zy_saleresource.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	zy_saleresource.bisspread is '是否推广/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_saleresource.bisindex is '是否首页展示/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_saleresource.bisinimage is '是否翻牌推广/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_saleresource.sdescription is '详情描述//';
COMMENT ON COLUMN 	zy_saleresource.sremark is '备注/2000/';
COMMENT ON COLUMN 	zy_saleresource.scheckresult is '审核结果/500/';
COMMENT ON COLUMN 	zy_saleresource.sinputsrc is '录入方式/0:HAND:手工录入
1:EXCEL:EXCEL导入
2:PUSH:仓库推送/';
COMMENT ON COLUMN 	hy_memberpactgroup.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_memberpactgroup.sapplymemberid is '申请会员ID/32/';
COMMENT ON COLUMN 	hy_memberpactgroup.sapplyuserid is '申请用户ID/32/';
COMMENT ON COLUMN 	hy_memberpactgroup.dapplydate is '申请时间//';
COMMENT ON COLUMN 	hy_memberpactgroup.istatus is '申请状态/0:APPLY:申请中
1:CHECKED:审核通过
2:REJECT:审核拒绝/';
COMMENT ON COLUMN 	hy_memberpactgroup.smanagerid is '组管理ID/32/';
COMMENT ON COLUMN 	hy_memberpactgroup.dcheckdate is '审核时间//';
COMMENT ON COLUMN 	hy_memberpactgroup.scheckuser is '审核人/32/';
COMMENT ON COLUMN 	hy_memberpactgroup.bisfobbiden is '是否禁用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_buyerresource.sguid is '主键/32/';
COMMENT ON COLUMN 	zy_buyerresource.bischecked is '是否已审核/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_buyerresource.sresourceno is '编号/50/';
COMMENT ON COLUMN 	zy_buyerresource.iresourcetype is '量尺方式/1:STANDARD:标准
0:NONSTANDARD:非标
/0:STANDARD:标准
1:NONSTANDARD:非标';
COMMENT ON COLUMN 	zy_buyerresource.bisfixedprice is '是否一口价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_buyerresource.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zy_buyerresource.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zy_buyerresource.suserid is '交易员ID/32/';
COMMENT ON COLUMN 	zy_buyerresource.susername is '交易员登录名/50/';
COMMENT ON COLUMN 	zy_buyerresource.smembername is '企业名称/100/';
COMMENT ON COLUMN 	zy_buyerresource.scategory is '品种/100/';
COMMENT ON COLUMN 	zy_buyerresource.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	zy_buyerresource.scommoditysystemcode is '品名系统编码/100/';
COMMENT ON COLUMN 	zy_buyerresource.sbigcategorysystemcode is '品种大类系统编码/100/';
COMMENT ON COLUMN 	zy_buyerresource.sbigcategoryid is '品种大类ID/32/';
COMMENT ON COLUMN 	zy_buyerresource.sbigcategoryname is '品种大类名称/100/';
COMMENT ON COLUMN 	zy_buyerresource.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	zy_buyerresource.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	zy_buyerresource.scommodityname is '品名/100/';
COMMENT ON COLUMN 	zy_buyerresource.slocalname is '俗名/100/';
COMMENT ON COLUMN 	zy_buyerresource.senname is '英文名/300/';
COMMENT ON COLUMN 	zy_buyerresource.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	zy_buyerresource.sclassification is '所属分类/100/';
COMMENT ON COLUMN 	zy_buyerresource.stinypic is '小图片/300/';
COMMENT ON COLUMN 	zy_buyerresource.swoodlevel is '等级/300/业务参数';
COMMENT ON COLUMN 	zy_buyerresource.sspec is '规格/50/';
COMMENT ON COLUMN 	zy_buyerresource.sspeca is '规格参数1/50/';
COMMENT ON COLUMN 	zy_buyerresource.sspecb is '规格参数2/50/';
COMMENT ON COLUMN 	zy_buyerresource.sspecc is '规格参数3/50/';
COMMENT ON COLUMN 	zy_buyerresource.smaterial is '材质/50/';
COMMENT ON COLUMN 	zy_buyerresource.sorigincountry is '产地国家/100/';
COMMENT ON COLUMN 	zy_buyerresource.soriginarea is '产地地区/100/';
COMMENT ON COLUMN 	zy_buyerresource.sbrand is '品牌/100/';
COMMENT ON COLUMN 	zy_buyerresource.sproducer is '生产厂家/50/';
COMMENT ON COLUMN 	zy_buyerresource.spacking is '包装/100/';
COMMENT ON COLUMN 	zy_buyerresource.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	zy_buyerresource.sstandard is '技术标准/50/';
COMMENT ON COLUMN 	zy_buyerresource.smeasurement is '计量方式/50/';
COMMENT ON COLUMN 	zy_buyerresource.dproductiondate is '生产日期//';
COMMENT ON COLUMN 	zy_buyerresource.iwarranty is '质保书/0:NO:无
1:YES:有
2:UNKNOW:未知/0无，1有，2未知';
COMMENT ON COLUMN 	zy_buyerresource.sprovince is '交货省份/50/';
COMMENT ON COLUMN 	zy_buyerresource.scity is '交货城市/50/';
COMMENT ON COLUMN 	zy_buyerresource.saddress is '交货地址/200/';
COMMENT ON COLUMN 	zy_buyerresource.swarehouse is '交货仓库/100/';
COMMENT ON COLUMN 	zy_buyerresource.swarehouseid is '仓库ID/32/';
COMMENT ON COLUMN 	zy_buyerresource.iupdown is '涨跌//';
COMMENT ON COLUMN 	zy_buyerresource.fprice is '挂牌价格//';
COMMENT ON COLUMN 	zy_buyerresource.fprotocolprice is '分销价格//';
COMMENT ON COLUMN 	zy_buyerresource.fbrokerage is '佣金//';
COMMENT ON COLUMN 	zy_buyerresource.fweight is '重量//';
COMMENT ON COLUMN 	zy_buyerresource.fminbuyamount is '最小购买重量//';
COMMENT ON COLUMN 	zy_buyerresource.denddate is '挂牌结束时间//';
COMMENT ON COLUMN 	zy_buyerresource.fmatchweight is '成交量//';
COMMENT ON COLUMN 	zy_buyerresource.ideliverydays is '交货期限//';
COMMENT ON COLUMN 	zy_buyerresource.ddeliverydate is '交货日期//';
COMMENT ON COLUMN 	zy_buyerresource.dbegindate is '挂牌日期//';
COMMENT ON COLUMN 	zy_buyerresource.istatus is '状态/0:WAIT:未挂单
1:APPLY:申请中
2:ONBUY:挂单中
3:OVER:采购完成
/0:APPLY:申请中
1:ONSALE:挂牌中
2:CANCEL:已撤单
3:OVER:销售完成
4:REJECT:已拒绝';
COMMENT ON COLUMN 	zy_buyerresource.bisdelete is '是否删除/0:NO:否
1:YES:是
/0：未删除
1：已删除';
COMMENT ON COLUMN 	zy_buyerresource.ihitcount is '点击量//';
COMMENT ON COLUMN 	zy_buyerresource.iversion is '版本号//';
COMMENT ON COLUMN 	zy_buyerresource.sserviceman is '联系人/50/';
COMMENT ON COLUMN 	zy_buyerresource.sservicetel is '联系电话/50/';
COMMENT ON COLUMN 	zy_buyerresource.sserviceqq is '联系QQ/50/';
COMMENT ON COLUMN 	zy_buyerresource.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	zy_buyerresource.dadddate is '添加日期//';
COMMENT ON COLUMN 	zy_buyerresource.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	zy_buyerresource.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	zy_buyerresource.bisspread is '是否推广/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_buyerresource.bisindex is '是否首页展示/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_buyerresource.bisinimage is '是否翻牌推广/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_buyerresource.sdescription is '详情描述//';
COMMENT ON COLUMN 	zy_buyerresource.sremark is '备注/2000/';
COMMENT ON COLUMN 	zy_buyerresource.scheckresult is '审核结果/500/';
COMMENT ON COLUMN 	zy_resourcecart.sguid is '主键/32/';
COMMENT ON COLUMN 	zy_resourcecart.imodeltype is '交易类型/0:SELL:卖方挂牌
1:BUY:买方采购
2:JP:竞拍
/';
COMMENT ON COLUMN 	zy_resourcecart.itradesrc is '成交来源/0:PC:PC端
1:Android:Android
2:IOS:IOS
3:WP:微软WP端
4:OTHER:其他
/';
COMMENT ON COLUMN 	zy_resourcecart.italkcount is '议价次数//';
COMMENT ON COLUMN 	zy_resourcecart.ideletetype is '删除类型/0:HAND:客户删除
1:SYSTEM:过期作废/';
COMMENT ON COLUMN 	zy_resourcecart.bisdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_resourcecart.sbuyeruserid is '买方交易员ID/32/';
COMMENT ON COLUMN 	zy_resourcecart.sbuyerusername is '买方交易员登录名/50/';
COMMENT ON COLUMN 	zy_resourcecart.sbuyermemberid is '买方会员ID/32/';
COMMENT ON COLUMN 	zy_resourcecart.sbuyermemberno is '买方会员编号/50/';
COMMENT ON COLUMN 	zy_resourcecart.sbuyermembername is '买方会员名称/300/';
COMMENT ON COLUMN 	zy_resourcecart.ssalerusername is '卖方交易员登录名/50/';
COMMENT ON COLUMN 	zy_resourcecart.ssalermemberno is '卖方会员编号/50/';
COMMENT ON COLUMN 	zy_resourcecart.ssalermembername is '卖方会员名称/300/';
COMMENT ON COLUMN 	zy_resourcecart.sselleruserid is '卖方交易员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	zy_resourcecart.ssellermemberid is '卖方会员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	zy_resourcecart.sresourceid is '挂单资源ID/32/挂牌资源GUID';
COMMENT ON COLUMN 	zy_resourcecart.inumber is '购买件数//';
COMMENT ON COLUMN 	zy_resourcecart.fweight is '购买重量//';
COMMENT ON COLUMN 	zy_resourcecart.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	zy_resourcecart.fprice is '价格//';
COMMENT ON COLUMN 	zy_resourcecart.dadddate is '添加日期//';
COMMENT ON COLUMN 	zy_resourcecart.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	zy_resourcecart.icurrentversion is '当前版本//';
COMMENT ON COLUMN 	zy_resourcecart.isitetype is '分站/0:GC:钢铁
1:NCP:农产品
2:YS:有色
3:SH:石化/';
COMMENT ON COLUMN 	dd_saleorder.sguid is '主键/32/';
COMMENT ON COLUMN 	dd_saleorder.imodeltype is '交易类型/0:SELL:卖方挂牌
1:BUY:买方采购
2:JP:竞拍
/';
COMMENT ON COLUMN 	dd_saleorder.itradesrc is '成交来源/0:PC:PC端
1:Android:Android
2:IOS:IOS
3:WP:微软WP端
4:OTHER:其他
/';
COMMENT ON COLUMN 	dd_saleorder.sgpmemberid is '挂牌交易会员Id/32/';
COMMENT ON COLUMN 	dd_saleorder.sbuyeruserid is '买方交易员ID/32/';
COMMENT ON COLUMN 	dd_saleorder.sbuyerusername is '买方交易员登录名/50/';
COMMENT ON COLUMN 	dd_saleorder.sbuyermemberid is '买方会员ID/32/';
COMMENT ON COLUMN 	dd_saleorder.sbuyermemberno is '买方会员编号/50/';
COMMENT ON COLUMN 	dd_saleorder.sbuyermembername is '买方会员名称/300/';
COMMENT ON COLUMN 	dd_saleorder.ssalerusername is '卖方交易员登录名/50/';
COMMENT ON COLUMN 	dd_saleorder.ssalermemberno is '卖方会员编号/50/';
COMMENT ON COLUMN 	dd_saleorder.ssalermembername is '卖方会员名称/300/';
COMMENT ON COLUMN 	dd_saleorder.sselleruserid is '卖方交易员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	dd_saleorder.ssellermemberid is '卖方会员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	dd_saleorder.sorderno is '订单编号/50/';
COMMENT ON COLUMN 	dd_saleorder.scontractcustno is '自定义合同号/50/';
COMMENT ON COLUMN 	dd_saleorder.scontractno is '合同编号/50/';
COMMENT ON COLUMN 	dd_saleorder.sfundaccountbanktype is '保证金账户银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	dd_saleorder.sfundaccountid is '保证金账户id/32/';
COMMENT ON COLUMN 	dd_saleorder.fbondamount is '保证金额//';
COMMENT ON COLUMN 	dd_saleorder.bisbond is '是否已缴保证金/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	dd_saleorder.ftotalamount is '订单总金额//';
COMMENT ON COLUMN 	dd_saleorder.ftotalweight is '总重量//';
COMMENT ON COLUMN 	dd_saleorder.fcurrenttotalamount is '订单当前总金额//';
COMMENT ON COLUMN 	dd_saleorder.fcurrenttotalweight is '订单当前总重量//';
COMMENT ON COLUMN 	dd_saleorder.iorderstatus is '订单状态/0:TALKING:洽谈中
1:CONTRACTOK:已生成合同
2:CANCEL:作废/';
COMMENT ON COLUMN 	dd_saleorder.sprovince is '交货省份/50/';
COMMENT ON COLUMN 	dd_saleorder.dorderdate is '订单签订日期//';
COMMENT ON COLUMN 	dd_saleorder.stoaccountname is '收款帐户户名/300/';
COMMENT ON COLUMN 	dd_saleorder.stoaccountaddr is '收款帐户开户地址/200/';
COMMENT ON COLUMN 	dd_saleorder.stoaccountno is '收款帐户帐号/50/';
COMMENT ON COLUMN 	dd_saleorder.sothersreceipt is '其他收款方式/300/';
COMMENT ON COLUMN 	dd_saleorder.scity is '交货城市/50/';
COMMENT ON COLUMN 	dd_saleorder.saddress is '交货地址/200/';
COMMENT ON COLUMN 	dd_saleorder.swarehouse is '交货仓库/100/';
COMMENT ON COLUMN 	dd_saleorder.ideliverydays is '交货期限//';
COMMENT ON COLUMN 	dd_saleorder.ddeliverydate is '交货日期//';
COMMENT ON COLUMN 	dd_saleorder.swarehouseid is '交货仓库ID/32/';
COMMENT ON COLUMN 	dd_saleorder.ifullorbatch is '全款/分批/0:FULL:全款
1:BATCH:分批/0全款/分批 默认为全款
1如果是分批则出现付款比例';
COMMENT ON COLUMN 	dd_saleorder.ipaytype is '支付类型/10:SOP:在线支付
20:OFFLINE:线下支付
/';
COMMENT ON COLUMN 	dd_saleorder.sterms is '补充条款//';
COMMENT ON COLUMN 	dd_saleorder.dpaymentenddate is '付款有效日期//';
COMMENT ON COLUMN 	dd_saleorder.sremark is '备注/2000/';
COMMENT ON COLUMN 	dd_saleorder.sbuyersigned is '买方签名/512/';
COMMENT ON COLUMN 	dd_saleorder.ssellersigned is '卖方签名/512/';
COMMENT ON COLUMN 	dd_saleorder.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	dd_saleorder.dadddate is '添加日期//';
COMMENT ON COLUMN 	dd_saleorder.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	dd_saleorder.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	dd_saleorder.iversion is '版本号//';
COMMENT ON COLUMN 	dd_saleorder.dconfirmdate is '确认日期//';
COMMENT ON COLUMN 	dd_saleorder.bisbuyerconfirm is '买方是否已确认/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	dd_saleorder.sbuyerconfirmoperatorid is '买方确认人/32/';
COMMENT ON COLUMN 	dd_saleorder.dbuyerconfirmdate is '买方确认时间//';
COMMENT ON COLUMN 	dd_saleorder.bissellerconfirm is '卖方是否已确认/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	dd_saleorder.ssellerconfirmoperatorid is '卖方确认人/32/';
COMMENT ON COLUMN 	dd_saleorder.dsellerconfirmdate is '卖方确认时间//';
COMMENT ON COLUMN 	dd_saleorder.iordercanceltype is '作废类型/0:NONE:没作废
1:BUYERCANCEL:买方作废
2:SELLERCANCEL:卖方作废
3:GPCANCEL:撤牌作废
4:TIMEOUTCANCEL:过期作废/';
COMMENT ON COLUMN 	dd_saleorder.ssignaddress is '签署地/50/';
COMMENT ON COLUMN 	dd_saleorder.bissendbyseemoney is '是否款到发货/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	dd_saleorder.bisviewgoodsapply is '是否申请看货/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contract.sguid is '主键/32/';
COMMENT ON COLUMN 	ht_contract.scontractno is '合同编号/50/';
COMMENT ON COLUMN 	ht_contract.sorderid is '订单ID/32/';
COMMENT ON COLUMN 	ht_contract.sbuyeruserid is '买方交易员ID/32/';
COMMENT ON COLUMN 	ht_contract.sbuyersname is '买方交易员姓名/50/';
COMMENT ON COLUMN 	ht_contract.sbuyerusername is '买方交易员用户名/50/';
COMMENT ON COLUMN 	ht_contract.sbuyermemberid is '买方会员ID/32/';
COMMENT ON COLUMN 	ht_contract.sbuyermemberno is '买方企业编号/50/';
COMMENT ON COLUMN 	ht_contract.sbuyermembername is '买方企业全称/100/';
COMMENT ON COLUMN 	ht_contract.sbuyermemberphone is '买方企业电话/20/电话有可以填多个，如果要输入多个号码，用"/"、","、";"分隔；分机号码用"-"分隔 ';
COMMENT ON COLUMN 	ht_contract.sselleruserid is '卖方交易员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	ht_contract.ssellername is '卖方交易员姓名/50/';
COMMENT ON COLUMN 	ht_contract.ssellerusername is '卖方交易员用户名/50/';
COMMENT ON COLUMN 	ht_contract.ssellermemberid is '卖方会员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	ht_contract.ssellermemberno is '卖方会员编号/50/';
COMMENT ON COLUMN 	ht_contract.ssellermembername is '卖方企业名称/100/';
COMMENT ON COLUMN 	ht_contract.ssellermemberphone is '卖方企业电话/20/电话有可以填多个，如果要输入多个号码，用"/"、","、";"分隔；分机号码用"-"分隔 ';
COMMENT ON COLUMN 	ht_contract.imodeltype is '交易模式/0:SELL:卖方挂牌
1:BUY:买方采购
2:JP:竞拍
/0 卖挂牌
1 买挂牌
2 招标
3 统购分销';
COMMENT ON COLUMN 	ht_contract.dcontractdate is '成交日期//';
COMMENT ON COLUMN 	ht_contract.sprovince is '交货省份/50/';
COMMENT ON COLUMN 	ht_contract.scity is '交货城市/50/';
COMMENT ON COLUMN 	ht_contract.swarehouse is '交货仓库/100/';
COMMENT ON COLUMN 	ht_contract.swarehouseid is '交货仓库ID/32/';
COMMENT ON COLUMN 	ht_contract.saddress is '交货地址/200/';
COMMENT ON COLUMN 	ht_contract.ddeliverydate is '交货日期//';
COMMENT ON COLUMN 	ht_contract.stoaccountname is '收款帐户户名/300/';
COMMENT ON COLUMN 	ht_contract.stoaccountaddr is '收款帐户开户地址/200/';
COMMENT ON COLUMN 	ht_contract.stoaccountno is '收款帐户帐号/50/';
COMMENT ON COLUMN 	ht_contract.sothersreceipt is '其他收款方式/300/';
COMMENT ON COLUMN 	ht_contract.ifullorbatch is '全款/分批/0:FULL:全款
1:BATCH:分批/0全款
1分批 
默认为全款
如果是分批则出现付款比例';
COMMENT ON COLUMN 	ht_contract.sterms is '补充条款//';
COMMENT ON COLUMN 	ht_contract.iinvoicetype is '开发票类型/0:NONE:未开票
1:PROMISE:发票承诺
2:INVOICE:发票通知/0:NONE:未开票
1:PROMISE:发票承诺
2:INVOICE:发票通知';
COMMENT ON COLUMN 	ht_contract.ideliverystatus is '交收状态/100:gBUYER_PAY:等待买方付款
200:bSELLER_SEND:等待卖方发货
201:bBUYER_TAKE:等待买方收货
202:bBUYER_REPAY:等待买方补款
300:gBUYER_INVOICE:等待买方收票
400:gFINISH:交收完成/100等待买方付款
300等待卖方发货
310等待买方收货
320等待双方确认交收完成
330等待卖方确认交收完成
340等待买方确认交收完成
210等待买方开提单
220等待买方出库
225等待仓库出库
226等待买方确认过户量
230等待买方确认出库量
240等待卖方确认
150等待卖方开票
160等待买方确认收票
170交收完成
注：
1开头 共用的状态
2开头 实物仓单类型合同
3开头 保证金仓单类型合同';
COMMENT ON COLUMN 	ht_contract.ipaymentstatus is '付款状态/0:NOTPAY:未付款
1:PAID:已付款
2:ADDPAY:待补款/';
COMMENT ON COLUMN 	ht_contract.icontractstatus is '合同状态/0:OK:正常
1:PAUSE:暂停
9:OVER:终止/0正常
1买方异议
2卖方异议
3终止';
COMMENT ON COLUMN 	ht_contract.icontracttype is '合同类型/0:COMMON:普通合同
1:PROTOCOL:协议交收/';
COMMENT ON COLUMN 	ht_contract.ipaytype is '支付类型/10:SOP:在线支付
20:OFFLINE:线下支付
/';
COMMENT ON COLUMN 	ht_contract.sremark is '备注/2000/';
COMMENT ON COLUMN 	ht_contract.sfundaccountbanktype is '保证金账户银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	ht_contract.sfundaccountid is '保证金账户id/32/';
COMMENT ON COLUMN 	ht_contract.fbondamount is '保证金额//';
COMMENT ON COLUMN 	ht_contract.bisbond is '是否已缴保证金/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contract.ftotalamount is '合同总额//';
COMMENT ON COLUMN 	ht_contract.ftotalweight is '总重量//';
COMMENT ON COLUMN 	ht_contract.fsellerreceivable is '卖方应收款//';
COMMENT ON COLUMN 	ht_contract.fsellerreceived is '卖方已收款//';
COMMENT ON COLUMN 	ht_contract.sselleraccountid is '卖方收款账户ID/32/';
COMMENT ON COLUMN 	ht_contract.sbuyeraccountid is '买方付款账户ID/32/';
COMMENT ON COLUMN 	ht_contract.fbuyerlockable is '买方应锁款//';
COMMENT ON COLUMN 	ht_contract.fbuyerlocked is '买方已锁款//';
COMMENT ON COLUMN 	ht_contract.fbuyerpaid is '买方已付款//';
COMMENT ON COLUMN 	ht_contract.fdeliveryfund is '实际交收金额//';
COMMENT ON COLUMN 	ht_contract.fdeliveryweight is '实际交收总量//';
COMMENT ON COLUMN 	ht_contract.frefund is '实际退款额//';
COMMENT ON COLUMN 	ht_contract.faddamount is '补款金额//';
COMMENT ON COLUMN 	ht_contract.bissellerjudge is '卖方是否已评价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contract.bisbuyerjudge is '是否买方已评价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contract.sdeliveryoverbuyer is '买方确认交货完成人/50/';
COMMENT ON COLUMN 	ht_contract.sdeliveryoverseller is '卖方确认交货完成人/50/';
COMMENT ON COLUMN 	ht_contract.sbuyerdeliveryoverdate is '买方确认交货完成日期//';
COMMENT ON COLUMN 	ht_contract.ssellerdeliveryoverdate is '卖方确认交货完成日期//';
COMMENT ON COLUMN 	ht_contract.doutweightoverdate is '出库/过户确认日期//';
COMMENT ON COLUMN 	ht_contract.dfinishdate is '合同完成日期//';
COMMENT ON COLUMN 	ht_contract.sbuysigner is '买方签名人/50/';
COMMENT ON COLUMN 	ht_contract.ssellsigneder is '卖方签名人/50/';
COMMENT ON COLUMN 	ht_contract.sbuyersigned is '买方签名/512/';
COMMENT ON COLUMN 	ht_contract.ssellersigned is '卖方签名/512/';
COMMENT ON COLUMN 	ht_contract.dbuyersigneddate is '买方签名日期//';
COMMENT ON COLUMN 	ht_contract.dsellersigneddate is '卖方签名日期//';
COMMENT ON COLUMN 	ht_contract.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	ht_contract.dadddate is '添加日期//';
COMMENT ON COLUMN 	ht_contract.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	ht_contract.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	ht_contract.icurrentversion is '订单版本号//';
COMMENT ON COLUMN 	ht_contract.iversion is '版本号//';
COMMENT ON COLUMN 	ht_contract.spaymentstoreid is '付款凭证/32/';
COMMENT ON COLUMN 	ht_contract.scontractcustno is '自定义合同号/50/';
COMMENT ON COLUMN 	ht_contract.ssignaddress is '签署地/50/';
COMMENT ON COLUMN 	ht_contract.bissendbyseemoney is '是否款到发货/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contract.bisbyjp is '是否竞拍合同/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contractdetail.sguid is '主键/32/';
COMMENT ON COLUMN 	ht_contractdetail.scontractid is '合同ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.scartid is '购物车ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.sresourceid is '挂单资源ID/32/挂牌资源GUID';
COMMENT ON COLUMN 	ht_contractdetail.sresourceno is '挂单资源编号/50/';
COMMENT ON COLUMN 	ht_contractdetail.ixsfs is '销售方式/0:JIAN:件
1:KUNBAO:捆包/';
COMMENT ON COLUMN 	ht_contractdetail.isitetype is '分站/0:GC:钢铁
1:NCP:农产品
2:YS:有色
3:SH:石化/';
COMMENT ON COLUMN 	ht_contractdetail.ilight is '验证类型/0:GREEN:绿灯
1:YELLOW:黄灯
2:RED:红灯
3:BLUE:蓝灯
4:WHITE:白灯/';
COMMENT ON COLUMN 	ht_contractdetail.sfriendno is '仓库资源code/50/';
COMMENT ON COLUMN 	ht_contractdetail.bisprotocal is '是否协议资源/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contractdetail.sresourceno2 is '编号/50/';
COMMENT ON COLUMN 	ht_contractdetail.sbalecode is '捆包号/50/';
COMMENT ON COLUMN 	ht_contractdetail.idiscounttype is '优惠方式/0:PRICE:单价优惠
1:WEIGHT:吨位优惠/';
COMMENT ON COLUMN 	ht_contractdetail.fdiscountamount is '优惠幅度//';
COMMENT ON COLUMN 	ht_contractdetail.bisfixedprice is '是否一口价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ht_contractdetail.icredit is '诚信分//';
COMMENT ON COLUMN 	ht_contractdetail.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	ht_contractdetail.suserid is '交易员ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.susername is '交易员登录名/50/';
COMMENT ON COLUMN 	ht_contractdetail.smembername is '企业名称/100/';
COMMENT ON COLUMN 	ht_contractdetail.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	ht_contractdetail.scommoditysystemcode is '品名系统编码/100/';
COMMENT ON COLUMN 	ht_contractdetail.sbigcategorysystemcode is '品种大类系统编码/100/';
COMMENT ON COLUMN 	ht_contractdetail.sbigcategoryid is '品种大类ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.sbigcategoryname is '品种大类名称/100/';
COMMENT ON COLUMN 	ht_contractdetail.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.scategory is '品种名称/100/';
COMMENT ON COLUMN 	ht_contractdetail.scommodityname is '品名/100/';
COMMENT ON COLUMN 	ht_contractdetail.slocalname is '俗名/100/';
COMMENT ON COLUMN 	ht_contractdetail.senname is '英文名/300/';
COMMENT ON COLUMN 	ht_contractdetail.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	ht_contractdetail.sclassification is '所属分类/100/';
COMMENT ON COLUMN 	ht_contractdetail.sbigpic is '大图片/300/';
COMMENT ON COLUMN 	ht_contractdetail.stinypic is '小图片/300/';
COMMENT ON COLUMN 	ht_contractdetail.ilcfs is '量尺方式/1:STANDARD:标准
0:NONSTANDARD:非标
/0:STANDARD:标准
1:NONSTANDARD:非标';
COMMENT ON COLUMN 	ht_contractdetail.swoodlevel is '等级/300/业务参数';
COMMENT ON COLUMN 	ht_contractdetail.sspec is '规格/50/';
COMMENT ON COLUMN 	ht_contractdetail.sspeca is '规格参数1/50/';
COMMENT ON COLUMN 	ht_contractdetail.sspecb is '规格参数2/50/';
COMMENT ON COLUMN 	ht_contractdetail.sspecc is '规格参数3/50/';
COMMENT ON COLUMN 	ht_contractdetail.smaterial is '材质/50/';
COMMENT ON COLUMN 	ht_contractdetail.sorigincountryid is '产地国家id/32/';
COMMENT ON COLUMN 	ht_contractdetail.soriginareaid is '产地地区id/32/';
COMMENT ON COLUMN 	ht_contractdetail.sorigincountry is '产地国家/100/';
COMMENT ON COLUMN 	ht_contractdetail.soriginarea is '产地地区/100/';
COMMENT ON COLUMN 	ht_contractdetail.sbrand is '品牌/100/';
COMMENT ON COLUMN 	ht_contractdetail.sproducer is '生产厂家/50/';
COMMENT ON COLUMN 	ht_contractdetail.spacking is '包装/100/';
COMMENT ON COLUMN 	ht_contractdetail.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	ht_contractdetail.sstandard is '技术标准/50/';
COMMENT ON COLUMN 	ht_contractdetail.smeasurement is '计量方式/50/';
COMMENT ON COLUMN 	ht_contractdetail.dproductiondate is '生产日期//';
COMMENT ON COLUMN 	ht_contractdetail.iwarranty is '质保书/0:NO:无
1:YES:有
2:UNKNOW:未知/0无，1有，2未知';
COMMENT ON COLUMN 	ht_contractdetail.sprovince is '交货省份/50/';
COMMENT ON COLUMN 	ht_contractdetail.scity is '交货城市/50/';
COMMENT ON COLUMN 	ht_contractdetail.saddress is '交货地址/200/';
COMMENT ON COLUMN 	ht_contractdetail.swarehouse is '交货仓库/100/';
COMMENT ON COLUMN 	ht_contractdetail.swarehouseid is '仓库ID/32/';
COMMENT ON COLUMN 	ht_contractdetail.iupdown is '涨跌//';
COMMENT ON COLUMN 	ht_contractdetail.fprice is '挂牌价格//';
COMMENT ON COLUMN 	ht_contractdetail.fprotocolprice is '协议价格//';
COMMENT ON COLUMN 	ht_contractdetail.fbrokerage is '佣金//';
COMMENT ON COLUMN 	ht_contractdetail.fweight is '重量//';
COMMENT ON COLUMN 	ht_contractdetail.inumber is '件数//';
COMMENT ON COLUMN 	ht_contractdetail.fnumberweight is '单件重量//';
COMMENT ON COLUMN 	ht_contractdetail.foutweight is '交收数量//';
COMMENT ON COLUMN 	ht_contractdetail.foutprice is '交收单价//';
COMMENT ON COLUMN 	ht_contractdetail.foutamount is '交收总额//';
COMMENT ON COLUMN 	ht_contractdetail.faddprice is '补款金额//';
COMMENT ON COLUMN 	ht_contractdetail.sindentureremark is '仓库备注/2000/';
COMMENT ON COLUMN 	ht_contractdetail.dadddate is '添加日期//';
COMMENT ON COLUMN 	ht_contractdetail.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	ht_contractdetail.fcontractfeescale is '合同手续费率//';
COMMENT ON COLUMN 	ht_contractdetail.fgpfeescale is '挂牌佣金费率//';
COMMENT ON COLUMN 	ht_contractdetail.fproxyfeescale is '代理佣金费率//';
COMMENT ON COLUMN 	ds_periodjob.sguid is '主键/32/';
COMMENT ON COLUMN 	ds_periodjob.sjobno is '定时任务编号/50/';
COMMENT ON COLUMN 	ds_periodjob.sname is '定时任务名称/50/';
COMMENT ON COLUMN 	ds_periodjob.itasktype is '任务类型/10:Settle:结算
11:CloseExchange:闭市
12:OpenExchange:开市
13:MatchJp:竞拍匹配成交
40:CCB_OPMATCH:建行签约对账
41:CCB_TRADEMATCH:建行交易对账
42:CCB_BALANCEMATCH:建行余额对账/发会员消息
发系统消息';
COMMENT ON COLUMN 	ds_periodjob.iperiodtype is '周期类型/0:EVERY_DAY:每天定时
1:EVERY_WORK_DAY:工作日定时
2:EVERY_WEEK:每周定时
3:EVERY_MONTH:每月定时
4:EVERY_YEAR:每年定时
5:EVERY_HOUR:每小时定时
6:EVERY_MINUTE:分钟定时/0 每天
1 星期一
2星期二';
COMMENT ON COLUMN 	ds_periodjob.iperiod is '周期//';
COMMENT ON COLUMN 	ds_periodjob.sparameter is '其他参数/2000/';
COMMENT ON COLUMN 	ds_periodjob.dplanexectime is '计划运行时间//';
COMMENT ON COLUMN 	ds_periodjob.bisforbidden is '是否禁用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ds_periodjob.dadddate is '添加日期//';
COMMENT ON COLUMN 	ds_periodjob.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	ds_periodjob.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	ds_periodjob.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	ds_periodjob.bisdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ds_periodjob.bisfailstop is '是否失败终止/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ds_periodjob.sremark is '备注/2000/';
COMMENT ON COLUMN 	ds_periodjoblog.sguid is '主键/32/';
COMMENT ON COLUMN 	ds_periodjoblog.sjobid is '定时任务ID/50/';
COMMENT ON COLUMN 	ds_periodjoblog.dexectime is '实际运行时间//';
COMMENT ON COLUMN 	ds_periodjoblog.iperiod is '周期//';
COMMENT ON COLUMN 	ds_periodjoblog.iperiodtype is '周期类型/0:EVERY_DAY:每天定时
1:EVERY_WORK_DAY:工作日定时
2:EVERY_WEEK:每周定时
3:EVERY_MONTH:每月定时
4:EVERY_YEAR:每年定时
5:EVERY_HOUR:每小时定时
6:EVERY_MINUTE:分钟定时/0 每天
1 星期一
2星期二';
COMMENT ON COLUMN 	ds_periodjoblog.itasktype is '任务类型/0:SEND_MEMBER_MESSAGE:发会员消息
1:SEND_ADMIN_MESSAGE:发系统管理员消息
2:RUN_PROCEDURE:定时运行存储过程

/发会员消息
发系统消息';
COMMENT ON COLUMN 	ds_periodjoblog.sname is '定时任务名称/50/';
COMMENT ON COLUMN 	ds_periodjoblog.sjobno is '定时任务编号/50/';
COMMENT ON COLUMN 	ds_periodjoblog.sparameter is '其他参数/2000/';
COMMENT ON COLUMN 	ds_periodjoblog.dplanexectime is '计划运行时间//';
COMMENT ON COLUMN 	ds_periodjoblog.bisfailstop is '是否失败终止/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ds_periodjoblog.sremark is '备注/2000/';
COMMENT ON COLUMN 	cx_infosendlog.sguid is '主键/32/';
COMMENT ON COLUMN 	cx_infosendlog.sinfoid is '信息ID/50/';
COMMENT ON COLUMN 	cx_infosendlog.iinfotype is '信息类型/0 :SMS:短信
1 :SITE:站内信/0 短信
1 邮件
2 彩信
3传真 
';
COMMENT ON COLUMN 	cx_infosendlog.dsendtime is '发送时间//';
COMMENT ON COLUMN 	cx_infosendlog.bissuccess is '发送是否 成功/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	cx_infosendlog.schannel is '通道/0:NULL:无
1:SHENZHEN: 深圳通道
2:GUANGZHOU:广州通道/';
COMMENT ON COLUMN 	cx_infosendlog.soperator is '接收人/50/';
COMMENT ON COLUMN 	cx_infosendlog.scontext is '发送内容//';
COMMENT ON COLUMN 	cx_infosendlog.sremark is '备注/1000/';
COMMENT ON COLUMN 	cx_infoconfigdetail.sguid is '主键/32/';
COMMENT ON COLUMN 	cx_infoconfigdetail.sconfigid is '主表ID/32/';
COMMENT ON COLUMN 	cx_infoconfigdetail.iinfotype is '信息类型/0 :SMS:短信
1 :SITE:站内信/';
COMMENT ON COLUMN 	cx_infoconfigdetail.stitlepath is '标题路径/300/';
COMMENT ON COLUMN 	cx_infoconfigdetail.stemplatepath is '模板路径//';
COMMENT ON COLUMN 	cx_infoconfigdetail.sattachpath is '附件路径/300/';
COMMENT ON COLUMN 	cx_infoconfigdetail.sremark is '备注/500/';
COMMENT ON COLUMN 	cx_infoconfigdetail.bissend is '是否发送/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	cx_infoconfigdetail.isort is '排序号//';
COMMENT ON COLUMN 	cx_infoconfig.sguid is '主键/32/';
COMMENT ON COLUMN 	cx_infoconfig.ssendno is '节点编号/50/';
COMMENT ON COLUMN 	cx_infoconfig.sname is '节点名称/100/0 短信
1 邮件
2 彩信
3传真 
';
COMMENT ON COLUMN 	cx_infoconfig.bissysbranch is '是否系统节点/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	cx_infoconfig.sremark is '备注/4000/';
COMMENT ON COLUMN 	cx_membertypetransfer.sguid is '主键/32/';
COMMENT ON COLUMN 	cx_membertypetransfer.stransferid is '传信节点ID/32/';
COMMENT ON COLUMN 	cx_membertypetransfer.imembertype is '会员类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/';
COMMENT ON COLUMN 	xy_membercreditlevel.sguid is '主键/32/';
COMMENT ON COLUMN 	xy_membercreditlevel.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	xy_membercreditlevel.slevelid is '信用等级ID/32/0：无权限限制路径
1：不需登录路径';
COMMENT ON COLUMN 	xy_membercreditlevel.ibuyerorseller is '买卖方/0:BUYER:买方
1:SELLER:卖方/0 buyer
1 seller';
COMMENT ON COLUMN 	xy_membercreditlevel.iokcount is '好评次数//';
COMMENT ON COLUMN 	xy_membercreditlevel.itotalokcount is '总评数//';
COMMENT ON COLUMN 	xy_membercreditlevel.ftotalpoint is '会员总分//';
COMMENT ON COLUMN 	xy_creditlevel.sguid is '主键/32/';
COMMENT ON COLUMN 	xy_creditlevel.slevelno is '等级编号/50/';
COMMENT ON COLUMN 	xy_creditlevel.sname is '等级名称/50/';
COMMENT ON COLUMN 	xy_creditlevel.ibeginpoint is '开始分数//0：无权限限制路径
1：不需登录路径';
COMMENT ON COLUMN 	xy_creditlevel.iendpoint is '结束分数//';
COMMENT ON COLUMN 	xy_creditlevel.spath is '图片路径/300/';
COMMENT ON COLUMN 	xy_credittarget.sguid is '主键/32/';
COMMENT ON COLUMN 	xy_credittarget.sname is '指标名/50/';
COMMENT ON COLUMN 	xy_credittarget.sremark is '指标说明/500/';
COMMENT ON COLUMN 	xy_credittarget.fweight is '权重//';
COMMENT ON COLUMN 	xy_credittarget.ibuyerorseller is '买卖方/0:BUYER:买方
1:SELLER:卖方/0 buyer
1 seller';
COMMENT ON COLUMN 	xy_credittarget.ipointa is '分值A//';
COMMENT ON COLUMN 	xy_credittarget.ipointb is '分值B//';
COMMENT ON COLUMN 	xy_credittarget.ipointc is '分值C//';
COMMENT ON COLUMN 	xy_membercontractpointdetail.sguid is '主键/32/';
COMMENT ON COLUMN 	xy_membercontractpointdetail.scontractpointid is '得分总表ID/32/';
COMMENT ON COLUMN 	xy_membercontractpointdetail.scommentmemberid is '评分会员ID/32/';
COMMENT ON COLUMN 	xy_membercontractpointdetail.stargetid is '指标ID/32/0：无权限限制路径
1：不需登录路径';
COMMENT ON COLUMN 	xy_membercontractpointdetail.ibuyerorseller is '买卖方/0:BUYER:买方
1:SELLER:卖方/0 buyer
1 seller';
COMMENT ON COLUMN 	xy_membercontractpointdetail.soperatorid is '评分交易员ID/32/';
COMMENT ON COLUMN 	xy_membercontractpointdetail.smemberid is '得分会员ID/32/';
COMMENT ON COLUMN 	xy_membercontractpointdetail.fpoint is '得分//';
COMMENT ON COLUMN 	xy_membercontractpointdetail.fweight is '权重//';
COMMENT ON COLUMN 	xy_membercontractpointdetail.fendpoint is '最后得分//';
COMMENT ON COLUMN 	xy_membercontractpoint.sguid is '主键/32/';
COMMENT ON COLUMN 	xy_membercontractpoint.scontractid is '合同ID/32/';
COMMENT ON COLUMN 	xy_membercontractpoint.ibuyerorseller is '买卖方/0:BUYER:买方
1:SELLER:卖方/0 buyer
1 seller';
COMMENT ON COLUMN 	xy_membercontractpoint.soperatorid is '评分交易员ID/32/';
COMMENT ON COLUMN 	xy_membercontractpoint.smemberid is '得分会员ID/32/';
COMMENT ON COLUMN 	xy_membercontractpoint.fpoint is '得分//';
COMMENT ON COLUMN 	xy_membercontractpoint.ilevel is '等级/3:BEST:好评
1:MIDDLE:中评
0:BAD:差评/';
COMMENT ON COLUMN 	xy_membercontractpoint.ddate is '评价时间//';
COMMENT ON COLUMN 	xy_membercontractpoint.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	xy_membercontractpoint.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	xy_membercontractpoint.scontent is '评价内容/2000/';
COMMENT ON COLUMN 	xy_membercontractpoint.scommentmemberid is '评分会员ID/32/';
COMMENT ON COLUMN 	xy_membercontractpoint.bisanonymity is '是否匿名评价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_integrallog.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_integrallog.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	hy_integrallog.iintegraloperator is '积分操作/0:Add:增加
1:Sub:减少/';
COMMENT ON COLUMN 	hy_integrallog.iintegral is '积分//';
COMMENT ON COLUMN 	hy_integrallog.sinfo is '积分描述/500/';
COMMENT ON COLUMN 	hy_integrallog.saddoperator is '操作人/50/';
COMMENT ON COLUMN 	hy_integrallog.dadddate is '操作时间//';
COMMENT ON COLUMN 	hy_integrallog.iintegralavailable is '当前可用积分//';
COMMENT ON COLUMN 	hy_integrallog.iintegralamount is '总积分//';
COMMENT ON COLUMN 	hy_integrallog.iintegralused is '已兑换积分//';
COMMENT ON COLUMN 	hy_integrallog.iintegraltype is '积分类型/0:JF0000:注册
1:JF0001:登录
2:JF0002:个人信息完善
3:JF0003:企业信息完善
4:JF0004:个人身份认证
5:JF0005:认证为企业
6:JF0006:申请为销客
7:JF0007:导入挂牌资源
8:JF0008:勾选挂牌资源推广
9:JF0009:增加单条挂牌资源
10:JF0010:生成合同
11:JF0011:买家上传付款凭证
12:JF0012:买家收货确认
13:JF0013:买家评价卖家
14:JF0014:卖家评价买家
15:JF0015:手工录入求购信息
16:JF0016:手工录入资源单
17:JF0017:excel导入资源单
19:JF0019:销客收藏推广资源
20:JF0020:后台设置企业卖家为VIP卖家
21:JF0021:普通卖家申请成为VIP卖家协议户
22:JF0022:普通卖家excel下载VIP卖家销售资源
23:JF0023:融资资格申请
24:JF0024:订单生成
/';
COMMENT ON COLUMN 	bj_categoryprice.sguid is '主键/32/';
COMMENT ON COLUMN 	bj_categoryprice.scategory is '品种名称/50/';
COMMENT ON COLUMN 	bj_categoryprice.dlastdate is '最后报价日期//';
COMMENT ON COLUMN 	bj_categoryprice.isort is '排序//';
COMMENT ON COLUMN 	bj_categoryprice.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	bj_categoryprice.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	bj_categorypricedetail.sguid is '主键/32/';
COMMENT ON COLUMN 	bj_categorypricedetail.scategoryid is '报价品种ID/32/';
COMMENT ON COLUMN 	bj_categorypricedetail.svariety is '品种/50/';
COMMENT ON COLUMN 	bj_categorypricedetail.scommodityname is '品名/50/';
COMMENT ON COLUMN 	bj_categorypricedetail.sspec is '规格/50/';
COMMENT ON COLUMN 	bj_categorypricedetail.smaterial is '材质/50/';
COMMENT ON COLUMN 	bj_categorypricedetail.sproducer is '产地/50/';
COMMENT ON COLUMN 	bj_categorypricedetail.fprice is '价格//';
COMMENT ON COLUMN 	bj_categorypricedetail.dpricedate is '报价日期//';
COMMENT ON COLUMN 	bj_categorypricedetail.isort is '序号//';
COMMENT ON COLUMN 	bj_categorypricedetailhis.sguid is '主键/32/';
COMMENT ON COLUMN 	bj_categorypricedetailhis.scategoryid is '报价品种ID/32/';
COMMENT ON COLUMN 	bj_categorypricedetailhis.svariety is '品种/50/';
COMMENT ON COLUMN 	bj_categorypricedetailhis.scommodityname is '品名/50/';
COMMENT ON COLUMN 	bj_categorypricedetailhis.sspec is '规格/50/';
COMMENT ON COLUMN 	bj_categorypricedetailhis.smaterial is '材质/50/';
COMMENT ON COLUMN 	bj_categorypricedetailhis.sproducer is '产地/50/';
COMMENT ON COLUMN 	bj_categorypricedetailhis.fprice is '价格//';
COMMENT ON COLUMN 	bj_categorypricedetailhis.dpricedate is '报价日期//';
COMMENT ON COLUMN 	bj_categorypricedetailhis.isort is '序号//';
COMMENT ON COLUMN 	zy_spreadmember.sguid is '主键/32/';
COMMENT ON COLUMN 	zy_spreadmember.smemberid is '会员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	zy_spreadmember.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zy_spreadmember.scnname is '会员名称/100/';
COMMENT ON COLUMN 	zy_spreadmember.isort is '排序号//挂牌资源GUID';
COMMENT ON COLUMN 	zy_spreadmember.icount is '推广条数//挂牌资源GUID';
COMMENT ON COLUMN 	zy_spreadmember.surl is '背景图片/300/';
COMMENT ON COLUMN 	zy_spreadmember.bisstop is '是否暂停推广/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_spreadmember.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	zy_spreadmember.dadddate is '添加日期//';
COMMENT ON COLUMN 	zy_spreadmember.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	zy_spreadmember.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	hy_integral.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_integral.iintegraltype is '积分类型/0:JF0000:注册
1:JF0001:登录
2:JF0002:个人信息完善
3:JF0003:企业信息完善
4:JF0004:个人身份认证
5:JF0005:认证为企业
6:JF0006:申请为销客
7:JF0007:导入挂牌资源
8:JF0008:勾选挂牌资源推广
9:JF0009:增加单条挂牌资源
10:JF0010:生成合同
11:JF0011:买家上传付款凭证
12:JF0012:买家收货确认
13:JF0013:买家评价卖家
14:JF0014:卖家评价买家
15:JF0015:手工录入求购信息
16:JF0016:手工录入资源单
17:JF0017:excel导入资源单
19:JF0019:销客收藏推广资源
20:JF0020:后台设置企业卖家为VIP卖家
21:JF0021:普通卖家申请成为VIP卖家协议户
22:JF0022:普通卖家excel下载VIP卖家销售资源
23:JF0023:融资资格申请
24:JF0024:订单生成
/';
COMMENT ON COLUMN 	hy_integral.iopertype is '累计类型/0:OnlyOne:记录一次
1:OneByDay:第天一次/';
COMMENT ON COLUMN 	hy_integral.iintegral is '积分分值//';
COMMENT ON COLUMN 	hy_integral.sinfo is '积分描述/500/';
COMMENT ON COLUMN 	hy_integral.bisused is '是否启用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_integral.saddoperator is '操作人/50/';
COMMENT ON COLUMN 	hy_integral.dadddate is '操作时间//';
COMMENT ON COLUMN 	xw_article.sguid is '主键ID/32/';
COMMENT ON COLUMN 	xw_article.stitle is '文章标题/300/';
COMMENT ON COLUMN 	xw_article.ssubjointitle is '副标题/300/';
COMMENT ON COLUMN 	xw_article.sfile is '附件/100/';
COMMENT ON COLUMN 	xw_article.stitleimage is '文章标题缩略图/100/';
COMMENT ON COLUMN 	xw_article.sabstract is '摘要/500/';
COMMENT ON COLUMN 	xw_article.sresourcename is '来源名称/300/';
COMMENT ON COLUMN 	xw_article.sresourceurl is '来源地址/300/';
COMMENT ON COLUMN 	xw_article.dpublishdate is '发布时间//';
COMMENT ON COLUMN 	xw_article.sauthor is '发布作者/50/';
COMMENT ON COLUMN 	xw_article.smodifyname is '修改人/50/';
COMMENT ON COLUMN 	xw_article.dmodifydate is '修改时间//';
COMMENT ON COLUMN 	xw_article.iallcount is '总访问数//';
COMMENT ON COLUMN 	xw_article.idaycount is '本日访问数//';
COMMENT ON COLUMN 	xw_article.dlastvisitdate is '最后访问日期//';
COMMENT ON COLUMN 	xw_article.icheckstate is '审核状态/0:NO:否
1:YES:是
/0：审核未通过 
1：审核通过';
COMMENT ON COLUMN 	xw_article.scheckopinion is '审核意见/500/';
COMMENT ON COLUMN 	xw_article.ssourceid is '原单号/32/';
COMMENT ON COLUMN 	xw_article.biscomment is '是否评论/0:NO:否
1:YES:是
/0：否
1：是';
COMMENT ON COLUMN 	xw_article.stopicurl is '专题url/1000/';
COMMENT ON COLUMN 	xw_article.skey is 'k/100/';
COMMENT ON COLUMN 	xw_article.dvaliddate is '有效期//';
COMMENT ON COLUMN 	xw_article.itoprank is '置顶级别//';
COMMENT ON COLUMN 	xw_article.icomentcount is '评论数//';
COMMENT ON COLUMN 	xw_article.snavigationid is '栏目id/32/';
COMMENT ON COLUMN 	xw_article.bisindex is '是否首页/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	xw_article.bistopic is '是否专题/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	xw_article.sdes is 's/500/';
COMMENT ON COLUMN 	xw_article.salt is 'alt/100/';
COMMENT ON COLUMN 	xw_article.st is 't/500/';
COMMENT ON COLUMN 	xw_article.stag is 'tag/300/';
COMMENT ON COLUMN 	xw_article.ihitcount is '点赞数//';
COMMENT ON COLUMN 	xw_navigation.sguid is '主键ID/32/';
COMMENT ON COLUMN 	xw_navigation.sparentid is '父栏目ID/32/';
COMMENT ON COLUMN 	xw_navigation.scode is '编码/20/';
COMMENT ON COLUMN 	xw_navigation.sname is '栏目名称/300/';
COMMENT ON COLUMN 	xw_navigation.st is 'T/500/';
COMMENT ON COLUMN 	xw_navigation.sk is 'K/500/';
COMMENT ON COLUMN 	xw_navigation.ss is 'S/500/';
COMMENT ON COLUMN 	xw_navigation.salt is 'Alt/300/';
COMMENT ON COLUMN 	xw_navigation.stitleimage is '附图/300/';
COMMENT ON COLUMN 	xw_navigation.sremark is '备注/1000/';
COMMENT ON COLUMN 	xw_navigation.isort is '排序号//';
COMMENT ON COLUMN 	xw_navigation.bisdefault is '是否默认栏目/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_authapply.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_authapply.smemberid is '会员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	hy_authapply.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	hy_authapply.scnname is '会员名称/100/';
COMMENT ON COLUMN 	hy_authapply.sapplyuserid is '申请人/50/';
COMMENT ON COLUMN 	hy_authapply.dapplydate is '申请日期//';
COMMENT ON COLUMN 	hy_authapply.iauthtype is '认证类型/0:COMPANY:企业认证
1:SALLER:交易会员
2:AGENT:挂牌交易会员
3:DISTRIBUTOR:分销商
4:FRIENDS:合作网站/';
COMMENT ON COLUMN 	hy_authapply.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	hy_authapply.smodifyuser is '修改人/50/';
COMMENT ON COLUMN 	hy_authapply.iapplytype is '申请认证类型/0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:WAREHOUSE:仓库
3:BANK:银行
7:MARKET:交易市场
8:CHARGE:监管公司
9:PERSONAL:个人认证
10:VIP:VIP会员
/';
COMMENT ON COLUMN 	hy_authapply.istatus is '状态/0 :WAIT:待审核
1: CHECKED:审核通过
2 :REJECT:被拒绝
/';
COMMENT ON COLUMN 	hy_authapply.scarddown is '身份证反面/300/';
COMMENT ON COLUMN 	hy_authapply.scardup is '身份证正面/300/';
COMMENT ON COLUMN 	hy_authapply.slegalpersoncode is '授权书/300/';
COMMENT ON COLUMN 	hy_authapply.sbusinessno is '营业执照副本/300/';
COMMENT ON COLUMN 	hy_authapply.sorgcode is '组织机构代码/300/';
COMMENT ON COLUMN 	hy_authapply.staxno is '税务登记证副本/300/';
COMMENT ON COLUMN 	hy_authapply.dcheckdate is '审核时间//';
COMMENT ON COLUMN 	hy_authapply.scheckuser is '审核人/32/';
COMMENT ON COLUMN 	hy_authapply.scheckremark is '审核说明/1000/';
COMMENT ON COLUMN 	rz_financingapply.sguid is '主键/32/';
COMMENT ON COLUMN 	rz_financingapply.sapplyman is '申请联系人/50/';
COMMENT ON COLUMN 	rz_financingapply.dapplydate is '申请时间//';
COMMENT ON COLUMN 	rz_financingapply.famount is '融资金额//';
COMMENT ON COLUMN 	rz_financingapply.sphone is '申请人联系方式/50/';
COMMENT ON COLUMN 	rz_financingapply.sremark is '备注/2000/';
COMMENT ON COLUMN 	zy_shopadvice.sguid is '主键/32/';
COMMENT ON COLUMN 	zy_shopadvice.smemberid is '会员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	zy_shopadvice.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zy_shopadvice.scnname is '会员名称/100/';
COMMENT ON COLUMN 	zy_shopadvice.isort is '排序号//挂牌资源GUID';
COMMENT ON COLUMN 	zy_shopadvice.surl is '图片/300/';
COMMENT ON COLUMN 	zy_shopadvice.bisstop is '是否暂停推广/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_shopadvice.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	zy_shopadvice.dadddate is '添加日期//';
COMMENT ON COLUMN 	zy_shopadvice.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	zy_shopadvice.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	zy_shopadvice.dbegindate is '推广开始日期//';
COMMENT ON COLUMN 	zy_shopadvice.denddate is '推广结算日期//';
COMMENT ON COLUMN 	zy_shopadvice.sremark is '备注/1000/';
COMMENT ON COLUMN 	zy_shopadvice.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	zy_shopadvice.scategory is '品种名称/100/';
COMMENT ON COLUMN 	zy_indexbaojia.sguid is '主键/32/';
COMMENT ON COLUMN 	zy_indexbaojia.spz is '品种/50/';
COMMENT ON COLUMN 	zy_indexbaojia.sgc is '钢厂/50/挂牌资源GUID';
COMMENT ON COLUMN 	zy_indexbaojia.spm is '品名/50/';
COMMENT ON COLUMN 	zy_indexbaojia.sgg is '规格/50/';
COMMENT ON COLUMN 	zy_indexbaojia.sgsid is '公司Id/32/';
COMMENT ON COLUMN 	zy_indexbaojia.sgs is '公司名称/300/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	zy_indexbaojia.fjg is '价格//挂牌资源GUID';
COMMENT ON COLUMN 	zy_indexbaojia.izd is '涨跌//';
COMMENT ON COLUMN 	zy_indexbaojia.ddate is '更新日期//';
COMMENT ON COLUMN 	zy_indexbaojia.bishand is '是否后台维护/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zy_indexbaojia.sremark is '备注/1000/';
COMMENT ON COLUMN 	hy_gangchang.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_gangchang.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	hy_gangchang.scnname is '公司名称/300/';
COMMENT ON COLUMN 	hy_gangchang.ssimpledesc is '简单介绍/500/';
COMMENT ON COLUMN 	hy_gangchang.sdetaildesc is '详细介绍//';
COMMENT ON COLUMN 	hy_gangchang.slinkman is '联系人/100/';
COMMENT ON COLUMN 	hy_gangchang.sqq is '联系QQ/50/';
COMMENT ON COLUMN 	hy_gangchang.slogo is 'logo/300/';
COMMENT ON COLUMN 	hy_gangchang.ssimplepic is '缩略图/300/';
COMMENT ON COLUMN 	hy_gangchang.sgcsb is '钢厂设备/300/';
COMMENT ON COLUMN 	hy_gangchang.soutweight is '年产能/300/';
COMMENT ON COLUMN 	hy_gangchang.dadddate is '添加日期//';
COMMENT ON COLUMN 	hy_gangchang.daddoperator is '添加人/100/';
COMMENT ON COLUMN 	hy_gangchang.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	hy_gangchang.dmodifyoperator is '修改人/100/';
COMMENT ON COLUMN 	hy_gangchang.sremark is '备注/1000/';
COMMENT ON COLUMN 	hy_gangchang.bisstart is '是否明星钢厂/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_gangchang.isort is '排序号//';
COMMENT ON COLUMN 	hy_partnermember.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_partnermember.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	hy_partnermember.smembercnname is '会员名称/100/';
COMMENT ON COLUMN 	hy_partnermember.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	hy_partnermember.spartnerid is '合作网站Id/32/';
COMMENT ON COLUMN 	hy_partnermember.spartnercnname is '合作网站名称/100/';
COMMENT ON COLUMN 	hy_partnermember.spartnerno is '合作网站编号/50/';
COMMENT ON COLUMN 	hy_partnermember.ddate is '添加时间//';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sapplymemberid is '申请会员ID/32/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sapplymembercnname is '申请会员名称/100/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sapplymemberno is '申请会员编号/50/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sapplyuserid is '申请人ID/32/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sapplyusername is '申请人账号/50/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sgpmemberid is '挂牌交易会员Id/32/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sgpmemberno is '挂牌交易会员编号/50/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sgpmembercnname is '挂牌交易会员名称/100/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.dapplydate is '申请时间//';
COMMENT ON COLUMN 	hy_appointgpmemberapply.istatus is '申请状态/0:APPLY:申请中
1:CHECKED:审核通过
2:REJECT:审核拒绝/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.sapplyremark is '申请说明/1000/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.dcheckdate is '审核时间//';
COMMENT ON COLUMN 	hy_appointgpmemberapply.scheckuser is '审核人/32/';
COMMENT ON COLUMN 	hy_appointgpmemberapply.scheckremark is '审核说明/1000/';
COMMENT ON COLUMN 	sys_servicecatagory.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_servicecatagory.soperatorid is '客服Id/32/';
COMMENT ON COLUMN 	sys_servicecatagory.scatagoryid is '品种Id/32/';
COMMENT ON COLUMN 	hy_gpmemberapply.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_gpmemberapply.sapplymemberid is '申请会员ID/32/';
COMMENT ON COLUMN 	hy_gpmemberapply.sapplymembercnname is '申请会员名称/100/';
COMMENT ON COLUMN 	hy_gpmemberapply.sapplymemberno is '申请会员编号/50/';
COMMENT ON COLUMN 	hy_gpmemberapply.sapplyuserid is '申请人ID/32/';
COMMENT ON COLUMN 	hy_gpmemberapply.sapplyusername is '申请人账号/50/';
COMMENT ON COLUMN 	hy_gpmemberapply.dapplydate is '申请时间//';
COMMENT ON COLUMN 	hy_gpmemberapply.istatus is '申请状态/0:APPLY:申请中
1:CHECKED:审核通过
2:REJECT:审核拒绝/';
COMMENT ON COLUMN 	hy_gpmemberapply.sapplyremark is '申请说明/1000/';
COMMENT ON COLUMN 	hy_gpmemberapply.dcheckdate is '审核时间//';
COMMENT ON COLUMN 	hy_gpmemberapply.scheckuser is '审核人/32/';
COMMENT ON COLUMN 	hy_gpmemberapply.scheckremark is '审核说明/1000/';
COMMENT ON COLUMN 	hy_gpmemberapply.isort is '排序号//';
COMMENT ON COLUMN 	hy_warehouse.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_warehouse.itype is '仓库类型/0:UNION:普通仓库
1:SIMPLE:联盟仓库/';
COMMENT ON COLUMN 	hy_warehouse.icheckstatus is '仓库状态/0 :INIT:待审核
1 :CHECK1:初审通过
10: CHECKED:审核通过
11 :REJECT:被拒绝
12:OVERDUE:逾期作废
20:OUTING:出金中
21:OUTED:已出金

/';
COMMENT ON COLUMN 	hy_warehouse.smemberid is '仓库会员ID/32/关联到类型为仓库的会员';
COMMENT ON COLUMN 	hy_warehouse.swarehouseno is '仓库编号/50/';
COMMENT ON COLUMN 	hy_warehouse.swarehousename is '仓库全称/100/';
COMMENT ON COLUMN 	hy_warehouse.swarehouseshortname is '仓库简称/50/';
COMMENT ON COLUMN 	hy_warehouse.scountry is '国家/50/';
COMMENT ON COLUMN 	hy_warehouse.sareaid is '地区区号/30/';
COMMENT ON COLUMN 	hy_warehouse.sprovince is '省份/50/';
COMMENT ON COLUMN 	hy_warehouse.scity is '城市/50/';
COMMENT ON COLUMN 	hy_warehouse.saddress is '仓库地址/200/';
COMMENT ON COLUMN 	hy_warehouse.sadminweburl is '网站管理地址/300/';
COMMENT ON COLUMN 	hy_warehouse.sweburl is '网站地址/300/';
COMMENT ON COLUMN 	hy_warehouse.szipcode is '仓库邮编/10/';
COMMENT ON COLUMN 	hy_warehouse.sremark is '仓库简介//';
COMMENT ON COLUMN 	hy_warehouse.ftransferfee is '过户费率//';
COMMENT ON COLUMN 	hy_warehouse.sfeeremark is '费率简介//';
COMMENT ON COLUMN 	hy_warehouse.ssysversion is '仓库系统版本/500/';
COMMENT ON COLUMN 	hy_warehouse.ssysdomain is '仓库系统域名/300/';
COMMENT ON COLUMN 	hy_warehouse.slinkman is '联系人/50/';
COMMENT ON COLUMN 	hy_warehouse.slinkfax is '传真/32/';
COMMENT ON COLUMN 	hy_warehouse.semail is '邮件/100/';
COMMENT ON COLUMN 	hy_warehouse.sphone is '电话/20/';
COMMENT ON COLUMN 	hy_warehouse.smobile is '手机/20/';
COMMENT ON COLUMN 	hy_warehouse.donlinedate is '上线日期//';
COMMENT ON COLUMN 	hy_warehouse.sonlinepassword is '上线密码/50/';
COMMENT ON COLUMN 	hy_warehouse.saccesspassword is '接口密码/32/';
COMMENT ON COLUMN 	hy_warehouse.skey is '密钥/32/';
COMMENT ON COLUMN 	hy_warehouse.bisonline is '是否已上线/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_warehouse.bisdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_warehouse.bisfreeze is '是否冻结/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_warehouse.dadddate is '添加日期//';
COMMENT ON COLUMN 	hy_warehouse.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	hy_warehouse.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	hy_warehouse.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	hy_warehouse.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	hy_warehouse.spyname is '全拼名/100/';
COMMENT ON COLUMN 	hy_warehouse.biscommon is '是否常用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_warehouse.bisactive is '是否活动/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	hy_warehouse.isort is '显示顺序//';
COMMENT ON COLUMN 	hy_warehouse.scheckusername is '审核人/50/';
COMMENT ON COLUMN 	hy_warehouse.schecktime is '审核时间//';
COMMENT ON COLUMN 	dd_saleorderdetail.sguid is '主键/32/';
COMMENT ON COLUMN 	dd_saleorderdetail.sorderid is '订单Id/32/';
COMMENT ON COLUMN 	dd_saleorderdetail.sresourceid is '挂单资源ID/32/挂牌资源GUID';
COMMENT ON COLUMN 	dd_saleorderdetail.sresourceno is '挂单资源编号/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.iresourcetype is '量尺方式/1:STANDARD:标准
0:NONSTANDARD:非标
/0:STANDARD:标准
1:NONSTANDARD:非标';
COMMENT ON COLUMN 	dd_saleorderdetail.bisfixedprice is '是否一口价/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	dd_saleorderdetail.ssalesmanid is '销客ID/32/';
COMMENT ON COLUMN 	dd_saleorderdetail.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	dd_saleorderdetail.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	dd_saleorderdetail.scategory is '品种/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.scommoditysystemcode is '品名系统编码/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.scommodityname is '品名/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.slocalname is '俗名/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.senname is '英文名/300/';
COMMENT ON COLUMN 	dd_saleorderdetail.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	dd_saleorderdetail.sclassification is '所属分类/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.stinypic is '小图片/300/';
COMMENT ON COLUMN 	dd_saleorderdetail.sspec is '规格/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.sspeca is '规格参数1/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.sspecb is '规格参数2/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.sspecc is '规格参数3/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.smaterial is '材质/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.sorigincountry is '产地国家/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.soriginarea is '产地地区/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.swoodlevel is '等级/300/业务参数';
COMMENT ON COLUMN 	dd_saleorderdetail.sbrand is '品牌/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.sproducer is '生产厂家/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.sstandard is '技术标准/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.smeasurement is '计量方式/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.dproductiondate is '生产日期//';
COMMENT ON COLUMN 	dd_saleorderdetail.iwarranty is '质保书/0:NO:无
1:YES:有
2:UNKNOW:未知/0无，1有，2未知';
COMMENT ON COLUMN 	dd_saleorderdetail.fweight is '数量//';
COMMENT ON COLUMN 	dd_saleorderdetail.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.famount is '金额//';
COMMENT ON COLUMN 	dd_saleorderdetail.fprice is '价格//';
COMMENT ON COLUMN 	dd_saleorderdetail.dadddate is '添加日期//';
COMMENT ON COLUMN 	dd_saleorderdetail.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	dd_saleorderdetail.sprovince is '交货省份/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.scity is '交货城市/50/';
COMMENT ON COLUMN 	dd_saleorderdetail.saddress is '交货地址/200/';
COMMENT ON COLUMN 	dd_saleorderdetail.swarehouse is '交货仓库/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.swarehouseid is '仓库ID/32/';
COMMENT ON COLUMN 	dd_saleorderdetail.icurrentversion is '当前版本//';
COMMENT ON COLUMN 	dd_saleorderdetail.sbigcategorysystemcode is '品种大类系统编码/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.sbigcategoryid is '品种大类ID/32/';
COMMENT ON COLUMN 	dd_saleorderdetail.sbigcategoryname is '品种大类名称/100/';
COMMENT ON COLUMN 	dd_saleorderdetail.fbrokerage is '佣金基数//';
COMMENT ON COLUMN 	dd_saleorderdetail.fnewprice is '最新数量//';
COMMENT ON COLUMN 	dd_saleorderdetail.fnewweight is '最新报价//';
COMMENT ON COLUMN 	dd_saleorderdetail.inewtype is '最新修改方/0:Buyer:买方
1:Seller:卖方/';
COMMENT ON COLUMN 	dd_saleorderdetail.bisconfirmedprice is '是否确认价格/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_province.scountryid is '国家ID/32/';
COMMENT ON COLUMN 	sys_province.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_province.sname is '省份名/100/';
COMMENT ON COLUMN 	sys_province.isort is '显示顺序//';
COMMENT ON COLUMN 	sys_province.sjpname is '简拼名/100/';
COMMENT ON COLUMN 	sys_province.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sys_city.sguid is '主键ID/32/';
COMMENT ON COLUMN 	sys_city.scountryid is '国家ID/32/';
COMMENT ON COLUMN 	sys_city.sprovinceid is '所属省份/32/';
COMMENT ON COLUMN 	sys_city.sname is '城市名/100/';
COMMENT ON COLUMN 	sys_city.isort is '显示顺序//';
COMMENT ON COLUMN 	sys_city.sjpname is '简拼名/100/';
COMMENT ON COLUMN 	sys_city.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sys_city.bisprovincecity is '是否省会/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_city.biscommon is '是否常用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_city.sareacode is '区号/50/';
COMMENT ON COLUMN 	sys_country.sguid is '主键ID/32/';
COMMENT ON COLUMN 	sys_country.sname is '国家名/50/';
COMMENT ON COLUMN 	sys_country.isort is '显示顺序//';
COMMENT ON COLUMN 	sys_country.biscommon is '是否常用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_country.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sys_country.spyname is '全拼名/100/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sguid is '主键/32/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sapplyno is '申请编号/50/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sorderid is '订单ID/32/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sfundaccountbanktype is '保证金账户银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sfundaccountid is '保证金账户id/32/';
COMMENT ON COLUMN 	dd_viewgoodsapply.fbondamount is '保证金额//';
COMMENT ON COLUMN 	dd_viewgoodsapply.bisbond is '是否已缴保证金/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sorderno is '订单编号/50/';
COMMENT ON COLUMN 	dd_viewgoodsapply.smemberid is '申请会员ID/32/';
COMMENT ON COLUMN 	dd_viewgoodsapply.ssellermemberid is '卖方公司Id/32/';
COMMENT ON COLUMN 	dd_viewgoodsapply.smemberno is '申请会员编号/50/';
COMMENT ON COLUMN 	dd_viewgoodsapply.smembername is '申请会员名称/100/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sappuserid is '申请用户ID/32/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sappusername is '申请用户名称/100/';
COMMENT ON COLUMN 	dd_viewgoodsapply.dappdate is '申请日期//';
COMMENT ON COLUMN 	dd_viewgoodsapply.dappviewdate is '申请看货日期//';
COMMENT ON COLUMN 	dd_viewgoodsapply.scontact is '联系人/50/';
COMMENT ON COLUMN 	dd_viewgoodsapply.scontactphone is '联系电话/100/';
COMMENT ON COLUMN 	dd_viewgoodsapply.scheckoperator is '审核人/50/';
COMMENT ON COLUMN 	dd_viewgoodsapply.dcheckdate is '审核日期//';
COMMENT ON COLUMN 	dd_viewgoodsapply.scheckremark is '审核内容/500/';
COMMENT ON COLUMN 	dd_viewgoodsapply.istatus is '状态/0:Apply:申请中
10:CheckOK:审核通过
11:Reject:审核拒绝
20:ViewOver:看货完成/';
COMMENT ON COLUMN 	dd_viewgoodsapply.sremark is '备注/500/';
COMMENT ON COLUMN 	hy_fxmemberapply.sguid is '主键/32/';
COMMENT ON COLUMN 	hy_fxmemberapply.sapplymemberid is '申请会员ID/32/';
COMMENT ON COLUMN 	hy_fxmemberapply.sapplymembercnname is '申请会员名称/100/';
COMMENT ON COLUMN 	hy_fxmemberapply.sapplymemberno is '申请会员编号/50/';
COMMENT ON COLUMN 	hy_fxmemberapply.sapplyuserid is '申请人ID/32/';
COMMENT ON COLUMN 	hy_fxmemberapply.sapplyusername is '申请人账号/50/';
COMMENT ON COLUMN 	hy_fxmemberapply.dapplydate is '申请时间//';
COMMENT ON COLUMN 	hy_fxmemberapply.istatus is '申请状态/0:APPLY:申请中
1:CHECKED:审核通过
2:REJECT:审核拒绝/';
COMMENT ON COLUMN 	hy_fxmemberapply.sapplyremark is '申请说明/1000/';
COMMENT ON COLUMN 	hy_fxmemberapply.dcheckdate is '审核时间//';
COMMENT ON COLUMN 	hy_fxmemberapply.scheckuser is '审核人/32/';
COMMENT ON COLUMN 	hy_fxmemberapply.scheckremark is '审核说明/1000/';
COMMENT ON COLUMN 	hy_fxmemberapply.isort is '排序号//';
COMMENT ON COLUMN 	zj_memberfund.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberfund.saccountno is '交易管理账户编号/50/';
COMMENT ON COLUMN 	zj_memberfund.iaccounttype is '资金账户类型/0:MEBER:一般会员子账户
21:COMMISSION:交易市场佣金子账户/';
COMMENT ON COLUMN 	zj_memberfund.sbankid is '监管银行ID/32/';
COMMENT ON COLUMN 	zj_memberfund.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberfund.sbankname is '监管银行名称/50/';
COMMENT ON COLUMN 	zj_memberfund.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_memberfund.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberfund.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberfund.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberfund.sbanksubaccountflag is '银行子账户账户性质/50/';
COMMENT ON COLUMN 	zj_memberfund.sbanksubaccountcardtype is '银行子账户证件类型/50/';
COMMENT ON COLUMN 	zj_memberfund.sbanksubaccountcardno is '银行子账户证件号/50/';
COMMENT ON COLUMN 	zj_memberfund.sinaccount is '入金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_memberfund.sinaccountname is '入金账户名称/300/';
COMMENT ON COLUMN 	zj_memberfund.sinaccountbankcode is '入金账户联行号（分行号）/50/';
COMMENT ON COLUMN 	zj_memberfund.sinaccountbankname is '入金账户开户行名称/300/';
COMMENT ON COLUMN 	zj_memberfund.sinaccountaddress is '入金账户收付款地址/200/';
COMMENT ON COLUMN 	zj_memberfund.sinaccounttrantype is '入金账户转账方式/50/';
COMMENT ON COLUMN 	zj_memberfund.soutaccount is '出金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_memberfund.soutaccountname is '出金账户名称/300/';
COMMENT ON COLUMN 	zj_memberfund.soutaccountbankname is '出金账户开户行名称/300/';
COMMENT ON COLUMN 	zj_memberfund.soutaccountbankcode is '出金账户联行号（分行号）/50/';
COMMENT ON COLUMN 	zj_memberfund.soutaccounttrantype is '出金账户转账方式/50/';
COMMENT ON COLUMN 	zj_memberfund.soutaccountaddress is '出金账户收付款地址/200/';
COMMENT ON COLUMN 	zj_memberfund.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberfund.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberfund.fusable is '可用资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.ffrozen is '交易冻结资金(余额)//挂牌保证金';
COMMENT ON COLUMN 	zj_memberfund.ffrozentotal is '当日交易冻结资金//';
COMMENT ON COLUMN 	zj_memberfund.funfrozentotal is '当日交易解冻资金//';
COMMENT ON COLUMN 	zj_memberfund.foutfrozen is '出金冻结资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.foutfrozentotal is '当日出金冻结资金//';
COMMENT ON COLUMN 	zj_memberfund.foutunfrozentotal is '当日出金解冻资金//';
COMMENT ON COLUMN 	zj_memberfund.flockmargin is '锁保证金(余额)//合同保证金';
COMMENT ON COLUMN 	zj_memberfund.flockmargintotal is '当日锁定保证金//';
COMMENT ON COLUMN 	zj_memberfund.funlockmargintotal is '当日解锁保证金//';
COMMENT ON COLUMN 	zj_memberfund.flock is '锁定资金(余额)//合同货款';
COMMENT ON COLUMN 	zj_memberfund.flocktotal is '当日货款锁定//';
COMMENT ON COLUMN 	zj_memberfund.freturn is '当日退款//';
COMMENT ON COLUMN 	zj_memberfund.fpayment is '当日货款支出//';
COMMENT ON COLUMN 	zj_memberfund.freceived is '当日货款收入//';
COMMENT ON COLUMN 	zj_memberfund.flockbybank is '银行冻结资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.flockbybanktotal is '当日银行冻结资金//';
COMMENT ON COLUMN 	zj_memberfund.funlockbybanktotal is '当日银行解冻资金//';
COMMENT ON COLUMN 	zj_memberfund.freallockbybank is '银行锁定资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.freallockbybanktotal is '当日银行锁定资金//';
COMMENT ON COLUMN 	zj_memberfund.funreallockbybanktotal is '当日银行解锁资金//';
COMMENT ON COLUMN 	zj_memberfund.fusableloan is '贷款可用余额//';
COMMENT ON COLUMN 	zj_memberfund.floan is '贷款余额//';
COMMENT ON COLUMN 	zj_memberfund.ffeepayment is '当日服务费用支出//';
COMMENT ON COLUMN 	zj_memberfund.fbreachin is '当日违约金收入//';
COMMENT ON COLUMN 	zj_memberfund.fbreachout is '当日违约金支出//';
COMMENT ON COLUMN 	zj_memberfund.fin is '当日入金//';
COMMENT ON COLUMN 	zj_memberfund.fout is '当日出金//';
COMMENT ON COLUMN 	zj_memberfund.finterest is '当日利息收入//';
COMMENT ON COLUMN 	zj_memberfund.floanin is '当日贷款发放//';
COMMENT ON COLUMN 	zj_memberfund.floanback is '当日还贷款//';
COMMENT ON COLUMN 	zj_memberfund.freinterestowed is '当日还欠息//';
COMMENT ON COLUMN 	zj_memberfund.flastusable is '上日可用资金//';
COMMENT ON COLUMN 	zj_memberfund.flastfrozen is '上日冻结资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.flastfrozentotal is '上日交易冻结资金//';
COMMENT ON COLUMN 	zj_memberfund.flastunfrozentotal is '上日交易解冻资金//';
COMMENT ON COLUMN 	zj_memberfund.flastoutfrozen is '上日出金冻结资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.flastoutfrozentotal is '上日出金冻结资金//';
COMMENT ON COLUMN 	zj_memberfund.flastoutunfrozentotal is '上日出金解冻资金//';
COMMENT ON COLUMN 	zj_memberfund.flastlockbybank is '上日银行冻结资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.flastlockbybanktotal is '上日银行冻结资金//';
COMMENT ON COLUMN 	zj_memberfund.flastunlockbybanktotal is '上日银行解冻资金//';
COMMENT ON COLUMN 	zj_memberfund.flastreallockbybank is '上日银行锁定资金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.flastreallockbybanktotal is '上日银行锁定资金//';
COMMENT ON COLUMN 	zj_memberfund.flastunreallockbybanktotal is '上日银行解锁资金//';
COMMENT ON COLUMN 	zj_memberfund.flastloan is '上日贷款余额//';
COMMENT ON COLUMN 	zj_memberfund.flastusableloan is '上日贷款可用余额//';
COMMENT ON COLUMN 	zj_memberfund.flastlockmargin is '上日锁保证金(余额)//';
COMMENT ON COLUMN 	zj_memberfund.flastlockmargintotal is '上日锁定保证金//';
COMMENT ON COLUMN 	zj_memberfund.flastunlockmargintotal is '上日解锁保证金//';
COMMENT ON COLUMN 	zj_memberfund.flastlock is '上日锁定资金//';
COMMENT ON COLUMN 	zj_memberfund.flastlocktotal is '上日货款锁定//';
COMMENT ON COLUMN 	zj_memberfund.flastreturn is '上日退款//';
COMMENT ON COLUMN 	zj_memberfund.flastpayment is '上日货款支出//';
COMMENT ON COLUMN 	zj_memberfund.flastreceived is '上日货款收入//';
COMMENT ON COLUMN 	zj_memberfund.flastfeepayment is '上日服务费用支出//';
COMMENT ON COLUMN 	zj_memberfund.flastbreachin is '上日违约金收入//';
COMMENT ON COLUMN 	zj_memberfund.flastbreachout is '上日违约金支出//';
COMMENT ON COLUMN 	zj_memberfund.flastinterest is '上日利息收入//';
COMMENT ON COLUMN 	zj_memberfund.flastin is '上日入金//';
COMMENT ON COLUMN 	zj_memberfund.flastout is '上日出金//';
COMMENT ON COLUMN 	zj_memberfund.flastloanin is '上日贷款发放//';
COMMENT ON COLUMN 	zj_memberfund.flastloanback is '上日还贷款//';
COMMENT ON COLUMN 	zj_memberfund.flastreinterestowed is '上日还欠息//';
COMMENT ON COLUMN 	zj_memberfund.bisfreeze is '是否账户被冻结/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfund.biscancel is '是否已销户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfund.bisbindinaccount is '是否已绑定入金账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfund.bisbindoutaccount is '是否已绑定出金账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfund.bisdefault is '是否默认账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfund.bisreceive is '是否收款账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfund.iversion is '版本号//';
COMMENT ON COLUMN 	zj_memberfund.ssubaccountid is '子账户ID(保证金子账户有用)/32/';
COMMENT ON COLUMN 	zj_outapply.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_outapply.sseqno is '出金申请流水号/50/';
COMMENT ON COLUMN 	zj_outapply.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_outapply.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_outapply.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_outapply.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_outapply.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_outapply.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_outapply.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_outapply.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_outapply.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_outapply.soperatorid is '交易员ID/32/';
COMMENT ON COLUMN 	zj_outapply.famount is '金额//';
COMMENT ON COLUMN 	zj_outapply.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_outapply.ssigninfo is '签名信息/512/';
COMMENT ON COLUMN 	zj_outapply.sfirstoperatorid is '初审人/32/';
COMMENT ON COLUMN 	zj_outapply.dfirstdate is '初审日期//';
COMMENT ON COLUMN 	zj_outapply.sfirstcheckinfo is '初审意见/2000/';
COMMENT ON COLUMN 	zj_outapply.sbankcode is '银行代码/100/';
COMMENT ON COLUMN 	zj_outapply.ssecondoperatorid is '复审人/32/';
COMMENT ON COLUMN 	zj_outapply.dseconddate is '复审日期//';
COMMENT ON COLUMN 	zj_outapply.ssecondcheckinfo is '复审意见/2000/';
COMMENT ON COLUMN 	zj_outapply.istatus is '状态/0 :INIT:待审核
1 :CHECK1:初审通过
10: CHECKED:审核通过
11 :REJECT:被拒绝
12:OVERDUE:逾期作废
20:OUTING:出金中
21:OUTED:已出金

/';
COMMENT ON COLUMN 	zj_outapply.bisdelete is '是否删除/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_outapply.dapplydate is '申请日期//';
COMMENT ON COLUMN 	zj_outapply.iversion is '版本号//';
COMMENT ON COLUMN 	zj_outapply.sthirdlogno is '银行前置流水号/50/';
COMMENT ON COLUMN 	zj_outapply.soutaccount is '出金账号/50/';
COMMENT ON COLUMN 	zj_outapply.soutaccountname is '出金账户名称/300/';
COMMENT ON COLUMN 	zj_outapply.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_outapply.fhandfee is '转账手续费//';
COMMENT ON COLUMN 	zj_outapply.sfeeoutcustid is '支付手续费子账号/50/';
COMMENT ON COLUMN 	zj_outapply.bisbankrequest is '是否银行发起/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_outapply.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_outapply.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_outapply.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberoutin.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberoutin.sseqno is '流水号/50/';
COMMENT ON COLUMN 	zj_memberoutin.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberoutin.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_memberoutin.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_memberoutin.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberoutin.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberoutin.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberoutin.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberoutin.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberoutin.soutinaccount is '出入金账号/50/';
COMMENT ON COLUMN 	zj_memberoutin.soutinaccountname is '出入金账户名称/500/';
COMMENT ON COLUMN 	zj_memberoutin.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_memberoutin.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberoutin.sbillno is '单据编号/50/订单号
合同号
挂牌号
备用字段';
COMMENT ON COLUMN 	zj_memberoutin.itype is '出入金类型//0 out
1 in';
COMMENT ON COLUMN 	zj_memberoutin.sthirdlogno is '银行前置流水号/50/';
COMMENT ON COLUMN 	zj_memberoutin.flockmargin is '锁定保证金(余额)//';
COMMENT ON COLUMN 	zj_memberoutin.famount is '金额//';
COMMENT ON COLUMN 	zj_memberoutin.fhandfee is '出金手续费//';
COMMENT ON COLUMN 	zj_memberoutin.sfeeoutcustid is '支付手续费子账号/50/';
COMMENT ON COLUMN 	zj_memberoutin.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_memberoutin.sacctdate is '银行会计日期/50/';
COMMENT ON COLUMN 	zj_memberoutin.ddate is '出入金时间//';
COMMENT ON COLUMN 	zj_memberoutin.sbanksigninfo is '银行签名/512/';
COMMENT ON COLUMN 	zj_memberoutin.sfirstoperatorid is '初审人/32/';
COMMENT ON COLUMN 	zj_memberoutin.dfirstdate is '初审日期//';
COMMENT ON COLUMN 	zj_memberoutin.ssecondoperatorid is '复审人/32/';
COMMENT ON COLUMN 	zj_memberoutin.dseconddate is '复审日期//';
COMMENT ON COLUMN 	zj_memberoutin.bisbankrequest is '是否银行发起/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberoutin.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_memberoutin.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_memberoutin.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfundserial.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberfundserial.sserialno is '流水编号/50/';
COMMENT ON COLUMN 	zj_memberfundserial.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_memberfundserial.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_memberfundserial.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberfundserial.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_memberfundserial.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberfundserial.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberfundserial.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberfundserial.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberfundserial.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberfundserial.sopertorid is '交易员ID/32/';
COMMENT ON COLUMN 	zj_memberfundserial.ipaytype is '支付类型/0:OUT:出金
1:IN:入金
10:FREEZE:冻结
11:FREE:解冻
20:LOCK:担保支付
21:RETURN:退款
31:RECEIVE:收款
70:FREEZEBANK:银行冻结
71:FREEBANK:银行解冻
72:LOCKBANK:银行锁定
73:UNLOCKBANK:银行解锁
90:REAL_PAY:直接支付/';
COMMENT ON COLUMN 	zj_memberfundserial.ifundtype is '资金类型/0:MARGIN:保证金
1:PAYMENT:货款
2:BREACH:违约金
3:FEE:服务费
4:DEBIT:贷款
5:INTEREST:利息
6:BROKERAGE:拥金
/';
COMMENT ON COLUMN 	zj_memberfundserial.famount is '金额//';
COMMENT ON COLUMN 	zj_memberfundserial.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberfundserial.sbillno is '单据编号/50/';
COMMENT ON COLUMN 	zj_memberfundserial.iobecttype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_memberfundserial.sremark is '摘要/500/';
COMMENT ON COLUMN 	zj_memberfundserial.ddate is '流水时间//';
COMMENT ON COLUMN 	zj_memberfundserial.fusable is '可用资金//';
COMMENT ON COLUMN 	zj_memberfundserial.flock is '锁定资金//';
COMMENT ON COLUMN 	zj_memberfundserial.ffrozen is '交易冻结资金//';
COMMENT ON COLUMN 	zj_memberfundserial.flockbybank is '银行冻结资金//';
COMMENT ON COLUMN 	zj_memberfundserial.foutfrozen is '出金冻结资金//';
COMMENT ON COLUMN 	zj_memberfundserial.flockmargin is '锁定保证金//';
COMMENT ON COLUMN 	zj_memberfundserial.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_memberfundserial.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_memberfundserial.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfeeserial.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.sserialno is '流水编号/50/';
COMMENT ON COLUMN 	zj_memberfeeserial.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberfeeserial.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberfeeserial.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberfeeserial.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberfeeserial.sinaccount is '入金账号/50/';
COMMENT ON COLUMN 	zj_memberfeeserial.sinaccountname is '入金账户名称/500/';
COMMENT ON COLUMN 	zj_memberfeeserial.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_memberfeeserial.sopertorid is '交易员ID/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberfeeserial.famount is '金额//';
COMMENT ON COLUMN 	zj_memberfeeserial.ifeetype is '费用类型/0:TRADE:交易手续费
1:MEMBER:会员费
2:FINANCINGFEE:融资服务费
3:REGULATORFEE:监管费
4:CUSTODYFEE:保管费
5:INSURANCEFEE:保险费
10:OTHER:其他费用/0交易手续费、
1会员费
';
COMMENT ON COLUMN 	zj_memberfeeserial.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.sbilltype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_memberfeeserial.sbillno is '单据编号/50/';
COMMENT ON COLUMN 	zj_memberfeeserial.ddate is '流水时间//';
COMMENT ON COLUMN 	zj_memberfeeserial.sfirstoperatorid is '记账人/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.dfirstdate is '记账日期//';
COMMENT ON COLUMN 	zj_memberfeeserial.ssecondoperatorid is '审核人/32/';
COMMENT ON COLUMN 	zj_memberfeeserial.dseconddate is '复审日期//';
COMMENT ON COLUMN 	zj_memberfeeserial.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_memberfeeserial.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_memberfeeserial.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfeeserial.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_hmemberfund.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_hmemberfund.dbalancedate is '交易日期//';
COMMENT ON COLUMN 	zj_hmemberfund.saccountid is '交易管理账户ID/32/';
COMMENT ON COLUMN 	zj_hmemberfund.saccountno is '交易管理账户编号/50/';
COMMENT ON COLUMN 	zj_hmemberfund.iaccounttype is '资金账户类型/0:MEBER:一般会员子账户
21:COMMISSION:交易市场佣金子账户/';
COMMENT ON COLUMN 	zj_hmemberfund.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_hmemberfund.sbankid is '监管银行ID/32/';
COMMENT ON COLUMN 	zj_hmemberfund.sbankname is '监管银行名称/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_hmemberfund.sbanksubaccountflag is '银行子账户账户性质/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sbanksubaccountcardtype is '银行子账户证件类型/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sbanksubaccountcardno is '银行子账户证件号/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sinaccount is '入金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sinaccountname is '入金账户名称/300/';
COMMENT ON COLUMN 	zj_hmemberfund.sinaccountbankcode is '入金账户联行号（分行号）/50/';
COMMENT ON COLUMN 	zj_hmemberfund.sinaccountbankname is '入金账户开户行名称/300/';
COMMENT ON COLUMN 	zj_hmemberfund.sinaccountaddress is '入金账户收付款地址/200/';
COMMENT ON COLUMN 	zj_hmemberfund.sinaccounttrantype is '入金账户转账方式/50/';
COMMENT ON COLUMN 	zj_hmemberfund.soutaccount is '出金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_hmemberfund.soutaccountname is '出金账户名称/300/';
COMMENT ON COLUMN 	zj_hmemberfund.soutaccountbankname is '出金账户开户行名称/300/';
COMMENT ON COLUMN 	zj_hmemberfund.soutaccountbankcode is '出金账户联行号（分行号）/50/';
COMMENT ON COLUMN 	zj_hmemberfund.soutaccounttrantype is '出金账户转账方式/50/';
COMMENT ON COLUMN 	zj_hmemberfund.soutaccountaddress is '出金账户收付款地址/200/';
COMMENT ON COLUMN 	zj_hmemberfund.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_hmemberfund.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_hmemberfund.fusable is '可用资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.ffrozen is '交易冻结资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.ffrozentotal is '当日交易冻结资金//';
COMMENT ON COLUMN 	zj_hmemberfund.funfrozentotal is '当日交易解冻资金//';
COMMENT ON COLUMN 	zj_hmemberfund.foutfrozen is '出金冻结资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.foutfrozentotal is '当日出金冻结资金//';
COMMENT ON COLUMN 	zj_hmemberfund.foutunfrozentotal is '当日出金解冻资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flockmargin is '锁保证金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flockmargintotal is '当日锁定保证金//';
COMMENT ON COLUMN 	zj_hmemberfund.funlockmargintotal is '当日解锁保证金//';
COMMENT ON COLUMN 	zj_hmemberfund.flock is '锁定资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flocktotal is '当日货款锁定//';
COMMENT ON COLUMN 	zj_hmemberfund.freturn is '当日退款//';
COMMENT ON COLUMN 	zj_hmemberfund.fpayment is '当日货款支出//';
COMMENT ON COLUMN 	zj_hmemberfund.flockbybank is '银行冻结资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flockbybanktotal is '当日银行冻结资金//';
COMMENT ON COLUMN 	zj_hmemberfund.funlockbybanktotal is '当日银行解冻资金//';
COMMENT ON COLUMN 	zj_hmemberfund.freallockbybank is '银行锁定资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.freallockbybanktotal is '当日银行锁定资金//';
COMMENT ON COLUMN 	zj_hmemberfund.funreallockbybanktotal is '当日银行解锁资金//';
COMMENT ON COLUMN 	zj_hmemberfund.floan is '贷款余额//';
COMMENT ON COLUMN 	zj_hmemberfund.fusableloan is '贷款可用余额//';
COMMENT ON COLUMN 	zj_hmemberfund.freceived is '当日货款收入//';
COMMENT ON COLUMN 	zj_hmemberfund.ffeepayment is '当日服务费用支出//';
COMMENT ON COLUMN 	zj_hmemberfund.fbreachin is '当日违约金收入//';
COMMENT ON COLUMN 	zj_hmemberfund.fbreachout is '当日违约金支出//';
COMMENT ON COLUMN 	zj_hmemberfund.fin is '当日入金//';
COMMENT ON COLUMN 	zj_hmemberfund.fout is '当日出金//';
COMMENT ON COLUMN 	zj_hmemberfund.finterest is '当日利息收入//';
COMMENT ON COLUMN 	zj_hmemberfund.floanin is '当日贷款发放//';
COMMENT ON COLUMN 	zj_hmemberfund.floanback is '当日还贷款//';
COMMENT ON COLUMN 	zj_hmemberfund.freinterestowed is '当日还欠息//';
COMMENT ON COLUMN 	zj_hmemberfund.flastusable is '上日可用资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastfrozen is '上日冻结资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flastfrozentotal is '上日交易冻结资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastunfrozentotal is '上日交易解冻资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastoutfrozen is '上日出金冻结资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flastoutfrozentotal is '上日出金冻结资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastoutunfrozentotal is '上日出金解冻资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastlockbybank is '上日银行冻结资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flastlockbybanktotal is '上日银行冻结资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastunlockbybanktotal is '上日银行解冻资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastreallockbybank is '上日银行锁定资金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flastreallockbybanktotal is '上日银行锁定资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastunreallockbybanktotal is '上日银行解锁资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastloan is '上日贷款余额//';
COMMENT ON COLUMN 	zj_hmemberfund.flastusableloan is '上日贷款可用余额//';
COMMENT ON COLUMN 	zj_hmemberfund.flastlockmargin is '上日锁保证金(余额)//';
COMMENT ON COLUMN 	zj_hmemberfund.flastlockmargintotal is '上日锁定保证金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastunlockmargintotal is '上日解锁保证金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastlock is '上日锁定资金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastlocktotal is '上日货款锁定//';
COMMENT ON COLUMN 	zj_hmemberfund.flastreturn is '上日退款//';
COMMENT ON COLUMN 	zj_hmemberfund.flastpayment is '上日货款支出//';
COMMENT ON COLUMN 	zj_hmemberfund.flastreceived is '上日货款收入//';
COMMENT ON COLUMN 	zj_hmemberfund.flastfeepayment is '上日服务费用支出//';
COMMENT ON COLUMN 	zj_hmemberfund.flastbreachin is '上日违约金收入//';
COMMENT ON COLUMN 	zj_hmemberfund.flastbreachout is '上日违约金支出//';
COMMENT ON COLUMN 	zj_hmemberfund.flastinterest is '上日利息收入//';
COMMENT ON COLUMN 	zj_hmemberfund.flastin is '上日入金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastout is '上日出金//';
COMMENT ON COLUMN 	zj_hmemberfund.flastloanin is '上日贷款发放//';
COMMENT ON COLUMN 	zj_hmemberfund.flastloanback is '上日还贷款//';
COMMENT ON COLUMN 	zj_hmemberfund.flastreinterestowed is '上日还欠息//';
COMMENT ON COLUMN 	zj_hmemberfund.bisfreeze is '是否账户被冻结/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_hmemberfund.biscancel is '是否已销户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_hmemberfund.bisbindinaccount is '是否已绑定入金账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_hmemberfund.bisbindoutaccount is '是否已绑定出金账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_hmemberfund.bisdefault is '是否默认账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_hmemberfund.bisreceive is '是否收款账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_hmemberfund.iversion is '版本号//';
COMMENT ON COLUMN 	zj_hmemberfund.ssubaccountid is '子账户ID(保证金子账户有用)/32/';
COMMENT ON COLUMN 	zj_bank.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_bank.sbankno is '银行编号/50/';
COMMENT ON COLUMN 	zj_bank.sbankname is '银行名称/50/';
COMMENT ON COLUMN 	zj_bank.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_bank.iinspecttype is '监管类型/0:BANK:监管银行
1:PAYCOMPANY:第三方支付公司/';
COMMENT ON COLUMN 	zj_bank.stranwebname is '交易网名称/300/';
COMMENT ON COLUMN 	zj_bank.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_bank.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_bank.soutaccountname is '自有资金出金账户名称/300/';
COMMENT ON COLUMN 	zj_bank.soutaccountbank is '自有资金出金账号开户行/300/';
COMMENT ON COLUMN 	zj_bank.soutaccount is '自有资金出金账号/50/';
COMMENT ON COLUMN 	zj_bank.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_bank.simagelogurl is '银行图片Log地址/300/';
COMMENT ON COLUMN 	zj_bank.sinterfacecode is '接口代码/50/';
COMMENT ON COLUMN 	zj_bank.bisfreeze is '是否禁用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_bank.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	zj_bank.dadddate is '添加日期//';
COMMENT ON COLUMN 	zj_bank.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	zj_bank.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	zj_bank.bisrealtimesettle is '是否实时清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_bank.sfeesubaccount is '手续费子账号/50/';
COMMENT ON COLUMN 	zj_bank.ssettlesubaccount is '清收子账号/50/';
COMMENT ON COLUMN 	zj_bank.sinterestsubaccount is '利息子账号/50/';
COMMENT ON COLUMN 	zj_bank.bishavesubbank is '是否分支行管理/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_bank.fpledgerate is '质押率//';
COMMENT ON COLUMN 	zj_bank.bisabetfinancing is '是否支持融资业务/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_inapply.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_inapply.sseqno is '流水号/50/';
COMMENT ON COLUMN 	zj_inapply.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_inapply.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_inapply.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_inapply.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_inapply.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_inapply.sinaccount is '入金账号/50/';
COMMENT ON COLUMN 	zj_inapply.sinaccountname is '入金账户名称/500/';
COMMENT ON COLUMN 	zj_inapply.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_inapply.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_inapply.ffeeamount is '手续费//';
COMMENT ON COLUMN 	zj_inapply.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_inapply.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_inapply.sbillno is '单据编号/50/订单号
合同号
挂牌号
备用字段';
COMMENT ON COLUMN 	zj_inapply.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_inapply.itype is '出入金类型//0 out
1 in';
COMMENT ON COLUMN 	zj_inapply.iinstatus is '入金状态/0:WAIT:待处理
1:SUCCESS:处理成功/';
COMMENT ON COLUMN 	zj_inapply.famount is '金额//';
COMMENT ON COLUMN 	zj_inapply.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_inapply.dacctdate is '银行会计日期//';
COMMENT ON COLUMN 	zj_inapply.ddate is '入金时间//';
COMMENT ON COLUMN 	zj_inapply.sbanksigninfo is '银行签名/512/';
COMMENT ON COLUMN 	zj_inapply.dadddate is '添加日期//';
COMMENT ON COLUMN 	zj_inapply.soperatorid is '操作人ID/32/';
COMMENT ON COLUMN 	zj_totalfund.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_totalfund.sbankid is '监管银行ID/32/';
COMMENT ON COLUMN 	zj_totalfund.sbankname is '监管银行名称/50/';
COMMENT ON COLUMN 	zj_totalfund.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_totalfund.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_totalfund.fusable is '可用资金//';
COMMENT ON COLUMN 	zj_totalfund.flock is '锁定资金//';
COMMENT ON COLUMN 	zj_totalfund.freturn is '当日退款//';
COMMENT ON COLUMN 	zj_totalfund.flockbybank is '银行冻结(锁定)资金//';
COMMENT ON COLUMN 	zj_totalfund.foutfrozen is '出金冻结资金//';
COMMENT ON COLUMN 	zj_totalfund.ffrozen is '交易冻结资金//';
COMMENT ON COLUMN 	zj_totalfund.freceived is '当日货款收入//';
COMMENT ON COLUMN 	zj_totalfund.fpayment is '当日货款支出//';
COMMENT ON COLUMN 	zj_totalfund.ffeepayment is '当日服务费用支出//';
COMMENT ON COLUMN 	zj_totalfund.fbreachin is '当日违约金收入//';
COMMENT ON COLUMN 	zj_totalfund.fbreachout is '当日违约金支出//';
COMMENT ON COLUMN 	zj_totalfund.fin is '当日入金//';
COMMENT ON COLUMN 	zj_totalfund.fout is '当日出金//';
COMMENT ON COLUMN 	zj_totalfund.finterest is '当日利息收入//';
COMMENT ON COLUMN 	zj_totalfund.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_exchangefund.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_exchangefund.dbalancedate is '结算日期//';
COMMENT ON COLUMN 	zj_exchangefund.sbankid is '监管银行ID/32/';
COMMENT ON COLUMN 	zj_exchangefund.sbankname is '监管银行名称/50/';
COMMENT ON COLUMN 	zj_exchangefund.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_exchangefund.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_exchangefund.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_exchangefund.saccountname is '账户名称/300/';
COMMENT ON COLUMN 	zj_exchangefund.sinaccount is '绑定入金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_exchangefund.soutaccount is '绑定出金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_exchangefund.fusable is '可用资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.ffrozen is '交易冻结资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.ffrozentotal is '当日交易冻结资金//';
COMMENT ON COLUMN 	zj_exchangefund.funfrozentotal is '当日交易解冻资金//';
COMMENT ON COLUMN 	zj_exchangefund.foutfrozen is '出金冻结资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.foutfrozentotal is '当日出金冻结资金//';
COMMENT ON COLUMN 	zj_exchangefund.foutunfrozentotal is '当日出金解冻资金//';
COMMENT ON COLUMN 	zj_exchangefund.flockmargin is '锁保证金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.flockmargintotal is '当日锁定保证金//';
COMMENT ON COLUMN 	zj_exchangefund.funlockmargintotal is '当日解锁保证金//';
COMMENT ON COLUMN 	zj_exchangefund.flock is '锁定资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.flocktotal is '当日货款锁定//';
COMMENT ON COLUMN 	zj_exchangefund.freturn is '当日退款//';
COMMENT ON COLUMN 	zj_exchangefund.fpayment is '当日货款支出//';
COMMENT ON COLUMN 	zj_exchangefund.flockbybank is '银行冻结资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.flockbybanktotal is '当日银行冻结资金//';
COMMENT ON COLUMN 	zj_exchangefund.funlockbybanktotal is '当日银行解冻资金//';
COMMENT ON COLUMN 	zj_exchangefund.freceived is '当日货款收入//';
COMMENT ON COLUMN 	zj_exchangefund.ffeepayment is '当日服务费用支出//';
COMMENT ON COLUMN 	zj_exchangefund.fbreachin is '当日违约金收入//';
COMMENT ON COLUMN 	zj_exchangefund.fbreachout is '当日违约金支出//';
COMMENT ON COLUMN 	zj_exchangefund.fin is '当日入金//';
COMMENT ON COLUMN 	zj_exchangefund.fout is '当日出金//';
COMMENT ON COLUMN 	zj_exchangefund.finterest is '当日利息收入//';
COMMENT ON COLUMN 	zj_exchangefund.flastusable is '上日可用资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastfrozen is '上日冻结资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.flastfrozentotal is '上日交易冻结资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastunfrozentotal is '上日交易解冻资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastoutfrozen is '上日出金冻结资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.flastoutfrozentotal is '上日出金冻结资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastoutunfrozentotal is '上日出金解冻资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastlockbybank is '上日银行冻结资金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.flastlockbybanktotal is '上日银行冻结资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastunlockbybanktotal is '上日银行解冻资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastlockmargin is '上日锁保证金(余额)//';
COMMENT ON COLUMN 	zj_exchangefund.flastlockmargintotal is '上日锁定保证金//';
COMMENT ON COLUMN 	zj_exchangefund.flastunlockmargintotal is '上日解锁保证金//';
COMMENT ON COLUMN 	zj_exchangefund.flastlock is '上日锁定资金//';
COMMENT ON COLUMN 	zj_exchangefund.flastlocktotal is '上日货款锁定//';
COMMENT ON COLUMN 	zj_exchangefund.flastreturn is '上日退款//';
COMMENT ON COLUMN 	zj_exchangefund.flastpayment is '上日货款支出//';
COMMENT ON COLUMN 	zj_exchangefund.flastreceived is '上日货款收入//';
COMMENT ON COLUMN 	zj_exchangefund.flastfeepayment is '上日服务费用支出//';
COMMENT ON COLUMN 	zj_exchangefund.flastbreachin is '上日违约金收入//';
COMMENT ON COLUMN 	zj_exchangefund.flastbreachout is '上日违约金支出//';
COMMENT ON COLUMN 	zj_exchangefund.flastinterest is '上日利息收入//';
COMMENT ON COLUMN 	zj_exchangefund.flastin is '上日入金//';
COMMENT ON COLUMN 	zj_exchangefund.flastout is '上日出金//';
COMMENT ON COLUMN 	zj_exchangefund.isubaccountcount is '子账户总数//';
COMMENT ON COLUMN 	zj_exchangefund.ivailidsubaccountcount is '有效子账户总数//';
COMMENT ON COLUMN 	zj_exchangefund.biscancel is '是否已销户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberopenclose.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberopenclose.sseqno is '流水号/50/';
COMMENT ON COLUMN 	zj_memberopenclose.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_memberopenclose.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_memberopenclose.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberopenclose.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberopenclose.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberopenclose.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberopenclose.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberopenclose.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberopenclose.sinaccount is '入金账号/50/';
COMMENT ON COLUMN 	zj_memberopenclose.sinaccountname is '入金账户名称/500/';
COMMENT ON COLUMN 	zj_memberopenclose.soutaccount is '出金账号/50/';
COMMENT ON COLUMN 	zj_memberopenclose.soutaccountname is '出金账户名称/500/';
COMMENT ON COLUMN 	zj_memberopenclose.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_memberopenclose.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberopenclose.sbillno is '单据编号/50/订单号
合同号
挂牌号
备用字段';
COMMENT ON COLUMN 	zj_memberopenclose.itype is '开销户类型//0:OPEN:开户
1:CLOSE:销户';
COMMENT ON COLUMN 	zj_memberopenclose.sthirdlogno is '银行前置流水号/50/';
COMMENT ON COLUMN 	zj_memberopenclose.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_memberopenclose.sacctdate is '银行会计日期/50/';
COMMENT ON COLUMN 	zj_memberopenclose.ddate is '开销户时间//';
COMMENT ON COLUMN 	zj_memberopenclose.sbanksigninfo is '银行签名/512/';
COMMENT ON COLUMN 	zj_memberopenclose.sfirstoperatorid is '初审人/32/';
COMMENT ON COLUMN 	zj_memberopenclose.dfirstdate is '初审日期//';
COMMENT ON COLUMN 	zj_memberopenclose.ssecondoperatorid is '复审人/32/';
COMMENT ON COLUMN 	zj_memberopenclose.dseconddate is '复审日期//';
COMMENT ON COLUMN 	zj_memberopenclose.bisbankrequest is '是否银行发起/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberopenclose.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_memberopenclose.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_memberopenclose.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfeebill.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberfeebill.sfeeno is '费用编号/50/';
COMMENT ON COLUMN 	zj_memberfeebill.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberfeebill.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_memberfeebill.famount is '金额//';
COMMENT ON COLUMN 	zj_memberfeebill.sfeecatlog is '费用类别/50/集合参数中获取。';
COMMENT ON COLUMN 	zj_memberfeebill.ifeetype is '费用类型/0:TRADE:交易手续费
1:MEMBER:会员费
2:FINANCINGFEE:融资服务费
3:REGULATORFEE:监管费
4:CUSTODYFEE:保管费
5:INSURANCEFEE:保险费
10:OTHER:其他费用/0交易手续费、
1会员费
';
COMMENT ON COLUMN 	zj_memberfeebill.istatus is '审核状态/0 :NEW:录入
1 :CHECK1:待审核
2 :CHECK2:待审核
3 :CHECK3:待审核
4 :CHECK4:待审核
5 :CHECK5:待审核
10: CHECKED:审核通过
11 :REJECT:被拒绝/';
COMMENT ON COLUMN 	zj_memberfeebill.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_memberfeebill.ddate is '流水时间//';
COMMENT ON COLUMN 	zj_memberfeebill.sfirstoperatorid is '记账人/32/';
COMMENT ON COLUMN 	zj_memberfeebill.dfirstdate is '记账日期//';
COMMENT ON COLUMN 	zj_memberfeebill.ssecondoperatorid is '审核人/32/';
COMMENT ON COLUMN 	zj_memberfeebill.dseconddate is '复审日期//';
COMMENT ON COLUMN 	zj_memberfeebill.scheckinfo is '审核意见/2000/';
COMMENT ON COLUMN 	zj_memberbreachbill.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberbreachbill.sbreachno is '违约金编号/50/';
COMMENT ON COLUMN 	zj_memberbreachbill.spromisefundid is '守约方账户ID/32/';
COMMENT ON COLUMN 	zj_memberbreachbill.sbreachmemberid is '违约方会员ID/32/';
COMMENT ON COLUMN 	zj_memberbreachbill.sbreachfundid is '违约方账户ID/32/';
COMMENT ON COLUMN 	zj_memberbreachbill.spromisememberid is '守约方会员ID/32/';
COMMENT ON COLUMN 	zj_memberbreachbill.famount is '金额//';
COMMENT ON COLUMN 	zj_memberbreachbill.sbreachcatlog is '违约类别/50/集合参数中获取。';
COMMENT ON COLUMN 	zj_memberbreachbill.sbillno is '单据编号/50/';
COMMENT ON COLUMN 	zj_memberbreachbill.sbilltype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_memberbreachbill.istatus is '审核状态/0 :NEW:录入
1 :CHECK1:待审核
2 :CHECK2:待审核
3 :CHECK3:待审核
4 :CHECK4:待审核
5 :CHECK5:待审核
10: CHECKED:审核通过
11 :REJECT:被拒绝/';
COMMENT ON COLUMN 	zj_memberbreachbill.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_memberbreachbill.ddate is '流水时间//';
COMMENT ON COLUMN 	zj_memberbreachbill.sfirstoperatorid is '记账人/32/';
COMMENT ON COLUMN 	zj_memberbreachbill.dfirstdate is '记账日期//';
COMMENT ON COLUMN 	zj_memberbreachbill.ssecondoperatorid is '审核人/32/';
COMMENT ON COLUMN 	zj_memberbreachbill.dseconddate is '审核日期//';
COMMENT ON COLUMN 	zj_memberbreachbill.scheckinfo is '审核意见/2000/';
COMMENT ON COLUMN 	zj_inoroutrecord.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_inoroutrecord.sseqno is '流水号/50/';
COMMENT ON COLUMN 	zj_inoroutrecord.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_inoroutrecord.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_inoroutrecord.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_inoroutrecord.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_inoroutrecord.sinaccount is '入金账号/50/';
COMMENT ON COLUMN 	zj_inoroutrecord.sinaccountname is '入金账户名称/500/';
COMMENT ON COLUMN 	zj_inoroutrecord.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_inoroutrecord.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_inoroutrecord.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_inoroutrecord.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_inoroutrecord.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_inoroutrecord.itype is '出入金类型//0 out
1 in';
COMMENT ON COLUMN 	zj_inoroutrecord.spayno is '支付单号/50/';
COMMENT ON COLUMN 	zj_inoroutrecord.famount is '金额//';
COMMENT ON COLUMN 	zj_inoroutrecord.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_inoroutrecord.sbanksigninfo is '银行签名/512/';
COMMENT ON COLUMN 	zj_inoroutrecord.dadddate is '添加日期//';
COMMENT ON COLUMN 	zj_inoroutrecord.istatus is '状态/0:WAIT:待激活
1:OK:已激活
2:ERR:异常/';
COMMENT ON COLUMN 	zj_inoroutrecord.soperatorid is '操作人ID/32/';
COMMENT ON COLUMN 	zj_inoroutrecord.iversion is '版本号//';
COMMENT ON COLUMN 	zj_memberfundapply.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberfundapply.saccountno is '交易管理账户编号/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sseqno is '流水号/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sbankid is '监管银行ID/32/';
COMMENT ON COLUMN 	zj_memberfundapply.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberfundapply.sbankname is '监管银行名称/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberfundapply.sbanksubaccountflag is '银行子账户账户性质/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sbanksubaccountcardtype is '银行子账户证件类型/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sbanksubaccountcardno is '银行子账户证件号/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sinaccount is '入金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sinaccountname is '入金账户名称/300/';
COMMENT ON COLUMN 	zj_memberfundapply.sinaccountbankcode is '入金账户联行号（分行号）/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sinaccountbankname is '入金账户开户行名称/300/';
COMMENT ON COLUMN 	zj_memberfundapply.sinaccountaddress is '入金账户收付款地址/200/';
COMMENT ON COLUMN 	zj_memberfundapply.sinaccounttrantype is '入金账户转账方式/50/';
COMMENT ON COLUMN 	zj_memberfundapply.soutaccount is '出金账号（结算账户）/50/';
COMMENT ON COLUMN 	zj_memberfundapply.soutaccountname is '出金账户名称/300/';
COMMENT ON COLUMN 	zj_memberfundapply.soutaccountbankname is '出金账户开户行名称/300/';
COMMENT ON COLUMN 	zj_memberfundapply.soutaccountbankcode is '出金账户联行号（分行号）/50/';
COMMENT ON COLUMN 	zj_memberfundapply.soutaccounttrantype is '出金账户转账方式/50/';
COMMENT ON COLUMN 	zj_memberfundapply.soutaccountaddress is '出金账户收付款地址/200/';
COMMENT ON COLUMN 	zj_memberfundapply.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberfundapply.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberfundapply.istatus is '状态/0:WAIT:待激活
1:OK:已激活
2:ERR:异常/0  待激活
1  已激活
2  异常';
COMMENT ON COLUMN 	zj_memberfundapply.bisbindinaccount is '是否已绑定入金账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfundapply.bisbindoutaccount is '是否已绑定出金账户/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberfundapply.ssignature is '签名串//';
COMMENT ON COLUMN 	zj_memberfundapply.dadddate is '添加日期//';
COMMENT ON COLUMN 	zj_memberfundapply.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	zj_memberfundapply.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	zj_memberfundapply.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	zj_memberfundapply.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_memberfundapply.iversion is '版本号//';
COMMENT ON COLUMN 	zj_payexception.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_payexception.sseqno is '支付流水号/50/';
COMMENT ON COLUMN 	zj_payexception.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_payexception.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_payexception.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_payexception.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_payexception.sbankname is '银行名称/50/';
COMMENT ON COLUMN 	zj_payexception.spayfundid is '付款方账户ID/32/';
COMMENT ON COLUMN 	zj_payexception.spaymemberid is '付款方会员ID/32/';
COMMENT ON COLUMN 	zj_payexception.spaymemberno is '付款方会员编号/50/';
COMMENT ON COLUMN 	zj_payexception.spaybanksubaccount is '付款方子账户账号/50/';
COMMENT ON COLUMN 	zj_payexception.spaybanksubaccountname is '付款方子账户名称/300/';
COMMENT ON COLUMN 	zj_payexception.sreceivefundid is '收款方账户ID/32/';
COMMENT ON COLUMN 	zj_payexception.sreceivememberid is '收款方会员ID/32/';
COMMENT ON COLUMN 	zj_payexception.sreceivebanksubaccount is '收款方子账户账号/50/';
COMMENT ON COLUMN 	zj_payexception.sreceivebanksubaccountname is '收款方子账户名称/300/';
COMMENT ON COLUMN 	zj_payexception.sreceivememberno is '收款方会员编号/50/';
COMMENT ON COLUMN 	zj_payexception.ipaytype is '支付类型/0:OUT:出金
1:IN:入金
10:FREEZE:冻结
11:FREE:解冻
20:LOCK:担保支付
21:RETURN:退款
31:RECEIVE:收款
70:FREEZEBANK:银行冻结
71:FREEBANK:银行解冻
72:LOCKBANK:银行锁定
73:UNLOCKBANK:银行解锁
90:REAL_PAY:直接支付/';
COMMENT ON COLUMN 	zj_payexception.ifundtype is '资金类型/0:MARGIN:保证金
1:PAYMENT:货款
2:BREACH:违约金
3:FEE:服务费
4:DEBIT:贷款
5:INTEREST:利息
6:BROKERAGE:拥金
/';
COMMENT ON COLUMN 	zj_payexception.ifeetype is '费用类型/0:TRADE:交易手续费
1:MEMBER:会员费
2:FINANCINGFEE:融资服务费
3:REGULATORFEE:监管费
4:CUSTODYFEE:保管费
5:INSURANCEFEE:保险费
10:OTHER:其他费用/0交易手续费、
1会员费
';
COMMENT ON COLUMN 	zj_payexception.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_payexception.famount is '金额//';
COMMENT ON COLUMN 	zj_payexception.ffeeamount is '手续费//';
COMMENT ON COLUMN 	zj_payexception.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_payexception.sbillno is '单据编号/50/订单号
合同号
挂牌号
备用字段';
COMMENT ON COLUMN 	zj_payexception.iobecttype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_payexception.itype is '类型/0:REALPAY:融资平台已经支付
1:NOTREALPAY:融资平台未支付
/';
COMMENT ON COLUMN 	zj_payexception.istatus is '状态/0:WAIT:待处理
1:SUCCESS:已处理/';
COMMENT ON COLUMN 	zj_payexception.sremark is '备注/2000/';
COMMENT ON COLUMN 	zj_payexception.dacctdate is '交易日期//';
COMMENT ON COLUMN 	zj_payexception.ddate is '支付时间//';
COMMENT ON COLUMN 	zj_payexception.sbanksigninfo is '签名信息/512/';
COMMENT ON COLUMN 	zj_payexception.dadddate is '添加日期//';
COMMENT ON COLUMN 	zj_payexception.soperatorid is '操作人ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sbankserialno is '银行流水编号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sserialno is '流水编号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sqydm is '交易网代码/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.spayfundid is '付款方账户ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.spaysubaccount is '付款方子账户账号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.spaysubaccountname is '付款方子账户名称/300/';
COMMENT ON COLUMN 	zj_memberfundpayserial.spaymemberid is '付款方会员ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.spaymemberno is '付款方会员编号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.spayopertorid is '付款方交易员ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sreceivefundid is '收款方账户ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sreceivesubaccount is '收款方子账户账号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sreceivesubaccountname is '收款方子账户名称/300/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sreceivememberid is '收款方会员ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sreceivememberno is '收款方会员编号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sreceiveopertorid is '收款方交易员ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.ipaytype is '支付类型/0:OUT:出金
1:IN:入金
10:FREEZE:冻结
11:FREE:解冻
20:LOCK:担保支付
21:RETURN:退款
31:RECEIVE:收款
70:FREEZEBANK:银行冻结
71:FREEBANK:银行解冻
72:LOCKBANK:银行锁定
73:UNLOCKBANK:银行解锁
90:REAL_PAY:直接支付/';
COMMENT ON COLUMN 	zj_memberfundpayserial.ifundtype is '资金类型/0:MARGIN:保证金
1:PAYMENT:货款
2:BREACH:违约金
3:FEE:服务费
4:DEBIT:贷款
5:INTEREST:利息
6:BROKERAGE:拥金
/';
COMMENT ON COLUMN 	zj_memberfundpayserial.famount is '金额//';
COMMENT ON COLUMN 	zj_memberfundpayserial.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sbillno is '单据编号/50/';
COMMENT ON COLUMN 	zj_memberfundpayserial.iobecttype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_memberfundpayserial.sremark is '摘要/500/';
COMMENT ON COLUMN 	zj_memberfundpayserial.ddate is '流水时间//';
COMMENT ON COLUMN 	zj_memberfundpayserial.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_memberfundpayserial.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_memberfundpayserial.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberdebt.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberdebt.sdebtno is '欠款编号/50/';
COMMENT ON COLUMN 	zj_memberdebt.smemberid is '欠款会员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	zj_memberdebt.fdebtamount is '欠款金额//';
COMMENT ON COLUMN 	zj_memberdebt.ifeetype is '费用类型/0:TRADE:交易手续费
1:MEMBER:会员费
2:FINANCINGFEE:融资服务费
3:REGULATORFEE:监管费
4:CUSTODYFEE:保管费
5:INSURANCEFEE:保险费
10:OTHER:其他费用/0交易手续费、
1会员费
';
COMMENT ON COLUMN 	zj_memberdebt.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberdebt.sbillno is '单据编号/50/';
COMMENT ON COLUMN 	zj_memberdebt.ibilltype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_memberdebt.bisrepayment is '是否已还款/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberdebt.drepaymentdate is '还款日期//';
COMMENT ON COLUMN 	zj_memberdebt.srepaymentoperatorid is '还款交易员ID/32/这里增加卖方会员字段是为了哪些资源可以合并购买';
COMMENT ON COLUMN 	zj_memberdebt.dadddate is '添加日期//';
COMMENT ON COLUMN 	zj_memberdebt.iversion is '版本号//';
COMMENT ON COLUMN 	zj_memberdebt.ipaytype is '支付类型/10:SOP:在线支付
20:OFFLINE:线下支付
/';
COMMENT ON COLUMN 	zj_memberdebt.susername is '支付人/50/';
COMMENT ON COLUMN 	zj_memberdebt.spayaccount is '支付账户/50/';
COMMENT ON COLUMN 	zj_memberdebt.dpaytime is '支付时间//';
COMMENT ON COLUMN 	zj_memberdebt.sacctoperator is '财务处理人/50/';
COMMENT ON COLUMN 	zj_memberdebt.daccttime is '处理时间//';
COMMENT ON COLUMN 	zj_memberdebt.sremark is '备注/1000/';
COMMENT ON COLUMN 	zj_memberdebt.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sfundid is '资金账号ID/32/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.smembername is '会员名称/100/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.ssubacctname is '子账户名称/100/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.ssubacctno is '子帐户账号/100/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.soutinacctname is '出入金帐户名称/50/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.soutinacctno is '出入金帐户账号/100/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.ioutintype is '出入金类型/0:IN:入金账号
1:OUT:出金账号
2:INOUT:出入金账号/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.icoorperson is '对公或对私//';
COMMENT ON COLUMN 	zj_memberoutinacctbind.icardoracct is '卡号或账号//';
COMMENT ON COLUMN 	zj_memberoutinacctbind.bisinterbank is '是否跨行/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sbankno is '支付系统行号/200/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sbankaddress is '开户行地址/200/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sbankorder is '银行顺序号/50/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.iorder is '顺序号//';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sprovice is '省份/32/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.scity is '城市/32/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sthirdlogno is '交易流水号/50/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.dtradedate is '交易时间//';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sremark1 is '备注1/500/';
COMMENT ON COLUMN 	zj_memberoutinacctbind.sremark2 is '备注2/500/';
COMMENT ON COLUMN 	zj_memberloanserial.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberloanserial.sseqno is '流水号/50/';
COMMENT ON COLUMN 	zj_memberloanserial.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_memberloanserial.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberloanserial.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_memberloanserial.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberloanserial.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberloanserial.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberloanserial.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberloanserial.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberloanserial.soutinaccount is '结算账号/50/';
COMMENT ON COLUMN 	zj_memberloanserial.soutinaccountname is '结算账户名称/500/';
COMMENT ON COLUMN 	zj_memberloanserial.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_memberloanserial.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberloanserial.sbillno is '单据编号/50/订单号
合同号
挂牌号
备用字段';
COMMENT ON COLUMN 	zj_memberloanserial.iobjecttype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_memberloanserial.ifundtype is '操作类型/10:LOANINSUBACCOUNT:贷款发放到子账户
11:LOANINSETTLEACCT:贷款发放到结算账户
20:SUBACCOUNTRELOAN:子账户余额还款
21:SETTLEACCTRELOAN:结算账户还款
22:SUBACCOUNTFRELOANFREEZE:子账户冻结还款
30:SUBACCTREINTEREST:子账户余额还欠息
31:SETTLEACCTREINTEREST:结算账户还欠息
32:SUBACCTREINTERESTFREEZE:子账户冻结还欠息
40:LOANREJECT:贷款拒绝
/';
COMMENT ON COLUMN 	zj_memberloanserial.sloanaccount is '贷款账号/50/';
COMMENT ON COLUMN 	zj_memberloanserial.sthirdlogno is '银行前置流水号/50/';
COMMENT ON COLUMN 	zj_memberloanserial.famount is '金额//';
COMMENT ON COLUMN 	zj_memberloanserial.fhandfee is '手续费//';
COMMENT ON COLUMN 	zj_memberloanserial.finterest is '利息//';
COMMENT ON COLUMN 	zj_memberloanserial.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_memberloanserial.sacctdate is '银行会计日期/50/';
COMMENT ON COLUMN 	zj_memberloanserial.ddate is '交易时间//';
COMMENT ON COLUMN 	zj_memberloanserial.sbanksigninfo is '银行签名/512/';
COMMENT ON COLUMN 	zj_memberloanserial.bisbankrequest is '是否银行发起/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberloanserial.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_memberloanserial.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_memberloanserial.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sseqno is '流水号/50/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sbankid is '银行ID/32/';
COMMENT ON COLUMN 	zj_memberbanklockserial.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sfundid is '账户ID/32/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sinspectaccount is '(监管账号)资金汇总账号/50/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sbanksubaccount is '银行子账户账号/50/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sbanksubaccountname is '银行子账户名称/300/';
COMMENT ON COLUMN 	zj_memberbanklockserial.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zj_memberbanklockserial.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sccycode is '币种/50/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sbillno is '单据编号/50/订单号
合同号
挂牌号
备用字段';
COMMENT ON COLUMN 	zj_memberbanklockserial.iobjecttype is '单据类型/0:IN:入金单
1:OUT:出金单
10:Member:会员
20:Bill:增值服务
30:CONTRACT:合同
31:HTDeliveryOrder :合同提货单
32:HTTransferOrder :合同过户单
40:FINANCINGAPPLY:融资申请单
50:IndentureApply:入库申请单
60:ViewGoodsApply:看货申请单
70:JPFreeze:竞拍保证金
100:Other:其它单据
/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sthirdlogno is '银行前置流水号/50/';
COMMENT ON COLUMN 	zj_memberbanklockserial.itype is '资金类型//0 冻结
1 解冻';
COMMENT ON COLUMN 	zj_memberbanklockserial.famount is '金额//';
COMMENT ON COLUMN 	zj_memberbanklockserial.sremark is '备注/500/';
COMMENT ON COLUMN 	zj_memberbanklockserial.sacctdate is '银行会计日期/50/';
COMMENT ON COLUMN 	zj_memberbanklockserial.ddate is '交易时间//';
COMMENT ON COLUMN 	zj_memberbanklockserial.sbanksigninfo is '银行签名/512/';
COMMENT ON COLUMN 	zj_memberbanklockserial.bisbankrequest is '是否银行发起/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_memberbanklockserial.dtradedate is '交易日期//';
COMMENT ON COLUMN 	zj_memberbanklockserial.dsettledate is '清算日期//';
COMMENT ON COLUMN 	zj_memberbanklockserial.fbissettle is '是否已清算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sp_indexcommodity.sguid is '品名ID/32/';
COMMENT ON COLUMN 	sp_indexcommodity.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	sp_indexcommodity.sname is '品名/50/';
COMMENT ON COLUMN 	sp_indexcommodity.slocalname is '俗名/50/';
COMMENT ON COLUMN 	sp_indexcommodity.senname is '英文名/300/';
COMMENT ON COLUMN 	sp_indexcommodity.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	sp_indexcommodity.sdescription is '品种介绍//';
COMMENT ON COLUMN 	sp_indexcommodity.sjpname is '简拼名/50/';
COMMENT ON COLUMN 	sp_indexcommodity.spyname is '全拼名/100/';
COMMENT ON COLUMN 	sp_indexcommodity.saddress is '图片地址/300/';
COMMENT ON COLUMN 	sp_indexcommodity.biscommon is '是否常用/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sp_indexcommodity.fpricemax is '价格上限//';
COMMENT ON COLUMN 	sp_indexcommodity.fpricemin is '价格下限//';
COMMENT ON COLUMN 	sp_indexcommodity.sspecset is '规格设置/100/';
COMMENT ON COLUMN 	zz_zzitem.sguid is '主键/32/';
COMMENT ON COLUMN 	zz_zzitem.iservicetype is '服务类型/0:AMOUNTINDEX:成交指数
1:PRICEINDEX:价格指数
2:CUSTOMINDEX:客户指数/';
COMMENT ON COLUMN 	zz_zzitem.sitemcode is '服务代码/50/';
COMMENT ON COLUMN 	zz_zzitem.sitemname is '服务名称/100/';
COMMENT ON COLUMN 	zz_zzitem.fprice is '价格//';
COMMENT ON COLUMN 	zz_zzitem.iservicedays is '服务天数//';
COMMENT ON COLUMN 	zz_zzitem.sremark is '备注/2000/';
COMMENT ON COLUMN 	zz_zzfeeserial.sguid is '主键/32/';
COMMENT ON COLUMN 	zz_zzfeeserial.sserialno is '流水编号/50/';
COMMENT ON COLUMN 	zz_zzfeeserial.iservicetype is '服务类型/0:AMOUNTINDEX:成交指数
1:PRICEINDEX:价格指数
2:CUSTOMINDEX:客户指数/';
COMMENT ON COLUMN 	zz_zzfeeserial.sitemid is '增值服务项目ID/32/';
COMMENT ON COLUMN 	zz_zzfeeserial.sitemcode is '服务代码/50/';
COMMENT ON COLUMN 	zz_zzfeeserial.sitemname is '服务名称/100/';
COMMENT ON COLUMN 	zz_zzfeeserial.smembername is '会员名称/100/';
COMMENT ON COLUMN 	zz_zzfeeserial.sopertorid is '交易员ID/32/';
COMMENT ON COLUMN 	zz_zzfeeserial.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zz_zzfeeserial.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zz_zzfeeserial.famount is '金额//';
COMMENT ON COLUMN 	zz_zzfeeserial.sbillid is '单据ID/32/';
COMMENT ON COLUMN 	zz_zzfeeserial.sbillno is '单据编号/50/';
COMMENT ON COLUMN 	zz_zzfeeserial.ddate is '流水时间//';
COMMENT ON COLUMN 	zz_zzfeeserial.fbissettle is '是否已清算//';
COMMENT ON COLUMN 	zz_zzfeeserial.iservicedays is '服务天数//';
COMMENT ON COLUMN 	zz_zzfeeserial.dstartdate is '服务开始日期//';
COMMENT ON COLUMN 	zz_zzfeeserial.denddate is '服务结束日期//';
COMMENT ON COLUMN 	zz_zzfeeserial.sremark is '备注/1000/';
COMMENT ON COLUMN 	zz_memberitem.sguid is '主键/32/';
COMMENT ON COLUMN 	zz_memberitem.sitemid is '服务Id/32/';
COMMENT ON COLUMN 	zz_memberitem.iservicetype is '服务类型/0:AMOUNTINDEX:成交指数
1:PRICEINDEX:价格指数
2:CUSTOMINDEX:客户指数/';
COMMENT ON COLUMN 	zz_memberitem.smembername is '会员名称/100/';
COMMENT ON COLUMN 	zz_memberitem.iservicedays is '服务天数//';
COMMENT ON COLUMN 	zz_memberitem.sitemcode is '服务代码/50/';
COMMENT ON COLUMN 	zz_memberitem.sitemname is '服务名称/100/';
COMMENT ON COLUMN 	zz_memberitem.dstartdate is '服务开始日期//';
COMMENT ON COLUMN 	zz_memberitem.denddate is '服务结束日期//';
COMMENT ON COLUMN 	zz_memberitem.dadddate is '添加时间//';
COMMENT ON COLUMN 	zz_memberitem.dmodifydate is '修改时间//';
COMMENT ON COLUMN 	zz_memberitem.daddoperator is '添加人/50/';
COMMENT ON COLUMN 	zz_memberitem.dmodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	zz_memberitem.sremark is '备注/2000/';
COMMENT ON COLUMN 	zz_memberitem.bisinvalidate is '是否已过期/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zz_memberitem.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	zz_memberitem.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	zj_bizpay.sguid is '主键/32/';
COMMENT ON COLUMN 	zj_bizpay.spayno is '支付单号/50/';
COMMENT ON COLUMN 	zj_bizpay.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	zj_bizpay.sbillid is '支付业务id/32/';
COMMENT ON COLUMN 	zj_bizpay.sbillno is '支付业务编号/50/';
COMMENT ON COLUMN 	zj_bizpay.ibizpaytype is '支付业务类型/0:CONTRACT:合同支付
1:ZZSERVICE:增值服务
2:RECONTRACT:合同二次支付
3:FUNDIN:入金
/';
COMMENT ON COLUMN 	zj_bizpay.ibizpaystatus is '支付状态/0:PAYING:支付中
1:SUCCESS:支付成功
2:FAILD:支付失败
3:KERNELFAILD:对方成功平台出错
/';
COMMENT ON COLUMN 	zj_bizpay.smarketserailno is '平台流水号/100/';
COMMENT ON COLUMN 	zj_bizpay.sbankserialno is '对方流水号/100/';
COMMENT ON COLUMN 	zj_bizpay.sreqparam is '请求参数//';
COMMENT ON COLUMN 	zj_bizpay.srspparam is '返回参数//';
COMMENT ON COLUMN 	zj_bizpay.ddate is '交易日期//';
COMMENT ON COLUMN 	zj_bizpay.dreqtime is '请求时间//';
COMMENT ON COLUMN 	zj_bizpay.drsptime is '响应时间//';
COMMENT ON COLUMN 	zj_bizpay.bissettled is '是否已结算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	zj_bizpay.sbankreq is '异步请求//';
COMMENT ON COLUMN 	zj_bizpay.sbankrsp is '异步响应//';
COMMENT ON COLUMN 	zj_bizpay.fpreamount is '申请支付金额//';
COMMENT ON COLUMN 	zj_bizpay.frealamount is '实际支付金额//';
COMMENT ON COLUMN 	zj_bizpay.sfundacountid is '资金账户id/32/';
COMMENT ON COLUMN 	zj_bizpay.smemberid is '会员Id/32/';
COMMENT ON COLUMN 	zj_bizpay.suserid is '交易员id/32/';
COMMENT ON COLUMN 	zj_bizpay.sremark is '备注/1000/';
COMMENT ON COLUMN 	zj_bizpay.iversion is '版本号//';
COMMENT ON COLUMN 	bb_categoryreport.sguid is '主键/32/';
COMMENT ON COLUMN 	bb_categoryreport.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	bb_categoryreport.scategory is '品种名称/50/';
COMMENT ON COLUMN 	bb_categoryreport.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	bb_categoryreport.scategoryjpname is '简拼名/100/';
COMMENT ON COLUMN 	bb_categoryreport.scategorypyname is '全拼名/100/';
COMMENT ON COLUMN 	bb_categoryreport.icount is '成交笔数//';
COMMENT ON COLUMN 	bb_categoryreport.fweight is '成交量//';
COMMENT ON COLUMN 	bb_categoryreport.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	bb_categoryreport.famount is '成交总金额//';
COMMENT ON COLUMN 	bb_categoryreport.fmaxprice is '最高价//';
COMMENT ON COLUMN 	bb_categoryreport.fminprice is '最低价//';
COMMENT ON COLUMN 	bb_categoryreport.favgprice is '平均价//';
COMMENT ON COLUMN 	bb_categoryreport.fprefectprice is '指导价格//';
COMMENT ON COLUMN 	bb_categoryreport.fmaxzdamount is '最高价涨跌额//';
COMMENT ON COLUMN 	bb_categoryreport.fminzdamount is '最低价涨跌额//';
COMMENT ON COLUMN 	bb_categoryreport.favgzdamount is '平均价涨跌额//';
COMMENT ON COLUMN 	bb_categoryreport.fmaxzdscale is '最高价涨跌比例//';
COMMENT ON COLUMN 	bb_categoryreport.fminzdscale is '最低价涨跌比例//';
COMMENT ON COLUMN 	bb_categoryreport.favgzdscale is '平均价涨跌比例//';
COMMENT ON COLUMN 	bb_categoryreport.ddate is '结算日//';
COMMENT ON COLUMN 	bb_commodityreport.sguid is '主键/32/';
COMMENT ON COLUMN 	bb_commodityreport.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	bb_commodityreport.scategory is '品种名称/50/';
COMMENT ON COLUMN 	bb_commodityreport.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	bb_commodityreport.scategoryjpname is '品种简拼名/100/';
COMMENT ON COLUMN 	bb_commodityreport.scategorypyname is '品种全拼名/100/';
COMMENT ON COLUMN 	bb_commodityreport.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	bb_commodityreport.scommodityname is '品名名称/50/';
COMMENT ON COLUMN 	bb_commodityreport.scommoditysystemcode is '品名系统编码/100/';
COMMENT ON COLUMN 	bb_commodityreport.scommodityjpname is '品名简拼名/100/';
COMMENT ON COLUMN 	bb_commodityreport.scommoditypyname is '品名全拼名/100/';
COMMENT ON COLUMN 	bb_commodityreport.icount is '成交笔数//';
COMMENT ON COLUMN 	bb_commodityreport.fweight is '成交量//';
COMMENT ON COLUMN 	bb_commodityreport.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	bb_commodityreport.famount is '成交总金额//';
COMMENT ON COLUMN 	bb_commodityreport.fmaxprice is '最高价//';
COMMENT ON COLUMN 	bb_commodityreport.fminprice is '最低价//';
COMMENT ON COLUMN 	bb_commodityreport.favgprice is '平均价//';
COMMENT ON COLUMN 	bb_commodityreport.fprefectprice is '指导价格//';
COMMENT ON COLUMN 	bb_commodityreport.fmaxzdamount is '最高价涨跌额//';
COMMENT ON COLUMN 	bb_commodityreport.fminzdamount is '最低价涨跌额//';
COMMENT ON COLUMN 	bb_commodityreport.favgzdamount is '平均价涨跌额//';
COMMENT ON COLUMN 	bb_commodityreport.fmaxzdscale is '最高价涨跌比例//';
COMMENT ON COLUMN 	bb_commodityreport.fminzdscale is '最低价涨跌比例//';
COMMENT ON COLUMN 	bb_commodityreport.favgzdscale is '平均价涨跌比例//';
COMMENT ON COLUMN 	bb_commodityreport.ddate is '结算日//';
COMMENT ON COLUMN 	bb_commodityreport.sbigcategorysystemcode is '品种大类系统编码/100/';
COMMENT ON COLUMN 	bb_commodityreport.sbigcategoryid is '品种大类ID/32/';
COMMENT ON COLUMN 	bb_commodityreport.sbigcategoryname is '品种大类名称/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.sguid is '主键/32/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.sresourceid is '资源id/32/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.iresourcetype is '资源类型/0:SALE:卖单
1:BUY:买单
2:JP:竞拍/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.sresourceno is '资源编号/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.scommodityname is '品名/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.suserid is '客户id/32/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.susername is '客户登录名/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.sname is '姓名/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.smobile is '手机号码/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.scnname is '公司名称/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.sip is 'IP地址/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.scountry is '国家/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.sprovice is '省份/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.scity is '城市/100/';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.icount is '访问次数//';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.dvisitedate is '访问日期//';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.dsettledate is '结算日//';
COMMENT ON COLUMN 	bb_resourcecostomsrcreport.sremark is '备注/1000/';
COMMENT ON COLUMN 	ds_planjob.sguid is '主键/32/';
COMMENT ON COLUMN 	ds_planjob.sname is '定时任务名称/50/';
COMMENT ON COLUMN 	ds_planjob.itasktype is '任务类型/0:SEND_MEMBER_MESSAGE:发会员消息
1:SEND_ADMIN_MESSAGE:发系统管理员消息
2:RUN_PROCEDURE:定时运行存储过程

/发会员消息
发系统消息';
COMMENT ON COLUMN 	ds_planjob.dplanexectime is '计划运行时间//';
COMMENT ON COLUMN 	ds_planjob.dexectime is '实际运行时间//';
COMMENT ON COLUMN 	ds_planjob.sparameter is '其他参数/2000/';
COMMENT ON COLUMN 	ds_planjob.bisover is '是否执行完成//正常
删除';
COMMENT ON COLUMN 	ds_planjob.bissuccess is '是否执行成功//';
COMMENT ON COLUMN 	ds_planjob.dadddate is '添加日期//';
COMMENT ON COLUMN 	ds_planjob.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	ds_planjob.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	ds_planjob.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	ds_planjob.bisdelete is '是否删除//';
COMMENT ON COLUMN 	ds_planjob.sremark is '备注/2000/';
COMMENT ON COLUMN 	ds_planjob.bisfailstop is '是否失败终止//';
COMMENT ON COLUMN 	ds_planjob.ifailcount is '失败次数//';
COMMENT ON COLUMN 	ds_planjob.iresendcount is '重发次数//';
COMMENT ON COLUMN 	ds_hplanjob.sguid is '主键/32/';
COMMENT ON COLUMN 	ds_hplanjob.dbalancedate is '结算日期//';
COMMENT ON COLUMN 	ds_hplanjob.sname is '定时任务名称/50/';
COMMENT ON COLUMN 	ds_hplanjob.itasktype is '任务类型/0:SEND_MEMBER_MESSAGE:发会员消息
1:SEND_ADMIN_MESSAGE:发系统管理员消息
2:RUN_PROCEDURE:定时运行存储过程

/';
COMMENT ON COLUMN 	ds_hplanjob.dplanexectime is '计划运行时间//';
COMMENT ON COLUMN 	ds_hplanjob.dexectime is '实际运行时间//';
COMMENT ON COLUMN 	ds_hplanjob.bisover is '是否执行完成//正常
删除';
COMMENT ON COLUMN 	ds_hplanjob.sremark is '备注/2000/';
COMMENT ON COLUMN 	ds_hplanjob.bissuccess is '是否执行成功//';
COMMENT ON COLUMN 	ds_hplanjob.sparameter is '其他参数/2000/';
COMMENT ON COLUMN 	ds_hplanjob.dadddate is '添加日期//';
COMMENT ON COLUMN 	ds_hplanjob.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	ds_hplanjob.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	ds_hplanjob.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	ds_hplanjob.bisdelete is '是否删除//';
COMMENT ON COLUMN 	ds_hplanjob.bisfailstop is '是否失败终止//';
COMMENT ON COLUMN 	ds_hplanjob.ifailcount is '失败次数//';
COMMENT ON COLUMN 	ds_hplanjob.iresendcount is '重发次数//';
COMMENT ON COLUMN 	sp_commondataappy.sguid is 'ID/32/';
COMMENT ON COLUMN 	sp_commondataappy.sno is '编号/100/';
COMMENT ON COLUMN 	sp_commondataappy.stitle is '标题/1000/';
COMMENT ON COLUMN 	sp_commondataappy.scontent is '提交内容/1000/';
COMMENT ON COLUMN 	sp_commondataappy.slinkman is '联系人/100/';
COMMENT ON COLUMN 	sp_commondataappy.slinkphone is '联系电话/100/';
COMMENT ON COLUMN 	sp_commondataappy.soperaotr is '处理人/100/';
COMMENT ON COLUMN 	sp_commondataappy.sresult is '处理结果/1000/';
COMMENT ON COLUMN 	sp_commondataappy.dadddate is '提交时间//';
COMMENT ON COLUMN 	sp_commondataappy.dresultdate is '处理时间//';
COMMENT ON COLUMN 	sp_commondataappy.bisresult is '是否已处理/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	ccb_settlelog.sguid is '主键/32/';
COMMENT ON COLUMN 	ccb_settlelog.ddate is '交易日期//';
COMMENT ON COLUMN 	ccb_settlelog.bisstartopclosematch is '是否已开始签约对账//';
COMMENT ON COLUMN 	ccb_settlelog.dstartopclosematchtime is '签约对账开始时间//';
COMMENT ON COLUMN 	ccb_settlelog.dendopclosematchtime is '签约对账结束时间//';
COMMENT ON COLUMN 	ccb_settlelog.bisopclosematch is '签约对账是否匹配//';
COMMENT ON COLUMN 	ccb_settlelog.bisstartoutinmatch is '是否已开始出入金对账//';
COMMENT ON COLUMN 	ccb_settlelog.doutinmatchstarttime is '出入金对账开始时间//';
COMMENT ON COLUMN 	ccb_settlelog.doutinmatchendtime is '出入金对账结束时间//';
COMMENT ON COLUMN 	ccb_settlelog.ioutinmatchfailcount is '出入金对账失败次数//';
COMMENT ON COLUMN 	ccb_settlelog.bisoutinmatch is '出入金是否匹配成功//';
COMMENT ON COLUMN 	ccb_settlelog.bisstartbalance is '是否已开始余额对账//';
COMMENT ON COLUMN 	ccb_settlelog.dbalancestarttime is '余额对账开始时间//';
COMMENT ON COLUMN 	ccb_settlelog.dbalanceendtime is '余额对账结束时间//';
COMMENT ON COLUMN 	ccb_settlelog.ibalancefailcount is '余额对账失败次数//';
COMMENT ON COLUMN 	ccb_settlelog.bisbalancesuccess is '余额是否匹配成功//';
COMMENT ON COLUMN 	ccb_settlelog.istatus is '当前状态/0:INIT:初始化中
10:OPCLOSE_MATCHING:签约对账中
11:OPCLOSE_MATCH_SECCESS:签约对账成功
12:OPCLOSE_MATCH_FAIL:签约对账失败
20:OUTIN_MATCHING:出入金匹配中
21:OUTIN_MATCH_FAIL:出入金匹配失败
22:OUTIN_MATCH_SUCCESS:出入金匹配成功
30:USABLE_MATCHING:余额匹配中
31:USABLE_MATCH_FAIL:余额匹配失败
32:USABLE_MATCH_SUCCESS:余额匹配成功
/';
COMMENT ON COLUMN 	ccb_settlelog.soutinmatchfileaddress is '出入金对账文件地址/300/';
COMMENT ON COLUMN 	ccb_settlelog.ibalancematchseq is '余额对账当前序号//';
COMMENT ON COLUMN 	ccb_settlelog.ioutinmatchseq is '出入金对账当前序号//';
COMMENT ON COLUMN 	ccb_settlelog.dadddate is '添加日期//';
COMMENT ON COLUMN 	ccb_settlelog.soifilestr is '出入金文件明细定位串/200/';
COMMENT ON COLUMN 	ccb_settlelog.soifilename is '出入金文件名/200/';
COMMENT ON COLUMN 	ccb_settlelog.ioireqcount is '出入金文件请求次数//';
COMMENT ON COLUMN 	ccb_settlelog.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	ccb_settlelog.sremark1 is '备注1/500/';
COMMENT ON COLUMN 	ccb_settlelog.sremark2 is '备注2/500/';
COMMENT ON COLUMN 	ccb_inoutserial.sguid is '主键/32/';
COMMENT ON COLUMN 	ccb_inoutserial.ssettlelogid is '建设银行清算日志ID/32/';
COMMENT ON COLUMN 	ccb_inoutserial.sseqno is '序号/50/';
COMMENT ON COLUMN 	ccb_inoutserial.sdate is '交易日期/50/';
COMMENT ON COLUMN 	ccb_inoutserial.smchno is '商户编号/50/';
COMMENT ON COLUMN 	ccb_inoutserial.smchname is '商户名称/200/';
COMMENT ON COLUMN 	ccb_inoutserial.smbrsitno is '会员席位号/50/';
COMMENT ON COLUMN 	ccb_inoutserial.smbrname is '会员名称/200/';
COMMENT ON COLUMN 	ccb_inoutserial.sdrcrcod is '借贷别/50/';
COMMENT ON COLUMN 	ccb_inoutserial.sppacctno32 is '对方账号/对方席位号/50/';
COMMENT ON COLUMN 	ccb_inoutserial.sopcustname is '对方户名/200/';
COMMENT ON COLUMN 	ccb_inoutserial.sdscrp is '摘要/50/';
COMMENT ON COLUMN 	ccb_inoutserial.stxamttyp is '资金类型/50/';
COMMENT ON COLUMN 	ccb_inoutserial.sserialno is '交易流水号/50/';
COMMENT ON COLUMN 	ccb_inoutserial.scontractno is '交易合同号/50/';
COMMENT ON COLUMN 	ccb_inoutserial.samount is '交易金额//';
COMMENT ON COLUMN 	ccb_inoutserial.sremark1 is '备注1/500/';
COMMENT ON COLUMN 	ccb_inoutserial.sremark2 is '备注2/500/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sguid is '主键/32/';
COMMENT ON COLUMN 	ccb_inoutserialerror.ssettlelogid is '华夏银行清算日志表ID/32/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sseqno is '序号/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbtype is '出入金类型(建行)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.stype is '出入金类型(平台)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbmemberno is '会员编号(建行)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.smemberno is '会员编号(平台)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbsubaccount is '子账号(建行)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.ssubaccount is '子账号(平台)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbsubaccountname is '子账户名称(建行)/300/';
COMMENT ON COLUMN 	ccb_inoutserialerror.ssubaccountname is '子账户名称(平台)/300/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccboutinacct is '出入金账号(建行)/32/';
COMMENT ON COLUMN 	ccb_inoutserialerror.soutinacct is '出入金账号(平台)/32/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbamount is '交易金额(建行)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.samount is '交易金额(平台)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sdifference is '差额/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbtradedate is '交易日期(建行)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.stradedate is '交易日期(平台)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbserialno is '流水号(建行)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sserialno is '流水号(平台)/50/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sccbcontractno is '合同编号(建行)/32/';
COMMENT ON COLUMN 	ccb_inoutserialerror.scontractno is '合同编号(平台)/32/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sremark1 is '备注1/300/';
COMMENT ON COLUMN 	ccb_inoutserialerror.sremark2 is '备注2/300/';
COMMENT ON COLUMN 	ccb_balancematchfail.sguid is '主键/32/';
COMMENT ON COLUMN 	ccb_balancematchfail.ssettlelogid is '华夏银行清算日志表ID/32/';
COMMENT ON COLUMN 	ccb_balancematchfail.sacctid is '账号ID/32/';
COMMENT ON COLUMN 	ccb_balancematchfail.ssubaccountno is '子账号/50/';
COMMENT ON COLUMN 	ccb_balancematchfail.ssubaccountname is '子账号名称/300/';
COMMENT ON COLUMN 	ccb_balancematchfail.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	ccb_balancematchfail.fccbamount is '建设银行总金额//';
COMMENT ON COLUMN 	ccb_balancematchfail.famount is '融资平台总金额//';
COMMENT ON COLUMN 	ccb_balancematchfail.famountdifference is '总金额差额//';
COMMENT ON COLUMN 	ccb_balancematchfail.fccbusable is '建设银行可用余额//';
COMMENT ON COLUMN 	ccb_balancematchfail.fusabel is '融资平台可用余额//';
COMMENT ON COLUMN 	ccb_balancematchfail.fusabledifference is '可用余额差额//';
COMMENT ON COLUMN 	ccb_balancematchfail.fccbfreeze is '建设银行冻结余额//';
COMMENT ON COLUMN 	ccb_balancematchfail.ffreeze is '融资平台冻结余额//';
COMMENT ON COLUMN 	ccb_balancematchfail.ffreezedifference is '冻结余额差额//';
COMMENT ON COLUMN 	ccb_balancematchfail.sremark is '对账结果说明/500/';
COMMENT ON COLUMN 	ccb_balancematchfail.sremark1 is '备注1/500/';
COMMENT ON COLUMN 	ccb_balancematchfail.sremark2 is '备注2/500/';
COMMENT ON COLUMN 	ccb_forcepayinform.sguid is '主键/32/';
COMMENT ON COLUMN 	ccb_forcepayinform.scontractno is '合同编号/50/';
COMMENT ON COLUMN 	ccb_forcepayinform.sbuyno is '买方席位号/50/';
COMMENT ON COLUMN 	ccb_forcepayinform.ssellerno is '卖方席位号/50/';
COMMENT ON COLUMN 	ccb_forcepayinform.famount is '合同金额//';
COMMENT ON COLUMN 	ccb_forcepayinform.dcontracttime is '合同时间//';
COMMENT ON COLUMN 	ccb_forcepayinform.ipayseq is '付款期次//';
COMMENT ON COLUMN 	ccb_forcepayinform.istatus is '状态//0:INFORMOK:强制付款通知成功
1:PAYOK:强制付款成功
2:PAYERROR:通知成功付款失败';
COMMENT ON COLUMN 	ccb_forcepayinform.daddtime is '添加时间//';
COMMENT ON COLUMN 	ccb_forcepayinform.dmodifytime is '修改时间//';
COMMENT ON COLUMN 	ccb_forcepayinform.sremark1 is '备注1/500/';
COMMENT ON COLUMN 	ccb_forcepayinform.sremark2 is '备注2/500/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sguid is '主键/32/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.ssettlelogid is '建行对账日志表ID/32/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sseqno is '序号/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sccbtype is '开销户类型(建行)/50/0：正常
1：暂停
2：解约';
COMMENT ON COLUMN 	ccb_openaccountserialerror.stype is '开销户类型(平台)/50/
1 close';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sccbsubaccount is '实时席位号(建行)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.ssubaccount is '实时席位号(平台)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sccbname is '会员名称(建行)/300/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sname is '会员名称(平台)/300/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sccbacctno is '结算账号(建行)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sacctno is '结算账号(平台)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sccbcardtype is '证件类型(建行)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.scardtype is '证件账号(建行)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sccbcardno is '证件类型(平台)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.scardno is '证件号码(平台)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sccbdate is '交易日期(建行)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sdate is '交易日期(平台)/50/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sopncloseseqno is '交易网流水主键/32/';
COMMENT ON COLUMN 	ccb_openaccountserialerror.sremark is '备注/300/';
COMMENT ON COLUMN 	sys_exchangecenter.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_exchangecenter.dtradedate is '交易日期//';
COMMENT ON COLUMN 	sys_exchangecenter.istatus is '状态/10:Open:开市
20:Close:闭市/';
COMMENT ON COLUMN 	bb_proxyaccount.sguid is '主键/32/';
COMMENT ON COLUMN 	bb_proxyaccount.iproxytype is '合作方类型/0:GPMEMBER:挂牌交易会员
1:WEBSITE:合作网站/';
COMMENT ON COLUMN 	bb_proxyaccount.sproxyid is '合作方id/32/';
COMMENT ON COLUMN 	bb_proxyaccount.sproxyname is '合作方名称/100/';
COMMENT ON COLUMN 	bb_proxyaccount.sproxyno is '合作方编号/50/';
COMMENT ON COLUMN 	bb_proxyaccount.fusable is '当前余额//';
COMMENT ON COLUMN 	bb_proxyaccount.fout is '已结算金额//';
COMMENT ON COLUMN 	bb_proxyaccount.dlastsettledate is '上次结算日//';
COMMENT ON COLUMN 	bb_proxyaccount.fscale is '分成比例//';
COMMENT ON COLUMN 	bb_proxyaccount.iprotectmonth is '客户保护期（月）//';
COMMENT ON COLUMN 	bb_proxyaccount.sremark is '备注/1000/';
COMMENT ON COLUMN 	bb_proxyfundout.sguid is '主键/32/';
COMMENT ON COLUMN 	bb_proxyfundout.iproxytype is '合作方类型/0:GPMEMBER:挂牌交易会员
1:WEBSITE:合作网站/';
COMMENT ON COLUMN 	bb_proxyfundout.sproxyid is '合作方id/32/';
COMMENT ON COLUMN 	bb_proxyfundout.sproxyname is '合作方名称/100/';
COMMENT ON COLUMN 	bb_proxyfundout.sproxyno is '合作方编号/50/';
COMMENT ON COLUMN 	bb_proxyfundout.foutamount is '出金金额//';
COMMENT ON COLUMN 	bb_proxyfundout.soperatorid is '操作人id/32/';
COMMENT ON COLUMN 	bb_proxyfundout.soperatorname is '操作人账号/50/';
COMMENT ON COLUMN 	bb_proxyfundout.dlastsettledate is '操作日期//';
COMMENT ON COLUMN 	bb_proxyfundout.sremark is '备注/1000/';
COMMENT ON COLUMN 	jp_jpresourceoffer.sguid is '主键/32/';
COMMENT ON COLUMN 	jp_jpresourceoffer.sresourceid is '资源ID/32/';
COMMENT ON COLUMN 	jp_jpresourceoffer.sresourceno is '资源编号/50/';
COMMENT ON COLUMN 	jp_jpresourceoffer.fofferweight is '重量//';
COMMENT ON COLUMN 	jp_jpresourceoffer.fofferamount is '出价//';
COMMENT ON COLUMN 	jp_jpresourceoffer.bisavarible is '是否有效/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	jp_jpresourceoffer.smemberid is '出价会员ID/32/';
COMMENT ON COLUMN 	jp_jpresourceoffer.smembername is '出价会员名称/100/';
COMMENT ON COLUMN 	jp_jpresourceoffer.smemberno is '出价会员编号/50/';
COMMENT ON COLUMN 	jp_jpresourceoffer.dadddate is '出价时间//';
COMMENT ON COLUMN 	jp_jpresourceoffer.suserid is '操作人Id/32/';
COMMENT ON COLUMN 	jp_jpresourceoffer.susername is '操作人登录名/50/';
COMMENT ON COLUMN 	jp_jpresourceoffer.sremark is '备注/1000/';
COMMENT ON COLUMN 	jp_jpresourceoffer.dmodifydate is '修改时间//';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.sguid is '主键/32/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.sresourceid is '资源ID/32/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.sresourceno is '资源编号/50/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.dadddate is '操作时间//';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.saddoperator is '操作人/50/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.istatus is '状态/0:NORMAL:正常
1:PAID:已支付合同
2:RETURN:已退款/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.famount is '金额//';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.sno is '编号/50/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.smembername is '会员名称/100/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.ibanktype is '银行类型/0:SDB:深发展
1:FUIOU:富友三方支付
2:HXB:华夏银行
3:CCB:建设银行
4:SFT:盛付通
5:AIP:通联支付
/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.sremark is '备注/1000/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.sfundaccountid is '资金账户id/32/';
COMMENT ON COLUMN 	jp_jpresourcefundfreeze.dmodifydate is '修改时间//';
COMMENT ON COLUMN 	jp_jpresource.sguid is '主键/32/';
COMMENT ON COLUMN 	jp_jpresource.sresourceno is '编号/50/';
COMMENT ON COLUMN 	jp_jpresource.iresourcetype is '竞拍资源类型/0:YUANMU:原木类
1:CHENGPIN:成品类/0:STANDARD:标准
1:NONSTANDARD:非标';
COMMENT ON COLUMN 	jp_jpresource.sgpmemberid is '挂牌交易会员Id/32/';
COMMENT ON COLUMN 	jp_jpresource.icredit is '诚信分//';
COMMENT ON COLUMN 	jp_jpresource.smemberid is '会员ID/32/';
COMMENT ON COLUMN 	jp_jpresource.smemberno is '会员编号/50/';
COMMENT ON COLUMN 	jp_jpresource.suserid is '交易员ID/32/';
COMMENT ON COLUMN 	jp_jpresource.susername is '交易员登录名/50/';
COMMENT ON COLUMN 	jp_jpresource.smembername is '企业名称/100/';
COMMENT ON COLUMN 	jp_jpresource.scategorysystemcode is '品种系统编码/100/';
COMMENT ON COLUMN 	jp_jpresource.scommoditysystemcode is '品名系统编码/100/';
COMMENT ON COLUMN 	jp_jpresource.sbigcategorysystemcode is '品种大类系统编码/100/';
COMMENT ON COLUMN 	jp_jpresource.sbigcategoryid is '品种大类ID/32/';
COMMENT ON COLUMN 	jp_jpresource.sbigcategoryname is '品种大类名称/100/';
COMMENT ON COLUMN 	jp_jpresource.scommodityid is '品名ID/32/';
COMMENT ON COLUMN 	jp_jpresource.scategoryid is '品种ID/32/';
COMMENT ON COLUMN 	jp_jpresource.scategory is '品种名称/300/';
COMMENT ON COLUMN 	jp_jpresource.scommodityname is '品名/300/';
COMMENT ON COLUMN 	jp_jpresource.slocalname is '俗名/300/';
COMMENT ON COLUMN 	jp_jpresource.senname is '英文名/300/';
COMMENT ON COLUMN 	jp_jpresource.ssubstitute is '替代品/300/';
COMMENT ON COLUMN 	jp_jpresource.sclassification is '所属分类/300/';
COMMENT ON COLUMN 	jp_jpresource.stinypic is '小图片/300/';
COMMENT ON COLUMN 	jp_jpresource.swoodlevel is '等级/300/业务参数';
COMMENT ON COLUMN 	jp_jpresource.sspec is '规格/300/';
COMMENT ON COLUMN 	jp_jpresource.sspeca is '规格参数1/300/';
COMMENT ON COLUMN 	jp_jpresource.suses is '用途/300/';
COMMENT ON COLUMN 	jp_jpresource.sspecb is '规格参数2/300/';
COMMENT ON COLUMN 	jp_jpresource.sspecc is '规格参数3/300/';
COMMENT ON COLUMN 	jp_jpresource.smaterial is '材质/300/';
COMMENT ON COLUMN 	jp_jpresource.sorigincountryid is '产地国家id/32/';
COMMENT ON COLUMN 	jp_jpresource.soriginareaid is '产地地区id/32/';
COMMENT ON COLUMN 	jp_jpresource.sorigincountry is '产地国家/100/';
COMMENT ON COLUMN 	jp_jpresource.soriginarea is '产地地区/100/';
COMMENT ON COLUMN 	jp_jpresource.sbrand is '品牌/100/';
COMMENT ON COLUMN 	jp_jpresource.sproducer is '生产厂家/100/';
COMMENT ON COLUMN 	jp_jpresource.spacking is '包装/100/';
COMMENT ON COLUMN 	jp_jpresource.sweightunit is '数量单位/100/';
COMMENT ON COLUMN 	jp_jpresource.smeasurement is '计量方式/100/';
COMMENT ON COLUMN 	jp_jpresource.dproductiondate is '生产日期//';
COMMENT ON COLUMN 	jp_jpresource.sprovince is '交货省份/300/';
COMMENT ON COLUMN 	jp_jpresource.scity is '交货城市/300/';
COMMENT ON COLUMN 	jp_jpresource.saddress is '交货地址/300/';
COMMENT ON COLUMN 	jp_jpresource.swarehouse is '交货仓库/300/';
COMMENT ON COLUMN 	jp_jpresource.swarehouseid is '仓库ID/32/';
COMMENT ON COLUMN 	jp_jpresource.iupdown is '涨跌//';
COMMENT ON COLUMN 	jp_jpresource.fstartprice is '起拍价//';
COMMENT ON COLUMN 	jp_jpresource.fholdprice is '保留价//';
COMMENT ON COLUMN 	jp_jpresource.fperamount is '加价幅度//';
COMMENT ON COLUMN 	jp_jpresource.iperaddminutes is '加价延长分钟数//';
COMMENT ON COLUMN 	jp_jpresource.idistendminutes is '加价距离结束分钟数//';
COMMENT ON COLUMN 	jp_jpresource.fbuyerrequidamount is '入场保证金额//';
COMMENT ON COLUMN 	jp_jpresource.ioffercount is '出价次数//';
COMMENT ON COLUMN 	jp_jpresource.fcurrentmaxprice is '当前最高价//';
COMMENT ON COLUMN 	jp_jpresource.fweight is '重量//';
COMMENT ON COLUMN 	jp_jpresource.fminbuyamount is '最小购买重量//';
COMMENT ON COLUMN 	jp_jpresource.denddate is '挂牌结束时间//';
COMMENT ON COLUMN 	jp_jpresource.fmatchamount is '成交金额//';
COMMENT ON COLUMN 	jp_jpresource.fmatchweight is '成交量//';
COMMENT ON COLUMN 	jp_jpresource.ideliverydays is '交货期限//';
COMMENT ON COLUMN 	jp_jpresource.ddeliverydate is '交货日期//';
COMMENT ON COLUMN 	jp_jpresource.dbegindate is '挂牌日期//';
COMMENT ON COLUMN 	jp_jpresource.istatus is '状态/0:APPLY:申请中
1:CANCEL:取消申请
3:CHECKOK:审核通过
4:REJECT:审核拒绝
5:OVER:已经结束/0:APPLY:申请中
1:CANCEL:取消申请
3:CHECKOK:审核通过
4:REJECT:审核拒绝
5:OVER:已经结束';
COMMENT ON COLUMN 	jp_jpresource.bisdelete is '是否删除/0:NO:否
1:YES:是
/0：未删除
1：已删除';
COMMENT ON COLUMN 	jp_jpresource.ihitcount is '点击量//';
COMMENT ON COLUMN 	jp_jpresource.iversion is '版本号//';
COMMENT ON COLUMN 	jp_jpresource.sserviceman is '联系人/50/';
COMMENT ON COLUMN 	jp_jpresource.sservicetel is '联系电话/50/';
COMMENT ON COLUMN 	jp_jpresource.sserviceqq is '联系QQ/50/';
COMMENT ON COLUMN 	jp_jpresource.saddoperator is '添加人/50/';
COMMENT ON COLUMN 	jp_jpresource.dadddate is '添加日期//';
COMMENT ON COLUMN 	jp_jpresource.dmodifydate is '修改日期//';
COMMENT ON COLUMN 	jp_jpresource.smodifyoperator is '修改人/50/';
COMMENT ON COLUMN 	jp_jpresource.sdescription is '详情描述//';
COMMENT ON COLUMN 	jp_jpresource.sremark is '备注/2000/';
COMMENT ON COLUMN 	jp_jpresource.scheckresult is '审核结果/500/';
COMMENT ON COLUMN 	jp_jpresource.scheckusername is '审核人登录名/50/';
COMMENT ON COLUMN 	jp_jpresource.schecktime is '审核时间//';
COMMENT ON COLUMN 	jp_jpresource.scheckuserid is '审核人id/32/';
COMMENT ON COLUMN 	jp_jpresource.bissettled is '是否已结算/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	sys_tradedate.sguid is '主键/32/';
COMMENT ON COLUMN 	sys_tradedate.ddate is '日期//';
COMMENT ON COLUMN 	sys_tradedate.bistrade is '是否交易日/0:NO:否
1:YES:是
/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.sguid is '主键/32/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.scartid is '购物车Id/32/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.iseq is '议价序次//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.fprice is '原价//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.fbuyerprice is '买家出价//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.fbuyerdiscount is '出价优惠幅度//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.fsellerdiscount is '还价优惠幅度//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.fsellerprice is '卖家还价//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.fweight is '数量//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.sweightunit is '数量单位/50/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.sbuyermemberid is '买家会员id/32/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.买家会员名称 is '买家会员名称/50/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.买家操作员登录名 is '买家操作员登录名/50/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.suserid is '买家操作员id/32/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.daddtime is '添加时间//';
COMMENT ON COLUMN 	dd_saleorderpricerecord.scontent is '报价内容/1000/';
COMMENT ON COLUMN 	dd_saleorderpricerecord.bisconfirmedprice is '是否确认价格/0:NO:否
1:YES:是
/';

}
