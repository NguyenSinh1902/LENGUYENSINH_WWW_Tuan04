package iuh.fit.se.daos.impl;

import iuh.fit.se.daos.UserDAO;
import iuh.fit.se.entities.User;
import iuh.fit.se.utils.EntityManagerFactoryUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class UserDAOImpl implements UserDAO {
    @Override
    public void save(User user) {
        EntityManager em = EntityManagerFactoryUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(user);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public List<User> findAll() {
        EntityManager em = EntityManagerFactoryUtil.getEntityManager();
        List<User> list = em.createQuery("SELECT u FROM User u", User.class).getResultList();
        em.close();
        return list;
    }
}
