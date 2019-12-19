package com.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtils {
    private static InputStream is = null;
    private static SqlSessionFactoryBuilder builder = null;
    private static SqlSessionFactory factory = null;
    private static volatile SqlSession session = null;

    static {
        try {
            is = Resources.getResourceAsStream("mybatis-config.xml");
        } catch (IOException e) {
            e.printStackTrace();
        }
        builder = new SqlSessionFactoryBuilder();
        if(is != null)
            factory = builder.build(is);
        try {
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static synchronized SqlSession getSession(){
        if (session == null){
            synchronized (MybatisUtils.class){
                if (session == null){
                    return factory.openSession();
                }
            }
        }
        return session;
    }

    public static void closeSession(){
        if(session != null)
            session.close();
    }
}
