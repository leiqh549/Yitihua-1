/*
* @Description: 管理员故事列表
* @Author: XieYuepeng
* @Email: 1931875520@qq.com
* @Version: 1.0
* @Date:   2018-05-30 14:05:10
* @Last Modified by:   XieYuepeng
* @Last Modified time: 2018-08-07 21:40:48
*/


$(function(){
 /*********************************************函数调用********************************************************************/
    
/*********************************************事件绑定********************************************************************/

   /**
     * 初始化提示信息、验证表单的调用函数
     */
    Paginate();

/*********************************************函数声明********************************************************************/


    function Paginate(page, extraData){
        var
            currentPage = page,            
            str = '',
            shenhe = '',
            id=localStorage.getItem('story_id'),
            data = {
               page: currentPage,
               id:id

           };
           
        jQuery.extend(data, extraData);
        console.log('/mock/pc-admin-story-detail-manage.json');

        $.ajax({
             type: 'get',
            // url: '/mock/admin-detail.json',
             // url: '/mock/manage-story-detail.json',
             url: jQuery.website+"adminStoryDetail/",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,  
            dataType: "json",
            success: function (rs) {
                // $('.panel-body').empty();
                if( rs.code == 0){
                    $.each(rs.data, function(index, item){
                        if(item.status==0){
                             shenhe="审核通过";
                                }else if(item.status==1){
                                     shenhe="审核未通过";
                                }else{
                                    shenhe="待审核";
                                }
                      $(".title").val(item.title);
                       $(".type").val(item.type);
                       $(".age").val(item.age);
                       $(".time").val(item.created_time);
                       $(".status").val(shenhe);
                       $(".publisher").val(item.upload_person);
                       $(".content").val(item.content);
                       $(".J_img").attr('src',item.image);
                      
                    }); 
                    $('.panel-body').append(str);
                }else{                
                    Alert('提示信息', '操作失败，返回参数不正确!');
                }

            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    };
})
   
   
   