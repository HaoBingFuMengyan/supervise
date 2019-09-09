package com.frogsing.heart.security.utils;

import com.frogsing.heart.log.Lg;
import sun.misc.BASE64Decoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class Aes
{
    private String key="";
    private String iv="";
    public Aes(String key,String iv){
        this.key=key;
        this.iv=iv;
    }
    public static void main(String args[]) throws Exception {
        Aes s=new Aes("1234567812345678", "1234567812345678");
        System.out.println(s.encrypt("datasjdflsdflslflsdfljksfd"));
        System.out.println(s.desEncrypt("DVGlhmkr/244ipSbg1bvJ7GQ2vq83VRANUqY9g4RT6M=").trim());
    }

    public  String encrypt(String data) throws Exception {
        try {
//            String data = "Test String";
//            String key = "1234567812345678";
//            String iv = "1234567812345678";

            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            int blockSize = cipher.getBlockSize();

            byte[] dataBytes = data.getBytes();
            int plaintextLength = dataBytes.length;
            if (plaintextLength % blockSize != 0) {
                plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));
            }

            byte[] plaintext = new byte[plaintextLength];
            System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);
            
            SecretKeySpec keyspec = new SecretKeySpec(key.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes());

            cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
            byte[] encrypted = cipher.doFinal(plaintext);

            return new sun.misc.BASE64Encoder().encode(encrypted);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public  String desEncrypt(String data) throws Exception {
        try
        {
//            String data = "2fbwW9+8vPId2/foafZq6Q==";
//            String key = "1234567812345678";
//            String iv = "1234567812345678";
            Lg.act("data:"+data);
            
            byte[] encrypted1 = new BASE64Decoder().decodeBuffer(data);
            
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            SecretKeySpec keyspec = new SecretKeySpec(key.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes());
            
            cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);

            byte[] original = cipher.doFinal(encrypted1);
            String originalString = new String(original);
            return originalString.replace("\0","");
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}