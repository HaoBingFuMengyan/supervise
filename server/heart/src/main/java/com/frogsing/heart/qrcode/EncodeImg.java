package com.frogsing.heart.qrcode;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Description: 生成不带Logo的二维码
 * <p>
 * Created by wesson on 2018/12/24.
 **/
public class EncodeImg {

    /**
     * 绘制二维码
     * @param contents 二维码内容
     * @return image 二维码图片
     * */
    public static BufferedImage encodeImg(String contents,QRCodeConfig config){
        BufferedImage image = null;
        try{
            BitMatrix matrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, config.getWidth(), config.getHeight(), config.getHints());
            image = new BufferedImage(config.getWidth(), config.getHeight(), BufferedImage.TYPE_INT_RGB);
            int width = matrix.getWidth();
            int height = matrix.getHeight();
            for(int x = 0; x < width; x++){
                for(int y =0;y < height; y++){
                    image.setRGB(x, y, matrix.get(x, y) ? config.getBLACK() : config.getWHITE());
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return image;
    }

    /**
     * 二维码绘制logo
     * @param bufferImage 二维码图片流
     * @param logo logo图片文件
     * */
    public static BufferedImage encodeImgLogo(BufferedImage bufferImage, BufferedImage logo){
        try{
            //Image image2 = ImageIO.read(image) ;
            //int width = image2.getWidth(null) ;
            //int height = image2.getHeight(null) ;
            //BufferedImage bufferImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB) ;
            //BufferedImage bufferImage =ImageIO.read(image) ;
            Graphics2D g2 = bufferImage.createGraphics();
            //g2.drawImage(image2, 0, 0, width, height, null) ;
            int matrixWidth = bufferImage.getWidth();
            int matrixHeigh = bufferImage.getHeight();

            //读取Logo图片
            //开始绘制图片
            g2.drawImage(logo,matrixWidth/5*2,matrixHeigh/5*2, matrixWidth/5, matrixHeigh/5, null);//绘制
            BasicStroke stroke = new BasicStroke(5,BasicStroke.CAP_ROUND,BasicStroke.JOIN_ROUND);
            g2.setStroke(stroke);// 设置笔画对象
            //指定弧度的圆角矩形
            RoundRectangle2D.Float round = new RoundRectangle2D.Float(matrixWidth/5*2, matrixHeigh/5*2, matrixWidth/5, matrixHeigh/5,20,20);
            g2.setColor(Color.white);
            g2.draw(round);// 绘制圆弧矩形

            //设置logo 有一道灰色边框
            BasicStroke stroke2 = new BasicStroke(1,BasicStroke.CAP_ROUND,BasicStroke.JOIN_ROUND);
            g2.setStroke(stroke2);// 设置笔画对象
            RoundRectangle2D.Float round2 = new RoundRectangle2D.Float(matrixWidth/5*2+2, matrixHeigh/5*2+2, matrixWidth/5-4, matrixHeigh/5-4,20,20);
            g2.setColor(new Color(128,128,128));
            g2.draw(round2);// 绘制圆弧矩形

            g2.dispose();

            bufferImage.flush() ;
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("二维码绘制logo失败");
        }
        return bufferImage;
    }



    /**
     * 二维码输出到文件
     * @param content 二维码内容
     * @param file 输出文件
     * */
    public static void writeLogoToFile(String content,File file,QRCodeConfig config) throws IOException {
        BufferedImage image = encodeImgLogo(encodeImg(content,config ), config.getLogo());
        try {
            ImageIO.write(image, config.getFormat(), file);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("二维码写入文件失败"+e.getMessage());
        }
    }
    /**
     * 二维码流式输出
     * @param content 二维码图片内容
     * @param stream 输出流
     * */
    public static void writeLogoToStream(String content, OutputStream stream,QRCodeConfig config){
        BufferedImage image = encodeImgLogo(encodeImg(content,config ), config.getLogo());
        try {
            ImageIO.write(image, config.getFormat(), stream);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("二维码写入流失败"+e.getMessage());
        }
    }

    /**
     * 二维码输出到文件
     *  @param contents 二维码内容
     * @param file 输出文件
     * */
    public static void writeToFile(String contents,  File file,QRCodeConfig config){
        BufferedImage image = encodeImg(contents,config);
        try {
            ImageIO.write(image, config.getFormat(), file);
        } catch (IOException e) {
            System.out.println("二维码写入文件失败"+e.getMessage());
        }
    }
    /**
     * 二维码流式输出
     *  @param contents 二维码内容
     * @param stream 输出流
     * */
    public static void writeToStream(String contents, OutputStream stream,QRCodeConfig config){
        BufferedImage image = encodeImg(contents,config);
        try {
            ImageIO.write(image,config.getFormat(), stream);
        } catch (IOException e) {
            System.out.println("二维码写入流失败"+e.getMessage());
        }
    }

    public static void main(String[] args) throws Exception{
        File file=new File("/Users/wesson/Downloads/a.png");
        File logofile=new File("/Users/wesson/Downloads/WechatIMG6183.png");
        EncodeImg.writeLogoToFile("asdfladjlj", file,new QRCodeConfig(500,ImageIO.read(logofile) ));
    }

}
