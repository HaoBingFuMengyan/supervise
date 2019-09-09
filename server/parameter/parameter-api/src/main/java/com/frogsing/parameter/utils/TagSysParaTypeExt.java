package com.frogsing.parameter.utils;

import com.frogsing.heart.utils.B;

import javax.servlet.jsp.JspException;
import java.io.IOException;

public class TagSysParaTypeExt extends PARAMETERTag.TagSysParaType {

    @Override
    public void DoOut() throws JspException, IOException {


        OP o = OP.valueOf(op);
        if (o == OP.syspara) {
            if (this.currentconst != null) {
                if (B.N(defval)) {
                    String str = ParaUtils.sys(currentconst.val(), defval);
                    this.getJspContext().getOut().write(str);
                } else {
                    String str = ParaUtils.sys(currentconst.val());
                    this.getJspContext().getOut().write(str);
                }
            }


        }
        else
            super.DoOut();
    }
}