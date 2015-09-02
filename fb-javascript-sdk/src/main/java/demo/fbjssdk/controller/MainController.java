package demo.fbjssdk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mainCtrl")
public class MainController {

	@RequestMapping(method=RequestMethod.GET, value="/getDetailsFromFacebook")
	public @ResponseBody String getDetails(@RequestParam("emailId") String emailId, @RequestParam("name") String name) {
		//With email you can design your login process.
		return "Hello user "+ name +". Your email is :"+emailId;
	}
}
