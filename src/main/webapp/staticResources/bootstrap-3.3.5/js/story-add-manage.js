/*
* @Description: 管理员故事列表
* @Author: XieYuepeng
* @Email: 1931875520@qq.com
* @Version: 1.0
* @Date:   2018-05-30 14:05:10
* @Last Modified by:   XieYuepeng
* @Last Modified time: 2018-08-09 21:10:10
*/
$(function(){
    /*********************************************函数调用********************************************************************/
    
/*********************************************事件绑定********************************************************************/
   // --------------------------刷新页面 
    PaginatType();
    PaginatTime();

  // ---------------------------------------------------
   

   
   
    
// --------------------------------逻辑代码

    // 对类型进行导入
    function PaginatType(){
        var
           strone="",
           data = {
            typ:"1"  
           };
      
        $.ajax({
             type:"get",
              url: jQuery.website+"storytype/",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,  
            dataType: "json",
            success: function (rs) {
                // $('#fenzhi').empty();(JSON.parse(rs.list)
                if( rs.code == 0){
                    $.each(rs.typ, function(index, item){
                        strone += '<option value ="'+ item.id+'">'+ item.name+'</option>'
                        
                    }); 
                    $('.type').append(strone);
                   
                }else{                
                   Alert('提示信息', '操作失败，参数不正确');
                }

            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    };

      // 对年代进行导入
    function PaginatTime(){
        var
           strtwo="",
           data = {
            age:"2"
           };
      
        $.ajax({
             type:"get",
               url: jQuery.website+"storyage/",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,  
            dataType: "json",
            success: function (rs) {
                // $('#fenzhi').empty();(JSON.parse(rs.list)
                if( rs.code == 0){
                    $.each(rs.age, function(index, item){
                        strtwo += '<option value ="'+ item.id+'">'+ item.name+'</option>'
                        
                    }); 
                    $('.time').append(strtwo);
                   
                }else{                
                 Alert('提示信息', '操作失败，返回参数不正确');
                }

            },
            error: function (message) {
                Alert("提示信息", "请求发送失败。")
            }
        });
    };

 
        //图片上传
        var image='';
        function selectImage(file, id){

            if(!file.files|| !file.files[0]){
                return;
            }
            var reader =new FileReader();
            reader.onload=function(evt){
                // document.getElementsById(id).src = evt.target.result;
                $("#"+id).attr("src",evt.target.result);
                image=evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);


        }
        // 对上传的图片预览

        $("#fileToUpload").change(function(){
            selectImage($("#fileToUpload")[0],'image')
        })


        // --------------------- 限制图片上传格式
       function filterFileImg(id){
        var
            filepath = $("#"+id+"").val(),
            extStart = filepath.lastIndexOf("."),
            ext = filepath.substring(extStart, filepath.length).toUpperCase();
            
        if (ext != ".JPEG" && ext != ".JPG" && ext != ".PNG") {
            Alert("提示信息", "文件格式不正确");
            $("#"+id+"").val("");
            return false;
        }
        return true;
    }


     // 编辑时单独上传图片信息ajax

    function imageAjax(){
        var 
            formData = new FormData(),
            title = $('.title').val(),
            type= $(".type").val(),
            time = $(".time").val(),
            // publisher = $(".publisher").val(),
            school = $(".school").val(),
            content = $(".content").val();
            
            // fileToUpload
        formData.append("image",$("#fileToUpload")[0].files[0]);
        formData.append("title",title);
        formData.append("type",type);
        formData.append("age",time);
        // formData.append("upload_person",publisher);
        formData.append("content",content);
        formData.append("id",localStorage.getItem('manager_id'));
        $.ajax({
            type:"post",
             url: jQuery.website+"adminstory/",
            contentType: false,
            data: formData,     //JSON.stringify
            processData: false,
            // dataType: "json",
            success: function (rs) {
                if(rs.code == 0){
                     Alert("提示信息", "添加成功！", function (){
                          window.location.href = "../../../html/pc-admin/story-manage/story-list-manage.html";
                    })
                     
                }else{
                    Alert('提示信息', '上传失败，请重新尝试！');
                }
            },
            error: function (message) {
                Alert('提示信息', '操作失败，请求失败!');
            }
        });
    }




    //向后台提交验证
$("#login").click(function() { //“注册”按钮单击事件
    
        
         
     if(filterFileImg('fileToUpload')){
           imageAjax(); 
    }

        
})

 //下面开头function的括号 
   
});


