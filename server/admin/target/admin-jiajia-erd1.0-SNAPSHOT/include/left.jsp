<%@ page contentType="text/html;charset=UTF-8" %>
<div class="sidebar-collapse" style="width: auto; height: 100%;">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element" style="text-align: center;">
                            <span><img alt="image" class="img-circle" style="height:64px;width:64px;" src="/master/static/common/img/logooo.png"></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">admin</strong></span>
                               <span class="text-muted text-xs block">基金协同监管系统<b class="caret"></b></span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">JP
                        </div>
                    </li>
                    <t:menu menu="${fns:getTopMenu()}" ></t:menu>
                    
                    
                </ul>
            </div>