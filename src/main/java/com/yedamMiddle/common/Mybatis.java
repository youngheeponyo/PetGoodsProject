package com.yedamMiddle.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Mybatis {
	private Mybatis() {
		
	}
	private static Object factoryLock = new Object();
	
	private static SqlSessionFactory factory = null;
	public static SqlSessionFactory getInstance() {
		if(factory == null) {
			synchronized(factoryLock) {
				if(factory == null) {
					String resource = "config/mybatis-config.xml";
					InputStream inputStream = null;
					try {
						inputStream = Resources.getResourceAsStream(resource);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					factory = new SqlSessionFactoryBuilder().build(inputStream);
				}
			}
		}		
		return factory;
	}
}