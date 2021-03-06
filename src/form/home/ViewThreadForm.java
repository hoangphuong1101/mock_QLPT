package form.home;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Account;
import model.bean.Category;
import model.bean.Image;
import model.bean.Rate;
import model.bean.Thread;

public class ViewThreadForm extends ActionForm {
	int threadId;
	Account account;
	Thread thread;
	ArrayList<Image> images;
	ArrayList<Image> images360;
	ArrayList<Rate> rates;
	int ratesCount;
	ArrayList<Category> categories;
	ArrayList<model.bean.Thread> relateThreads;

	public ViewThreadForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ViewThreadForm(int threadId, Account account, Thread thread, ArrayList<Image> images,
			ArrayList<Category> categories, ArrayList<Thread> relateThreads) {
		super();
		this.threadId = threadId;
		this.account = account;
		this.thread = thread;
		this.images = images;
		this.categories = categories;
		this.relateThreads = relateThreads;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Thread getThread() {
		return thread;
	}

	public void setThread(Thread thread) {
		this.thread = thread;
	}

	public ArrayList<Image> getImages() {
		return images;
	}

	public void setImages(ArrayList<Image> images) {
		this.images = images;
	}

	public ArrayList<Image> getImages360() {
		return images360;
	}

	public void setImages360(ArrayList<Image> images360) {
		this.images360 = images360;
	}

	public ArrayList<Rate> getRates() {
		return rates;
	}

	public void setRates(ArrayList<Rate> rates) {
		this.rates = rates;
	}

	public int getRatesCount() {
		return ratesCount;
	}

	public void setRatesCount(int ratesCount) {
		this.ratesCount = ratesCount;
	}

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}

	public ArrayList<model.bean.Thread> getRelateThreads() {
		return relateThreads;
	}

	public void setRelateThreads(ArrayList<model.bean.Thread> relateThreads) {
		this.relateThreads = relateThreads;
	}

}
