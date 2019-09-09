package com.frogsing.file.fetch;/**
 * Created by wesson on 2017/9/20.
 */

import org.springframework.stereotype.Component;

import com.frogsing.file.po.SysFile;
import com.frogsing.file.utils.FILECol.cs_sysfile;
import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.parameter.utils.ParaUtils;

/**
 * Description:
 * <p>
 * Created by wesson on 2017/9/20.
 **/
@Component
public class FetchSysFile extends BaseFetch<SysFile>{
	
   
	@Override
	public void beforeSave(SysFile vo, SysFile po, ILoginUser u) {
		if(B.Y(vo.getId()))
			vo.setScode(ParaUtils.seqno(cs_sysfile.tablename));
	}

}
