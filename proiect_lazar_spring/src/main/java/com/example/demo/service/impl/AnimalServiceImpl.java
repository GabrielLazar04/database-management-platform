package com.example.demo.service.impl;
import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Animal;
import com.example.demo.repository.AnimalRepository;
import com.example.demo.service.AnimalService;
@Service
public class AnimalServiceImpl implements AnimalService{
private AnimalRepository AnimalRepository;
public AnimalServiceImpl(AnimalRepository AnimalRepository)
{
super();
this.AnimalRepository = AnimalRepository;
}
@Override
public List<Animal> getAllAnimali() {
return AnimalRepository.findAll();
}
@Override
public Animal saveAnimal(Animal Animal) {
return AnimalRepository.save(Animal);
}
@Override
public Animal getAnimalById(Long idanimal) {
return AnimalRepository.findById(idanimal).get();
}
@Override
public Animal updateAnimal(Animal Animal) {
return AnimalRepository.save(Animal);
}
@Override
public void deleteAnimalById(Long idanimal) {
AnimalRepository.deleteById(idanimal);
}
}