import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/api/areaService.dart';
import 'package:mobile/api/model/area/Action.dart' as areaLib;
import 'package:mobile/api/model/area/Area.dart';
import 'package:mobile/api/model/area/Parameter.dart';
import 'package:mobile/api/model/area/ParameterType.dart';
import 'package:mobile/api/model/area/Reaction.dart';
import 'package:mobile/api/model/createAreaRequest.dart';
import 'package:mobile/page/color_list.dart';
import 'create_ifttt.dart';

class edit_ifttt extends StatelessWidget {
  late areaService api;

  edit_ifttt(this.api, {Key? key}) : super(key: key);

  createAreaRequest getArea(String id) {
    for (var it in api.token!.areas) {
      if (it.id == id) {
        return it;
      }
    }
    throw "Invalid areas id";
  }

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments as String;
    createAreaRequest area = getArea(args);

    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildTopPage(context),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 100.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              api.deleteIfttt(args).then((value) => {
                                if (value) {
                                  Navigator.of(context).pushNamed('/List')
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: color_list.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: color_list.third,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO FILL THIS WHEN PAGE WAS BUILD
                              areaLib.Action actionBuild = areaLib.Action(
                                  "",
                                  [
                                    Parameter("", ParameterType.TEXT)
                                  ]
                              );
                              Reaction reactionBuild = Reaction(
                                  "",
                                  [
                                    Parameter("", ParameterType.TEXT)
                                  ]
                              );

                              api.updateIfttt(area.id, Area(area.id, api.token!.token, actionBuild, reactionBuild));
                              Navigator.of(context).pushNamed('/List');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: color_list.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: color_list.third,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]
            )
        ),
      ),
    );
  }

  Widget buildTopPage(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'Edit IFTTT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color_list.fourth,
                        fontSize: 50
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                        Icons.close,
                        size: 40.0
                    ),
                    tooltip: 'Close page',
                    onPressed: () {
                      callbackClose(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ]
    );
  }
}