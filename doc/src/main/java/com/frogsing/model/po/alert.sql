#sys_operator 管理员
#sys_loginlog 系统管理员登陆信息
#sys_operatorrole 操作员角色表
#sys_rolepurview 后台角色权限分配
#sys_menu 系统菜单设置表
#sys_role sys角色表
#sp_store 商品库存
#sp_inbill 入库单
alter table sp_inbill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_passbill 中转单
#sp_outbill 实提单
alter table sp_outbill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#hy_member 会员信息表
#sp_transferbill 过户单
alter table sp_transferbill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_machining 加工单
alter table sp_machining modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_handling 装卸单
#sp_movepos 移库单
alter table sp_movepos modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_handlingdetail 装卸单明细
#sp_adjustbill 调整单
alter table sp_adjustbill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_passbilldetail 中转单明细
#sp_outbilldetail 实提单明细
#sp_transferbilldetail 过户单明细
#sp_storestackdetail 库存码单明细
#sp_machiningdetail 加工单明细
#sp_outstackdetail 出库码单明细
#cs_storeposition 库位属性
#cs_codegroup 分组编号
#cs_goodsproperty 货物属性
#cs_goodspropertydetail 货物属性明细
#sp_storepos 库存库位
#sp_handlingpos 装卸单库位
#cs_limitbygoods 货物重量下限
#hy_cusdepartment 部门信息
#cs_machine 开平机
#cs_adjustmentparm 理算参数
#hy_staff 员工
#sp_captionmachiningdetail 预加工明细
#sys_systempara 系统信息
#sys_log 日志
#sys_businesspara 业务参数
#sys_sequence 单据编号表
#ht_contract 合同主表
#ht_contractdetail 合同明细
#ht_contractdetailconfig 合同明细配置
#ht_feedetail 费用表
#ht_feebill 结算单
#sys_logdetail 日志详细信息
#sys_frogtemplate 系统模版
#sp_changeserial 商品库存变动流水
#hy_user 交易用户
#hy_actor 会员角色表
#hy_useractor 交易员角色表
#hy_right 会员权限码管理
#hy_actorright 角色权限表
#hy_memberloginlog 交易员登录退出日志
#hy_onlineuser 在线交易员表
#sys_purview 交易系统后台权限码
#sp_checkstore 验收库存
#sp_checkstorestackdetail 验收库存码单明细
#sp_checkbill 验收单
alter table sp_checkbill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_checkstorepos 验收库存库位
#sp_outmsg 出库通知单
alter table sp_outmsg modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_outmsgdetail 出库通知单明细
#hy_bank 银行
#hy_bankpledge 银行质押表
#sp_sendcar 发货车
#hy_bankuser 银行用户
#cs_packageinfo 货物单件信息
#sp_positonstore 库位库存合计
#ds_planjob 定时任务表
#ds_hplanjob 历史定时任务表
#ds_periodjob 周期性任务
#ds_periodjoblog 周期性任务日志
#jk_interfaceconfig 接口对接配置
#sys_parameter 系统参数表
#sys_warehouse 分库管理
#sp_receivestore 收货明细
#sp_receivebill 收货单
alter table sp_receivebill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_moveposdetail 移库单明细
#ht_storefeebuildbill 仓储费用发生单
#cs_goodspropertytotal 物资表
#sp_historystackdetail 历史码单明细表
#sp_outsaybill 发货单
alter table sp_outsaybill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_outsaybilldetail 发货单明细
#sp_storedetail 商品库存明细表
#sp_singlemergebill 单重合并单
#cs_carsproperty 车辆设置
#sp_adjustdetail 调整单明细
#cs_printrestriction 打印次数限制表
#sp_printrecord 打印记录表
#sp_cusmergebill 客户库存合并单
alter table sp_cusmergebill modify dsysdate timestamp default CURRENT_TIMESTAMP;
#sp_cusmergedetail 客户库存合并单明细
#sp_pledgebill 质押单
#sp_pledgedetail 质押明细
#sp_unpledge 解押单
#sp_unpledgedetail 解押单明细
#sys_mac mac地址储存表
#sp_tempprintrecord 临时打印次数记录表
#cs_corpdrawup 提货单位表
#sp_lockbill 锁定库存单
#sp_lockdetail 锁定库存明细
