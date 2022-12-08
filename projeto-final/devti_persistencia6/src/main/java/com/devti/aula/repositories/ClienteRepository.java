package com.devti.aula.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devti.aula.model.Cidade;
import com.devti.aula.model.Cliente;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer>{
	
	public List<Cliente> findById(int id);
	
	public List<Cliente> findByCidade(Cidade cidade);
//	
//	public List<Cliente> findByNomeStartingWith(String letra);
//	
//	public List<Cliente> findByIdadeLessThanEqual(int idade);
//	
//	public List<Cliente> findByIdadeBetween(int idade);
}
