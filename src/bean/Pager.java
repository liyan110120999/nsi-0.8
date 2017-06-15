package bean;

import java.io.Serializable;
import java.util.List;

public class Pager<T> implements Serializable {

private static final long serialVersionUID = -8741766802354222579L;
	
	private int pageSize; // 姣忛〉鏄剧ず澶氬皯鏉¤褰�
	
	private int currentPage; //褰撳墠绗嚑椤垫暟鎹�
	
	private int totalRecord; // 涓�鍏卞灏戞潯璁板綍
	
	private int totalPage; // 涓�鍏卞灏戦〉璁板綍
	
	private List<T> dataList; //瑕佹樉绀虹殑鏁版嵁

	
	
	
	
	
	
	public Pager() {

	}

	public Pager(int pageSize, int currentPage, int totalRecord, int totalPage,
			List<T> dataList) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.totalPage = totalPage;
		this.dataList = dataList;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
	
	
}
