package com.baodientu.model.bo;

import com.baodientu.model.bean.Admin;
import com.baodientu.model.dao.AdminDAO;

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
