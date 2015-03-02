package com.salary.sync.crm;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * CRM工具类
 * @author 陈捷
 *
 */
@Deprecated
public class CRMUtil {

    private static final SessionFactory sessionFactory;

    static {
        try {
            sessionFactory = new Configuration().configure("com/salary/sync/crm/hibernate-crm.cfg.xml").buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial CRM SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}