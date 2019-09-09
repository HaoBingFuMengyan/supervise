(function(){
   var HEAD = document.head = document.head || document.getElementsByTagName('head')[0];
  // String -> (Error -> Element -> Void) -> Void
  // String -> (Error -> Element -> Void) -> (Element->Void) -> Void
  function loadScript(src,fn,before){
      var node = document.createElement("script");
      node.setAttribute('async','async');
      if(before){
        before(node)
      }else{
        void null
      }
      var timeID
      var supportLoad = "onload" in node
      var onEvent = supportLoad ? "onload" : "onreadystatechange"
      node[onEvent] = function onLoad() {
          if (!supportLoad && !timeID && /complete|loaded/.test(node.readyState)) {
              timeID = setTimeout(onLoad)
              return
          }
          if (supportLoad || timeID) {
              clearTimeout(timeID)
              fn(null,node);
          }
      }
      HEAD.appendChild(node);
      node.src=src;
      node.onerror=function(e){
          fn(e);
      }
  }

  loadScript(
    '//static.wuage.com/??' + 
    'common/statistic/common.js' +
    ',common/statistic/dopsa.js' +
    ',common/statistic/data-collect.js' + 
    ',common/statistic/perf.js' 
    ,function(){})

  loadScript('//w.cnzz.com/q_stat.php?id=1258116816',function(){
    void null
  },function(node){
    node.setAttribute('id','cnzz_stat_icon_1258116816')
  })
}())