class CarroModel {
  int? id;
  String? nome;
  String? tipo;
  String? descricao;
  String? urlFoto;
  String? urlVideo;
  String? latitude;
  String? longitude;

  CarroModel(
      {this.id,
      this.nome,
      this.tipo,
      this.descricao,
      this.urlFoto,
      this.urlVideo,
      this.latitude,
      this.longitude});

  CarroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    descricao = json['descricao'];
    urlFoto = json['urlFoto'];
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  CarroModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    tipo = map['tipo'];
    descricao = map['descricao'];
    urlFoto = map['urlFoto'];
    urlVideo = map['urlVideo'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto;
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
