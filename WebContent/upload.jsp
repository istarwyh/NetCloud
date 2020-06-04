<style type="text/css"> 
        iframe{  
            border:none;  
            width:0;  
            height:0;  
        }  
          
        #p_out{  
          width:200px;  
          height:12px;  
          margin:10px 0 0 0;  
          padding:1px;  
          font-size:10px;  
          border:solid #6b8e23 1px;  
        }  
          
        #p_in{  
          width:0%;  
          height:100%;  
          background-color:#6b8e23;  
          margin:0;  
          padding:0;  
        }  
          
        #dis{  
          margin:0;  
          padding:0;  
          text-align:center;  
          font-size:12px;  
          height:12px;  
          width:200px;  
        }  
          
</style>
<style type="text/css" mce_bogus="1">       
iframe{  
            border:none;  
            width:0;  
            height:0;  
        }  
          
        #p_out{  
          width:200px;  
          height:12px;  
          margin:10px 0 0 0;  
          padding:1px;  
          font-size:10px;  
          border:solid #6b8e23 1px;  
        }  
          
        #p_in{  
          width:0%;  
          height:100%;  
          background-color:#6b8e23;  
          margin:0;  
          padding:0;  
        }  
          
        #dis{  
          margin:0;  
          padding:0;  
          text-align:center;  
          font-size:12px;  
          height:12px;  
          width:200px;  
        }  
        </style>  
    </head>  
    <body>  
        <div class="main">  
          
        <div class="top">  
        </div>  
          
        <div style="width: 250px; margin: 0 auto;">  
          
        
           <div class="errorbox">  
                <s:actionerror/>  
           </div>  
              
           <form id="uploadfile_form" name="uploadfile_form"   
enctype="multipart/form-data"    
                 method="post" target="uploadfile_iframe">    
             
                <input type="file" name="file" />    
                <br><br>    
                <button onclick="progress()">提交</button>    
             
                <div id="p_out"><div   
id="p_in"></div></div>    
                <div id="dis"></div>    
           </form>    
             
           <iframe frameborder="0" id="uploadfile_iframe"   
name="uploadfile_iframe" src="javascript:void(0)"   
mce_src="javascript:void(0)"></iframe>    
           <iframe frameborder="0" id="progress_iframe"   
name="progress_iframe" src="javascript:void(0)"   
mce_src="javascript:void(0)"></iframe>    
        </div>  
          
        </div>  
          
    </body>  
      
    <script type="text/javascript">  
   
    function uploadFile(key){  
        document.forms[0].action =   
'uploadfile.action?callback=parent.upload&key='+key;  
        document.forms[0].submit();  
        document.getElementById('dis').innerHTML = "开始传送数据...";  
          
    }  
 
    function progress(){  
        document.getElementById('progress_iframe').src =   
'progress.action?callback1=parent.uploadFile&callback2=parent.upload';  
  
        document.getElementById('dis').innerHTML = '初始化数据...';  
        document.getElementById('p_in').style.width = "0%";  
    }  
     
    function upload(len, total){  
        document.getElementById('p_in').style.width =   
(Math.round(len/total*100))+'%';  
        document.getElementById('dis').innerHTML = len + '/' + total + 'Byte';  
        if(len === total) {  
            document.getElementById('dis').innerHTML = "文件上传完成!";  
        }  
    }      
      
      
 </script>  
</html>