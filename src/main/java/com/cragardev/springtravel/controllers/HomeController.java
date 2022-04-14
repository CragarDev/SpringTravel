package com.cragardev.springtravel.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	// ------------------------------------------ Updating Expense ----------------------------------
		// page for updating an expense
	@GetMapping("/expenses/update/{id}")
	public String expenseUpdate(Model model, @PathVariable(value="id") long id) {
		
		Expense expense = expenseService.findExpense(id);
		
		model.addAttribute("expense", expense);	
		
		return "updateExpense.jsp";
	}
		
		
	// Update Expense processing
	@PutMapping( value="/expenses/update/{id}")
	public String expenseUpdateProcess(
			@Valid 
			@ModelAttribute("expense") Expense expense, BindingResult result) {
		
		if (result.hasErrors()) {        
            return "updateExpense.jsp";
        } else {
            
        	expenseService.updateExpense(expense.getId(), expense.getName(), expense.getVendor(), expense.getAmount(), expense.getDescription());
            return "redirect:/expenses";
        }
	}
	
	
		
		
		// ------------------------------^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ----------------------------------
		

	

	
		// ------------------------------------------ Delete Expense ----------------------------------
		
//		@RequestMapping(value="/books/delete/{bookId}")
//		public String destroy(@PathVariable("bookId") Long bookId) {
//			bookService.deleteBook(bookId);
//			
//			return "redirect:/books";
//		}
				
		// ------------------------------^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ----------------------------------

}
