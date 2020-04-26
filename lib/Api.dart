import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';


const CHAVE_YOUTUBE_API = 'AIzaSyAT-ezsMz5s8ikDBUR2hbtX9Bu7H9_KkRs';
const CANAL_ID = 'UCVHFbqXqoYvEWM1Ddxl0QDg';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  
  Future<List<Video>> pesquisar(String pesquisa) async{
    http.Response response = await http.get(
      URL_BASE + 'search'
      '?part=snippet'
      '&type=video'
      '&maxResults=20'
      '&order=date'
      '&key=$CHAVE_YOUTUBE_API'
      '&channelId=$CANAL_ID'
      '&q=$pesquisa'
    );

    if(response.statusCode == 200){


      Map<String, dynamic> data = json.decode(response.body);

      List<Video> videos = data['items'].map<Video>(
        (datas){
          return Video.fromJson(datas);
      }).toList();
      
      return videos;     
    } else {

    }
  }
}