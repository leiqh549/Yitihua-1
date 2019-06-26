$(function(){

    //server url
    //
    jQuery.extend({
        // website: 'http://192.168.1.123:8000/'
        website:'https://history.pandawork.net/'
    });
    //刷新页面之后保证样式正确
    $(".nav-pills li ul li a").each(function(){
        $this = $(this);  
        if($this[0].href==String(window.location)){  
            $this.parents('.active').find('.J_firstMenu').css("background-color", "#30a5ff");
            $this.parents('.active').find('ul').css('display','block');
            $this.parent('li').css('background-color','black');
        }  
    }); 
    //点击退出登录清除localStorage
    $('.J_outManage').click(function(){
        localStorage.setItem('manager_id', '');
        window.location.href='/html/login/login.html';
    })
    $('.J_outTeacher').click(function(){
        localStorage.setItem('teacher_id', '');
        window.location.href='/html/login/login.html';
    })
    //侧边栏显示隐藏
    $('.fa-bars').click(function () {
        if ($('.sidebar').is(":visible") === true) {
            $('.holder, .footer').css({
                'margin-left': '0px'
            });
            $('.sidebar').css({
                'margin-left': '-200px'
            });
            $('.sidebar').hide();
            // $("#container").addClass("sidebar-closed");
        } else {
            $('.holder, .footer').css({
                'margin-left': '200px'
            });
            $('.sidebar').show();
            $('.sidebar').css({
                'margin-left': '0'
            });
        }
    });
    //回到顶部
    $('#back-to-top').click(function(){
    	$("html,body").animate({scrollTop:0}, 500);
    });

    //展开，收起下级菜单
    $('.J_firstMenu').click(function(e){
        addColor(e);
    	var ul = $(this).next('ul'),
    		i = $(this).children(".fa-angle-right");

    	if(ul.is(':visible') === true){
    		ul.css('display','none');
    		i.css('transform','rotate(0deg)');
    	}else{
    		ul.css('display',''); 
    		i.css('transform','rotate(90deg)');
    	}
    });

    //显示账号名
    $('.J_namename').text(localStorage.getItem('name'));

    function addColor(e){
        var icon = $(e.currentTarget).children("i:last-child"),
            iconCss = icon.attr('style'),
            currentA = icon.parent('.J_firstMenu');
        if(iconCss == 'transform: rotate(90deg);'){
            currentA.css("background-color", "#4E5465");
        }else{
            currentA.css("background-color", "#30a5ff");
        }
    };
});


