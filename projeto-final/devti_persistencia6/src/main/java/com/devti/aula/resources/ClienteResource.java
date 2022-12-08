package com.devti.aula.resources;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.devti.aula.model.Cidade;
import com.devti.aula.model.Cliente;
import com.devti.aula.repositories.ClienteRepository;
import com.devti.aula.service.ClienteService;
import com.google.common.net.MediaType;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/cliente")
public class ClienteResource {
	
	
	@Autowired
	ClienteService service;
	
	@ApiOperation(value = "Exclui um cliente do banco de dados")
	@DeleteMapping("/{id}")
	public void excluirCliente(@PathVariable("id") int id) {
		service.excluir(id);
	}
	@ApiOperation(value = "Altera um cliente do banco de dados")
	@PutMapping("/{id}")
	public Cliente alterarCliente(@RequestBody Cliente c, @PathVariable int id) {
		c.setId(id);
		return service.alterar(c);
		
	}
	@ApiOperation(value = "Insere um cliente no banco de dados")
	@PostMapping
	public Cliente inserirCliente(@RequestBody Cliente c) {
		return service.incluir(c);
	}
	@ApiOperation(value = "LIsta todos os clientes do banco de dados")
	@GetMapping
	public List<Cliente> listarTodos(){
		return service.listarTodos();
	}
	@ApiOperation(value = "Busca clientes por seus id's no banco de dados")
	@GetMapping("/buscaid/{id}")
	public List<Cliente> buscarPorId(@PathVariable("id") int id){
		return service.buscarPorId(id);
	}
	
	@ApiOperation(value = "Busca clientes por cidade no banco de dados")
	@GetMapping("/buscacidade/{cidade}")
	public List<Cliente> buscaClientePorCidade(@PathVariable("cidade") Cidade cidade){
		return service.buscaPorCidade(cidade);
	}
	
	
//	@GetMapping("/buscaletra/{letra}")
//	public List<Cliente> buscarPorPrimeiraLetra(@PathVariable("letra") String letra){
//		return service.buscarPorPrimeiraLetra(letra);
//	}
//	
//	@GetMapping("/buscaidademenorque/{idade}")
//	public List<Cliente> buscarPorIdadeMenorQue(@PathVariable("idade") int idade){
//		return service.buscarPorIdadeMenorQue(idade);
//	}
//	
//	@GetMapping("/buscaidadeentre/{idade}/{idade}")
//	public List<Cliente> buscarIdadeEntre(@PathVariable("idade") int idade){
//		return service.buscarIdadeEntre(idade);
//	}


}
