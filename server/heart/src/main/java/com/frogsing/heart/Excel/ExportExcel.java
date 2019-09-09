/**
 * 
 */
package com.frogsing.heart.Excel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFComment;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHyperlink;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.DateUtils;


/**
 * @author sandy
 *
 */
public class ExportExcel<T> {
	
	private Class<T> classType;
	private List<ColnameToField> colNameToField;// 列名与类属性名的对应关系
	private HSSFWorkbook workbook;
	private HSSFSheet sheet;
	private String title = " ";
	private String remark = " ";
	private String author = " ";
	private HSSFCellStyle headerStyle = null;
	private HSSFCellStyle rowStyle = null;
	private HSSFCellStyle linkStyle = null;
	private HSSFFont headerFont = null;
	private HSSFFont rowFont = null;
	private HSSFFont linkCellFont = null;
	private String dateFormat = "yyyy-MM-dd";// 默认日期格式

	@SuppressWarnings("unchecked")
	private void initClass(){
		// 获取泛型的实际类型
		Type type = this.getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			// 转换成泛型类
			ParameterizedType pType = (ParameterizedType) type;
			this.classType = (Class<T>) pType.getActualTypeArguments()[0];
		}
	}
	
	
	/**
	 * 构造函数导入到Excel文件，需要手动调用构造buildHeader(),buildRow方法
	 * @param colNameToField  列名
	 * @param path  路径，需要包含文件名的
	 */
	public ExportExcel(String title,List<ColnameToField> colNameToField) {
		this.title = title;
		this.colNameToField = colNameToField;
		initClass();
	}
	
	
	/**
	 * 构造函数导入到Excel文件输出流
	 * @param dataset
	 * @param colNameToField
	 * @param out
	 */
	public ExportExcel(String title,Collection<T> dataset,List<ColnameToField> colNameToField) {
		this.title = title;
		this.colNameToField = colNameToField;
		this.initClass();
		this.buildHeader();
		this.buildRow(dataset);
	} 
	
	
	public void buildHeader(){
		// 声明一个工作薄
		workbook = new HSSFWorkbook();
		// 生成一个表格
		sheet = workbook.createSheet(title);
		// 设置表格默认列宽度为20个字节
		sheet.setDefaultColumnWidth(20);
		buildHeaderStyle();
		// 声明一个画图的顶级管理器
		HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		// 定义注释的大小和位置,详见文档
		HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0, 0, 0, 0, (short) 4, 2, (short) 6, 5));
		// 设置注释内容
		comment.setString(new HSSFRichTextString(remark));
		// 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
		comment.setAuthor(author);

		// 产生表格标题行
		HSSFRow row = sheet.createRow(0);
		// 设置表格标题行的列名数组并生成Excel
		for (int i = 0;i< colNameToField.size();i++) {
			HSSFCell cell = row.createCell(i);
			sheet.autoSizeColumn(i);
			cell.setCellStyle(headerStyle);
			HSSFRichTextString text = new HSSFRichTextString(colNameToField.get(i).getColname());
			cell.setCellValue(text);
		}
	}
	
	private void buildHeaderStyle(){
		if(headerStyle == null){
			// 生成一个样式
			headerStyle = workbook.createCellStyle();
			// 设置这些样式
			headerStyle.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
			headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		}
		
		if(headerFont == null){
			// 生成一个字体
			headerFont = workbook.createFont();
			headerFont.setColor(HSSFColor.VIOLET.index);
			headerFont.setFontHeightInPoints((short) 12);
			headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		}
		// 把字体应用到当前的样式
		headerStyle.setFont(headerFont);
	}
	
	private void buildRowStyle(){
		if(rowStyle == null){
			rowStyle = workbook.createCellStyle();
			rowStyle.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
			rowStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			rowStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			rowStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			rowStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			rowStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			rowStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			rowStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		}
		
		if(rowFont == null){
			// 生成一个字体
			rowFont = workbook.createFont();
			rowFont.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		}
		// 把字体应用到当前的样式
		rowStyle.setFont(rowFont);
	}
	
	private void buildLinkStyle(){
		if(linkStyle == null){
			linkStyle = workbook.createCellStyle();
			
			linkStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//左右居中
			linkStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//上下居中
			linkStyle.setBorderBottom((short)1);
			linkStyle.setBorderLeft((short)1);
			linkStyle.setBorderRight((short)1);
			linkStyle.setBorderTop((short)1);
		}
		if(linkCellFont == null){
			linkCellFont= workbook.createFont();
			linkCellFont.setUnderline((byte) 1);
			linkCellFont.setColor(HSSFColor.BLUE.index);
		}
		linkStyle.setFont(linkCellFont);
	}
	
	public void buildRow(Collection<T> dataset){
		if(dataset == null || dataset.size() == 0)
			return;
		buildRowStyle();
		int i = 1;
		for(T obj:dataset){
			this.addRow(obj,i);
			i++;
		}
	}
	
	public void addRow(T obj,int index){
		if(rowStyle == null){
			buildRowStyle();
		}
		HSSFRow row = sheet.createRow(index);
		// 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
		int cellIndex = 0;// Excel列索引
		for (ColnameToField colField : colNameToField) {
			String fieldName = colField.getFieldName();// 取属性名
			try {
				Object value = BeanUtils.getProperty(obj, fieldName);
				if(B.N(colField.getLink())){
					String path = BeanUtils.getProperty(obj, colField.getLink());
					this.buildLinkCell(row, path, value, cellIndex);
				}else{
					this.buildCell(row, value, cellIndex);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 清理资源
				cellIndex++;
			}
		}
	}
	
	/**
	 * 生成列
	 * @param row
	 * @param value
	 * @param index
	 */
	private void buildCell(HSSFRow row,Object value,int index){
		HSSFCell cell = row.createCell(index);
		sheet.autoSizeColumn(index);
		HSSFRichTextString text = null;
		if(value == null)
			value=" ";
		if(value instanceof Date)
			text = new HSSFRichTextString(DateUtils.dateToString((Date)value, dateFormat));
		else
			text = new HSSFRichTextString((String)value);
		cell.setCellValue(text);
	}
	
	/**
	 * 生成链接列
	 * @param workbook
	 * @param row
	 * @param path
	 * @param value
	 * @param index
	 */
	private void buildLinkCell(HSSFRow row,String path,Object value,int index){
		buildLinkStyle();
		HSSFHyperlink link=new HSSFHyperlink(HSSFHyperlink.LINK_URL);
		link.setAddress(path);
		HSSFCell cell = row.createCell(index);
		row.getSheet().autoSizeColumn(index);
		cell.setCellStyle(linkStyle);
		cell.setHyperlink(link);
		cell.setCellValue((String)value);
	}
	
	public void exportOutputStream(OutputStream out){
		try {
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	/**
	 * 根据文件路径将Excel文件导出
	 * @param path
	 * @return
	 */
	public File exportFile(String path) {
		File file = new File(path);
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		OutputStream out = null;
		try {
			out = new FileOutputStream(file);
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return file;
	}


	public void setTitle(String title) {
		this.title = title;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}


	public HSSFWorkbook getWorkbook() {
		return workbook;
	}


	public HSSFSheet getSheet() {
		return sheet;
	}


	public void setHeaderStyle(HSSFCellStyle headerStyle) {
		this.headerStyle = headerStyle;
	}


	public void setRowStyle(HSSFCellStyle rowStyle) {
		this.rowStyle = rowStyle;
	}


	public void setHeaderFont(HSSFFont headerFont) {
		this.headerFont = headerFont;
	}


	public void setRowFont(HSSFFont rowFont) {
		this.rowFont = rowFont;
	}
	
	
}
