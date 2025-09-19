package iuh.fit.se.daos;

import iuh.fit.se.entities.Product;
import java.util.List;

public interface ProductDAO {
    List<Product> findAll();
    Product findById(int id);
}
