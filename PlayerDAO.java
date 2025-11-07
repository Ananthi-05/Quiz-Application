package com.p1.DAO;

import com.p1.Model.Player;
import com.p1.Utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class PlayerDAO {

    // Save player results to the database
    public void savePlayer(Player player) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(player);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }
}
