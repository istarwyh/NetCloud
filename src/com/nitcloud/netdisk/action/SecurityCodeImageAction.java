package com.nitcloud.netdisk.action;

import com.nitcloud.netdisk.utils.SecurityCode;
import com.nitcloud.netdisk.utils.SecurityImage;
import com.opensymphony.xwork2.ActionSupport;

import java.io.ByteArrayInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * �ṩͼƬ��֤��
 * @version 1.0 2012/08/22
 * @author dongliyang
 */
@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class SecurityCodeImageAction extends ActionSupport{
    
	private HttpServletRequest request;
    private HttpSession session;
    
    //ͼƬ��
    private ByteArrayInputStream imageStream;

    public ByteArrayInputStream getImageStream() {
        return imageStream;
    }

    public void setImageStream(ByteArrayInputStream imageStream) {
        this.imageStream = imageStream;
    }

    
    public String execute() throws Exception {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        //�������Hardģʽ�����Բ����ִ�Сд
//        String securityCode = SecurityCode.getSecurityCode(4,SecurityCodeLevel.Hard, false).toLowerCase();
        
        //��ȡĬ���ѶȺͳ��ȵ���֤��
        String securityCode = SecurityCode.getSecurityCode();
        imageStream = SecurityImage.getImageAsInputStream(securityCode);
        //����session��
        session.setAttribute("securitycode", securityCode);

        return SUCCESS;
    }

}
