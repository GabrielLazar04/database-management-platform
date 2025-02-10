package com.example.demo.service.impl;
import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Buletin;
import com.example.demo.repository.BuletinRepository;
import com.example.demo.service.BuletinService;
@Service
public class BuletinServiceImpl implements
BuletinService{
private BuletinRepository BuletinRepository;
public BuletinServiceImpl(BuletinRepository BuletinRepository) {
super();
this.BuletinRepository = BuletinRepository;
}
@Override
public List<Buletin> getAllConsultatii() {
return BuletinRepository.findAll();
}
@Override
public Buletin saveBuletin(Buletin Buletin) {
return BuletinRepository.save(Buletin);
}
@Override
public Buletin getBuletinById(Long idbuletin)
{
return
BuletinRepository.findById(idbuletin).get();
}
@Override
public Buletin updateBuletin(Buletin Buletin) {
return BuletinRepository.save(Buletin);
}
@Override
public void deleteBuletinById(Long idbuletin) {
BuletinRepository.deleteById(idbuletin);
}
}