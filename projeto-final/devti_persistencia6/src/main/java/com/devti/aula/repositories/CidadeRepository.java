package com.devti.aula.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devti.aula.model.Cidade;


@Repository
public interface CidadeRepository extends JpaRepository<Cidade, Integer>{
	
	public java.util.List<Cidade> findByUf(String uf);
}
