/*
* @Description: 管理员故事列表
* @Author: XieYuepeng
* @Email: 1931875520@qq.com
* @Version: 1.0
* @Date:   2018-05-30 14:05:10
* @Last Modified by:   XieYuepeng
* @Last Modified time: 2018-08-08 15:00:51
*/

$(function(){
/*********************************************函数调用********************************************************************/
    
/*********************************************事件绑定********************************************************************/
// 一打开就开始刷第一页的数据
    /**
     * 初始化提示信息、验证表单
     */
    Pagination(1);
    /**
     * 分页
     */
    

     $('.J_search').click(function(){
        var
            form = $(".J_searchForm").serializeObject();

        Pagination(1, form);  
    })
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

    // 点击审核通过与不通过按钮的时候获取到当前对象的id并向后台进行传递
    $(document).on('click','.J_addCouSee',function(e){
            var story_id = $(e.target).attr('data-id');
            localStorage.setItem('story_id', story_id);//获取id
            window.location.href = "../story-manage/story-exam-detail.html";
            console.log(story_id);
});
    // 页面初始化的函数声明，用于刷数据，初始化提示信息、验证表单
    function Pagination(page, extraData){
        var
            currentPage = page,  
            id=localStorage.getItem('manager_id');      
            str = '',
            shenhe='',
            data = {
                pageNo: currentPage,
                status: '',
                id:id 

            };
        jQuery.extend(data, extraData);
        $.ajax({
            type: 'get',
            url: jQuery.website+"adminstory/",
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

                    //循环把每一行的数据刷出来
                    $.each(rs.data, function(index, item){
                        //通过data-的自定义属性来拿到每行刷的那个数据
                         if(item.status==0){
                                 shenhe="审核通过";
                            }else if(item.status==1){
                                 shenhe="审核未通过";
                            }else{
                                shenhe="待审核";
                            }
                        str += '<tr data-title="'+ item.title +'" data-id="'+ item.id +'"  data-teacherName="'+ item.teacherName +'"  class="tr_father">\
                                <td name="title" style="width:20px; overflow:hidden; text-overflow: ellipsis;white-space:nowrap; ">'+ item.title+'</td>\
                                <td id="teacherName">'+ item.upload_person+'</td>\
                                <td class="publishTime">'+ item.created_time+'</td>\
                                <td id="spot"><a data-id = " '+ item.id +' " href="javascript:;" class="label-info J_addCouSee"><i class="fa fa-pencil"></i>&nbsp;查看详情</a></td>\
                                <td class="publishTime">'+shenhe+'</td>\
                                <td ><a  class="J_shenhe label-info"  data-id = "'+ item.id+'"><i class="fa fa-pencil"></i>&nbsp;点击审核</a> </td>\
                            </tr>'
                    }); 
                    //把每行的数据加到tbody里面去
                    $('#J_template').append(str);
                }else{                
                    Alert('提示信息', '操作失败，返回参数不正确');
                }
            },
            error: function (message) {
                //Alert是jquery专用的alert，样式与传统的ale不同rt
                Alert("提示信息", "请求发送失败。")
            }
        });
        ChangeToSpot();
    }


    $(document).on('click','.J_shenhe',function(e){
        $('#J_shenhedialoag').modal('show');
       var id = $(e.target).attr('data-id');
        $('.hidId').val(id);

    });
    /*确认删除*/
    $(document).on('click','.J_shenhesure',function(){
         var theshenhe=$('.shenhezhi').val();
         if(theshenhe==0){
            addone();
         }else{
            addtwo();
         }
    });
    // 点击通过按钮往后台发后台发送id的事件事件绑定
    function addone(){
        //通过点击事件，用target获得点击对象，用parents祖先函数获得到tr、用find找到子孙元素、用val（）获取到select选中的值
       var
            id=$('.hidId').val(),
            person; 
         
            //保存对象进行传递
            person = {
                'id': id,
                'status':0
                
        
            };
            $.ajax({
                //去到url.js里面找到url和type
           type: 'put',
            url: jQuery.website+"adminstory/"+id+'/',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: person,     //JSON.stringify
            dataType: "json",
            success: function (rs) {
                if( rs.code == 0){                
                     Alert('提示信息', '审核成功');
                     $('#J_shenhedialoag').modal('hide');
                    window.location.reload();
                }else{                
                     Alert('提示信息', '操作失败，返回参数不正确');
                }
            },
            error: function (message) {
                
                Alert('提示信息', '操作失败，请求失败!');
            }
        });
       
      
   }

// ------------------------------------------------------不通过

/*
        添加评语并传递到后台
    */
    //通过点击事件来进行添加、问问学姐J-add类的问题
   function addtwo(){
        //通过点击事件，用target获得点击对象，用parents祖先函数获得到tr、用find找到子孙元素、用val（）获取到select选中的值
       var
            id=$('.hidId').val(),
            person; 
           
            //保存对象进行传递
            person = {
                'id': id,
                'status': 1,
                
        
            };
            $.ajax({
           type: 'put',
            url: jQuery.website+"adminstory/"+id+'/',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: person,     //JSON.stringify
            dataType: "json",
            success: function (rs) {
                if( rs.code == 0){                
                     Alert('提示信息', '审核成功');
                     $('#J_shenhedialoag').modal('hide');
                    window.location.reload();
                }else{                
                     Alert('提示信息', '操作失败，返回参数不正确');
                }
            },
            error: function (message) {
             
                Alert('提示信息', '操作失败，请求失败!');
            }
        });
       
      
        }
    //新增的js函数

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
});;
    

   }

  
//问学姐长虚线有快捷键吗
 //下面开头function的括号 
   
});

