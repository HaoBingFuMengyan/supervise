package com.frogsing.message.utils;

import java.io.File;
import java.util.Map;
import java.util.Properties;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.frogsing.heart.freemarker.FreeMarkerUtils;
import com.frogsing.heart.spring.Props;


/**
 * 发送邮件类
 * 
 * @author <a href=" mailto:haifeng.cauc@gmail.com">chain</a>
 * @since version1.0
 */
public class EmailUtils {
	private static Log log = LogFactory.getLog(EmailUtils.class);
	private static String email_host = null;
	private static String email_servermail = null;
	private static String email_username = null;
	private static String email_password = null;
	private static JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	static {
		try {
			
			
			email_host = Props.get("email.host").trim();
			email_servermail = Props.get("email.servermail").trim();
			email_username = Props.get("email.username").trim();
			email_password = Props.get("email.password").trim();

			log.info("成功加载系统邮件配置...");
		} catch (Exception e) {
			log.error("加载系统邮件配置出错" + e);
		}
	}

	/**
	 * 发送普通文本邮件
	 * 
	 * @param title
	 *            ,邮件标题
	 * @param params
	 *            ,文本参数
	 * @param content
	 *            , 模板
	 * @param email
	 *            ,收件人
	 * @return
	 */
	public static boolean mailText(String title,
			String content, String... email) {
		try {
			mailSender.setUsername(email_username);
			mailSender.setPassword(email_password);
			mailSender.setHost(email_host);
			Properties p = new Properties();
			p.setProperty("mail.smtp.auth", "true");
			p.setProperty("mail.smtp.starttls.enable", "true");
			p.setProperty("mail.smtp.ssl.enable", Props.get("email.smtp.ssl.enable"));
			p.setProperty("mail.smtp.port",Props.get("email.smtp.port"));
			mailSender.setJavaMailProperties(p);
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			helper.setTo(email);
			helper.setFrom(email_servermail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(msg);
			return true;
		} catch (Exception e) {
			log.error("邮件发送出错：" + e);
			return false;
		}
	}

	/**
	 * 以File类型发送邮件带附件
	 * 
	 * @param title
	 *            , 标题
	 * @param params
	 *            , 文本参数
	 * @param content
	 *            , 内容
	 * @param files
	 *            , 文件，key为文件名，value为文件,key以ts_m_(ts_m_融资单2012...)开头表示key为文件名，
	 *            否则取file的name
	 * @param email
	 *            ,收件人
	 * @return
	 */
	public static boolean mailFiles(String title, Map<String, Object> params,
			String content, Map<String, File> files, String email) {
		try {
			mailSender.setUsername(email_username);
			mailSender.setPassword(email_password);
			mailSender.setHost(email_host);
			Properties p = new Properties();
			p.setProperty("mail.smtp.auth", "true");
			p.setProperty("mail.smtp.starttls.enable", "true");
			mailSender.setJavaMailProperties(p);
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			helper.setTo(email);
			helper.setFrom(email_servermail);
			helper.setSubject(title);
			helper.setText(FreeMarkerUtils.renderModel(params, content), true);

			// 附件
			for (String file_name : files.keySet()) {
				if (file_name.startsWith("ts_m_")) {
					File file = files.get(file_name.substring(5));
					helper.addAttachment(
							MimeUtility.encodeText(file_name.substring(5)),
							file);
				} else {
					helper.addAttachment(MimeUtility.encodeText(file_name),
							files.get(file_name));
				}
			}
			mailSender.send(msg);
			return true;
		} catch (Exception e) {
			log.error("邮件发送出错：" + e);
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 以byte[]类型发送邮件带附件
	 * 
	 * @param title
	 *            , 标题
	 * @param params
	 *            , 文本参数
	 * @param content
	 *            , 内容
	 * @param files
	 *            , 文件，key必须为文件名
	 * @param email
	 *            ,收件人
	 * @return
	 */
	private boolean mailBytes(String title, Map<String, Object> params,
			String content, Map<String, byte[]> files, String email) {
		try {
			mailSender.setUsername(email_username);
			mailSender.setPassword(email_password);
			mailSender.setHost(email_host);
			Properties p = new Properties();
			p.setProperty("mail.smtp.auth", "true");
			p.setProperty("mail.smtp.starttls.enable", "true");
			mailSender.setJavaMailProperties(p);
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			helper.setTo(email);
			helper.setFrom(email_servermail);
			helper.setSubject(title);
			helper.setText(FreeMarkerUtils.renderModel(params, content), true);

			// 附件
			for (String file_name : params.keySet()) {
				if (file_name.startsWith("ts_m_")) {
					// helper.addAttachment(attachmentFilename,
					// InputStreamSource)

					// helper.addAttachment(
					// MimeUtility.encodeText(file_name.substring(5)),
					// file);
				} else {
					// helper.addAttachment(file_name, files.get(file_name));
				}
			}
			mailSender.send(msg);
			return true;
		} catch (Exception e) {
			log.error("邮件发送出错：" + e);
			return false;
		}
	}
}
