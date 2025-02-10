package com.example.demo.service;
import java.util.List;
import com.example.demo.entity.Animal;
public interface AnimalService {
List<Animal> getAllAnimali();
Animal saveAnimal(Animal animal);
Animal getAnimalById(Long idanimal);
Animal updateAnimal(Animal animal);
void deleteAnimalById(Long idanimal);
}