package com.example.demo.service;
import java.util.List;
import com.example.demo.entity.Caracteristici;
public interface CaracteristiciService {
List<Caracteristici> getAllCaracteristicii();
Caracteristici saveCaracteristici(Caracteristici caracteristici);
Caracteristici getCaracteristiciById(Long idcaracteristici);
Caracteristici updateCaracteristici(Caracteristici caracteristici);
void deleteCaracteristiciById(Long idcaracteristici);
}