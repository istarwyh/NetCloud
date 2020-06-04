// JavaScript Document
function tsubmit(){

 var userName=$("#loginEmail").val();
 var password=$("#password").val();
 var repassword=$("#rePassword").val();
var phrase=$("#phrase").val();
 var t = document.getElementById("selec"); 
var se = t.options[t.selectedIndex].value;
 var regUserName = /^[a-zA-Z0-9]+$/;
 var regPassWord = /^[a-zA-Z0-9]+$/;
 
 if(userName == "")
 {
	 alert("用户名不能为空");
	 return false;
 }
 if(password == "")
 {
	 alert("密码不能为空");
	 return false;
 }
 if(repassword == "")
 {
	 alert("确认密码不能为空");
	 return false;
 }
 if(phrase == "")
 {
	 alert("验证码不能为空");
	 return false;
 }
 if(se == "")
 {
	 alert("部门不能为空");
	 return false;
 }
 
 if(password != repassword) {
	   alert("两次输入密码不一致！");
	   document.getElementById("rePassword").focus();
	   return false;
    }
if(!regUserName.test(userName) || userName.length<6 || userName.length>20){
 alert("用户名应为6-20个字符且只能为字母和数字，（区分大小写）");
 document.getElementById("loginEmail").value="";
 return false;
 }
 if(!regPassWord.test(password)|| password.length<6 || password.length>20){
 alert("密码应为6-20个字符且只能为字母和数字，（区分大小写）");
 document.getElementById("password").value="";
 return false;
 }
 if(!regPassWord.test(repassword) || repassword.length<6 || repassword.length>20){
 alert("确认密码应为6-20个字符且只能为字母和数字，（区分大小写）");

 document.getElementById("rePassword").focus();
 }

$("#qucpspregForm").submit();
}


