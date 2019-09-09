(function(root, factory) {
	if(typeof define === 'function' && define.amd) {
		define('carousel', ['jquery'], factory);
	} else if(typeof module === 'object' && module.exports) {
		module.exports = factory(require('jquery'));
	} else {
		root.carousel = factory(root.jquery);
	}
})(this, function() {
	function carousel(ele) {

		var self = this;
		self.ele = $(ele);
		self.handle = self.ele.find(".handle");
		self.linnerPanel = self.ele.find(".linner-panel");
		self.linnerPanelLi = self.ele.find(".linner-panel li");
		self.lpfirstChild = self.ele.find(".linner-panel li:first-child");
		self.index = 0;
		self.count = 0;
		self.isdbclick = false;
		self.isDataTimer = self.ele.hasClass("dataTimer");
		//self.hasSlide      = self.ele.find("carousel-linner").hasClass("unslide");
		self.isDataTimer ? self.dataTimer = Number(self.ele.attr("data-timer")) : self.dataTimer = 0;
		self.init();
	}
	carousel.prototype.init = function() {
		var self = this;
		self.linnerPanelLi.length > 1 ? self.cloneElement() : false;
		self.addProgress();
		self.linnerPanelLi.length > 1 ? self.handle.addClass("in") : self.handle.removeClass("in");
		self.isDataTimer && self.linnerPanelLi.length > 1 ? self.setTimer() : false;
		self.linnerPanel.css("width", (self.linnerPanelLi.width() * (self.linnerPanelLi.length + 1)) + "px");
		self.bindEvent();
	}
	carousel.prototype.bindEvent = function() {
		var self = this;
		self.ele.find(".handle").on("click", function(e) {
			var $this = $(this);
			var nowTime = new Date().getTime();
			var clickTime = $this.attr("clickTime");
			if(clickTime != "undefind" && (nowTime - Number(clickTime) < 500)) {
				return;
			} else {
				$this.attr("clickTime", nowTime);
				$this.hasClass("prev") ? self.pre() : self.next();
			}
		});
		$(".carousel-indicators").on("click", "li", function() {
			var $this = $(this);
			self.animate($this.index());
			self.index = $this.index();
		})
		self.linnerPanelLi.length > 1 ? self.hover() : false;
	}
	carousel.prototype.pre = function() {
		var self = this;
		self.count = 0;
		self.index--;
		if(self.index < 0) {
			self.index = self.linnerPanelLi.length - 1;
			$(self.linnerPanel).css("left", "-" + self.linnerPanelLi.length + "00%")
		}
		self.changeDataSource("pre", self.index);
	}
	carousel.prototype.next = function() {
		var self = this;
		self.count = 0;
		self.index++;
		self.changeDataSource("next", self.index);
	}
	carousel.prototype.changeDataSource = function(handType, index) {
			var self = this;
			var thisChild = $(self.linnerPanelLi).eq(index);
			//handType == "next" ? self.childIndex(index-1) : self.childIndex(index+1);
			thisChild.find("img").attr("src") == undefined ? thisChild.find("img").attr("src", thisChild.find("a").attr("data-source")) : false;
			//thisChild.find("img").attr("src",thisChild.find("a").attr("data-source"));
			self.animate(index);
		}
		//	carousel.prototype.childIndex = function(index){
		//		var Li = $(this.linnerPanelLi);
		//		Li.not(Li.eq(index)).find("img").removeAttr("src");
		//	}
	carousel.prototype.hover = function() {
		var self = this;
		if(self.isDataTimer) {
			self.ele.find(".handle,.carousel-linner,.carousel-indicators").mouseenter(function() {
				self.clearTimer();
			});
			self.ele.find(".handle,.carousel-linner,.carousel-indicators").mouseleave(function() {
				self.setTimer();
			});
		}
	}
	carousel.prototype.animate = function(index) {
		var self = this;
		self.count = 0;
		//console.log(index);
		var getIndicatorsChild = self.ele.find(".carousel-indicators li");
		getIndicatorsChild.removeClass("active").eq(index == self.linnerPanelLi.length ? 0 : index).addClass("active");
		//$(".carousel-indicators li.active>i").css("width", "100%").attr("data-pro", "100");
		$(".carousel-indicators li.active>i").css("width", "0");
		$(self.linnerPanel).animate({
			"left": "-" + index + "00%"
		}, 500, function() {
			if(index > self.linnerPanelLi.length - 1) {
				self.index = 0;
				$(this).css("left", "0%");
			}
		});
	}
	carousel.prototype.cloneElement = function() {
		var self = this,
			cloneVal = $(self.lpfirstChild).clone();
		cloneVal.find("img").attr("src", cloneVal.find("a").attr("data-source"));
		//cloneVal.find("img").removeAttr("src");
		$(self.linnerPanel).append(cloneVal);
	}
	carousel.prototype.addProgress = function() {
		var self = this;
		if(self.ele.hasClass("slide") && self.linnerPanelLi.length > 1) {
			var indicatorsChilds = "",
				indicators = "";
			for(var i = 0; i < self.linnerPanelLi.length; i++) {
				i == 0 ? indicatorsChilds += '<li class="active"><i data-pro="0"></i></li>' : indicatorsChilds += '<li><i data-pro="0"></i></li>';
			}
			indicators = '<ol class="carousel-indicators">' + indicatorsChilds + '</ol>';
			self.ele.append(indicators);
		}
	}
	carousel.prototype.setTimer = function() {
		var self = this;
		//self.count == 0 ? self.count = Number($(".carousel-indicators li.active>i").attr("data-pro")) : false;
		self.isSetTimer = setInterval(function() {
			self.count++;
			self.count > 100 ? self.next() : $(".carousel-indicators li.active>i").css("width", self.count + "%").attr("data-pro", "0");
		}, self.dataTimer / 100);
	}
	carousel.prototype.clearTimer = function() {
			//console.log("clear");
			clearInterval(this.isSetTimer);
		}
		//	function progressbar(){
		//		
		//	}
	new carousel("#carousel");
	//star.init();
});