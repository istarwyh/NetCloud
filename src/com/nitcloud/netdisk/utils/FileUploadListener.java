package com.nitcloud.netdisk.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

import com.nitcloud.netdisk.domain.State;

public class FileUploadListener implements ProgressListener{
	private HttpSession session;
	
	public FileUploadListener(HttpServletRequest request) {
	       session = request.getSession();
	       State state = new State();
	       session.setAttribute("state", state);
	}
	@Override
	public void update(long readedBytes, long totalBytes, int currentItem) {
		// TODO Auto-generated method stub
		   //System.out.println("update:"+readedBytes+";"+totalBytes+";"+currentItem);
	       
		   State state = (State) session.getAttribute("state");
	       
	       state.setReadedBytes(readedBytes);
	       state.setTotalBytes(totalBytes);
	       state.setCurrentItem(currentItem);
	}
}
