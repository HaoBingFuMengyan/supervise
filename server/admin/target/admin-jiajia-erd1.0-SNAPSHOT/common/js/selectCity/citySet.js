(function ($) {
	$.extend($.fn,{
		initRegion:function(user_options){
			var default_options = {
				proviceid : $("#sprovinceid"), //区/县ID
				provicename : $("#sprovince"), //区/县ID
				cityid : $("#scityid"), // 城市ID
				cityname : $("#scity"), //城市名称
				regionid:$("#sregionid"),
				regionname:$("#sregion"),
				split:"",
				width:"470"
			};
			
			var self = this;
			var tb_province = [];
			var content,ops,$provice,$city,$region,
				$city_body,$citypop,$city_title;
			self.init = function (options) {
				self.setOptions(options);
				content = 
					'<div class="_citys" style="width: 450px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative;background-color: white; "><span title="关闭" id="cColse" style="color: #56b4f8; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #56b4f8; cursor: pointer;" >×</span><ul id="_citysheng" class="_citys0" style="width:100%;height:34px;display:inline-block;border-bottom:2px solid #56b4f8;padding:0;margin:0;"><li class="citySel"style="display:inline-block;float:left;line-height:34px;font-size:15px;color:#888;width:80px;text-align:center;cursor:pointer;">省份</li><li style="display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px;float:left; text-align: center; cursor: pointer;">城市</li><li style="display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer;">区县</li></ul><div id="_citys0" class="_citys1"></div><div style="display:none" id="_citys1" class="_citys1"></div><div style="display:none" id="_citys2" class="_citys1"></div></div>';
				
				Iput.init({id: self, content: content,width:self.ops.width});
				
			    var b = province;
			    b.sort(function(a,b){return parseInt(a['id'])>parseInt(b['id'])?1:-1});
			    for (var i = 0, len = b.length; i < len; i++) {
			        tb_province.push('<a style="width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden;"data-level="0" data-id="' + b[i]['id'] + '" data-name="' + b[i]['name'] + '">' + b[i]['name'] + '</a>');
			    }
			    
			    $provice=$("#_citys0");
			    $city=$("#_citys1");
			    $region=$("#_citys2");
			    $city_body=$("._citys1");
			    $city_title=$("#_citysheng li");
			    
			    $provice.append(tb_province.join(""));
			    $provice.delegate("a",'click',self.provice_click);
			    $city.delegate("a",'click',self.city_click);
			    $region.delegate("a",'click',self.region_click);
			    
			    $city_title.click(function(){
			    	var index = $city_title.index(this);
			    	self.show_title(index);
			    	self.show_body(index);
			    });
			    
			    $("#cColse").click(function(){
			    	Iput.colse();
			    });
			    
			    $citypop=$("div._citys");
			    
			    self.click(function(e){
			    	self.init_default();
			    	Iput.show(this,e);
			    });
		    };
		    
		    self.provice_click=function(){
		    	var g = self.buildCity($(this));
		    	self.item_clear(true,true);
		    	$city.append(g);
		    	self.show_title(1);
		    	self.show_body(1);
		        
		        self.select_clear(true,true,true);
		        $(this).addClass("AreaS");
		        
		        self.set_province_val($(this).data("id"),$(this).data("name"));
		    };
		    
		    self.show_body=function(index){
		    	$("._citys1").hide();
		    	$("._citys1:eq("+index+")").show();
		    }
		    
		    self.show_title=function(index){
		    	$city_title.removeClass("citySel");
		        $("#_citysheng li:eq("+index+")").addClass("citySel");
		    }
		    
		    self.city_click=function(){
		    	var rg=self.buildRegion($(this));
		    	self.item_clear(false,true);
		    	$region.append(rg);
		    	self.show_title(2);
		    	self.show_body(2);
		    	
		    	self.select_clear(false,true,true);
		    	$(this).addClass("AreaS");
		        
		        
		        self.set_city_val($(this).data("id"),$(this).data("name"));
		    };
		    
		    self.region_click=function(){
		    	self.select_clear(false,false,true);
	            $(this).addClass("AreaS");
	            
	            self.set_region_val($(this).data("id"),$(this).data("name"));
	            self.closePop();
		    };
		    
		    self.select_clear=function(pc,cc,rc){
		    	if(pc) $provice.find("a").removeClass("AreaS");
		    	if(cc) $city.find("a").removeClass("AreaS");
		    	if(rc) $region.find("a").removeClass("AreaS");
		    };
		    self.item_clear=function(cc,rc){
		    	if(cc) $city.find("a").remove();
		    	if(rc) $region.find("a").remove();
		    };
		    
		    self.closePop=function(){
		    	 Iput.colse();
		    };
		    
		    self.init_default=function(){
		    	self.item_clear(true,true);
		    	self.select_clear(true,true,true);
		    	self.show_title(0);
		    	self.show_body(0);
		    };
		    
		    self.set_province_val=function(id,val){
		    	self.val(val);
		    	if(self.ops.provicename)
		    		self.ops.provicename.val(val);
		        if(self.ops.provicenid)
		        	self.ops.provicenid.val(id);
		    };
		    
		    self.set_city_val=function(id,val){
		    	self.val(self.val()+self.ops.split+val);
		    	if(self.ops.cityname)
		    		self.ops.cityname.val(val);
		    	if(self.ops.cityid)
		    		self.ops.cityid.val(id);
		    };
		    self.set_region_val=function(id,val){
		    	self.val(self.val()+self.ops.split+val);
		    	if(self.ops.regionname)
		    		self.ops.regionname.val(val);
		    	if(self.ops.regionid)
		    		self.ops.regionid.val(id);
		    };
		    
		    self.setOptions = function (options) {
		    	self.ops = $.extend(true, {}, default_options, options);
		    };
		    
		    self.buildCity = function(obj) {
		        var c = obj.data('id');
		        var e = province;
		        var f;
		        var g = '';
		        for (var i = 0, plen = e.length; i < plen; i++) {
		            if (e[i]['id'] == parseInt(c)) {
		                f = e[i]['city'];
		                break
		            }
		        }
		        f.sort(function(a,b){return parseInt(a['id'])>parseInt(b['id'])?1:-1});
		        for (var j = 0, clen = f.length; j < clen; j++) {
		            g += '<a style="width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden;"data-level="1" data-id="' + f[j]['id'] + '" data-name="' + f[j]['name'] + '" title="' + f[j]['name'] + '">' + f[j]['name'] + '</a>'
		        }
		        return g;
		    };
		    self.buildRegion = function(obj) {
		        var c = obj.data('id');
		        var e = area;
		        var f = [];
		        var g = '';
		        for (var i = 0, plen = e.length; i < plen; i++) {
		            if (e[i]['pid'] == parseInt(c)) {
		                f.push(e[i]);
		            }
		        }
		        f.sort(function(a,b){return parseInt(a['id'])>parseInt(b['id'])?1:-1});
		        for (var j = 0, clen = f.length; j < clen; j++) {
		            g += '<a style="width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden;"data-level="1" data-id="' + f[j]['id'] + '" data-name="' + f[j]['name'] + '" title="' + f[j]['name'] + '">' + f[j]['name'] + '</a>'
		        }

		        return g;
		    };
		    
		    self.init(user_options);
		    
		}
	});
})(jQuery);

/*
function SelCity(obj,e) {
    var ths = obj;
    var dal = '<div class="_citys"><span title="关闭" id="cColse" >×</span><ul id="_citysheng" class="_citys0"><li class="citySel">省份</li><li>城市</li><li>区县</li></ul><div id="_citys0" class="_citys1"></div><div style="display:none" id="_citys1" class="_citys1"></div><div style="display:none" id="_citys2" class="_citys1"></div></div>';
    Iput.show({ id: ths, event: e, content: dal,width:"470"});
    $("#cColse").click(function () {
        Iput.colse();
    });
    var tb_province = [];
    var b = province;
    for (var i = 0, len = b.length; i < len; i++) {
        tb_province.push('<a data-level="0" data-id="' + b[i]['id'] + '" data-name="' + b[i]['name'] + '">' + b[i]['name'] + '</a>');
    }
    
    $("#_citys0").append(tb_province.join(""));
    $("#_citys0 a").click(function () {
        var g = getCity($(this));
        $("#_citys1 a").remove();
        $("#_citys1").append(g);
        $("._citys1").hide();
        $("._citys1:eq(1)").show();
        $("#_citys0 a,#_citys1 a,#_citys2 a").removeClass("AreaS");
        $(this).addClass("AreaS");
        var lev = $(this).data("name");
        ths.value = $(this).data("name");
        if (document.getElementById("hcity") == null) {
            var hcitys = $('<input>', {
                type: 'hidden',
                name: "hcity",
                "data-id": $(this).data("id"),
                id: "hcity",
                val: lev
            });
            $(ths).after(hcitys);
        }
        else {
            $("#hcity").val(lev);
            $("#hcity").attr("data-id", $(this).data("id"));
        }
        $("#_citys1 a").click(function () {
            $("#_citys1 a,#_citys2 a").removeClass("AreaS");
            $(this).addClass("AreaS");
            var lev =  $(this).data("name");
            if (document.getElementById("hproper") == null) {
                var hcitys = $('<input>', {
                    type: 'hidden',
                    name: "hproper",
                    "data-id": $(this).data("id"),
                    id: "hproper",
                    val: lev
                });
                $(ths).after(hcitys);
            }
            else {
                $("#hproper").attr("data-id", $(this).data("id"));
                $("#hproper").val(lev);
            }
            var bc = $("#hcity").val();
            ths.value = bc+ "-" + $(this).data("name");

            var ar = getArea($(this));

            $("#_citys2 a").remove();
            $("#_citys2").append(ar);
            $("._citys1").hide();
            $("._citys1:eq(2)").show();

            $("#_citys2 a").click(function () {
                $("#_citys2 a").removeClass("AreaS");
                $(this).addClass("AreaS");
                var lev = $(this).data("name");
                if (document.getElementById("harea") == null) {
                    var hcitys = $('<input>', {
                        type: 'hidden',
                        name: "harea",
                        "data-id": $(this).data("id"),
                        id: "harea",
                        val: lev
                    });
                    $(ths).after(hcitys);
                }
                else {
                    $("#harea").val(lev);
                    $("#harea").attr("data-id", $(this).data("id"));
                }
                var bc = $("#hcity").val();
                var bp = $("#hproper").val();
                ths.value = bc + "-" + bp + "-" + $(this).data("name");
                Iput.colse();
            });

        });
    });
    $("#_citysheng li").click(function () {
        $("#_citysheng li").removeClass("citySel");
        $(this).addClass("citySel");
        var s = $("#_citysheng li").index(this);
        $("._citys1").hide();
        $("._citys1:eq(" + s + ")").show();
    });
}

function getCity(obj) {
    var c = obj.data('id');
    var e = province;
    var f;
    var g = '';
    for (var i = 0, plen = e.length; i < plen; i++) {
        if (e[i]['id'] == parseInt(c)) {
            f = e[i]['city'];
            break
        }
    }
    for (var j = 0, clen = f.length; j < clen; j++) {
        g += '<a data-level="1" data-id="' + f[j]['id'] + '" data-name="' + f[j]['name'] + '" title="' + f[j]['name'] + '">' + f[j]['name'] + '</a>'
    }
    $("#_citysheng li").removeClass("citySel");
    $("#_citysheng li:eq(1)").addClass("citySel");
    return g;
}
function getArea(obj) {
    var c = obj.data('id');
    var e = area;
    var f = [];
    var g = '';
    for (var i = 0, plen = e.length; i < plen; i++) {
        if (e[i]['pid'] == parseInt(c)) {
            f.push(e[i]);
        }
    }
    for (var j = 0, clen = f.length; j < clen; j++) {
        g += '<a data-level="1" data-id="' + f[j]['id'] + '" data-name="' + f[j]['name'] + '" title="' + f[j]['name'] + '">' + f[j]['name'] + '</a>'
    }

    $("#_citysheng li").removeClass("citySel");
    $("#_citysheng li:eq(2)").addClass("citySel");
    return g;
}*/