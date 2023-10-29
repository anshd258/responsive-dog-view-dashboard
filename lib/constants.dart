import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:octo_image/octo_image.dart';
import 'package:responsivedashboard/bloc/get_by_breed_cubit.dart';

var defaultBackgroundColor = Color.fromRGBO(255, 178, 184, 1);
var appBarColor = Color.fromRGBO(103, 0, 29, 1);

var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text(' '),
  centerTitle: false,
);
var drawerTextColor = GoogleFonts.inter(
  fontSize: 20,
  color: const Color.fromRGBO(64, 0, 15, 1),
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: Color.fromRGBO(255, 218, 219, 1),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  elevation: 5,
  child: Column(
    children: [
      DrawerHeader(
        child: Icon(
          Icons.pets_rounded,
          size: 64,
          color: const Color.fromRGBO(141, 16, 47, 1),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.home, color: const Color.fromRGBO(64, 0, 15, 1)),
          title: Text(
            'D A S H B O A R D',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(
            Icons.settings,
            color: const Color.fromRGBO(64, 0, 15, 1),
          ),
          title: Text(
            'S E T T I N G S',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(
            Icons.info,
            color: const Color.fromRGBO(64, 0, 15, 1),
          ),
          title: Text(
            'A B O U T',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(
            Icons.logout,
            color: const Color.fromRGBO(64, 0, 15, 1),
          ),
          title: Text(
            'L O G O U T',
            style: drawerTextColor,
          ),
        ),
      ),
    ],
  ),
);

class Data {
  LineIcon icon;
  String title;
  bool subBreed;
  Function function;
  Data(
      {required this.icon,
      required this.title,
      this.subBreed = false,
      required this.function});
}

List<Data> values(BuildContext context) {
  return [
    Data(
        function: (String breed) {
          context.read<GetByBreedCubit>().getByBreed(breed);
        },
        icon: LineIcon.dice(color: const Color.fromRGBO(64, 0, 15, 1)),
        title: "Get a random image of dog by breed"),
    Data(
        function: (String breed) {
          context.read<GetByBreedCubit>().getByBreedAndList(breed);
        },
        icon: LineIcon.list(color: const Color.fromRGBO(64, 0, 15, 1)),
        title: "Get a list of image of dog by breed"),
    Data(
        function: (String breed, String subBreed) {
          context
              .read<GetByBreedCubit>()
              .getByBreedAndSubBreed(breed, subBreed);
        },
        subBreed: true,
        icon: LineIcon.diceD20(color: const Color.fromRGBO(64, 0, 15, 1)),
        title: "Get a random image of dog by breed and sub breed"),
    Data(
        function: (String breed, String subBreed) {
          context
              .read<GetByBreedCubit>()
              .getByBreedAndListAndSubBreed(breed, subBreed);
        },
        icon: LineIcon.listUl(color: const Color.fromRGBO(64, 0, 15, 1)),
        subBreed: true,
        title: "Get a list of image of dog by breed and sub breed")
  ];
}

Future<dynamic> imageDialog(BuildContext context, String currentlink, bool barrier) {
    return showDialog(
                    context: context,
                    barrierColor: const Color.fromRGBO(141, 16, 47, 0.4),
                    barrierDismissible: barrier,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: Container(
                            height: 500,
                            width: 350,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: OctoImage(
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.error,
                                  color: const Color.fromRGBO(141, 16, 47, 1),
                                ),
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  currentlink,
                                ),
                                progressIndicatorBuilder:
                                    (context, progress) {
                                  return CircularProgressIndicator(
                                      color: const Color.fromRGBO(
                                          141, 16, 47, 0.4));
                                },
                              ),
                            ),
                          ));
                    },
                  );
  }

