package com.bookstore.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entity.Customer;
import com.bookstore.mapper.CustomerMapper;
import com.bookstore.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
    private final CustomerMapper customerMapper;

    public CustomerServiceImpl(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }

    @Override
    public List<Customer> list() {
        return customerMapper.findAll();
    }

    @Override
    public long count() {
        return customerMapper.count();
    }

    @Override
    @Transactional
    public Customer register(Customer customer) {
        if (customer.getUserID() == null) {
            customer.setUserID(4L);
        }
        customerMapper.insert(customer);
        return customer;
    }

    @Override
    public Customer login(String email, String password) {
        return customerMapper.findByEmailAndPassword(email, password);
    }
}
