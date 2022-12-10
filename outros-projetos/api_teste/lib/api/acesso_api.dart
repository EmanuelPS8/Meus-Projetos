import 'dart:convert';

import 'package:api_teste/model/cidade.dart';
import 'package:api_teste/model/pessoa.dart';
import 'package:http/http.dart';

class AcessoApi {
  Future<List<Pessoa>> listaPessoa() async {
    String url = 'http://localhost:8080/cliente';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = jsonDecode(jsonFormatadoUtf8);
    List<Pessoa> pessoas = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

  Future<List<Cidade>> listaCidade() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = jsonDecode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<void> inserePessoa(Map<String, dynamic> pessoa) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: jsonEncode(pessoa));
  }
}
