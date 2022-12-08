package com.devti.aula.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devti.aula.model.Cidade;
import com.devti.aula.model.Cliente;
import com.devti.aula.repositories.ClienteRepository;

@Service
public class ClienteService {
	@Autowired
	ClienteRepository rep;
	
	public List<Cliente> buscarPorId(int id){
		return rep.findById(id);
	}
	public List<Cliente> buscaPorCidade(Cidade cidade) {
		return rep.findByCidade(cidade);
	}
	
//	public List<Cliente> buscarPorPrimeiraLetra(String letra){
//		return rep.findByNomeStartingWith(letra);
//	}
//	
//	public List<Cliente> buscarPorIdadeMenorQue(int idade){
//		return rep.findByIdadeLessThanEqual(idade);
//	}
//	
//	public List<Cliente> buscarIdadeEntre(int idade){
//		return rep.findByIdadeBetween(idade);
//	}
	
	public List<Cliente> listarTodos(){
		return rep.findAll();
	}
	
	public Cliente incluir(Cliente c) {
		return rep.save(c);
	}
	
	public Cliente alterar(Cliente c) {
		return rep.save(c);
	}
	
	public void excluir(Integer id) {
		Cliente clienteExcluir = rep.findById(id).get();
		if(clienteExcluir != null) {
			rep.delete(clienteExcluir);
		}
	}
}
