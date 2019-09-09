/*
 * author:haizi
 *
 *  img-jquery
 *  参数说明
 *  obj:传入的dom元素内执行懒加载 不传默认是body
 *  dataSrc: 懒加载需要的图片的key <img data-src="xxx.gif" />
 *  bDefaultImg:是否需要默认 loding 图片
 *	errorImgSrc:加载失败图片 默认和懒加载图片一样
 *	preload:是否需要预加载
 *	preloadDataSrc:预加载需要的key
 *	preloadDom:预加载元素
 *
 */


(function (root, factory) {
	if (typeof define === 'function' && define.amd) {
		define('fImgLoad', ['jquery'], factory);
	} else if (typeof module === 'object' && module.exports) {
		module.exports = factory(require('jquery'));
	} else {
		root.fImgLoad = factory(root.jquery);
	}
})(this, function() {

	function fImgLoad(oJson){
		this.init.apply(this,arguments);
	}

	//var _that = null;

	fImgLoad.prototype={
		init:function(oJson){
			var _option={
				dataSrc : 'data-src',
				obj : $('body'),
				bDefaultImg:false,
				sImgSrc:'https://img.wuage.com/147497202923280placeholder.png',
				errorImgSrc:"https://img.wuage.com/147497202923280placeholder.png",
				_that:this,
				preload:false,
				preloadDataSrc : "data-preload",
				preloadDom :$('body')

			};

			for(var key in oJson){
				_option[key] = oJson[key];
			};
			_option.preloadImgArray = _option.preloadDom.find('['+_option.preloadDataSrc+']');
			this.option = _option;

			this.fn();
		},
		fn:function(){

			this.option.imgArray = this.option.obj.find('['+this.option.dataSrc+']');
			if(this.option['bDefaultImg']){
				this.defaultImg();
			};
			if(this.option.preload){
				this.preloadImg();
			}
			this.loadImg();
			this.scrollRender();
		},
		defaultImg:function(){//给图片赋值默认图片
			var _that=this;
			this.option['imgArray'].each(function(i){
				this.src=_that.option['sImgSrc'];
			})
		},
		preloadImg:function(){//预加载
			var _opt = this.option,
				_img = _opt.preloadImgArray,
				_that = this;

			if(_img.length){
				for(var i = 0; i < _img.length; i++){
					var _this = _img[i];

					_that.newImg($(_this),$(_this).attr(_opt['preloadDataSrc']));
					$(_this).removeAttr(_opt.preloadDataSrc);
					_that.option.preloadImgArray = _opt.obj.find('img['+_opt.preloadDataSrc+']');

				}
			}
		},
		loadImg:function(){//加载img

			var _opt = this.option,
				_img = _opt['imgArray'],
				_that = this;

			if(_img.length){
				for(var i = 0; i < _img.length; i++){
					var _this = _img[i];
					if(this.isLoad(_this)) {
						_that.newImg($(_this), $(_this).attr(_opt['dataSrc']));
						$(_this).removeAttr(_opt.dataSrc);
						_that.option.imgArray = _opt.obj.find('[' + _opt.dataSrc + ']');
					}
				}
			}else if(typeof _that._callLoadImg == 'function'){
				$(window).off('scroll',_that._callLoadImg);
			}

		},
		newImg:function(obj,src){
			var _this = this;
			var oImg = new Image();
			oImg.onload=function(){
				if(obj.is('img')){
					obj.attr('src',src)
				}else{
					obj.css({'background-Image':'url('+src+')'})
				}
			};
			oImg.onerror = function (){
				if(obj.is('img')){
					obj.attr('src',_this.option.errorImgSrc)
				}else{
					obj.css({'background-Image':'url('+_this.option.errorImgSrc+')'})
				}
			};
			oImg.src = src;
		},
		isLoad:function(img){//是否加载当前的图片

			var _scrollTop = $(window).scrollTop(),
				_winHeight = $(window).height(),
				_imgTop = $(img).offset().top,
				_height = $(img).height();
			if(_scrollTop + _winHeight >= _imgTop && _imgTop+_height >= _scrollTop ){
				return true;
			}
			return false;
		},
		scrollRender:function(){
			var _that = this;
			function callLoadImg(){
				_that.loadImg.call(_that);
			}
			_that._callLoadImg = callLoadImg;
			$(window).on('scroll',_that._callLoadImg);
		},
		coming:function(){//新增图片 回调。
			this.fn();
		}
	}
	return fImgLoad;
});
