// JavaScript Document

  function tsubmit(){
/* var qucpspregForm=document.getElementById("loginForm");*/
 var userName = $("#loginAccount").val();
 var password = $("#lpassword").val();

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
 
 
if(!regUserName.test(userName) || userName.length<6 || userName.length>20){
 alert("用户名应为6-20个字符!(只能为数字或字母)");
 return false;
 }
 if(!regPassWord.test(password) || password.length<6 || password.length>20){
 alert("密码应为6-20个字符且只能为字母和数字，（区分大小写）");
 return false;
 }
    
 }


  function atsubmit(){
/* var qucpspregForm=document.getElementById("aloginForm");*/
 var userName=$("#aloginAccount").val();
 var password=$("#alpassword").val();

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
 

if(!regUserName.test(userName) || userName.length<6 || userName.length>20){
 alert("用户名应为6-20个字符！(只能为数字或字母)");
 return false;
 }
 if(!regPassWord.test(password) || password.length<6 || password.length>20){
 alert("密码应为6-20个字符且只能为字母和数字，（区分大小写）");
  return false;
 }
 
 }


