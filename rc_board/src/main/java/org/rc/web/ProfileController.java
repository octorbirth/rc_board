package org.rc.web;

import org.rc.dto.BoardDTO;
import org.rc.dto.MemberDTO;
import org.rc.dto.SearchCriteria;
import org.rc.service.BoardService;
import org.rc.service.MemberService;
import org.rc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/profile/*")
@Log
public class ProfileController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/view")
	public void view(MemberDTO dto, Model model) {
		model.addAttribute("members",service.getInfo(dto));
		return;
	}
	@GetMapping("/management")
	public void management() {
		return;
	}
	
	@PostMapping("/management")
	public String modify(MemberDTO dto, Model model) {
		service.updateInfo(dto);
		model.addAttribute("dto", dto);
		return "redirect:/profile/management";
	}
	
}
