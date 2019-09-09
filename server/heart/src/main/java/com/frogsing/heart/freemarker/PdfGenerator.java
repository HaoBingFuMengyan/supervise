/** 
 * Filename PdfGenerator.java
 * Create on 2014年12月2日
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.freemarker;

import com.frogsing.heart.pdf.AsianFontProvider;
import com.frogsing.heart.utils.B;
import com.google.common.collect.Lists;
import com.itextpdf.awt.geom.Rectangle2D;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.parser.*;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import org.jsoup.Jsoup;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class PdfGenerator {

	/** 
     * Output a pdf to the specified outputstream 
     *  
     * @param htmlStr the htmlstr 
     * @param out the specified outputstream 
     * @throws Exception 
     */  
    public static void generate(String htmlStr, OutputStream out)  
            throws Exception {  
        try {
			/*ITextRenderer renderer = new ITextRenderer();
			ITextFontResolver fontResolver = renderer.getFontResolver(); 
			fontResolver.addFont("/font/arialuni.ttf",BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
			renderer.setDocumentFromString(htmlStr);  
			renderer.layout();  
			renderer.createPDF(out);*/

			Document document = new Document();
			PdfWriter writer = PdfWriter.getInstance(document, out);
			writer.setPageEvent(new HeadFootInfoPdfPageEvent());
			document.open();
			org.jsoup.nodes.Document _doc = Jsoup.parse(htmlStr);
			_doc.outputSettings().syntax(org.jsoup.nodes.Document.OutputSettings.Syntax.xml);
			String _html = _doc.html();



			XMLWorkerHelper.getInstance().parseXHtml(writer, document,new ByteArrayInputStream(_html.getBytes()), Charset.forName("UTF-8"), new AsianFontProvider());
			document.close();
			writer.close();
		} finally{
			if(out != null)
				out.close();
		}
    }

	/**
	 * 取文字的位置
	 * @param filePath
	 * @param keyword
	 * @return
	 */
    public static List<float[]> getTextPoint(String filePath,final String keyword) {
		try {
			return getPoint(new PdfReader(filePath),keyword,null);
		} catch (Exception e) {
			return Lists.newArrayList();
		}
	}

	/**
	 * 取图片位置
	 *
	 * @param filePath
	 * @param image
	 * @return
	 */
	public static List<float[]> getImagePoint(String filePath, final Image image) {
		try {
			return getPoint(new PdfReader(filePath), null, image);
		} catch (Exception e) {
			return Lists.newArrayList();
		}
	}

	public static List<float[]> getPointByKeyWords(String filePath, final String key, final Image image) {
		try {
			return getPoint(new PdfReader(filePath), key, image);
		} catch (Exception e) {
			return Lists.newArrayList();
		}
	}

	public static List<float[]> getPointByKeyWords(String filePath, final String key) {
		try {
			return getPoint(new PdfReader(filePath), key, null);
		} catch (Exception e) {
			return Lists.newArrayList();
		}
	}

	public static List<float[]> getPointByKeyWords(InputStream inputStream, final String key) {
		try {
			return getPoint(new PdfReader(inputStream), key, null);
		} catch (Exception e) {
			return Lists.newArrayList();
		}
	}


	/**
	 * 返回关键字所在页码和坐标
	 * @param pdfReader  PDF
	 * @param image     要定位的图片
	 * @return  List<float[]>  返回关键字所在的坐标和页数 float[0] >> X; float[1] >> Y; float[2] >> page
	 */
	public static List<float[]> getPoint(PdfReader pdfReader, final String key,final Image image) {
		final List<float[]> arrays = new ArrayList<float[]>();
		try {
			int pageNum = pdfReader.getNumberOfPages();
			PdfReaderContentParser pdfReaderContentParser = new PdfReaderContentParser(pdfReader);

			for (int i = 1; i <= pageNum; i++) {

				final int finalI = i;
				pdfReaderContentParser.processContent(i, new RenderListener() {
					//此方法是监听PDF里的文字内容，有重复情况会都把坐标和页码信息都存入arrays里
					@Override
					public void renderText(TextRenderInfo textRenderInfo) {
                           if(B.Y(key))
                           	return;
                            String text = textRenderInfo.getText(); // 整页内容

                            if (null != text && text.contains(key)) {
                                Rectangle2D.Float boundingRectange = textRenderInfo
                                        .getBaseline().getBoundingRectange();
								textRenderInfo.getBaseline();
                                float[] resu = new float[3];
                                resu[0] = (float)boundingRectange.getCenterX();
                                resu[1] = (float)boundingRectange.getCenterY();
                                resu[2] = finalI;
                                arrays.add(resu);
                            }
					}

					//此方法是监听PDF里的图片内容
					@Override
					public void renderImage(ImageRenderInfo arg0) {
						if(image == null)
							return;
						PdfImageObject image0;
						try {
							image0 = arg0.getImage();
							byte[] imageByte = image0.getImageAsBytes();
							Image imageInPDF = Image.getInstance(imageByte);
							if(image0!=null && imageInPDF.equals(image)){
								float[] resu = new float[3];
								// 0 => x;  1 => y;  2 => z
								//z的值始终为1
								resu[0] = arg0.getStartPoint().get(0);
								resu[1] = arg0.getStartPoint().get(1);
								resu[2] = finalI;
								arrays.add(resu);
							}
						} catch (IOException e) {
							e.printStackTrace();
						} catch (BadElementException e) {
							e.printStackTrace();
						}
					}

					@Override
					public void endTextBlock() {
					}

					@Override
					public void beginTextBlock() {
					}
				});
			}
			pdfReader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return arrays;
	}


}
