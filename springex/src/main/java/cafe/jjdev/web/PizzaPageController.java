package cafe.jjdev.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PizzaPageController {
	@RequestMapping(value="/pieChart", method = RequestMethod.GET)
	public String pizzaPage() {
		return "pieChart";
	}
}