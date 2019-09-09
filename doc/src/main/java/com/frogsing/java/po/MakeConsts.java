package com.frogsing.java.po;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import com.frogsing.pdm.PDM;
import com.frogsing.pdm.Parser;
import com.frogsing.pdm.PdmCode;

public class MakeConsts {
	public static void main(String[] args) throws Exception{
 
		String currentdir = (new File("").getAbsolutePath());
 
		PdmCode.RunPath = currentdir;
		PdmCode.FtlPath = currentdir + "/src/test/java/com/frogsing/java/";
		PdmCode.OutPath = currentdir;
		PdmCode.forlang=PdmCode.Lang.java;
		PDM pdm = new Parser().pdmParser(currentdir
				+ "/../../doc/model/frrz.pdm");
		
		 String files[][]=
		{
		   {"mtl.xml","po/constswork.txt.ftl","@po/work.txt","null.xml","object:all"},
		   {"mtl.xml","po/Consts.java.ftl","../po/src/main/java/com/frogsing/po/utils/Consts.java","null.xml","object:all"},
		   {"mtl.xml","po/ConstsTag.java.ftl","../po/src/main/java/com/frogsing/po/utils/ConstsTag.java","null.xml","object:all"},
		   {"mtl.xml","po/Colums.java.ftl","../po/src/main/java/com/frogsing/po/utils/Colums.java","null.xml","object:all"},
		   {"mtl.xml","po/consts.tld.ftl","../po/src/main/resources/META-INF/consts.tld","null.xml","object:all"},

		};
		try {
			for (int i = 0; i < files.length; i++) {
				PdmCode.execute(files[i], pdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		ArrayList<String> list = getObjects(PdmCode.FtlPath+ "/po/work.txt");

		for (String str : list) {
			String sCmd[] = str.split(",");
			PdmCode.execute(sCmd, pdm);
		}

		System.exit(0);
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
