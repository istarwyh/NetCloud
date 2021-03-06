package com.nitcloud.netdisk.utils;

import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.PrintWriter;  
import java.util.List;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.ProgressListener;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
import org.apache.log4j.Logger;  
/** 
 * upload file 
 *  
 * @author scott.Cgi 
 */  
public class UploadFile {  
    private static final Logger LOG = Logger.getLogger(UploadFile.class);  
    /** 
     * 上传文件 
     *  
     * @param request 
     *            http request 
     * @param response 
     *            htp response 
     * @throws IOException 
     *             IOException 
     */  
    public static void upload(HttpServletRequest request,  
            HttpServletResponse response) throws IOException {  
        LOG.info("客户端提交类型: " + request.getContentType());  
        if (request.getContentType() == null) {  
            throw new IOException(  
                    "the request doesn't contain a multipart/form-data stream");  
        }  
          
        String key = request.getParameter("key");  
        Progress p = (Progress)request.getSession().getAttribute(key);  
          
        // 设置上传文件总大小  
        p.setLength(request.getContentLength());  
        LOG.info("上传文件大小为 : " + p.getLength());  
        // 上传临时路径  
        String path = request.getSession().getServletContext().getRealPath("/");  
        LOG.info("上传临时路径 : " + path);  
        // 设置上传工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        factory.setRepository(new File(path));  
        // 阀值,超过这个值才会写到临时目录  
        factory.setSizeThreshold(1024 * 1024 * 10);  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        // 最大上传限制  
        upload.setSizeMax(1024 * 1024 * 200);  
        // 设置监听器监听上传进度  
        upload.setProgressListener(p);  
        try {  
            LOG.info("解析上传文件....");  
            List<FileItem> items = upload.parseRequest(request);  
              
            LOG.info("上传数据...");  
            for (FileItem item : items) {  
                  
                // 非表单域  
                if (!item.isFormField()) {  
                    LOG.info("上传路径  : " + path + item.getName());  
                    FileOutputStream fos = new FileOutputStream(path + item.getName());  
                    // 文件全在内存中  
                    if (item.isInMemory()) {  
                        fos.write(item.get());  
                        p.setComplete(true);  
                    } else {  
                        InputStream is = item.getInputStream();  
                        byte[] buffer = new byte[1024];  
                        int len;  
                        while ((len = is.read(buffer)) > 0) {  
                            fos.write(buffer, 0, len);  
                        }  
                        is.close();  
                    }  
                    fos.close();  
                    LOG.info("完成上传文件!");  
                      
                    item.delete();  
                    LOG.info("删除临时文件!");  
                      
                    p.setComplete(true);  
                    LOG.info("更新progress对象状态为完成状态!");  
                }  
            }  
        } catch (Exception e) {  
            LOG.error("上传文件出现异常, 错误原因 : " + e.getMessage());  
            // 发生错误,进度信息对象设置为完成状态  
            p.setComplete(true);  
            request.getSession().removeAttribute(key);  
        }  
    }  
      
    /** 
     * 执行客户端脚本 
     *  
     * @param response 
     *            http response 
     * @param script 
     *            javscript string 
     * @throws IOException  
     *            IOException 
     */   
    public static void execClientScript(HttpServletResponse resposne,  
            String script) throws IOException {  
          
        PrintWriter out = resposne.getWriter();  
          
        out.println("<script type='text/javascript'>" + script + "</script>");  
        // fix ie problem  
        out.println("---------------------------------------------------");  
        out.println("---------------------------------------------------");  
        out.println("---------------------------------------------------");  
        out.println("---------------------------------------------------");  
        out.println("---------------------------------------------------");  
        out.println("---------------------------------------------------");  
        out.println("---------------------------------------------------");  
        out.flush();  
    }  
    /** 
     * 上传文件进度信息 
     *  
     * @author wanglei 
     * @version 0.1 
     */  
    public static class Progress implements ProgressListener {  
        // 文件总长度  
        private long length = 0;  
        // 已上传的文件长度  
        private long currentLength = 0;  
        // 上传是否完成  
        private boolean isComplete = false;  
        /* 
         * (non-Javadoc) 
         * @see org.apache.commons.fileupload.ProgressListener#update(long, 
         * long, int) 
         */  
        @Override  
        public void update(long bytesRead, long contentLength, int items) {  
            this.currentLength = bytesRead;  
        }  
        /** 
         * the getter method of length 
         *  
         * @return the length 
         */  
        public long getLength() {  
            return length;  
        }  
        /** 
         * the getter method of currentLength 
         *  
         * @return the currentLength 
         */  
        public long getCurrentLength() {  
            return currentLength;  
        }  
        /** 
         * the getter method of isComplete 
         *  
         * @return the isComplete 
         */  
        public boolean isComplete() {  
            return isComplete;  
        }  
        /** 
         * the setter method of the length 
         *  
         * @param length 
         *            the length to set 
         */  
        public void setLength(long length) {  
            this.length = length;  
        }  
        /** 
         * the setter method of the currentLength 
         *  
         * @param currentLength 
         *            the currentLength to set 
         */  
        public void setCurrentLength(long currentLength) {  
            this.currentLength = currentLength;  
        }  
        /** 
         * the setter method of the isComplete 
         *  
         * @param isComplete 
         *            the isComplete to set 
         */  
        public void setComplete(boolean isComplete) {  
            this.isComplete = isComplete;  
        }  
    }  
}
