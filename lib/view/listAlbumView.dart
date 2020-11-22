import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izone_app/controller/stateController.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ListAlbumView extends StatelessWidget {
  ListAlbumView();

  final ListAlbumController _stateController = ListAlbumController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Obx(() {
            if (_stateController.listAlbum.length > 0 &&
                _stateController.mapAlbums.isNotEmpty) {
              return ListView.builder(
                itemCount: _stateController.listAlbum.length,
                itemBuilder: (context, index) => Card(
                  child: ExpandablePanel(
                    header: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        _stateController.listAlbum[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    expanded: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _stateController
                          .mapAlbums[_stateController.listAlbum[index]].length,
                      itemBuilder: (context, indexx) => Card(
                        child: ListTile(
                          leading: Icon(Icons.music_note),
                          title: Text(_stateController
                              .mapAlbums[_stateController.listAlbum[index]]
                                  [indexx]
                              .name),
                          onTap: () {
                            YoutubePlayerController ytbController =
                                YoutubePlayerController(
                              initialVideoId: _stateController
                                  .mapAlbums[_stateController.listAlbum[index]]
                                      [indexx]
                                  .ytbID,
                              flags: YoutubePlayerFlags(),
                            );
                            _showYtbPopup(context, ytbController);
                          },
                        ),
                      ),
                    ),
                    theme: ExpandableThemeData(
                      tapHeaderToExpand: true,
                      hasIcon: true,
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ],
    );
  }

  void _showYtbPopup(
      BuildContext context, YoutubePlayerController ytbController) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          child: YoutubePlayer(
            controller: ytbController,
            showVideoProgressIndicator: true,
          ),
        ),
      ),
    );
  }
}
