/*
* @Description: 管理员故事列表
* @Author: XieYuepeng
* @Email: 1931875520@qq.com
* @Version: 1.0
* @Date:   2018-05-30 14:05:10
* @Last Modified by:   XieYuepeng
* @Last Modified time: 2018-08-08 14:56:43
*/




$(function(){

 /*********************************************函数调用********************************************************************/
    
/*********************************************事件绑定********************************************************************/
    
     /**
     * 分页刷数据
     */

    // 一打开就开始刷第一页的数据，用参数1
    /**
     * 初始化提示信息、验证表单的调用函数
     */
    // PaginatZhuangtai();
    PaginatType();
    PaginatAge();
    Pagination(1);
    /**
     * 分页
     */
    $('#pageLimit').bootstrapPaginator({
        currentPage: 1,//当前页面停留在那张页面上localStorage
        size: "small",
        bootstrapMajorVersion: 3,
        alignment: "right",
        numberOfPages: 5,//一共显示多少页
        //pageDataCount 一共有多少页（必须写）
        totalPages: $('.pageDataCount').val(),
        itemTexts: function (type, page, current) {
            switch (type) {
                case "first": return "首页";
                case "prev": return "<";
                case "next": return ">";
                case "last": return "末页";
                case "page": return page;
            }
        },
        onPageClicked: function (event, originalEvent, type, page) {
            //有疑问，问一下学姐serializeObject()
            var
                form = $(".J_searchForm").serializeObject();

            Pagination(page, form);  
        } 
    });



    // 点击详情的时候获取到那个详情的id
    $(document).on('click','.J_addCouSee',function(e){
            var story_id = $(e.target).attr('data-id');
            localStorage.setItem('story_id', story_id);//获取id
            window.location.href = "../story-manage/story-detail-manage.html";
            console.log(story_id);
         });


        /**
     * 列表点击搜索，开始刷数据
    
     */
    $(".J_search").click(function(){

        var form = $(".J_searchForm").serializeObject();

        Pagination(1, form);

    
         
    });



/*********************************************函数声明********************************************************************/

    // 页面初始化的函数声明，用于刷数据，初始化提示信息、验证表单
    function Pagination(page, extraData){
        var
            currentPage = page,        
            str = '',
            shenhe = '',
            dstatus='',
            user_id=localStorage.getItem('manager_id'),
            data = {
                pageNo: currentPage,
                age: '',
                type: '',
                status: '',
                name: '',
                upload_person: '',
                id:user_id               
            };
            
        jQuery.extend(data, extraData);
        $.ajax({
            type: 'get',
            // url: '/mock/pc-admin-story-list-manage.json',
            url:jQuery.website+'adminstory/',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,     //JSON.stringify
            dataType: "json",
            success: function (rs) {
                //看是否tbody为空
                $('#J_template').empty();
                if( rs.code == 0){
                    $('#pageLimit').bootstrapPaginator({
                        //得到总的页数
                        totalPages: rs.pageDataCount
                    });

                    //循环把每一行的数据刷出来   <td >'+ item.school+'</td>\ 0 通过，1 不通过， 2  审待核
                    $.each(rs.data, function(index, item){
                        //通过data-的自定义属性来拿到每行刷的那个数据
                          if(item.status==0){
                             shenhe="审核通过";
                        }else if(item.status==1){
                             shenhe="审核未通过";
                        }else{
                            shenhe="待审核";
                        }


                        if(item.dstatus==1){
                             dstatus="删除";
                              str += '<tr data-title="'+ item.title +'"  data-teacherName="'+ item.upload_person +'"  class="tr_father">\
                                <td name="title" style="width:20px; overflow:hidden; text-overflow: ellipsis;white-space:nowrap; ">'+ item.title+'</td>\
                                <td id="teacherName">'+ item.upload_person+'</td>\
                                <td class="status">'+shenhe+'</td>\
                                <td class="publishTime">'+ item.created_time+'</td>\
                                <td data-id = " '+ item.id +' " id="spot"><a  data-id = " '+ item.id +' " href="javascript:;" class="label-info J_addCouSee"><i class="fa fa-pencil"></i>&nbsp;查看详情</a>\
                                <a  data-id = " '+ item.id +' " href="javascript:;" class="label-info J_shanchu"><i class="fa fa-trash-o"></i>&nbsp;'+dstatus+'</a>\
                                </td>\
                            </tr>'
                        }else{
                           str += '<tr data-title="'+ item.title +'"  data-teacherName="'+ item.upload_person +'"  class="tr_father">\
                                <td name="title" style="width:20px; overflow:hidden; text-overflow: ellipsis;white-space:nowrap; ">'+ item.title+'</td>\
                                <td id="teacherName">'+ item.upload_person+'</td>\
                                <td class="status">'+shenhe+'</td>\
                                <td class="publishTime">'+ item.created_time+'</td>\
                                <td data-id = " '+ item.id +' " id="spot"><a  data-id = " '+ item.id +' " href="javascript:;" class="label-info J_addCouSee"><i class="fa fa-pencil"></i>&nbsp;查看详情</a>\
                                </td>\
                            </tr>'
                        }
                       
                    }); 
                    //把每行的数据加到tbody里面去
                    $('#J_template').append(str);
                }else{                
                    Alert('提示信息', '操作失败，参数不正确');

                }
            },
            error: function (message) {
                //Alert是jquery专用的alert，样式与传统的alert不同
                Alert("提示信息", "请求发送失败。")
            }
        });
        ChangeToSpot();
    }
   

 


    //超出的内容把它变为三个点
   function ChangeToSpot(){
    var fTable=$('#J_template');
    var fTr=fTable.children();
    var fTd=fTr.children(".spot");
    fTd.each(function(){
        var maxwidth=1;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'…');
        }
    });
    }




    // 对年代的下拉列表进行导入
    function PaginatAge(){
        var
           str="",
           data = {
           };
           console.log('/mock/fenzhi.json');
        $.ajax({
             type:"get",
            // url: "http://192.168.1.64:8000/toRegister/",
          url: jQuery.website+"agelist/",
           // url:'/mock/age.json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,  
            dataType: "json",
            success: function (rs) {
                $('#age').empty();
                $('#age').append('","<option value="">请选择</option>')
                if( rs.code == 0){
                    $.each(rs.age, function(index, item){
                        str += '<option value ="'+ item.id+'">'+ item.name+'</option>\
                               '
                    }); 
                    $('#age').append(str);
                }else{                
                   Alert('提示信息', '操作失败，参数不正确');
                }

            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    };



// 对年代的下拉列表进行导入
    function PaginatType(){
        var
           str="",
           data = {
           };
          
        $.ajax({
             type:"get",
             url: jQuery.website+"typelist/",
            // url: "http://192.168.1.64:8000/toRegister/",
           // url:jQuery.url.homepageRegeist.fenzhi.url,
           // url:'/mock/type.json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,  
            dataType: "json",
            success: function (rs) {
                $('#type').empty();
                $('#type').append('<option value="">请选择</option>')
                if( rs.code == 0){
                    $.each(rs.typ, function(index, item){
                        str += '<option value ="'+ item.id+'">'+ item.name+'</option>\
                               '
                    }); 
                    $('#type').append(str);
                }else{                
                    Alert('提示信息', '操作失败，参数不正确');
                }

            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    };


      /**
      * -----------------------------------------------删除事件--------------------------------------------------
     */
    /*
        删除
    */
    $(document).on('click','.J_shanchu',function(e){
        $('#J_allTeaDel').modal('show');
       var id = $(e.target).attr('data-id');
        $('.hidId').val(id);

    });
    /*确认删除*/
    $(document).on('click','.J_delSure',function(){
        del();
    });
    /**
      * 删除事件
     */
    function del(id){
        var id = $('.hidId').val(),
            dstatus=1,
            user_id=localStorage.getItem('manager_id'),
            form = {
                id: id,
                user_id:user_id,
                dstatus:dstatus
            };
        $.ajax({
            type: 'put',
            url:jQuery.website+'adminstory/'+id+'/', //'/mock/common.json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: form,
            dataType: "json",
            success: function (rs) {
                if(rs.code == 0){
                    $('#J_allTeaDel').modal('hide');
                    Alert("提示信息", "删除成功！", function (){
                        window.location.reload();
                        // Pagination(1);
                        // $('#pageLimit').bootstrapPaginator({
                        //     currentPage: 1
                        // })
                    })
                    // Confirm("提示信息", "删除成功！", function(){
                    //     window.location.reload();
                    // })
                }else{
                   
                    Alert('提示信息', "返回参数错误");
                }
            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    }


  
 //下面开头function的括号 
   
});



 
