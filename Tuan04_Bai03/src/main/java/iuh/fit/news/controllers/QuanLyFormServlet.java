package iuh.fit.news.controllers;

import iuh.fit.news.dao.DanhSachTinTucQuanLy;
import iuh.fit.news.entities.TinTuc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "quanLyForm", urlPatterns = {"/news/manage"})
public class QuanLyFormServlet extends HttpServlet {
    private DanhSachTinTucQuanLy dao;

    @Override
    public void init() throws ServletException {
        dao = new DanhSachTinTucQuanLy();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<TinTuc> list = dao.getAllTinTuc();
        req.setAttribute("tintucs", list);
        req.getRequestDispatcher("/views/news/QuanLyForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int matt = Integer.parseInt(req.getParameter("matt"));
        dao.deleteTinTuc(matt);
        resp.sendRedirect(req.getContextPath() + "/news/manage");
    }
}
