package com.example.demo.entity;
import jakarta.persistence.*;
@Entity
@Table(name = "animal")
public class Animal {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long idanimal;
@Column(name = "nume", nullable = false)
private String nume;

public Animal() {
}
public Animal(String nume) {
super();
this.nume = nume;
}
public Long getIdanimal() {
return idanimal;
}
public void setIdanimal(Long idanimal) {
this.idanimal = idanimal;
}
public String getNume() {
return nume;
}
public void setNume(String nume) {
this.nume = nume;
}
}