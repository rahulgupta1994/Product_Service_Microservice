package com.programmingtechie.productservice.controller;

import com.programmingtechie.productservice.model.Product;
import com.programmingtechie.productservice.repository.ProductRepository;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/api/product")
@AllArgsConstructor
public class ProductRestController {

    private final ProductRepository productRepository;

    @GetMapping
    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }

    @GetMapping("/id")
    public Product getAllProducts(@PathVariable String id){
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Cannot Find Product By ID: " +id));
    }

    @PostMapping
    public ResponseEntity<String> saveProduct(@RequestBody Product product){
        Product savedProduct = productRepository.insert(product);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequestUri()
                .path("/id")
                .buildAndExpand(savedProduct.getId())
                .toUri();
        return ResponseEntity.created(uri).build();
    }

}
