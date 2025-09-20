package iuh.fit.news.controllers;

import iuh.fit.news.dao.DanhSachTinTucQuanLy;
import iuh.fit.news.entities.TinTuc;
import iuh.fit.news.entities.DanhMuc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "danhSachTinTuc", urlPatterns = {"/news"})
public class DanhSachTinTucServlet extends HttpServlet {
    private DanhSachTinTucQuanLy dao;

    @Override
    public void init() throws ServletException {
        dao = new DanhSachTinTucQuanLy();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String madm = req.getParameter("madm");
        List<TinTuc> list;
        if (madm != null) {
            list = dao.getTinTucByDanhMuc(Integer.parseInt(madm));
        } else {
            list = dao.getAllTinTuc();
        }

        List<DanhMuc> danhMucs = dao.getAllDanhMuc();
        req.setAttribute("danhmucs", danhMucs);
        req.setAttribute("tintucs", list);
        req.getRequestDispatcher("/views/news/DanhSachTinTuc.jsp").forward(req, resp);
    }
}
