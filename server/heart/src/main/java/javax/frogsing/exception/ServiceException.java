package javax.frogsing.exception;

import com.frogsing.common.utils.MsgUtils;
import com.frogsing.heart.utils.B;

import java.io.Serializable;
import java.util.Map;

/**
 * Service层公用的Exception.
 * 
 * 继承自RuntimeException, 从由Spring管理事务的函数中抛出时会触发事务回滚.
 * 
 * @frogsing van
 */
public class ServiceException extends RuntimeException  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2971254198040066282L;

	public String getCode() {
		return B.Y(code)?"999999":code;
	}

	private  String code;
	private Map<String,String> msgmap=null;

	public ServiceException() {
		super();
	}

	public ServiceException(String message) {
		super(MsgUtils.getMsg(message));
	}
	public ServiceException(String code, String message) {
		super(MsgUtils.getMsg(message));
		this.code=code;
	}

	public ServiceException(Map<String,String> map, String message) {
		super(MsgUtils.getMsg(message));
		msgmap = map;
	}
	//在外面用msgutils.get
	public ServiceException(boolean flag, String message) {
		super(message);
	}
	public ServiceException(Throwable cause) {
		super(cause);
	}

	public ServiceException(String message, Throwable cause) {
		super(message, cause);
	}

	public Map<String,String> getMsgmap() {
		return msgmap;
	}
	
}
