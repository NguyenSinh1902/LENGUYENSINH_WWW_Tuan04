package iuh.fit.se.daos;

import iuh.fit.se.entities.User;
import java.util.List;

public interface UserDAO {
    void save(User user);
    List<User> findAll();
}
