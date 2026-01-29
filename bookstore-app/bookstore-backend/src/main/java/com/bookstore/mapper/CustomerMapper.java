package com.bookstore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bookstore.entity.Customer;

@Mapper
public interface CustomerMapper {
    List<Customer> findAll();
    long count();
    int insert(Customer customer);
    Customer findByEmailAndPassword(String email, String password);
}
