/**
 * 
 */
package com.frogsing.heart.consts;


/**
 * @author sandy
 *
 */
public interface IConst {
    int val();
    String label();
    int getVal();
    String getLabel();
    IConst[] vals();
    IConst valof(String str);
    boolean isEq(int i);
    boolean isNot(int i);
  
   
}
