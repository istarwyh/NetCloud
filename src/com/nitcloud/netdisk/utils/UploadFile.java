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
     * �ϴ��ļ� 
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
        LOG.info("�ͻ����ύ����: " + request.getContentType());  
        if (request.getContentType() == null) {  
            throw new IOException(  
                    "the request doesn't contain a multipart/form-data stream");  
        }  
          
        String key = request.getParameter("key");  
        Progress p = (Progress)request.getSession().getAttribute(key);  
          
        // �����ϴ��ļ��ܴ�С  
        p.setLength(request.getContentLength());  
        LOG.info("�ϴ��ļ���СΪ : " + p.getLength());  
        // �ϴ���ʱ·��  
        String path = request.getSession().getServletContext().getRealPath("/");  
        LOG.info("�ϴ���ʱ·�� : " + path);  
        // �����ϴ�����  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        factory.setRepository(new File(path));  
        // ��ֵ,�������ֵ�Ż�д����ʱĿ¼  
        factory.setSizeThreshold(1024 * 1024 * 10);  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        // ����ϴ�����  
        upload.setSizeMax(1024 * 1024 * 200);  
        // ���ü����������ϴ�����  
        upload.setProgressListener(p);  
        try {  
            LOG.info("�����ϴ��ļ�....");  
            List<FileItem> items = upload.parseRequest(request);  
              
            LOG.info("�ϴ�����...");  
            for (FileItem item : items) {  
                  
                // �Ǳ���  
                if (!item.isFormField()) {  
                    LOG.info("�ϴ�·��  : " + path + item.getName());  
                    FileOutputStream fos = new FileOutputStream(path + item.getName());  
                    // �ļ�ȫ���ڴ���  
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
                    LOG.info("����ϴ��ļ�!");  
                      
                    item.delete();  
                    LOG.info("ɾ����ʱ�ļ�!");  
                      
                    p.setComplete(true);  
                    LOG.info("����progress����״̬Ϊ���״̬!");  
                }  
            }  
        } catch (Exception e) {  
            LOG.error("�ϴ��ļ������쳣, ����ԭ�� : " + e.getMessage());  
            // ��������,������Ϣ��������Ϊ���״̬  
            p.setComplete(true);  
            request.getSession().removeAttribute(key);  
        }  
    }  
      
    /** 
     * ִ�пͻ��˽ű� 
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
     * �ϴ��ļ�������Ϣ 
     *  
     * @author wanglei 
     * @version 0.1 
     */  
    public static class Progress implements ProgressListener {  
        // �ļ��ܳ���  
        private long length = 0;  
        // ���ϴ����ļ�����  
        private long currentLength = 0;  
        // �ϴ��Ƿ����  
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
