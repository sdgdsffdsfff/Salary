package com.salary.sync.a6;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * A6工具类
 * @author 陈捷
 *
 */
@Deprecated
public class A6Util {

    private static final SessionFactory sessionFactory;

    static {
        try {
            sessionFactory = new Configuration().configure("com/salary/sync/a6/hibernate-a6.cfg.xml").buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial A6 SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}