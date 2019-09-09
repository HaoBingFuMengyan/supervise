/**
 * 
 */
package com.frogsing.heart.Excel;

/**
 * @author sandy
 *
 */
public class ColnameToField {

	private String colname;//列名  
    private String fieldName;//类属性名  
    private String link;  //超链接属性
    public ColnameToField(String fieldName, String colname){  
        this.colname = colname;  
        this.fieldName = fieldName;  
    }
    public ColnameToField(String fieldName, String colname, String link){  
        this.colname = colname;  
        this.fieldName = fieldName;
        this.link = link;
    }
    public String getColname() {  
        return colname;  
    }  
    public void setColname(String colname) {  
        this.colname = colname;  
    }  
    public String getFieldName() {  
        return fieldName;  
    }  
    public void setFieldName(String fieldName) {  
        this.fieldName = fieldName;  
    }
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}  
    
}
