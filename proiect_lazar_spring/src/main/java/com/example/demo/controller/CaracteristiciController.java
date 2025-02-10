package com.example.demo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.demo.entity.Caracteristici;
import com.example.demo.service.CaracteristiciService;
@Controller
public class CaracteristiciController {
private CaracteristiciService caracteristiciService;
public CaracteristiciController(CaracteristiciService caracteristiciService) {
super();
this.caracteristiciService = caracteristiciService;
}
// metoda handler care se ocupa cu lista caracteristicilor, returnarea si vizualizarea lor
@GetMapping("/caracteristici")
public String listcaracteristici(Model model) {
model.addAttribute("caracteristici", caracteristiciService.getAllCaracteristicii());
return "caracteristici";
}
@GetMapping("/caracteristici/new")
public String createCaracteristiciForm(Model model) {
Caracteristici caracteristici = new Caracteristici();
model.addAttribute("caracteristici", caracteristici);
return "creare_caracteristici";
}
@PostMapping("/caracteristici")
public String saveCaracteristici(@ModelAttribute("caracteristici") Caracteristici caracteristici) {
caracteristiciService.saveCaracteristici(caracteristici);
return "redirect:/caracteristici";
}
@GetMapping("/caracteristici/edit/{idcaracteristici}")
public String editCaracteristiciForm(@PathVariable Long idcaracteristici, Model model) {
model.addAttribute("caracteristici", caracteristiciService.getCaracteristiciById(idcaracteristici));
return "edit_caracteristici";
}
@PostMapping("/caracteristici/{idcaracteristici}")
public String updateCaracteristici(@PathVariable Long idcaracteristici,
@ModelAttribute("caracteristici") Caracteristici caracteristici,
Model model) {
Caracteristici caracteristiciExistent = caracteristiciService.getCaracteristiciById(idcaracteristici);
caracteristiciExistent.setIdcaracteristici(idcaracteristici);
caracteristiciExistent.setNume(caracteristici.getNume());
// salveaza un obiect caracteristici modificat
caracteristiciService.updateCaracteristici(caracteristiciExistent);
return "redirect:/caracteristici";
}
// metoda de tip handler folosita pentru a se ocupa cu cererea de stergere a caracteristiciului
@GetMapping("/caracteristici/{idcaracteristici}")
public String deleteCaracteristici(@PathVariable Long idcaracteristici) {
caracteristiciService.deleteCaracteristiciById(idcaracteristici);
return "redirect:/caracteristici";
}
}