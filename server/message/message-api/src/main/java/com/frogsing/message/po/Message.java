package com.frogsing.message.po;
//frogsingcode//


import com.frogsing.message.utils.MESSAGECol;
import com.frogsing.operator.utils.OPERATORCol;
import com.google.common.collect.Lists;

import javax.persistence.*;
import java.util.List;

//frogsingcode//
@Entity
@Table(name = "cx_message")
//frogsingcode//
//frogsingcode//
public class Message  extends  MessageBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//


	private List<MessageDetail> messageDetails = Lists.newArrayList();

	@OneToMany(fetch= FetchType.LAZY)
	@JoinColumn(name = MESSAGECol.cx_messagedetail.smessageid,updatable = false, insertable = false, nullable = true)
	@OrderBy("dsenddatetime asc ")

	public List<MessageDetail> getMessageDetails() {
		return messageDetails;
	}

	public void setMessageDetails(List<MessageDetail> messageDetails) {
		this.messageDetails = messageDetails;
	}

	//frogsingcode//
	
}
