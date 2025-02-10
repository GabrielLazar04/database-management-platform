package com.example.demo.entity;

import java.sql.Date;
import jakarta.persistence.*;

@Entity
@Table(name = "buletin")
public class Buletin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idbuletin;

    @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idcaracteristici", nullable = false)
    private Caracteristici caracteristici;

    @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idAnimal", nullable = false)
    private Animal animal;

    @Column(name = "mediu", nullable = false)
    private String mediu;

    public Buletin() {
    }

    public Buletin(Caracteristici caracteristici, Animal animal, String mediu) {
        super();
        this.caracteristici = caracteristici;
        this.animal = animal;
        this.mediu = mediu;
    }

    public Long getIdbuletin() {
        return idbuletin;
    }

    public void setIdbuletin(Long idbuletin) {
        this.idbuletin = idbuletin;
    }

    public Caracteristici getCaracteristici() {
        return caracteristici;
    }

    public void setCaracteristici(Caracteristici caracteristici) {
        this.caracteristici = caracteristici;
    }

    public Animal getAnimal() {
        return animal;
    }

    public void setAnimal(Animal animal) {
        this.animal = animal;
    }

    public String getMediu() {
        return mediu;
    }

    public void setMediu(String mediu) {
        this.mediu = mediu;
    }

}
