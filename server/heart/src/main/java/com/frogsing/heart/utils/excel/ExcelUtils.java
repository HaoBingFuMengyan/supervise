package com.frogsing.heart.utils.excel;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.DateUtils;
import com.google.common.collect.Lists;
 
/**
 * Excel导入的工具类.
 *
 * @author sunhao(sunhao.java@gmail.com)
 * @version V1.0, 14-2-24 下午2:07
 */
public class ExcelUtils {
    private static final Logger logger = LoggerFactory.getLogger(ExcelUtils.class);
    //成功
    public static final Integer STATUS_OK = Integer.valueOf(1);
    //失败
    public static final Integer STATUS_NO = Integer.valueOf(0);
    /**
     * 私有化构造器
     */
    private ExcelUtils(){
 
    }
    /**
	 * 根据HSSFCell类型设置数据
	 * 
	 * @param cell
	 * @return
	 */
	private  static String getCellFormatValue(HSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case HSSFCell.CELL_TYPE_NUMERIC:
			case HSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式

					// 方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
					// cellvalue = cell.getDateCellValue().toLocaleString();

					// 方法2：这样子的data格式是不带带时分秒的：2011-10-12
					Date date = cell.getDateCellValue();
					cellvalue = DateUtils.dateToString(date);

				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case HSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = " ";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;

	}
    private static List<String> readGpExcelTitle(HSSFSheet sheet) {
    	List<String> ls=Lists.newArrayList();
		HSSFRow row = sheet.getRow(0);
		// 标题总列数
		int colNum = row.getLastCellNum();
		String tCell="";
		for (int i = 0; i < colNum; i++) {
			if (null == row.getCell(i)) {
				continue;
			}
			tCell=getCellFormatValue(row.getCell(i));
			if(B.Y(tCell) || "null".equalsIgnoreCase(tCell))
				continue;
			ls.add(tCell);
		}
		return ls;
	}

    /**
     * 获取excel文件中的数据对象
     *
     * @param is                        excel
     * @param excelColumnNames          excel中每个字段的英文名(应该与pojo对象的字段名一致,顺序与excel一致)
     * @return                          excel每行是list一条记录，map是对应的"字段名-->值"
     * @throws Exception
     */
    public static List<Map<String, String>> getImportData(InputStream is) throws Exception {
    	 POIFSFileSystem fs;
    	 HSSFWorkbook wb;
    	 HSSFSheet sheet;
    	 HSSFRow row;
    	logger.debug("InputStream:{}", is);
        fs = new POIFSFileSystem(is);
		wb = new HSSFWorkbook(fs);
		
		sheet = wb.getSheetAt(0);
	
		List<String> excelColumnNames = readGpExcelTitle(sheet);
 
        //行数
        int rowCounts = sheet.getLastRowNum();
        logger.debug("rowCounts:{}", rowCounts);
        List<Map<String, String>> list = new ArrayList<Map<String, String>>(rowCounts - 1);
 
        //双重for循环取出数据
        for(int i = 1; i <=rowCounts; i++){
            Map<String, String> params = new HashMap<String, String>();
            //i,j i:行 j:列
            row=sheet.getRow(i);
            for(int j = 0; j < excelColumnNames.size(); j++){
                String data=getCellFormatValue(row.getCell(j));
                params.put(excelColumnNames.get(j),data);
            }
 
            list.add(params);
        }
 
        return list;
    }
 
    /**
     * 获取导入数据为对象的List
     *
     * @param data
     * @param clazz
     * @param excelColumnNames
     * @param checkExcel
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> List<T> makeData(List<Map<String, String>> data, Class<T> clazz, List<String> excelColumnNames, CheckExcel checkExcel) throws Exception {
        if(data == null || data.isEmpty() || clazz == null || checkExcel == null) {
            return Collections.EMPTY_LIST;
        }
 
        List<T> result = new ArrayList<T>(data.size());
        for(Map<String, String> d : data) {
            if(checkExcel != null && !checkExcel.check(d)) {
                continue;
            }
            T entity = clazz.newInstance();
            for(String column : excelColumnNames) {
                BeanUtils.setProperty(entity, column, d.get(column));
            }
 
            result.add(entity);
        }
 
        return result;
    }
    public static void main(String[] args) {
    	//List<Map<String, String>> data = ExcelUtils.getImportData(is,Constants.EXCEL_COLUMN_NAMES);
    	
	}
}