package action.admin.category;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import com.google.gson.Gson;

import common.StringProcess;
import form.admin.account.AccountForm;
import form.admin.category.CategoryForm;
import model.bean.Account;
import model.bean.Category;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import statics.Log;

public class AddCategoryAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

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

		// accountListForm tương tác dữ liệu từ form
		CategoryForm categoryForm = (CategoryForm) form;

		// accountBO để tương tác vs csdl
		CategoryBO categoryBO = new CategoryBO();

		// Lưu lại hành động từ form
		String action = categoryForm.getAction();

		if ("submit".equals(action)) {
			Category category = new Category(0, categoryForm.getName());
			categoryBO.add(category);
			// Thêm thành công và chuyển trang
			return mapping.findForward("success");

		} else {

			return mapping.findForward("failed");
		}
	}
}
