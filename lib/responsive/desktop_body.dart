import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';
import 'package:octo_image/octo_image.dart';
import 'package:responsivedashboard/ImgPage.dart';
import 'package:responsivedashboard/bloc/get_by_breed_cubit.dart';
import 'package:responsivedashboard/bloc/get_by_sub_breed_cubit.dart';
import '../constants.dart';
import '../util/my_box.dart';
import '../util/my_tile.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  late List<Data> value;
  @override
  void initState() {
    value = values(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocListener<GetByBreedCubit, GetByBreedState>(
                  listener: (context, state) {
                    if (state is GetByBreedError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.error),
                        backgroundColor: Color.fromRGBO(103, 0, 29, 1),
                      ));
                    } else if (state is GetByBreedLoaded) {
                      if (!state.list) {
                        imageDialog(context, state.currentlink, true);
                      }
                    } else {}
                  },
                  child: myDrawer,
                ),

                // first half of page
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // first 4 boxes in grid
                      AspectRatio(
                        aspectRatio: 4,
                        child: SizedBox(
                          width: double.infinity,
                          child: GridView.builder(
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (context, index) {
                              Data temp = value[index];

                              return MyBox(
                                data: temp,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: BlocBuilder<GetByBreedCubit, GetByBreedState>(
                          builder: (context, state) {
                            if (state.subBreed && state.list) {
                              return Text(
                                "List with Sub Breed",
                                style: drawerTextColor,
                              );
                            } else if (!state.subBreed && state.list) {
                              return Text(
                                "List with Breed",
                                style: drawerTextColor,
                              );
                            } else {
                              return Center();
                            }
                          },
                        ),
                      ),
                      // list of previous days
                      Expanded(
                          child: BlocConsumer<GetByBreedCubit, GetByBreedState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if (state is GetByBreedLoading && state.list) {
                            return CircularProgressIndicator(
                                color: const Color.fromRGBO(141, 16, 47, 0.4));
                          } else if (state.message.isEmpty) {
                            return Text(
                              "No List Data",
                              style: drawerTextColor,
                            );
                          } else {
                            return ListView.builder(
                              itemCount: state.message.length,
                              itemBuilder: (context, index) {
                                return MyTile(
                                  link: state.message[index],
                                );
                              },
                            );
                          }
                        },
                      )),
                    ],
                  ),
                ),
                // second half of page
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(context
                                      .watch<GetByBreedCubit>()
                                      .currentImage)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(255, 218, 219, 1),
                            ),
                          )),
                      // list of stuff
                      // Expanded(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         color: Colors.grey[200],
                      //       ),
                      //       child: BlocConsumer<GetBySubBreedCubit,
                      //           GetBySubBreedState>(
                      //         listener: (context, state) {
                      //           if (state is GetBySubBreedError) {
                      //             ScaffoldMessenger.of(context)
                      //                 .showSnackBar(SnackBar(
                      //               content: Text(state.error),
                      //               backgroundColor:
                      //                   Color.fromRGBO(103, 0, 29, 1),
                      //             ));
                      //           }
                      //         },
                      //         builder: (context, state) {
                      //           return Column(
                      //               children: state.allBreeds.entries.map((e) {
                      //             return Text(
                      //               e.key,
                      //               style: drawerTextColor,
                      //             );
                      //           }).toList());
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<GetByBreedCubit, GetByBreedState>(
            builder: (context, state) {
              if (state is GetByBreedLoading) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black38,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Center();
              }
            },
          )
        ],
      ),
    );
  }
}
