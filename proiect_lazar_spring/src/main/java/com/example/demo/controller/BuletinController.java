package com.example.demo.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.demo.entity.Buletin;
import com.example.demo.service.BuletinService;
import com.example.demo.entity.Caracteristici;
import com.example.demo.repository.AnimalRepository;
import com.example.demo.repository.CaracteristiciRepository;
import com.example.demo.entity.Animal;
@Controller
public class BuletinController {
private BuletinService buletinService;
@Autowired
private CaracteristiciRepository caracteristiciRepo;
@Autowired
private AnimalRepository animalRepo;
public BuletinController(BuletinService buletinService) {
super();
this.buletinService = buletinService;
}
@GetMapping("/buletin")
public String listBuletin(Model model) {
model.addAttribute("buletin", buletinService.getAllConsultatii());
return "buletin";
}
@GetMapping("/buletin/new")
public String createBuletinForm(Model model) {
List<Caracteristici> toticaracteristiciii = caracteristiciRepo.findAll();
List<Animal> totianimalii = animalRepo.findAll();
Buletin buletin = new Buletin();
model.addAttribute("buletin", buletin);
model.addAttribute("toticaracteristiciii", toticaracteristiciii);
model.addAttribute("totianimalii", totianimalii);
return "creare_buletin";
}
@PostMapping("/buletin")
public String saveBuletin(@ModelAttribute("buletin") Buletin
buletin) {
buletinService.saveBuletin(buletin);
return "redirect:/buletin";
}
@GetMapping("/buletin/edit/{idbuletin}")
public String editAnimalForm(@PathVariable Long idbuletin, Model model) {
List<Caracteristici> toticaracteristiciii = caracteristiciRepo.findAll();
List<Animal> totianimalii = animalRepo.findAll();
model.addAttribute("buletin", buletinService.getBuletinById(idbuletin));
model.addAttribute("toticaracteristiciii", toticaracteristiciii);
model.addAttribute("totianimalii", totianimalii);
return "edit_buletin";
}
@PostMapping("/buletin/{idbuletin}")
public String updateBuletin(@PathVariable Long idbuletin,
@ModelAttribute("buletin") Buletin buletin,
Model model) {
Buletin buletinExistenta =
buletinService.getBuletinById(idbuletin);
buletinExistenta.setIdbuletin(idbuletin);
buletinExistenta.setCaracteristici(buletin.getCaracteristici());
buletinExistenta.setAnimal(buletin.getAnimal());
buletinExistenta.setMediu(buletin.getMediu());
buletinService.updateBuletin(buletinExistenta);
return "redirect:/buletin";
}
@GetMapping("/buletin/{idbuletin}")
public String deleteBuletin(@PathVariable Long idbuletin) {
buletinService.deleteBuletinById(idbuletin);
return "redirect:/buletin";
}
}