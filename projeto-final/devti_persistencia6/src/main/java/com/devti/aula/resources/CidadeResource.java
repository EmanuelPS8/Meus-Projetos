package com.devti.aula.resources;

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
import com.devti.aula.service.CidadeService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/cidade")
public class CidadeResource {
	
	@Autowired
	CidadeService service;
	
	@ApiOperation(value = "Exclui uma cidade do banco de dados")
	@DeleteMapping("/{id}")
	public void excluir(@PathVariable("id") int id) {
		service.excluir(id);
	}
	@ApiOperation(value = "Altera uma cidade do banco de dados")
	@PutMapping("/{id}")	
	public Cidade alterar(@RequestBody Cidade c, @PathVariable int id) {
		c.setId(id);
		return service.alterar(c);
	}
	@ApiOperation(value = "Insere uma cidade no banco de dados")
	@PostMapping
	public Cidade inserirCidade(@RequestBody Cidade c) {
		return service.incluir(c);
	}
	@ApiOperation(value = "LIsta todas as cidades do banco de dados")
	@GetMapping
	public java.util.List<Cidade> ListarTodas(){
		return service.listarTodas();
	}
	@ApiOperation(value = "Busca uma cidades por estado no banco de dados")
	@GetMapping("/buscauf/{uf}")
	public java.util.List<Cidade> buscarPorUf(@PathVariable("uf") String uf){
		return service.buscarPorUf(uf);
	}
	
	
}
