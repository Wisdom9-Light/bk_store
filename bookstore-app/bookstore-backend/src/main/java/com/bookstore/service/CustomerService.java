package com.bookstore.service;

import java.util.List;

import com.bookstore.entity.Customer;

public interface CustomerService {
    List<Customer> list();
    long count();
    Customer register(Customer customer);
    Customer login(String email, String password);
}
