<#function  fToType p >
<#switch p>
<#case "Weight"><#assign p1="numeric(18,4)"?replace("xs:","")>
<#break>
<#case "Time"><#assign p1="xs:date"?replace("xs:","")>
<#break>
<#case "MemberStatus"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "MaxRemark"><#assign p1="VARCHAR(4000)"?replace("xs:","")>
<#break>
<#case "Fax"><#assign p1="VARCHAR(30)"?replace("xs:","")>
<#break>
<#case "ZipCode"><#assign p1="VARCHAR(10)"?replace("xs:","")>
<#break>
<#case "Addrress"><#assign p1="VARCHAR(200)"?replace("xs:","")>
<#break>
<#case "BankAccount"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "AreaCode"><#assign p1="VARCHAR(30)"?replace("xs:","")>
<#break>
<#case "CardNo"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "MemberType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "Title"><#assign p1="VARCHAR(300)"?replace("xs:","")>
<#break>
<#case "Remark"><#assign p1="VARCHAR(1000)"?replace("xs:","")>
<#break>
<#case "LongRemark"><#assign p1="VARCHAR(2000)"?replace("xs:","")>
<#break>
<#case "DateTime"><#assign p1="xs:date"?replace("xs:","")>
<#break>
<#case "ShortRemark"><#assign p1="VARCHAR(500)"?replace("xs:","")>
<#break>
<#case "Url"><#assign p1="VARCHAR(300)"?replace("xs:","")>
<#break>
<#case "Sex"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "LongName"><#assign p1="VARCHAR(100)"?replace("xs:","")>
<#break>
<#case "Date"><#assign p1="xs:date"?replace("xs:","")>
<#break>
<#case "Bool"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "Mail"><#assign p1="VARCHAR(100)"?replace("xs:","")>
<#break>
<#case "Phone"><#assign p1="VARCHAR(20)"?replace("xs:","")>
<#break>
<#case "Mobile"><#assign p1="VARCHAR(20)"?replace("xs:","")>
<#break>
<#case "Password"><#assign p1="VARCHAR(33)"?replace("xs:","")>
<#break>
<#case "Shortname"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "Code"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "Guid"><#assign p1="VARCHAR(32)"?replace("xs:","")>
<#break>
<#case "Quantity"><#assign p1="numeric(10)"?replace("xs:","")>
<#break>
<#case "Money"><#assign p1="numeric(18,2)"?replace("xs:","")>
<#break>
<#case "FeeRate"><#assign p1="numeric(18,6)"?replace("xs:","")>
<#break>
<#case "StoretType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "Area"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "Integer"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "PayType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "TypeInvoice"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "CarNo"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "TransportType"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "Code50"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "BillType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "CardNum"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "TypeArr"><#assign p1="VARCHAR(50)"?replace("xs:","")>
<#break>
<#case "FlagCharging"><#assign p1="VARCHAR(30)"?replace("xs:","")>
<#break>
<#case "HelpRemember"><#assign p1="VARCHAR(20)"?replace("xs:","")>
<#break>
<#case "OrderNum"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "QuantityUnit"><#assign p1="VARCHAR(20)"?replace("xs:","")>
<#break>
<#case "WeightUnit"><#assign p1="VARCHAR(20)"?replace("xs:","")>
<#break>
<#case "GroupLevel"><#assign p1="VARCHAR(5)"?replace("xs:","")>
<#break>
<#case "ConvPara"><#assign p1="numeric(10,4)"?replace("xs:","")>
<#break>
<#case "TypePack"><#assign p1="varchar(50)"?replace("xs:","")>
<#break>
<#case "StateOut"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "GroupCode"><#assign p1="varchar(5)"?replace("xs:","")>
<#break>
<#case "WayGroup"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "CodePosNo"><#assign p1="varchar(4)"?replace("xs:","")>
<#break>
<#case "StorePosType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "WorkType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "LogType"><#assign p1="varchar(50)"?replace("xs:","")>
<#break>
<#case "BusinessParaType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "PropertyType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "GrossOrNet"><#assign p1="xs:int"?replace("xs:","")>
<#break>
</#switch>
<#if p1?lower_case?starts_with("numeric")>
	<#if (p1?index_of(",")>1)>
	<#return "double">
	<#else>
	<#return "long">
	</#if>
<#else>
	<#if p1?lower_case?starts_with("varchar")>
	<#return "string">
	<#else>
	<#return p1>
	</#if>
</#if>
</#function>

<#function  fToDesc p >
<#switch p>
<#case "Weight">
<#assign p1="">
<#break>
<#case "Time">
<#assign p1="">
<#break>
<#case "MemberStatus">
<#assign p1="0:WAIT:待激活\n      1:NORMAL:正常\n      2 :FLEEZE:冻结">
<#break>
<#case "MaxRemark">
<#assign p1="4000">
<#break>
<#case "Fax">
<#assign p1="32">
<#break>
<#case "ZipCode">
<#assign p1="10">
<#break>
<#case "Addrress">
<#assign p1="200">
<#break>
<#case "BankAccount">
<#assign p1="50">
<#break>
<#case "AreaCode">
<#assign p1="6">
<#break>
<#case "CardNo">
<#assign p1="50">
<#break>
<#case "MemberType">
<#assign p1="0:Store:存货客户\n      1:Market:钢材市场\n      2:Lading:提货单位\n      9:Other:其它">
<#break>
<#case "Title">
<#assign p1="300">
<#break>
<#case "Remark">
<#assign p1="1000">
<#break>
<#case "LongRemark">
<#assign p1="2000">
<#break>
<#case "DateTime">
<#assign p1="">
<#break>
<#case "ShortRemark">
<#assign p1="500">
<#break>
<#case "Url">
<#assign p1="300">
<#break>
<#case "Sex">
<#assign p1="0:MAN:,男\n      1:WOMAN:女">
<#break>
<#case "LongName">
<#assign p1="100">
<#break>
<#case "Date">
<#assign p1="">
<#break>
<#case "Bool">
<#assign p1="">
<#break>
<#case "Mail">
<#assign p1="100">
<#break>
<#case "Phone">
<#assign p1="20">
<#break>
<#case "Mobile">
<#assign p1="20">
<#break>
<#case "Password">
<#assign p1="40">
<#break>
<#case "Shortname">
<#assign p1="50">
<#break>
<#case "Code">
<#assign p1="50">
<#break>
<#case "Guid">
<#assign p1="32">
<#break>
<#case "Quantity">
<#assign p1="">
<#break>
<#case "Money">
<#assign p1="">
<#break>
<#case "FeeRate">
<#assign p1="">
<#break>
<#case "StoretType">
<#assign p1="0:InStore:入库\n      1:Transfer:过户\n      2:Move:移库\n      3:Back:退货\n      4:Unpack:开箱\n      5:OpenSafe:开平\n      6:Pretreatment:预处理\n      9:Other:其它">
<#break>
<#case "Area">
<#assign p1="">
<#break>
<#case "Integer">
<#assign p1="">
<#break>
<#case "PayType">
<#assign p1="0:Customer:客户记帐\n      1:Now:现收\n      9:Other:其它">
<#break>
<#case "TypeInvoice">
<#assign p1="0:Crossing:过站经停\n      1:Conk:到货直发\n      9:Other:其它">
<#break>
<#case "CarNo">
<#assign p1="">
<#break>
<#case "TransportType">
<#assign p1="">
<#break>
<#case "Code50">
<#assign p1="">
<#break>
<#case "BillType">
<#assign p1="0:InStore:入库单\n      1:Transfer:过户单\n      2:Move:移库单\n      3:Back:退货单\n      4:Process:加工单\n      5:OutStore:出库单\n      6:Pass:中转单\n      7:Handling:装卸单\n      9:Other:其它">
<#break>
<#case "CardNum">
<#assign p1="">
<#break>
<#case "TypeArr">
<#assign p1="">
<#break>
<#case "FlagCharging">
<#assign p1="">
<#break>
<#case "HelpRemember">
<#assign p1="">
<#break>
<#case "OrderNum">
<#assign p1="">
<#break>
<#case "QuantityUnit">
<#assign p1="">
<#break>
<#case "WeightUnit">
<#assign p1="">
<#break>
<#case "GroupLevel">
<#assign p1="">
<#break>
<#case "ConvPara">
<#assign p1="">
<#break>
<#case "TypePack">
<#assign p1="">
<#break>
<#case "StateOut">
<#assign p1="0:Say:应发\n      1:Real:实发\n      2:Both:全部\n      3:None:无">
<#break>
<#case "GroupCode">
<#assign p1="">
<#break>
<#case "WayGroup">
<#assign p1="0:A:A吞吐库存报表分类法\n      1:B:B货物重要性(ABC)分类法\n      2:C:C特殊报表分类法">
<#break>
<#case "CodePosNo">
<#assign p1="">
<#break>
<#case "StorePosType">
<#assign p1="0:In:室内库\n      1:Out:室外库\n      2:Special:特殊库\n      9:Other:其它">
<#break>
<#case "WorkType">
<#assign p1="0:Tally:理货员\n      1:Receive:接运员\n      2:Crane:吊车司机\n      3:Forklift:叉车工\n      4:Handling:装卸班组\n      5:Open:开平操作工\n      6:OpenProcess:开平加工班组\n      7:Salesman:业务员\n      8:Money:收银员\n      9:Other:其它">
<#break>
<#case "LogType">
<#assign p1="">
<#break>
<#case "BusinessParaType">
<#assign p1="0:ArrivedType:到货方式\n      1:SendOutType:发货方式\n      10:AdjustReason:调整原因">
<#break>
<#case "PropertyType">
<#assign p1="0: Spec :规格\n      1:Type :型号\n      2:Char :材质\n      3:MadeBy :产地">
<#break>
<#case "GrossOrNet">
<#assign p1="0:Gross:重量以毛重为准\n      1:Net:重量以净重为准">
<#break>
</#switch>
<#return p1>
</#function>