package iuh.fit.news.controllers;

import iuh.fit.news.dao.DanhSachTinTucQuanLy;
import iuh.fit.news.entities.TinTuc;
import iuh.fit.news.entities.DanhMuc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "tinTucForm", urlPatterns = {"/news/add"})
public class TinTucFormServlet extends HttpServlet {
    private DanhSachTinTucQuanLy dao;

    @Override
    public void init() throws ServletException {
        dao = new DanhSachTinTucQuanLy();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<DanhMuc> danhMucs = dao.getAllDanhMuc();
        req.setAttribute("danhmucs", danhMucs);
        req.getRequestDispatcher("/views/news/TinTucForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String tieuDe = req.getParameter("tieuDe");
        String noiDung = req.getParameter("noiDungTT");
        String lienKet = req.getParameter("lienKet");
        int madm = Integer.parseInt(req.getParameter("madm"));

        // Validation đơn giản
        if (tieuDe.isEmpty() || noiDung.isEmpty() || lienKet.isEmpty() || !lienKet.startsWith("http://")) {
            req.setAttribute("error", "Dữ liệu nhập không hợp lệ!");
            doGet(req, resp);
            return;
        }

        DanhMuc dm = dao.getAllDanhMuc().stream()
                .filter(d -> d.getMadm() == madm)
                .findFirst().orElse(null);

        TinTuc tt = new TinTuc();
        tt.setTieuDe(tieuDe);
        tt.setNoiDungTT(noiDung);
        tt.setLienKet(lienKet);
        tt.setDanhMuc(dm);

        dao.addTinTuc(tt);
        resp.sendRedirect(req.getContextPath() + "/news");
    }
}
