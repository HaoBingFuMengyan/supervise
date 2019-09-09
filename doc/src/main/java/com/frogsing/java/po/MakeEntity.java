package com.frogsing.java.po;

import com.frogsing.pdm.PDM;
import com.frogsing.pdm.Parser;
import com.frogsing.pdm.PdmCode;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class MakeEntity {
	public static void main(String[] args) throws Exception{
		List<String> list=new ArrayList<String>();
		list.add("log.pdm");
		list.add("parameter.pdm");
		list.add("operator.pdm");
		list.add("project.pdm");
		list.add("file.pdm");

		for(int i=0;i<list.size();i++){
			System.out.println(String.format("%d:%s",i,list.get(i)));
		}

		Scanner scan = new Scanner(System.in);
		while(true){
			System.out.print("请输入模块名或序号并回车：");
			String s = scan.nextLine();
			System.out.println("-----------");
			if(s.equals("exit")||s.isEmpty()){
				break;
			}else{
				if(list.contains(s.trim()))
				{
					make(s);
					continue;
				}
				try{
					int cmd=Integer.parseInt(s);
					if(cmd>=0&&cmd<list.size()){
						s=list.get(cmd);
						make(s);
						continue;
					}
				}
				catch (Exception ex){

					System.out.println("错误的输入，请重新输入：");
				}
			}
		}

	}
	public static void make(String name) throws Exception{
 
		String currentdir = (new File("").getAbsolutePath());
		if(currentdir.indexOf("doc")<0){
			currentdir=currentdir+"/doc";
		}
		System.out.println(currentdir);

		PdmCode.RunPath = currentdir;
		PdmCode.FtlPath = currentdir + "/src/main/java/com/frogsing/java/";
		PdmCode.OutPath = currentdir;
		PdmCode.forlang=PdmCode.Lang.java;
		PDM pdm ;
		try{
		 pdm = new Parser().pdmParser(currentdir
				+ String.format("/model/%s",name));
		}
		catch (Exception e) {
			e.printStackTrace();
			return;
		}
		String pk=pdm.getCode().toLowerCase();
		String bigpk=pk.toUpperCase();
		 String files[][]=
		{
		   {"mtl.xml","po/work.txt.ftl","@po/work.txt","null.xml","object:all;"},
		   {"mtl.xml","po/Consts.java.ftl",String.format("../server/%1$s/%1$s-api/src/main/java/com/frogsing/%1$s/utils/%3$s.java",pdm.getCode(),pk,bigpk),"null.xml",String.format("object:all;pack:%s", bigpk)},
		   {"mtl.xml","po/ConstsTag.java.ftl",String.format("../server/%1$s/%1$s-api/src/main/java/com/frogsing/%1$s/utils/%3$sTag.java",pdm.getCode(),pk,bigpk),"null.xml",String.format("object:all;pack:%s", bigpk)},
		   {"mtl.xml","po/Colums.java.ftl",String.format("../server/%1$s/%1$s-api/src/main/java/com/frogsing/%1$s/utils/%3$sCol.java",pdm.getCode(),pk,bigpk),"null.xml",String.format("object:all;pack:%s", bigpk)},
		   {"mtl.xml","po/consts.tld.ftl",String.format("../server/%1$s/%1$s-api/src/main/resources/META-INF/%1$s.tld",pdm.getCode(),pk,bigpk),"null.xml",String.format("object:all;pack:%s", bigpk)},
			{"mtl.xml","po/pom.xml.ftl",String.format("../server/%1$s/%1$s-api/pom.xml",pdm.getCode()),"null.xml",String.format("replace:no;object:all;pack:%s", "api")},
			{"mtl.xml","po/pom.xml.ftl",String.format("../server/%1$s/%1$s-service/pom.xml",pdm.getCode()),"null.xml",String.format("replace:no;object:all;pack:%s", "service")}

		};
		try {
			for (int i = 0; i < files.length; i++) {
				PdmCode.execute(files[i], pdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
	
		ArrayList<String> list = getObjects(PdmCode.FtlPath+ "/po/work.txt");

		for (String str : list) {
			String sCmd[] = str.split(",");
			PdmCode.execute(sCmd, pdm);
		}

		//System.exit(0);
	}

	public static ArrayList<String> getObjects(String fileName) {
		ArrayList<String> list = new ArrayList<String>();
		File file = new File(fileName);
		BufferedReader reader = null;
		try {
			// System.out.println("以行为单位读取文件内容，一次读一整行：");
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
