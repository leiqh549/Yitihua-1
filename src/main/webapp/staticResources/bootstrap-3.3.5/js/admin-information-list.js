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

	$(document).on('click', '.J_modify', function(e){
		var id = $(e.target).parent().attr("data-id");
		$(".hidId").val(id);
	})
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
            url: jQuery.website+'manager/',//'/mock/adminList.json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,     //JSON.stringify
            dataType: "json",
            success: function (rs) {
                $('#J_template').empty();
                if( rs.code == 0){
                    $('#pageLimit').bootstrapPaginator({
                        totalPages: rs.pageDataCount
                    });
                    if(rs.list.length > 0){
                        var status = ''
                        $.each(rs.list, function(index, item){
                            if(item.status == '0'){
                                status = '停用'
                            }else{
                                status = '在用'
                            }
                            str += '<tr data-id="'+ item.id +'" data-status="'+ item.status +'">\
                                    <td>'+ item.number +'</td>\
                                    <td>'+ item.username +'</td>\
                                    <td>'+ item.password +'</td>\
                                    <td>'+ status +'</td>\
                                    <td><a href="javascript:;" class="label-info J_modify"><i class="fa fa-pencil"></i>&nbsp;修改状态</a>\</td>\
                                </tr>'
                        }); 
                    }else{
                        str += '<tr><td colspan="6">暂无数据</td></tr>'
                    }
                    
                    $('#J_template').append(str);
                }else{                
                    Alert('提示信息', '操作失败，返回参数不正确!');
                }
            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    };

    $(document).on('click', '.J_modify', function(e){
        var id = $(e.target).parents('tr').attr('data-id'),
            status = $(e.target).parents('tr').attr('data-status');
            $('.hiddenId').val(id)
            $('.J_select').val(status)
        $('#J_dialog').modal('show');
    })

    $('.J_update').click(function(){
        $.ajax({
            type:"put",
            url: jQuery.website+'manager/'+$('.hiddenId').val()+'/',//"/mock/common.json",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {
                id: $('.hiddenId').val(),
                'user_id': localStorage.getItem('manager_id'),
                status: $('.J_select').val()
            },     //JSON.stringify
            dataType: "json",
            success: function (rs) {
                console.log(rs.code)
                if(rs.code == 0){
                    Alert('提示信息', '保存成功！',function(){
                        location.reload();
                    });
                }else{
                    Alert('提示信息', '保存失败，请重新尝试！');
                }
            },
            error: function (message) {
                Alert('提示信息', '操作失败，请求失败!');
            }
        });
    })


})