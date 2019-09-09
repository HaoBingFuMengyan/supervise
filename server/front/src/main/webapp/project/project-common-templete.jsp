<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/html" id="stockinstatusTp">
    {{#  if(d.bisstock==0||d.bisstock==""){ }}
        {{#  if(d.ext.finweight==0 || d.ext.finweight==null){ }}
            未入库
        {{#  } else { }}
            {{#  if(d.ext.finweight>=d.ext.fweight){ }}
                入库完成
            {{#  } else{ }}
                部分入库
            {{#  } } }}

    {{#  } else{ }}
         入库完成
    {{#  } }}
</script>


<script type="text/html" id="stockoutstatus">
    {{#  if(d.ext.foutweight==0 || d.ext.foutweight==null){ }}
    未出库
    {{#  } }}

    {{#  if(d.ext.foutweight>0 && d.ext.foutweight< d.ext.fweight){ }}
    部分出库
    {{#  } }}

    {{#  if(d.ext.foutweight>0 && d.ext.foutweight>=d.ext.fweight){ }}
    出库完成
    {{#  } }}
</script>
