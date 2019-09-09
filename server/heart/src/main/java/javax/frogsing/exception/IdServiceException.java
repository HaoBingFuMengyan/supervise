package javax.frogsing.exception;

import com.frogsing.heart.web.utils.MsgUtils;

/**
 * Service层公用的Exception.
 * 
 * 继承自RuntimeException, 从由Spring管理事务的函数中抛出时会触发事务回滚.
 * 
 * @frogsing van
 */
public class IdServiceException extends RuntimeException {

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6662561684218609381L;
	private String id;
	public String getId() {
		return id;
	}

	public IdServiceException() {
		super();
	}

	public IdServiceException(String message,String id) {
		super(MsgUtils.getMsg(message));
		this.id=id;
	}

}
