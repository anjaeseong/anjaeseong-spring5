package com.edu.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.service.IF_MemberService;
import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

/**
 * 이 클래스는 Admin관리자단을 접근하는 클래스
 * 변수 Object를 만들어서 jsp로 전송 <-> jsp 폼값을 받아서 Object로 처리
 * @author 안재성
 *
 */
@Controller
public class AdminController { 
	//컨트롤러 수정하면 자동로딩(auto컴파일)
	//디버그용 로그객체 생성
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	//이 메서드는 회원목록을 출력하는  jsp와 매핑에 됩니다
	@Inject
	private IF_MemberService memberService;
	
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
	public String viewMemberForm(Model model, @RequestParam("user_id")String user_id, @ModelAttribute("pageVO")PageVO pageVO) throws Exception {
		/*
		 *이 메서드는 리스트 페이지에서 상세보기로 이동할때 보여주는1개 레코드값을 보여주는 구현을 합니다
		 *JUnit에서 테스트했던 readMember 방식을 이용
		 *다른점은 JUnit에서는 식별자ID를 상제로 지정했지만 이 메서드에서는 @RequestParam인터페이스를 이용해서 식별자 값을 받음
		 */
		//위 출력값memberVO 1개의 레코드를 model이용해서 member_view.jsp 로 보냅니다(아래)
		model.addAttribute("memberVo", memberService.readMember(user_id));
		return "admin/member/member_view"; //상대경로 폴더파일위치
	}
	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
	public String selectMember(Model model, PageVO pageVO) throws Exception {
	/*
		이 메서드는 2가지 객체를 생성해서 JSP로 보내줘야 합니다
	    1객체: memberList객체를 생성해서 model을 통해서 jsp로 전송
	    2객체: pageVO객체(prev,next,startPage,endPage)를 생성해서 model을 통해서
	    2번객체무터 로직이 필요-> memberList구하는 쿼리변수가 만들어지기 때문에 이거부터 구현
	 */
		//역방향 검색한 결과를 jsp 보내줍니다 (아래)
		if(pageVO.getPage() == null) {
			pageVO.setPage(1);
		}
		//pagdVO의 calcPage메서드를 실행하려면 필수 변수값입력(아래)
		
		pageVO.setQueryPerPageNum(5); //memberList 쿼리에 필요
		pageVO.setPerPageNum(5); //startPge,endPage구할때
		//위 2개의 변수값을 이용해서 아래 setTotalCount메서드에서 calcPge()호출됨
		pageVO.setTotalCount(memberService.countMember(pageVO)); //검색되든 안되든 결과의 전체카운트값(단, 페이징 관련없개수)
		//calcPge 실행되면 prev, next 변수값이 입력됩니다
		List<MemberVO> listMember = memberService.selectMember(pageVO);
		
		logger.info("디버그" + pageVO.toString()); //지금까지 jsp->컨트롤러 일방향 자료이동
		//컨트롤러에서 jsp로 역방향으로 보내는 자료를 Model에 담아서 보내게 됩니다
		model.addAttribute("listMember", listMember);
		model.addAttribute("pageVO", pageVO);
		return "admin/member/member_list";//상대경로
	}
	//URL요청 경로는 @RequstMapping 반드시 절대경로로 표시
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin(Model model) throws Exception {//에러발생시 Exception클래스의 정보를 스프링으로 보내게 됩니다
		//아래 상대경로에서/WEB-INF/views/폴더가 루트(생략prefix접두어) 입니다
		//아래 상대경로 home.jsp에서 .jsp (생략suffix접미어) 입니다
		return "admin/home";//리턴 경로=접근경로는 상대경로로 표시
	}
}
