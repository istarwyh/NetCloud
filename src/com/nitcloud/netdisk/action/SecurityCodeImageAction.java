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
 * 提供图片验证码
 * @version 1.0 2012/08/22
 * @author dongliyang
 */
@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class SecurityCodeImageAction extends ActionSupport{
    
	private HttpServletRequest request;
    private HttpSession session;
    
    //图片流
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
        
        //如果开启Hard模式，可以不区分大小写
//        String securityCode = SecurityCode.getSecurityCode(4,SecurityCodeLevel.Hard, false).toLowerCase();
        
        //获取默认难度和长度的验证码
        String securityCode = SecurityCode.getSecurityCode();
        imageStream = SecurityImage.getImageAsInputStream(securityCode);
        //放入session中
        session.setAttribute("securitycode", securityCode);

        return SUCCESS;
    }

}
