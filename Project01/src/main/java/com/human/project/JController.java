package com.human.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JController {
	
	@RequestMapping(value = "/book_done", method = RequestMethod.GET)
	public String book_done() {
		
		return "book_done";
	}
}
