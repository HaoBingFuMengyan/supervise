package com.frogsing.java.po;

import com.frogsing.pdm.PDM;
import com.frogsing.pdm.Parser;
import com.frogsing.pdm.PdmCode;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
public class MakeExtEntity {

	public static void main(String[] args) throws Exception{
//		make("area.pdm");
//		make("article.pdm");
//		make("dispatch.pdm");
//		make("file.pdm");
//		make("goods.pdm");
//		make("layout.pdm");
//		make("log.pdm");
//		make("member.pdm");
//		make("message.pdm");
//		make("operator.pdm");
//		make("parameter.pdm");
		make("contract.pdm");
//		make("resource.pdm");



	}

	public static void make(String name) throws Exception
	{
		String currentdir = (new File("").getAbsolutePath());
		if(currentdir.indexOf("heart")<0){
			currentdir=currentdir+"/modules/heart";
		}
		System.out.println(currentdir);

		PdmCode.RunPath = currentdir;
		PdmCode.FtlPath = currentdir + "/src/test/java/com/frogsing/java/";
		PdmCode.OutPath = currentdir;
		PdmCode.forlang=PdmCode.Lang.java;
		PDM pdm ;
		try{
			pdm = new Parser().pdmParser(currentdir
					+ String.format("/../../doc/model/%s",name));
		}
		catch (Exception e) {
			e.printStackTrace();
			return;
		}
			 		  
	 String files[][]=
	{
	 // {"鸣蛙软件.xml","po/test.ftl","@po/test.txt","null.xml","object:all"},

	//    {"mtl.xml","po/type.ftl.ftl","@po/type.ftl","null.xml","object:all"},
		{"mtl.xml","po/Getset.java.ftl","@po/Getset.java","null.xml","object:all"},
	//	{"mtl.xml","po/work.ext.txt.ftl","@po/work.ext.txt","null.xml","object:all"},
	  	//		 {"鸣蛙软件.xml" , "po/entity.java.ftl","/src/auto/java/com/todaysteel/auto/po/out/sys/Operator.java", "null.xml", "object:Operator;pack:com.todaysteel.auto.po.out"}
	};
	
	               
	 try{
	for(int i=0;i<files.length;i++){
	   PdmCode.execute(files[i],pdm);	  
	}
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }

	ArrayList<String> list=getObjects(PdmCode.FtlPath+"/po/work.ext.txt");
	
	for(String str:list)
	{
		String sCmd[]=str.split(",");
		PdmCode.execute(sCmd,pdm);	
	}
	
	
	
	}
	   public  static ArrayList<String> getObjects(String fileName) {
		   ArrayList<String> list=new ArrayList<String>();
	        File file = new File(fileName);
	        BufferedReader reader = null;
	        try {
	          //  System.out.println("以行为单位读取文件内容，一次读一整行：");
	            reader = new BufferedReader(new FileReader(file));
	            String tempString = null;
	         
	            while ((tempString = reader.readLine()) != null) {
	            	
	               list.add(tempString.replace(" ", ""));	               
	            }
	            reader.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (reader != null) {
	                try {
	                    reader.close();
	                } catch (IOException e1) {
	                }
	            }
	        }
	        return list;
	    }


}

