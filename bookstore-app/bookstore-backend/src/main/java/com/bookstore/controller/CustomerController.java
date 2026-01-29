package com.bookstore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.bookstore.dto.CustomerLoginRequest;
import com.bookstore.dto.CustomerRegisterRequest;
import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;

import jakarta.validation.Valid;

@CrossOrigin
@RestController
@RequestMapping("/api/customers")
public class CustomerController {
    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public List<Customer> list() {
        return customerService.list();
    }

    @GetMapping("/count")
    public Map<String, Object> count() {
        Map<String, Object> result = new HashMap<>();
        result.put("count", customerService.count());
        return result;
    }

    @PostMapping("/register")
    public Customer register(@Valid @RequestBody CustomerRegisterRequest request) {
        Customer customer = new Customer();
        customer.setFirstName(request.getFirstName());
        customer.setLastName(request.getLastName());
        customer.setEmail(request.getEmail());
        customer.setPassword(request.getPassword());
        customer.setAge(request.getAge());
        customer.setNationality(request.getNationality());
        customer.setLanguage(request.getLanguage());
        customer.setReligion(request.getReligion());
        customer.setProfession(request.getProfession());
        customer.setBankID(request.getBankID());
        return customerService.register(customer);
    }

    @PostMapping("/login")
    public Customer login(@Valid @RequestBody CustomerLoginRequest request) {
        Customer customer = customerService.login(request.getEmail(), request.getPassword());
        if (customer == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid credentials");
        }
        customer.setPassword(null);
        return customer;
    }
}
