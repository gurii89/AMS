package cafe.jjdev.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
import cafe.jjdev.web.service.Board;
import cafe.jjdev.web.service.BoardDao;
@Controller
public class BoardController {
    @Autowired
    private BoardDao boardDao;
    
    // 글 수정 폼 요청
    @RequestMapping(value="/boardModify", method = RequestMethod.GET)
    public String boardModify(Model model
                            , @RequestParam(value="boardNo", required=true) int boardNo){
        Board board  = boardDao.getBoard(boardNo);
        model.addAttribute("board", board);
        return "boardModify";
    }
    
    // 글 수정 요청
    @RequestMapping(value="/boardModify", method = RequestMethod.POST)
    public String boardModify(Board board){
        boardDao.updateBoard(board);
        return "redirect:/boardView?boardNo="+board.getBoardNo();
    }
    
    // 글 삭제 폼 요청(비밀번호 입력 폼)
    @RequestMapping(value="/boardRemove", method = RequestMethod.GET)
    public String boardRemove(@RequestParam(value="boardNo", required=true) int boardNo) {
        return "boardRemove";
    }
    // 글 삭제 요청
    @RequestMapping(value="/boardRemove", method = RequestMethod.POST)
    public String boardRemove(@RequestParam(value="boardNo", required=true) int boardNo
                            , @RequestParam(value="boardPw", required=true) String boardPw) {
        boardDao.deleteBoard(boardNo, boardPw);
        return "redirect:/boardList";
    }
    
    // 글 상세 내용 요청 
    @RequestMapping(value="/boardView", method = RequestMethod.GET)
    public String boardView(Model model
                            , @RequestParam(value="boardNo", required=true) int boardNo) {
        Board board = boardDao.getBoard(boardNo);
        model.addAttribute("board", board);
        return "boardView";
    }
    
    // 리스트 요청
    @RequestMapping(value="/boardList", method = RequestMethod.GET)
    public String boardList(Model model
                            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
        int boardCount = boardDao.getBoardCount();
        int pagePerRow = 10;
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
        List<Board> list = boardDao.getBoardList(currentPage, pagePerRow);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("list", list);
        return "boardList";
    }
    
    
    // 입력(액션) 요청
    @RequestMapping(value="/boardAdd", method = RequestMethod.POST)
    public String boardAdd(Board board) {
        System.out.println(board);
        boardDao.insertBoard(board);
        return "redirect:/boardList"; // 글입력후 "/boardList"로 리다이렉트(재요청)
    }
    // 입력페이지 요청
    @RequestMapping(value="/boardAdd", method = RequestMethod.GET)
    public String boardAdd() {
        System.out.println("boardAdd 폼 요청");
        return "boardAdd";
    }
}