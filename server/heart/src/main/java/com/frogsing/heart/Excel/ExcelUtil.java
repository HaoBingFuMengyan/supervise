package com.frogsing.heart.Excel;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * 导出excel并下下载
 * @author wangjianglin
 */
public class ExcelUtil {

	public static List<Map<String, String>> parseExcelFile(String path) {
		return null;
	}
	
	/** 导出excel下载 */
	public static void renderToExcel(List<String> keys, List<Map<String,String>> data, HttpServletResponse response,String excelName) throws IOException{
		if(keys == null || keys.isEmpty() || data == null || data.isEmpty())
			return;
		
		// 创建excel工作簿
        Workbook wb = new HSSFWorkbook();
        // 创建第一个sheet
        Sheet sheet = wb.createSheet("data");
        
        // 创建标题行
        Row row = sheet.createRow((short) 0);
        for(int i = 0; i < keys.size(); i++){
        	String fieldName = keys.get(i);
        	Cell cell = row.createCell(i);
        	cell.setCellValue(fieldName);
        }
        
        for(int j = 0; j < data.size(); j++){
        	Map<String,String> map = data.get(j);
        	Row r = sheet.createRow(j+1);
        	
        	for(int i = 0; i < keys.size(); i++){
            	String fieldName = keys.get(i);
            	Object value = map.get(fieldName);
            	Cell cell = r.createCell(i);
            	cell.setCellValue(value != null ? value.toString() : null);
            }
        }
        
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            wb.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
		
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+excelName+".xls");

        ServletOutputStream out = response.getOutputStream();

        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;

        try {

            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);

            byte[] buff = new byte[2048];
            int bytesRead;

            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        }
        finally {
            if (bis != null) bis.close();
            if (bos != null) bos.close();
        }
        return;
	}
	
	/*private String parseExcel(Cell cell) {  
        String result = new String();  
        switch (cell.getCellType()) {  
        case HSSFCell.CELL_TYPE_NUMERIC:// 数字类型  
            if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式  
                SimpleDateFormat sdf = null;  
                if (cell.getCellStyle().getDataFormat() == HSSFDataFormat  
                        .getBuiltinFormat("h:mm")) {  
                    sdf = new SimpleDateFormat("HH:mm");  
                } else {// 日期  
                    sdf = new SimpleDateFormat("yyyy-MM-dd");  
                }  
                Date date = cell.getDateCellValue();  
                result = sdf.format(date);  
            } else if (cell.getCellStyle().getDataFormat() == 58) {  
                // 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)  
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
                double value = cell.getNumericCellValue();  
                Date date = org.apache.poi.ss.usermodel.DateUtil  
                        .getJavaDate(value);  
                result = sdf.format(date);  
            } else {  
                double value = cell.getNumericCellValue();  
                CellStyle style = cell.getCellStyle();  
                DecimalFormat format = new DecimalFormat();  
                String temp = style.getDataFormatString();  
                // 单元格设置成常规  
                if (temp.equals("General")) {  
                    format.applyPattern("#");  
                }  
                result = format.format(value);  
            }  
            break;  
        case HSSFCell.CELL_TYPE_STRING:// String类型  
            result = cell.getRichStringCellValue().toString();  
            break;  
        case HSSFCell.CELL_TYPE_BLANK:  
            result = "";  
        default:  
            result = "";  
            break;  
        }  
        return result;  
    }  */

}