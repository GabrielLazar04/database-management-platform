package com.example.demo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.demo.entity.Animal;
import com.example.demo.service.AnimalService;
@Controller
public class AnimalController {
private AnimalService animalService;
public AnimalController(AnimalService animalService) {
super();
this.animalService = animalService;
}
@GetMapping("/animal")
public String listPacienti(Model model) {
model.addAttribute("animal", animalService.getAllAnimali());
return "animal";
}
@GetMapping("/animal/new")
public String createAnimalForm(Model model) {
Animal animal = new Animal();
model.addAttribute("animal", animal);
return "creare_animal";
}
@PostMapping("/animal")
public String saveAnimal(@ModelAttribute("animal") Animal animal) {
animalService.saveAnimal(animal);
return "redirect:/animal";
}
@GetMapping("/animal/edit/{idanimal}")
public String editAnimalForm(@PathVariable Long idanimal, Model model) {
model.addAttribute("animal", animalService.getAnimalById(idanimal));
return "edit_animal";
}
@PostMapping("/animal/{idanimal}")
public String updateAnimal(@PathVariable Long idanimal,
@ModelAttribute("animal") Animal animal,
Model model) {
Animal animalExistent = animalService.getAnimalById(idanimal);
animalExistent.setIdanimal(idanimal);
animalExistent.setNume(animal.getNume());
animalService.updateAnimal(animalExistent);
return "redirect:/animal";
}
@GetMapping("/animal/{idanimal}")
public String deleteAnimal(@PathVariable Long idanimal) {
animalService.deleteAnimalById(idanimal);
return "redirect:/animal";
}
}
