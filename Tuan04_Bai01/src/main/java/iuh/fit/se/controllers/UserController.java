package iuh.fit.se.controllers;

import iuh.fit.se.daos.UserDAO;
import iuh.fit.se.daos.impl.UserDAOImpl;
import iuh.fit.se.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "userController", urlPatterns = {"/users"})
public class UserController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<User> list = userDAO.findAll();
        req.setAttribute("users", list);
        req.getRequestDispatcher("/views/user/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName  = req.getParameter("lastName");
        String email     = req.getParameter("email");
        String confirmEmail = req.getParameter("confirmEmail");
        String password  = req.getParameter("password");
        String birthday  = req.getParameter("day") + "/" +
                req.getParameter("month") + "/" +
                req.getParameter("year");
        String gender    = req.getParameter("gender");

        if (!email.equals(confirmEmail)) {
            req.setAttribute("errors", "Email và xác nhận Email không trùng!");
            req.getRequestDispatcher("/views/commom/error.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setConfirmEmail(confirmEmail);
        user.setPassword(password);
        user.setBirthday(birthday);
        user.setGender(gender);

        userDAO.save(user);
        resp.sendRedirect(req.getContextPath() + "/users");
    }
}
