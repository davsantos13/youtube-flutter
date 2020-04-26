class Video {

  String id;
  String titulo;
  String urlImagem;
  String canal;
  String descricao;

  Video({this.id, this.titulo, this.urlImagem, this.canal, this.descricao});

  /*static convertJson(Map<String, dynamic> json){
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      urlImagem: json['thumbnails']['high']['url'],
      canal: json['snippet']['channelId']
    );
  }*/
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      descricao: json['snippet']['description'],
      urlImagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelTitle']
    );
  }

}