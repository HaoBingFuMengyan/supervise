package com.frogsing.heart.qrcode;

import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import java.awt.image.BufferedImage;
import java.util.Hashtable;

/**
 * Description:
 * <p>
 * Created by wesson on 2018/12/24.
 **/
public class QRCodeConfig {

    //二维码颜色
    private int BLACK = 0xFF000000;//0xFFFF0000，黑色
    //二维码背景色
    private int WHITE = 0xFFFFFFFF;//0xFF0000FF，白色
    //注：二维码颜色色差大，扫描快，但如果"BLACK'设置为黑色外其他颜色，可能无法扫描
    //二维码图片宽度
    private int width = 300;
    //二维码图片高度
    private int height = 300;

    private String format="png";  //图片后缀

    private BufferedImage logo;  //Logo图片

    private Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();

    public QRCodeConfig(){
        init();
    }

    public QRCodeConfig(int size){
        init();
        this.width=size;
        this.height=size;
    }

    public QRCodeConfig(int color,int backgroud,int size){
        init();
        this.BLACK=color;
        this.WHITE=backgroud;
        this.width=size;
        this.height=size;
    }

    public QRCodeConfig(int size,BufferedImage logo){
        init();
        this.width=size;
        this.height=size;
        this.logo=logo;
    }

    public void init(){
        // 指定纠错等级,纠错级别（L 7%、M 15%、Q 25%、H 30%）
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        // 内容所使用字符集编码
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
//      hints.put(EncodeHintType.MAX_SIZE, 350);//设置图片的最大值
//      hints.put(EncodeHintType.MIN_SIZE, 100);//设置图片的最小值
        hints.put(EncodeHintType.MARGIN, 1);//设置二维码边的空度，非负数

    }

    public int getBLACK() {
        return BLACK;
    }

    public void setBLACK(int BLACK) {
        this.BLACK = BLACK;
    }

    public int getWHITE() {
        return WHITE;
    }

    public void setWHITE(int WHITE) {
        this.WHITE = WHITE;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public BufferedImage getLogo() {
        return logo;
    }

    public void setLogo(BufferedImage logo) {
        this.logo = logo;
    }

    public Hashtable<EncodeHintType, Object> getHints() {
        return hints;
    }

    public void setHints(Hashtable<EncodeHintType, Object> hints) {
        this.hints = hints;
    }
}
