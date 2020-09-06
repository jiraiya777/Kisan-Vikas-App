 import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoPlayer{
YoutubePlayerController myController;
String url;
String description;
String title;
VideoPlayer({ this.title , this.description , this.url});
}


class VideoList {
  String url;
  String description;
  int likes;
  int dislikes;
  int reports;
  String title;

  VideoList(String url, String description , String title , int likes , int dislikes , int reports) {
    this.url = url;
    this.description = description;
    this.title = title;
    this.likes = likes;
    this.dislikes = dislikes;
    this.reports = reports;

    }

} 