package com.cragardev.springtravel.services;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.cragardev.springtravel.models.Expense;
import com.cragardev.springtravel.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	// adding the expense repository as a dependency
    private final ExpenseRepository expenseRepository;
    
    // constructor
    public ExpenseService(ExpenseRepository expenseRepository) {
    	this.expenseRepository = expenseRepository;
    }
    
    // returns all the expenses
    public List<Expense> allExpenses() {
    	return expenseRepository.findAll();		
	}
    
    // create an expense
    public Expense createExpense(Expense expense) {
    	return expenseRepository.save(expense);		
    }
    
    // retrieves an expense
    public Expense findExpense(Long id) {
    	Optional<Expense> optionalExpense = expenseRepository.findById(id);
    	if(optionalExpense.isPresent()) {
    		return optionalExpense.get();
    	} else {
    		return null;
    	}
    }

}