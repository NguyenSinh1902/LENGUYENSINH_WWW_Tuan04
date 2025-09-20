package iuh.fit.news.dao;

import iuh.fit.news.entities.TinTuc;
import iuh.fit.news.entities.DanhMuc;
import jakarta.persistence.*;

import java.util.List;

public class DanhSachTinTucQuanLy {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("news-management");
    private EntityManager em = emf.createEntityManager();

    public List<TinTuc> getTinTucByDanhMuc(int madm) {
        return em.createQuery("SELECT t FROM TinTuc t WHERE t.danhMuc.madm = :madm", TinTuc.class)
                .setParameter("madm", madm)
                .getResultList();
    }

    public List<TinTuc> getAllTinTuc() {
        return em.createQuery("SELECT t FROM TinTuc t", TinTuc.class).getResultList();
    }

    public void addTinTuc(TinTuc tt) {
        em.getTransaction().begin();
        em.persist(tt);
        em.getTransaction().commit();
    }

    public void deleteTinTuc(int matt) {
        em.getTransaction().begin();
        TinTuc tt = em.find(TinTuc.class, matt);
        if (tt != null) em.remove(tt);
        em.getTransaction().commit();
    }

    public List<DanhMuc> getAllDanhMuc() {
        return em.createQuery("SELECT d FROM DanhMuc d", DanhMuc.class).getResultList();
    }
}
