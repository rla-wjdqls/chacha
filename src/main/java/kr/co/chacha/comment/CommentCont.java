package kr.co.chacha.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/comment")
public class CommentCont {

	public CommentCont() {

		System.out.println("-----CommentCont() 객체 생성");
	}

	@Autowired
	private CommentDAO commentDao;

	@PostMapping("/insert")
	@ResponseBody
	public int mCommentServiceInsert(@RequestParam int textno, @RequestParam String content, HttpSession session)
			throws Exception {
		// HttpServletRequest req
		// @ModelAttribute commentDTO commentDto
		CommentDTO commentDto = new CommentDTO();
		commentDto.setTextno(textno);
		commentDto.setContent(content);
		
		String uid=(String)session.getAttribute("s_id");
		commentDto.setUid(uid);
		int cnt = commentDao.commentInsert(commentDto);

		return cnt;

	}// mCommentServiceInsert() end
	
	/*
	@GetMapping("/commentInsertForm")
	public String showCommentInsertForm(Model model, @RequestParam("textno") int textno) {
		// 이전 페이지 정보를 모델에 추가
	   // CommentDTO commentDto = new CommentDTO();
	    //int cnt = commentDao.commentInsert(commentDto);

	    // 업데이트된 댓글 목록을 가져와서 모델에 추가
	    List<CommentDTO> updatedComments = commentDao.commentList(textno);
	    model.addAttribute("comments", updatedComments);

	    return "commentInsertForm";
    }
	*/
	
	@GetMapping("/list")
	@ResponseBody
	public List<CommentDTO> mCommentServiceList(int textno) throws Exception {
		List<CommentDTO> list = commentDao.commentList(textno);
		return list;
	}// mCommentServiceList() end

	@PostMapping("/update")
	@ResponseBody
	public int mCommentServiceUpdateProc(@RequestParam int commentNo, @RequestParam String content) throws Exception {
		CommentDTO commentDto = new CommentDTO();
		commentDto.setCommentNo(commentNo);
		commentDto.setContent(content);
		//로그인하고 난 후, 댓글 수정을 하려면 -> mCommentServiceInsert()함수 참조

		int cnt = commentDao.commentUpdate(commentDto);
		return cnt;
	}// mCommentServiceUpdateProc() end

	@PostMapping("/delete/{commentNo}")
	@ResponseBody
	public int mCommentServiceDelete(@PathVariable int commentNo) throws Exception {
		int cnt = commentDao.commentDelete(commentNo);
		return cnt;
	}// mCommentServiceDelete() end

	
	
}
