package model.bo;

import java.util.ArrayList;

import model.bean.Account;
import model.dao.AccountDAO;

public class AccountBO {
	AccountDAO accountDAO = new AccountDAO();

	// Lấy danh sách tài khoản ở trang
	public ArrayList<Account> getListAccount(int page) {
		return accountDAO.getListAccount(page);
	}

	// Xóa tài khoản
	public void deleteAccount(Account account) {
		accountDAO.deleteAccount(account);
	}

	// Tạo tài khoản account
	public boolean addAccount(Account account) {
		return accountDAO.addAccount(account);
	}

	// Lấy thông tin tài khoản có accountId =
	public Account getAccountById(Account account) {
		return accountDAO.getAccountById(account);
	}

	// Sửa thông tin tài khoản
	public void editAccount(Account account) {
		accountDAO.editAccount(account);
	}

	public boolean checkEmail(Account account) {
		return accountDAO.checkEmail(account);
	}

	public int checkLogin(Account account) {
		return accountDAO.checkLogin(account);
	}

	public Account checkLoginAccount(Account account) {
		return accountDAO.checkLoginAccount(account);
	}

	public Account checkLoginAccountMod(Account account) {
		return accountDAO.checkLoginAccountMod(account);
	}

	public Account checkLoginAccountAdmin(Account account) {
		return accountDAO.checkLoginAccountAdmin(account);
	}

	public ArrayList<Account> getListAccountUser(int page) {
		return accountDAO.getListAccountUser(page);
	}

	public boolean lock(Account account) {
		return accountDAO.lock(account);
	}

	public boolean unLock(Account account) {
		return accountDAO.unLock(account);
	}

}
