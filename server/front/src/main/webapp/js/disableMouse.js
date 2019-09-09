$().ready(function () {
    //屏蔽键盘事件
    // document.onkeydown = function () {
    //     var e = window.event || arguments[0];
    //     //f12禁用
    //     if (e.keyCode = 123) {
    //         return false;
    //         //Ctrl+Shift+I
    //     } else if ((e.ctrlKey) && (e.shiftKey) && (e.keyCode = 73)) {
    //         return false;
    //         //Shift+F10
    //     } else if ((e.shiftKey) && (e.keyCode = 121)) {
    //         return false;
    //         //Ctrl+U
    //     } else if ((e.ctrlKey) && (e.keyCode = 85)) {
    //         return false;
    //         //ctrl+s
    //     } else if ((e.ctrlKey) && (e.keyCode = 83)) {
    //         return false;
    //         //option+command+i
    //     } else if ((e.keyCode = 18) && (e.keyCode = 91) && (e.keyCode = 73)) {
    //         return false;
    //         //option+command+j
    //     } else if ((e.keyCode = 18) && (e.keyCode = 91) && (e.keyCode = 74)) {
    //         return false;
    //         //option+command+c
    //     } else if ((e.keyCode = 18) && (e.keyCode = 91) && (e.keyCode = 67)) {
    //         return false;
    //     }
    //
    // };
    //屏蔽鼠标右键
    document.oncontextmenu = function () {
        return false;
    };
    //屏蔽鼠标拖拽
    document.ondragstart = function () {
        return false;
    }
})