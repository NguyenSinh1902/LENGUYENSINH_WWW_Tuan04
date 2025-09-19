package iuh.fit.se.controllers;

import iuh.fit.se.daos.ProductDAO;
import iuh.fit.se.daos.impl.ProductDAOImpl;
import iuh.fit.se.entities.ItemCart;
import iuh.fit.se.entities.Product;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import javax.sql.DataSource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "cartController", urlPatterns = "/cart")
public class CartController extends HttpServlet {
    @Resource(name = "jdbc/shopping")
    private DataSource dataSource;

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        this.productDAO = new ProductDAOImpl(this.dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "view";

        HttpSession session = req.getSession();
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        switch (action) {
            case "add":
                int id = Integer.parseInt(req.getParameter("id"));
                Product p = productDAO.findById(id);
                boolean exists = false;
                for (ItemCart item : cart) {
                    if (item.getProduct().getId() == id) {
                        item.setQuantity(item.getQuantity() + 1);
                        exists = true;
                        break;
                    }
                }
                if (!exists) {
                    cart.add(new ItemCart(p, 1));
                }
                resp.sendRedirect("cart?action=view");
                break;

            case "remove":
                int removeId = Integer.parseInt(req.getParameter("id"));
                cart.removeIf(item -> item.getProduct().getId() == removeId);
                resp.sendRedirect("cart?action=view");
                break;

            case "update":
                int updateId = Integer.parseInt(req.getParameter("id"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                for (ItemCart item : cart) {
                    if (item.getProduct().getId() == updateId) {
                        item.setQuantity(quantity);
                        break;
                    }
                }
                resp.sendRedirect("cart?action=view");
                break;

            default:
                req.getRequestDispatcher("views/cart/index.jsp").forward(req, resp);
        }
    }
}
