/*-----------------------------------------------------------------------------
* @Description:     学生基本信息列表
* @Version:         1.0.0
* @author:          xuexy(915585955@qq.com)
* @date             2018.05.06
* ==NOTES:=============================================
* v1.0.0(2018.05.06):
     初始生成
* ---------------------------------------------------------------------------*/
$(function(){

	/*--------------------------------------------------------------------------------
	 * 初始化
	 * 
	 *--------------------------------------------------------------------------------*/
	//当前页面的父目录添加active背景颜色，右面的图标旋转
	// $("#firstMenu5").children(".J_firstMenu").addClass("J_firstMenu-active").children("i:eq(1)").css('transform','rotate(90deg)');
	// //当前页面的侧边栏展示并设置背景颜色
	// $("#firstMenu5").children("ul").css('display','').children("li:eq(0)").css("background-color","#2B2E37");
	
    Pagination(1);
	/*--------------------------------------------------------------------------------
	 * 点击事件
	 * 
	 *--------------------------------------------------------------------------------*/
	/**
	 * 点击搜索按钮
	 * @param  {[type]} ){  var    form [description]
	 * @return {[type]}     [description]
	 */
	$(".J_search").click(function(){
        var
            form = $(".J_searchForm").serializeObject();

        Pagination(1, form);
    });

	// $(".J_modify").click(function(e){
	// 	var id = $(e.target).parent().attr("data-id");
	// 	$(".hidId").val(id);
	// })
	/**
     * 分页
     */
    $('#pageLimit').bootstrapPaginator({
        //currentPage: 3,
        totalPages: $('.pageDataCount').val(),
        size: "small",
        bootstrapMajorVersion: 3,
        alignment: "right",
        numberOfPages: 5,
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
            var
                form = $(".J_searchForm").serializeObject();

            Pagination(page, form);  
        }
    });

	 /*--------------------------------------------------------------------------------
	 * 函数实现
	 * 
	 *--------------------------------------------------------------------------------*/
	 /**
	  * 分页刷数据
	  * @param {[type]} page      [description]
	  * @param {[type]} extraData [description]
	  */
    function Pagination(page, extraData){

        var
            currentPage = page,            
            str = '',
            data = {
                page: currentPage
            };
        jQuery.extend(data, extraData);

        $.ajax({
            type: 'get',
            url: jQuery.website+'studentlist/',//jQuery.website+'studentlist/',//'/mock/common.json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,     //JSON.stringify
            dataType: "json",
            success: function (rs) {
                $('#J_template').empty();
                if( rs.code == 0){
                    $('#pageLimit').bootstrapPaginator({
                        //得到总的页数
                        totalPages: rs.pageDataCount
                    });
                    if(rs.list.length > 0){
                         $.each(rs.list, function(index, item){
                            str += '<tr data-id="'+ item.student_id +'" class="flag">\
                                    <td>'+ item.number +'</td>\
                                    <td>'+ item.student_name +'</td>\
                                    <td>'+ item.school +'</td>\
                                    <td>\
                                        <a href="/html/pc-admin/student-information-management/student-information-detail.html#?id='+item.student_id+'" class="label-info J_modify"><i class="fa fa-pencil"></i>&nbsp;详情/修改</a>\
                                    </td>\
                                </tr>'
                        }); 
                        $('#J_template').append(str);
                    }else{
                        $('#J_template').append('<tr><td colspan="6">暂无数据！</td></tr>');
                    }
                   
                }else{
                    Alert('提示信息', '操作失败，返回参数不正确!');
                }
            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    };

    $('.J_allDown').click(function(){

        var name = $('.J_name').val(),
            username = $('.J_username').val(),
            school = $('.J_schoolSearch').val();

        if($('.flag').length>1){
            $('.J_allDown').attr('href', jQuery.website+'exportstudent?student_name='+name+'&username='+username+'&school='+school);
        }else{
            Alert('提示信息', '导出数据不能为空')
        }
    })
})