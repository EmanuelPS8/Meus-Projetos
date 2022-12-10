import 'dart:convert';

import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/model/pessoa.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AcessoApi {
  Future<List<Pessoa>> listaPessoas() async {
    String url = 'http://localhost:8080/cliente';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUft8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUft8);
    List<Pessoa> pessoas = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

  Future<List<Cidade>> listaCidades() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUft8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUft8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<void> inserePessoa(Map<String, dynamic> pessoa) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: json.encode(pessoa));
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<void> deletePessoa(int id) async {
    String url = "http://localhost:8080/cliente/$id";
    await delete(Uri.parse(url));
  }

  Future<void> deleteCidade(int id) async {
    String url = "http://localhost:8080/cidade/$id";
    await delete(Uri.parse(url));
  }

  Future<void> alteraCliente(Map<String, dynamic> cliente, int id) async {
    String url = 'http://localhost:8080/cliente/$id';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse(url), headers: headers, body: json.encode(cliente));
  }

  Future<void> alteraCidade(Map<String, dynamic> cidade, int id) async {
    String url = 'http://localhost:8080/cidade/$id';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<List<Cidade>> cidadePorUf(String uf) async {
    String url = 'http://localhost:8080/cidade/buscauf/$uf';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUft8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUft8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<List<Pessoa>> buscaPessoaFiltro(int cidade) async {
    String url = 'http://localhost:8080/cliente/buscacidade/$cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUft8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUft8);
    List<Pessoa> pessoas = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

  // Future<List<Cidade>> cidadePorUf(String uf) async {
  //   final Response =
  //       await http.get(Uri.parse("http://localhost:8080/cidade/buscauf/$uf"));
  //   return cidadePorUf(uf);
  // }
}
