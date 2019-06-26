/*-----------------------------------------------------------------------------
* @Description:     学生基本信息添加
* @Version:         1.0.0
* @author:          xuexy(915585955@qq.com)
* @date             2018.05.06
* ==NOTES:=============================================
* v1.0.0(2018.05.06):
     初始生成
* ---------------------------------------------------------------------------*/
$(function(){

	$(document).on('click', '.J_add', function(e){
		if($('.J_username').val() == '' || $('.J_password').val() == ''){
			Alert('提示信息', '请检查信息是否完整')
		}else{
			add();
		}		
	});
	function add(){
		var 
			username = $('.J_username').val(),
			password = $('.J_password').val(),
			// status = $('.search').find("input:radio[name='is_state']:checked").val(),
			// isEval = $('.J_isEval').val(),
			form = {};
			form = {
				'username':username,
				'password':password,
				'user_id': localStorage.getItem('manager_id')
				// 'role':1,
				// 'status':status
			}
			$.ajax({
            type: "post",
            url: jQuery.website+'manager/',//'/mock/common.json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: form,     //JSON.stringify
            dataType: "json",
            success: function (rs) {
                if( rs.code == 0){                  
                    Alert('提示信息', '保存成功', function(){
                    	window.location.href="admin-information-list.html";
                    });
                    // window.location.reload(); 
                }else{                
                    Alert('提示信息', '添加失败，请检查用户名是否冲突!');
                }
            },
            error: function (message) {
                Alert('提示信息', '操作失败，请求失败!');
            }
        });
	}
})