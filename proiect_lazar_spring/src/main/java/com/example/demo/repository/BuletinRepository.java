package com.example.demo.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.entity.Buletin;
public interface BuletinRepository extends JpaRepository<Buletin, Long>{
}