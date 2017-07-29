package action.admin.account;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.account.AccountListForm;
import form.admin.account.DeleteForm;
import model.bean.Account;
import model.bo.AccountBO;
import statics.Log;
import statics.Pagination;

public class DeleteAccountAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		

		/* START CHECK LOGIN */
		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		HttpSession httpSession = request.getSession();

		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");

		try {
			account.setEmail(httpSession.getAttribute("emailAdmin").toString());
			account.setPassword(httpSession.getAttribute("passwordAdmin").toString());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		Account accountData = accountBO.checkLoginAccountAdmin(account);
		if (accountData.getAccountId() > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("emailAdmin", accountData.getEmail());
			httpSession.setAttribute("passwordAdmin", accountData.getPassword());
			response.addCookie(new Cookie("emailAdmin", accountData.getEmail()));
			response.addCookie(new Cookie("avatarAdmin", accountData.getAvatar()));
			accountData.setPassword("");
		} else {
			return mapping.findForward("failed");
		}
		/* END CHECK LOGIN */
		
		//Tương tác dữ liệu từ form
		DeleteForm deleteForm = (DeleteForm) form;
		
		//Tương tác với csdl
		
		//Lấy accountId từ form
		int accountId = deleteForm.getAccountId();
		
		//Tạo ra đối tượng account
		account = new Account();
		
		//Gán giá trị accountId
		account.setAccountId(accountId);
		
		if( accountId >= 0 )
			accountBO.deleteAccount(account);

		//Trả v�? deletedAccount
		return mapping.findForward("deletedAccount");
	}
}
