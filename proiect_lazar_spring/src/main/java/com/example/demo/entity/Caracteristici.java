package com.example.demo.entity;
import jakarta.persistence.*;
@Entity
@Table(name = "caracteristici")
public class Caracteristici {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long idcaracteristici;
@Column(name = "nume", nullable = false)
private String nume;
public Caracteristici() {
}
public Caracteristici(String nume) {
super();
this.nume = nume;
}
public Long getIdcaracteristici() {
return idcaracteristici;
}
public void setIdcaracteristici(Long idcaracteristici) {
this.idcaracteristici = idcaracteristici;
}
public String getNume() {
return nume;
}
public void setNume(String nume) {
this.nume = nume;
}
}