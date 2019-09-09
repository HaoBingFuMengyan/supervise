package com.frogsing.heart.freemarker;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.*;

public class HeadFootInfoPdfPageEvent extends PdfPageEventHelper {

    PdfTemplate tpl;



    public void onOpenDocument(PdfWriter writer, Document document) {
        tpl = writer.getDirectContent().createTemplate(100, 20);
    }


    //实现页眉和页脚的方法
    public void onEndPage(PdfWriter writer, Document document) {
        try {
            PdfContentByte headAndFootPdfContent = writer.getDirectContent();
            headAndFootPdfContent.saveState();
            headAndFootPdfContent.beginText();
            //设置中文
            headAndFootPdfContent.setFontAndSize(BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",    BaseFont.NOT_EMBEDDED), 12);
            //文档页头信息设置
            float x = document.top(-20);
            float x1 = document.top(-5);
//            //页头信息中间
//            headAndFootPdfContent.showTextAligned(PdfContentByte.ALIGN_CENTER, pdfName, (document.right() + document.left()) / 2, x, 0);
//            //页头信息左面
//            headAndFootPdfContent.showTextAligned(PdfContentByte.ALIGN_LEFT, riqi[0] + "年" + riqi[1] + "月" + riqi[2] + "日",
//                    document.left() + 100, x1, 0);
//            //页头信息中间
////            headAndFootPdfContent.showTextAligned(PdfContentByte.ALIGN_CENTER, type+"库单号：" +code+ "",
//                    (document.right() + document.left()) / 2, x1, 0);
            //页头信息右面
//            headAndFootPdfContent.showTextAligned(PdfContentByte.ALIGN_RIGHT, " 单位：册", document.right() - 100, x1, 0);
            //文档页脚信息设置
            float y = document.bottom(-20);
            float y1 = document.bottom(-35);
            //添加页码
            //页脚信息中间
            headAndFootPdfContent.showTextAligned(PdfContentByte.ALIGN_CENTER, String.format("--第%s页--",document.getPageNumber()) ,
                    (document.right() + document.left()) / 2, y1, 0);
            //在每页结束的时候把“第x页”信息写道模版指定位置
            headAndFootPdfContent.addTemplate(tpl, (document.right() + document.left()) / 2 + 15, y1);//定位“y页” 在具体的页面调试时候需要更改这xy的坐标
            headAndFootPdfContent.endText();
            headAndFootPdfContent.restoreState();
        } catch (Exception de) {
            de.printStackTrace();
        }
    }



}
