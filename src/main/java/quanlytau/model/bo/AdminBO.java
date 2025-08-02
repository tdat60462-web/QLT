package quanlytau.model.bo;

import quanlytau.model.bean.Admin;
import quanlytau.model.dao.AdminDAO;

public class AdminBO {
    private AdminDAO adminDAO = new AdminDAO();

    public Admin getAdminByUsername(String username) {
        return adminDAO.getAdminByUsername(username);
    }

    public boolean checkLogin(String username, String password) {
        Admin admin = getAdminByUsername(username);
        return admin != null && admin.getPassword().equals(password);
    }
}
