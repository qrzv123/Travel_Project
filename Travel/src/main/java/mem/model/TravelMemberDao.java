package mem.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import login.model.TravelUserBean;
import shop.model.OrdersBean;


@Component
public class TravelMemberDao {
	private String namespace = "mem.model.Mem";
	@Autowired
	SqlSessionTemplate sst;
	
	//맴버 비밀번호변경
	public void updateMemPwd(TravelUserBean tubean) {
		int cnt = -1;
		cnt = sst.update(namespace+".UpdateMemberPwd", tubean);
		System.out.println("cnt: "+cnt);
	}
	
	//맴버 계좌번호 추가
	public void insertAccount(TravelAccountBean tabean) {
		int cnt = -1;
		cnt = sst.insert(namespace+".InsertAccountMember", tabean);
		System.out.println("cnt: "+cnt);
	}

	//맴버 계좌 리스트
	public List<TravelAccountBean> accountList(int mnum) {
		List<TravelAccountBean> lists = sst.selectList(namespace+".SelectAccountList",mnum);
		return lists;
	}

	//
	public List<TravelBookBean> orderList(int mnum) {
		List<TravelBookBean> lists = sst.selectList(namespace+".selectOrder", mnum);
		return lists;
	}

	public int seachAccount(String accnum) {
		int cnt = -1;
		cnt = sst.selectOne(namespace+".SearchAccount", accnum);
		System.out.println("cnt: "+cnt);
		return cnt;
	}

	public void deleteMember(TravelUserBean userInfo) {
		int cnt = -1;
		cnt = sst.delete(namespace+".DeleteMember", userInfo);
		System.out.println("cnt: "+cnt);
	}
	
	
}
