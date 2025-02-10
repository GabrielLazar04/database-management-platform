package com.example.demo.service.impl;
import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Caracteristici;
import com.example.demo.repository.CaracteristiciRepository;
import com.example.demo.service.CaracteristiciService;
@Service
public class CaracteristiciServiceImpl implements CaracteristiciService{
private CaracteristiciRepository CaracteristiciRepository;
public CaracteristiciServiceImpl(CaracteristiciRepository
CaracteristiciRepository) {
super();
this.CaracteristiciRepository = CaracteristiciRepository;
}
@Override
public List<Caracteristici> getAllCaracteristicii() {
return CaracteristiciRepository.findAll();
}
@Override
public Caracteristici saveCaracteristici(Caracteristici Caracteristici) {
return CaracteristiciRepository.save(Caracteristici);
}
@Override
public Caracteristici getCaracteristiciById(Long idcaracteristici) {
return CaracteristiciRepository.findById(idcaracteristici).get();
}
@Override
public Caracteristici updateCaracteristici(Caracteristici Caracteristici) {
return CaracteristiciRepository.save(Caracteristici);
}
@Override
public void deleteCaracteristiciById(Long idcaracteristici) {
CaracteristiciRepository.deleteById(idcaracteristici);
}
}