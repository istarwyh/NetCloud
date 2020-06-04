package com.nitcloud.netdisk.utils;

import java.util.List;

import com.nitcloud.netdisk.domain.Page;

public class Result {  
	
    private Page page;          //分页信息  
    @SuppressWarnings("rawtypes")
	private List list;          //列表操作  
    
    public Page getPage() {     //获取分页信息  
        return page;  
    }  
    public void setPage(Page page) {    //设置分页信息  
        this.page = page;  
    }  
    @SuppressWarnings("rawtypes")
	public List getList() {     //获取列表信息  
        return list;  
    }  
    @SuppressWarnings("rawtypes")
	public void setList(List list) {    //设置列表信息  
        this.list = list;  
    }  
}
