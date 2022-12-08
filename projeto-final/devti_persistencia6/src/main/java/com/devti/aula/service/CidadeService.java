package com.devti.aula.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devti.aula.model.Cidade;
import com.devti.aula.repositories.CidadeRepository;

@Service
public class CidadeService {
	
	@Autowired
	CidadeRepository rep;
	
	public java.util.List<Cidade> buscarPorUf(String uf){
		return rep.findByUf(uf);
	}

	
		
	public Cidade incluir(Cidade c) {
		return rep.save(c);
	}
	
	public java.util.List<Cidade> listarTodas(){
		return rep.findAll();
	}
	
	public Cidade alterar(Cidade c) {
		return rep.save(c);
	}
	
	public void excluir(Integer id) {
		Cidade cidadeExcluir = rep.findById(id).get();
		if(cidadeExcluir != null) {
			rep.delete(cidadeExcluir);
		}
	}
}
