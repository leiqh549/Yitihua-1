$(function() {
	if(!localStorage.getItem('manager_id')){
		Warn('提示信息', '身份信息已过期，请重新登录', function() {
			window.location.href='/index.html';
		})
	}
})