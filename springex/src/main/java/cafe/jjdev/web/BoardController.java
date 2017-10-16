package cafe.jjdev.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value="/boardAdd", method = RequestMethod.GET)
    public String boardAdd() {
        System.out.println("boardAdd Æû ¿äÃ»");
        return "boardAdd";
    }
}
