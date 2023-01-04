import 'package:flutter/material.dart';

class Sound {
  final int id, duration;
  final String title, artist, sound, image;

  Sound({
    @required this.id,
    @required this.title,
    @required this.artist,
    @required this.sound,
    @required this.image,
    @required this.duration,
  });

}

List<Sound> demoSounds = [
  Sound(
      id: 1,
      title: "Sleep",
      artist: "Scott Buckley",
      sound: "https://valentincourcoux.fr/app/antide/ScottBuckley-Sleep.mp3",
      image: "https://valentincourcoux.fr/app/antide/landscape_3.jpg",
      duration: 3,
  ),
  Sound(
    id: 2,
    title: "Maree",
    artist: "Kai Engel",
    sound: "https://valentincourcoux.fr/app/antide/KaiEngel-Maree.mp3",
    image: "https://valentincourcoux.fr/app/antide/landscape_2.jpg",
    duration: 3,
  ),
  Sound(
    id: 3,
    title: "Naya",
    artist: "Ha Tom",
    sound: "https://valentincourcoux.fr/app/antide/HaTom-Naya.mp3",
    image: "https://valentincourcoux.fr/app/antide/landscape_4.jpg",
    duration: 4,
  ),
  Sound(
    id: 4,
    title: "Shine",
    artist: "Onycs",
    sound: "https://valentincourcoux.fr/app/antide/Onycs-Shine.mp3",
    image: "https://valentincourcoux.fr/app/antide/landscape_5.jpg",
    duration: 5,
  ),

];

