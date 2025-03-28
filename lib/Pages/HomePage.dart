import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundoji/Components/CategoryList.dart';
import 'package:soundoji/Components/SoundojiLogo.dart';
import 'package:soundoji/Constants/UIColors.dart';
import 'package:soundoji/Models/SoundojiObj.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer audioPlayer = AudioPlayer();

  late List<SoundojiObj> funList;
  late List<SoundojiObj> animalList;
  late List<SoundojiObj> vehiclesList;
  late List<SoundojiObj> cenkErdemList;
  late final UIColors _colors;

  Future<void> play(int index, String category) async {
    String soundPath;
    switch (category) {
      case 'Funny':
        soundPath = funList[index].soundPath;
        break;
      case 'Animals':
        soundPath = animalList[index].soundPath;
        break;
      case 'Vehicles':
        soundPath = vehiclesList[index].soundPath;
        break;
      case 'CenkErdem':
        soundPath = cenkErdemList[index].soundPath;
        break;
      default:
        return;
    }
    await audioPlayer.play(AssetSource(soundPath));
  }

  List<SoundojiObj> filterByCategory(String category) {
    return SoundojiObj.soundojis
        .where((element) => element.category == category)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    funList = filterByCategory('Funny');
    animalList = filterByCategory('Animals');
    vehiclesList = filterByCategory('Vehicles');
    cenkErdemList = filterByCategory('CenkErdem');
    _colors = UIColors();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: _colors.uiYellow,
        child: Column(
          children: [
            Flexible(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    color: _colors.defaultWhite,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xfff6f6f6),
                          blurRadius: 0,
                          offset: Offset(0, 5)),
                    ]),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0,
                  color: _colors.defaultWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListView(
                      children: [
                        CategoryList(
                          title: 'Animals',
                          list: animalList,
                          playSound: play,
                        ),
                        CategoryList(
                          title: 'Vehicles',
                          list: vehiclesList,
                          playSound: play,
                        ),
                        CategoryList(
                          title: 'Funny',
                          list: funList,
                          playSound: play,
                        ),
                        CategoryList(
                          title: 'CenkErdem',
                          list: cenkErdemList,
                          playSound: play,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          flex: 2,
                          child: SoundojiLogo(
                            key: Key('soundoji_logo'),
                            colors: _colors,
                            width: 80,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                          flex: 4,
                          child: FittedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome to Soundoji',
                                    style: TextStyle(
                                        color: _colors.defaultWhite,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 26),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Tap emojis after making sure the volume is on!',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: _colors.defaultWhite,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
