package com.frogsing.model.po;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.frogsing.pdm.*;

public class PdmEntity {
	public static void main(String[] args) throws Exception{
		//make("area.pdm");
		//make("article.pdm");
		List<PDM> list=new ArrayList<PDM>();
		list.add(make("blackbox.pdm"));
		list.add(make("dispatch.pdm"));
		//list.add(make("goods.pdm"));
		//list.add(make("layout.pdm"));
		//list.add(make("log.pdm"));
		list.add(make("member.pdm"));
		list.add(make("message.pdm"));
		//list.add(make("operator.pdm"));
		list.add(make("parameter.pdm"));
		//list.add(make("contract.pdm"));
		//list.add(make("resource.pdm"));
		//list.add(make("layout.pdm"));
		list.add(make("fund.pdm"));
		list.add(make("operator.pdm"));

		makeconst(list);

	}

	private static void makeconst(List<PDM> list) {

		Set<String> set=new HashSet<String>();
		PDM pd_main = list.get(0);

		for (PDMDomain domain : pd_main.getDomains()) {
			set.add(domain.getCode());
		}
		for(int i=1;i<list.size();i++){
			PDM pdm = list.get(i);
			ArrayList<PDMDomain> domains = pd_main.getDomains();
			for (PDMDomain domain : pdm.getDomains()) {
				if(!set.contains(domain.getCode())) {
					set.add(domain.getCode());
					domains.add(domain);
				}
			}
			ArrayList<PDMTable> tables = pd_main.getTables();
			for (int j=0;j<pdm.getTables().size();j++) {
				PDMTable tb = pdm.getTables().get(j);
					tables.add(tb);
			}
			ArrayList<PDMTable> views = pd_main.getViews();
			for (int j=0;j<pdm.getViews().size();j++) {
				PDMTable view = pdm.getViews().get(j);
				views.add(view);
			}
		}
		String currentdir = (new File("").getAbsolutePath());
		if(currentdir.indexOf("doc")<0){
			currentdir=currentdir+"/doc";
		}
		System.out.println(currentdir);
		PdmCode.RunPath = currentdir;
		PdmCode.FtlPath = currentdir + "/src/main/java/com/frogsing/model/";
		PdmCode.OutPath = currentdir;
		PdmCode.forlang=PdmCode.Lang.csharp;
		PDM pdm =pd_main;

		String pk=pdm.getCode().toLowerCase();
		String bigpk=pk.toUpperCase();
		String files[][] = {
				{ "blackbox.xml", "po/dao.xml.ftl", "../client/sing/dao.xml",
						"null.xml", "object:all" },
				{ "blackbox.xml", "po/DaoProxy.cs.ftl",
						"../client/sing/frame/dao/partial/DaoProxy.cs", "null.xml",
						"object:all" },
				{ "blackbox.xml", "po/DaoPartial.cs.ftl",
						"../client/sing/frame/dao/partial/DaoPartial.cs", "null.xml",
						"object:all" },
				{ "blackbox.xml", "po/service.cs.ftl",
						"../client/sing/frame/service/partial/ServicePartial.cs",
						"null.xml", "object:all;pack:service" },
				{ "blackbox.xml", "po/Consts.java.ftl", "../client/model/utils/sys/Consts.cs",
						"null.xml", "object:all" },
				{ "blackbox.xml", "po/Colums.java.ftl", "../client/model/utils/sys/Colums.cs",
						"null.xml", "object:all" }

		};

		try {
			for (int i = 0; i < files.length; i++) {
				PdmCode.execute(files[i], pdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


	}

	public static PDM make(String name) throws Exception{

		String currentdir = (new File("").getAbsolutePath());
		if(currentdir.indexOf("doc")<0){
			currentdir=currentdir+"/doc";
		}
		System.out.println(currentdir);

		PdmCode.RunPath = currentdir;
		PdmCode.FtlPath = currentdir + "/src/main/java/com/frogsing/model/";
		PdmCode.OutPath = currentdir;
		PdmCode.forlang=PdmCode.Lang.csharp;
		PDM pdm ;
		try{
			pdm = new Parser().pdmParser(currentdir
					+ String.format("/model/%s",name));
		}
		catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		String pk=pdm.getCode().toLowerCase();
		String bigpk=pk.toUpperCase();
		String files[][] = {
				// {"blackbox.xml","po/test.ftl","@po/test.txt","null.xml","object:all"},

				// {"blackbox.xml","po/type.ftl.ftl","@po/type.ftl","null.xml","object:all"},
//				{ "blackbox.xml", "po/dao.xml.ftl", "../client/sing/dao.xml",
//						"null.xml", "object:all" },
//				{ "blackbox.xml", "po/DaoProxy.cs.ftl",
//						"../client/sing/frame/dao/partial/DaoProxy.cs", "null.xml",
//						"object:all" },
//				{ "blackbox.xml", "po/DaoPartial.cs.ftl",
//						"../client/sing/frame/dao/partial/DaoPartial.cs", "null.xml",
//						"object:all" },
//				{ "blackbox.xml", "po/service.cs.ftl",
//						"../client/sing/frame/service/partial/ServicePartial.cs",
//						"null.xml", "object:all;pack:service" },
				{ "blackbox.xml", "po/work.txt.ftl", "@po/work.txt",
						"null.xml", "object:all" },
//				{ "blackbox.xml", "po/Consts.java.ftl", "utils/sys/Consts.cs",
//						"null.xml", "object:all" },
//				{ "blackbox.xml", "po/Colums.java.ftl", "utils/sys/Colums.cs",
//						"null.xml", "object:all" },
//				{ "blackbox.xml", "po/alert.sql.ftl", "@po/alert.sql",
//							"null.xml", "object:all" },
		// {"blackbox.xml","po/oracletypefunction.java.ftl","@po/oracletypefunction.sql","null.xml","object:all"},
		//

		// {"blackbox.xml" ,
		// "po/entity.java.ftl","/src/auto/java/com/todaysteel/auto/po/out/sys/Operator.java",
		// "null.xml", "object:Operator;pack:com.todaysteel.auto.po.out"}
		};

		try {
			for (int i = 0; i < files.length; i++) {
				PdmCode.execute(files[i], pdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		ArrayList<String> list = getObjects(PdmCode.FtlPath
				+ "/po/work.txt");

		for (String str : list) {
			String sCmd[] = str.split(",");
			PdmCode.execute(sCmd, pdm);
		}

		return pdm;
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
