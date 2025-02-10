package com.example.demo.service;
import java.util.List;
import com.example.demo.entity.Buletin;
public interface BuletinService {
List<Buletin> getAllConsultatii();
Buletin saveBuletin(Buletin buletin);
Buletin getBuletinById(Long idbuletin);
Buletin updateBuletin(Buletin buletin);
void deleteBuletinById(Long idbuletin);
}