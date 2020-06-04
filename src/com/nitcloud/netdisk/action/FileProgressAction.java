package com.nitcloud.netdisk.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

import com.nitcloud.netdisk.domain.State;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class FileProgressAction extends ActionSupport {

	private State state;

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		this.state = (State) session.getAttribute("state");
		if (state == null) {
			System.out.println("action is null");
			state = new State();
			state.setCurrentItem(0);
		} else {

			Double a = Double.parseDouble(state.getReadedBytes() + "");
			Double b = Double.parseDouble(state.getTotalBytes() + "");
			double result = a / b * 100;
			state.setRate((int) result);
			
			//System.out.println("action:" + state.getRate());
		}
		
/*		state.setReadedBytes(state.getReadedBytes()/1024/1024);
		state.setTotalBytes(state.getTotalBytes()/1024/1024);
		
		System.out.println("the total byte is " + state.getTotalBytes());
		System.out.println("the read byte is " + state.getReadedBytes());*/
		
		//判断文件上传完成后的过程
		if(state.getRate() == 100) {
			if(session.getAttribute("progress") != null) {
				//System.out.println("progress is not null! the progress is " + session.getAttribute("progress"));
				state.setRate((Integer)session.getAttribute("progress"));
			}
		}
		
		return "success";
	}
}
