package com.nitcloud.netdisk.utils;

import java.util.List;

import com.nitcloud.netdisk.domain.Page;

public class Result {  
	
    private Page page;          //��ҳ��Ϣ  
    @SuppressWarnings("rawtypes")
	private List list;          //�б����  
    
    public Page getPage() {     //��ȡ��ҳ��Ϣ  
        return page;  
    }  
    public void setPage(Page page) {    //���÷�ҳ��Ϣ  
        this.page = page;  
    }  
    @SuppressWarnings("rawtypes")
	public List getList() {     //��ȡ�б���Ϣ  
        return list;  
    }  
    @SuppressWarnings("rawtypes")
	public void setList(List list) {    //�����б���Ϣ  
        this.list = list;  
    }  
}
