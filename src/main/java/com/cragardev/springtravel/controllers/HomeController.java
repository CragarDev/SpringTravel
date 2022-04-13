package com.cragardev.springtravel.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.cragardev.springtravel.models.Expense;
import com.cragardev.springtravel.services.ExpenseService;

@Controller
public class HomeController {
	
	@Autowired
	ExpenseService expenseService;

	
	// --------------------- Home - showing all expense and add expense form
	
	@GetMapping("/expenses")
	public String index(Model model, @ModelAttribute("expense") Expense expense) {
		
		List<Expense> expenses = expenseService.allExpenses()
;		model.addAttribute("expenses", expenses);
		
		
		return "index.jsp";
	}


	// -------------^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ----------------------------
	
	
	

	// ------------------------- Create Expense Processing ----------------------------------
	
	@PostMapping("/expenses/process")
	public String createExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
            return "index.jsp";
        } else {
            expenseService.createExpense(expense);
            return "redirect:/expenses";
        }
	}
	
	// -------------^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --------------------------------

}
