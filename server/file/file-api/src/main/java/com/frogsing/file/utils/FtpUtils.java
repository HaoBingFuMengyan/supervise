package com.frogsing.file.utils;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.spring.Props;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.Constants;
import com.frogsing.heart.utils.F;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.frogsing.exception.ServiceException;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * FTP客户端工具
 * 
 * @author Administrator
 * 
 */
public class FtpUtils {
	
	//上传文件黑名单
	private static final Map<String,String>  denyFiles = new HashMap<String, String>();	 
	public static void validateFileType(String surfix){
			denyFiles.put("exe", "exe");
			denyFiles.put("mp3", "mp3");
			denyFiles.put("rar", "rar");
			denyFiles.put("mp4", "mp4");
		if(denyFiles.containsValue(surfix.toLowerCase())){
			E.S("不支持文件类型：" + surfix);
		}
	}
	
	public static boolean DBGetParamUploadToFtpServer(File file,
			String serverPath, String fileName, FtpConfig config) {
		FTPClient ftpClient;
		try {
			ftpClient = new FTPClient();// 打开ftp客户端
			// 登录到Ftp服务器
			boolean isOpenSuccess = loginFtp(ftpClient, config);
			if (isOpenSuccess) {// 以下几步顺序不能错
				// 改变当前工作目录，如果不存在，则创建此目录
				if (!ftpClient.changeWorkingDirectory(serverPath)) {
					if (ftpClient.makeDirectory(serverPath)) {
						ftpClient.changeWorkingDirectory(serverPath);
					} else
						throw new ServiceException("创建目录失败！");
				}
				// 设置编码
				ftpClient.setControlEncoding(Constants.UTF_8);
				ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
				FileInputStream inputStream = new FileInputStream(file);
				ftpClient.storeFile(fileName, inputStream);
				close(ftpClient, null, inputStream);// 关闭
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 判断此路径中是否存在此文件
	 * 
	 * @param filePath
	 * @param fileName
	 * @return
	 */
	public static boolean exitFile(String filePath, String fileName,
			FtpConfig config) throws Exception {
		FTPClient ftpClient = null;
		try {
			ftpClient = new FTPClient();// 打开ftp客户端
			// 登录到Ftp服务器
			boolean isOpenSuccess = loginFtp(ftpClient, config);
			if (isOpenSuccess) {// 以下几步顺序不能错
				// 改变当前工作目录，如果不存在，则创建此目录
				String[] paths = filePath.split("/");
				if (null != paths && paths.length > 0) {
					for (String str : paths) {
						if (StringUtils.isNotBlank(str))
							if (!ftpClient.changeWorkingDirectory(str)) {
								throw new ServiceException("检测文件时发现文件目录不存在");
							}
					}
				}

				if (ftpClient.listNames(fileName).length > 0)
					return true;
				else
					return false;
			} else {
				throw new ServiceException("检测文件时登录FTP失败");
			}
		} catch (ServiceException e) {
			throw new Exception(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("检测文件是否存在出现异常");
		} finally {
			if (ftpClient != null)
				ftpClient.disconnect();
		}
	}

	/**
	 * 删除ftp上的文件
	 *
	 * @param path
	 * @return
	 */
	public static boolean deleteFile(String path)  {
		if(B.Y(path))
			return true;
		int i = path.lastIndexOf("/");
		String filePath = path.substring(0, i);
		String fileName = path.substring(i + 1);
		return FtpUtils.deleteFile(filePath,fileName,FtpConfig.getConfig());
	}

	/**
	 * 删除ftp上的文件
	 *
	 * @param filePath
	 * @param fileName
	 * @return
	 */
	public static boolean deleteFile(String filePath, String fileName) throws Exception {
		return FtpUtils.deleteFile(filePath,fileName,FtpConfig.getConfig());
	}


	/**
	 * 删除ftp上的文件
	 * 
	 * @param filePath
	 * @param fileName
	 * @return
	 */
	public static boolean deleteFile(String filePath, String fileName,
			FtpConfig config){
		FTPClient ftpClient = null;
		try {
			ftpClient = new FTPClient();// 打开ftp客户端
			// 登录到Ftp服务器
			boolean isOpenSuccess = loginFtp(ftpClient, config);
			if (isOpenSuccess) {// 以下几步顺序不能错
				// 改变当前工作目录，如果不存在，则创建此目录
				String[] paths = filePath.split("/");
				if (null != paths && paths.length > 0) {
					for (String str : paths) {
						if (StringUtils.isNotBlank(str))
							if (!ftpClient.changeWorkingDirectory(str)) {
								//throw new ServiceException("检测文件时发现文件目录不存在");
								return true;
							}
					}
				}

				if (ftpClient.listNames(fileName).length > 0)
					return ftpClient.deleteFile(fileName);
				else
					return true;
			} else {
				throw new ServiceException("检测文件时登录FTP失败");
			}
		} catch (ServiceException e) {
			throw new ServiceException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("检测文件是否存在出现异常");
		} finally {
			if (ftpClient != null)
				try {
					ftpClient.disconnect();
				} catch (Exception e) {
					e.printStackTrace();
				}

		}
	}

	/**
	 * 下载文件
	 * 
	 * @param ftpClient
	 * @param path
	 * @return
	 */
	public static InputStream downloadFile(FTPClient ftpClient, String path) {
		int i = path.lastIndexOf("/");
		String filePath = path.substring(0, i);
		String fileName = path.substring(i + 1);
		try {
			// 改变当前工作目录，如果不存在，则创建此目录
			if (!ftpClient.changeWorkingDirectory(filePath)) {
				return null;
			}
			// 设置编码
			ftpClient.setControlEncoding(Constants.UTF_8);
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
			return ftpClient.retrieveFileStream(fileName);
		} catch (IOException e) {

			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 下载文件
	 * 
	 * @param ftpClient
	 * @param filePath
	 * @param fileName
	 * @return
	 */
	public static void downloadFile(FTPClient ftpClient, String filePath,
			String fileName, OutputStream outputStream) throws Exception {
		// 改变当前工作目录，如果不存在，则创建此目录
		ftpClient.changeWorkingDirectory("~");
		if (!ftpClient.changeWorkingDirectory(filePath)) {
			return;
		}
		// 设置编码
		ftpClient.setControlEncoding(Constants.UTF_8);
		ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
		ftpClient.enterLocalPassiveMode();
		if (!ftpClient.retrieveFile(fileName, outputStream)) {
			throw new Exception("文件下载出错");
		}
		return;
	}

	/**
	 * 下载文件
	 * 
	 * @param path
	 *            文件路径
	 * @return
	 */
	public static InputStream downloadFile(String path) {
		FtpConfig config = FtpConfig.getConfig();
		FTPClient ftpClient;
		try {
			ftpClient = new FTPClient();// 打开ftp客户端
			// 登录到Ftp服务器
			boolean isOpenSuccess = loginFtp(ftpClient, config);
			if (isOpenSuccess) {// 以下几步顺序不能错
				return downloadFile(ftpClient, path);
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 下载文件返回byte[]
	 * 
	 * @author path
	 * @return
	 */
	public static byte[] dowLoadFile(String path) {
		try {
			InputStream is = downloadFile(path);
			ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
			int ch;
			while ((ch = is.read()) != -1) {
				bytestream.write(ch);
			}
			byte data[] = bytestream.toByteArray();
			bytestream.close();
			return data;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 *            文件
	 * @param serverPath
	 *            上传的路径
	 *            文件名
	 * @return
	 */
	public static String uploadToFtpServer(File file, String serverPath) {

		String fileName = UUID.randomUUID().toString()
				+ file.getName().substring(file.getName().lastIndexOf("."),
						file.getName().length());
		validateFileType(fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()));
		FtpConfig config = FtpConfig.getConfig();
		FTPClient ftpClient;

		try {
			ftpClient = new FTPClient();// 打开ftp客户端
			// 登录到Ftp服务器
			boolean isOpenSuccess = loginFtp(ftpClient, config);

			if (isOpenSuccess) {// 以下几步顺序不能错
				// 改变当前工作目录，如果不存在，则创建此目录
				serverPath=getServicePath(serverPath);
				if (!createDirecroty(serverPath, ftpClient)) {
					throw new ServiceException("创建目录失败！");
				}
				// 设置编码
				ftpClient.setControlEncoding(Constants.UTF_8);
				ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
				FileInputStream inputStream = new FileInputStream(file);
				ftpClient.storeFile(fileName, inputStream);
				close(ftpClient, null, inputStream);// 关闭
			} else {
				return null;
			}
		} catch (Exception e) {
			throw new ServiceException(e);

		}
		return serverPath + "/" + fileName;

	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 *            文件
	 * @param serverPath
	 *            上传的路径
	 *            文件名
	 * @return
	 */

	public static String uploadToFtpServer(CommonsMultipartFile file,
			String serverPath) {

		if(file == null || file.getSize()==0)
			return "";
		String fileName = UUID.randomUUID().toString()
				+ file.getOriginalFilename().substring(
						file.getOriginalFilename().lastIndexOf("."),
						file.getOriginalFilename().length());
		validateFileType(fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()));
		FtpConfig config = FtpConfig.getConfig();
		FTPClient ftpClient;

		try {
			ftpClient = new FTPClient();// 打开ftp客户端
			// 登录到Ftp服务器
			boolean isOpenSuccess = loginFtp(ftpClient, config);
			System.out.println("服务器地址："+ config.getName()+":"+ config.getPassword()+":"+config.getUrl()+":"+isOpenSuccess);

			if (isOpenSuccess) {// 以下几步顺序不能错
				// 改变当前工作目录，如果不存在，则创建此目录
				serverPath=getServicePath(serverPath);
				if (!createDirecroty(serverPath, ftpClient)) {
					throw new ServiceException("创建目录失败！");
				}
				// 设置编码
				ftpClient.setControlEncoding(Constants.UTF_8);
				ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
			//	InputStream in = new FileInputStream(new File(orifilename));
				ftpClient.enterLocalPassiveMode();
				boolean t = ftpClient.storeFile(fileName, file.getInputStream());
				close(ftpClient, null, null);// 关闭
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException(e);

		}
		System.out.println("~~~~~~~~~"+serverPath + "/" + fileName);
		return serverPath + "/" + fileName;
	}

	/** 登录到Ftp服务器 */
	public static boolean loginFtp(FTPClient ftpClient, FtpConfig config) {
		try {
			ftpClient.connect(config.getUrl(), config.getPort());
			ftpClient.login(config.getName(), config.getPassword());
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

	/** 得到本地文件的输入流 */
	public static InputStream getLocalFileInputStream(File file)
			throws FileNotFoundException {
		return new FileInputStream(file);
	}

	/** 下载文件到本地 */
	public static void writeToLocal(InputStream inputStream,
			OutputStream outputStream) throws IOException {
		byte[] bytes = new byte[1024];
		while (inputStream.read(bytes) != -1) {
			outputStream.write(bytes, 0, bytes.length);
		}
	}

	/** 关闭 */
	public static void close(FTPClient ftpClient, OutputStream outputStream,
			InputStream inputStream) throws IOException {
		if (inputStream != null)
			inputStream.close();
		if (outputStream != null)
			outputStream.close();
		if (ftpClient != null)
			ftpClient.disconnect();
	}

	/**
	 * 递归创建远程服务器目录
	 * 
	 * @param remote
	 *            远程服务器文件绝对路径
	 * @param ftpClient
	 *            FTPClient对象
	 * @return 目录创建是否成功
	 * @throws IOException
	 */
	private static boolean createDirecroty(String remote, FTPClient ftpClient)
			throws IOException {
		boolean status = true;
		String directory = remote;// remote.substring(0, remote.lastIndexOf("/")
									// + 1);

		if (!directory.equalsIgnoreCase("/")
				&& !ftpClient.changeWorkingDirectory(new String(directory
						.getBytes("GBK"), "iso-8859-1"))) {
			// 如果远程目录不存在，则递归创建远程服务器目录
			String[] dir = directory.split("/");
			for (String tmp : dir) {
				if (StringUtils.isBlank(tmp))
					continue;
				String subDirectory = new String(tmp.getBytes("GBK"),
						"iso-8859-1");
				if (!ftpClient.changeWorkingDirectory(subDirectory)) {
					if (ftpClient.makeDirectory(subDirectory)) {
						ftpClient.changeWorkingDirectory(subDirectory);
					} else {
						return false;
					}
				}
			}
		}
		return status;
	}

	public static String getServicePath(String path){
		String serverPath = "/" + Props.get("project.name");
		if(B.N(path)) {
			serverPath = serverPath+(path.endsWith("/")?"":"/")+path;
		}
		return serverPath;
	}

	public static String getPrivateDir(String path){
		String serverPath = "/PrivateDir";
		if(B.N(path)) {
			serverPath = serverPath+(path.endsWith("/")?"":"/")+path;
		}
		return serverPath;
	}

	public static String getPublicDir(String path){
		String serverPath = "/PublicDir";
		if(B.N(path)) {
			serverPath = serverPath+(path.endsWith("/")?"":"/")+path;
		}
		return serverPath;
	}

	public static String uploadToFtpServerImg(CommonsMultipartFile file,
			String serverPath) {
		String sname = file.getOriginalFilename();
		String pre = sname.substring(sname.lastIndexOf("."), sname.length() - 1);
		pre = pre.toLowerCase();
		String rightSuffix = ".jpg.jpeg.bmp.gif.png";
		if (rightSuffix.indexOf(pre) < 0)
			E.S("请上传jpg jpeg bmp gif png格式的图片");

		return uploadToFtpServer(file, serverPath);
	}

	public static String uploadToFtpServerImg(CommonsMultipartFile file,
			String serverPath, int maxSize) {
		String sname = file.getOriginalFilename();
		validateFileType(sname.substring(sname.lastIndexOf(".")+1, sname.length()));
		double size = (double) file.getSize() / 1024 / 1024;
		if (F.compareTo(size, maxSize) > 0)
			E.S("超过文件最大限制" + maxSize + "M");
		return uploadToFtpServerImg(file, serverPath);
	}
}