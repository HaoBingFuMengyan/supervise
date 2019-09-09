package com.frogsing.parameter.utils;

import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.vo.BusinessParameterVo;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.List;

public class TagBizParaTypeExt extends PARAMETERTag.TagBizParaType {

    @Override
    public void DoOut() throws JspException, IOException {

        OP o = OP.valueOf(op);
        if (o == OP.bizselect) {//业务参数显示为<select>
            if (this.currentconst == null) {

                return;
            }

            StringBuffer bf = new StringBuffer();

            bf.append("<select " + (B.Y(id) ? "" : "id=\"" + id + "\" "));
            bf.append((B.Y(name) ? "" : " name=\"" + name + "\" "));
            bf.append(option + " >");
            if (B.N(defname)) {
                if (B.Y(defval))
                    bf.append("<option value=\"\">" + defname + "</option>");
                else
                    bf.append("<option value=\"" + defval + "\" " + (defval == String.valueOf(val) ? " selected=\"selected\" " : "") + ">" + defname + "</option>");
            }
            List<BusinessParameterVo> list = ParaUtils.biz(this.currentconst.val());

            for (BusinessParameterVo item : list) {

                bf.append("<option value=\"" + item.getSparametervalue() + "\" " + ((B.N(val) && val.equals(item.getSparametervalue())) ? " selected=\"selected\" " : "") + ">" +
                        item.getSparametername() + "</option>");
            }
            bf.append("</select>");
            this.getJspContext().getOut().write(bf.toString());
        }else if(o==OP.bizradio){
            if(this.currentconst==null)
            {
                return;
            }

            StringBuffer bf=new StringBuffer();
            List<BusinessParameterVo> list=ParaUtils.biz(this.currentconst.val());

            for(BusinessParameterVo item:list){
                bf.append("<input type=\"radio\" " +(B.Y(id)?"":"id=\""+id+"\" "));
                bf.append((B.Y(name)?"":" name=\""+name+"\" "));
                bf.append(option+" ");
                bf.append("value=\""+item.getSparametervalue()+"\" "+((B.N(val) && val.equals(item.getSparametervalue())) ? " checked=\"checked\" " : "")+"/>&nbsp;<span class=\"after\">"+ item.getSparametername()+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            }
            this.getJspContext().getOut().write(bf.toString());
        }
        else
            super.DoOut();


    }
}