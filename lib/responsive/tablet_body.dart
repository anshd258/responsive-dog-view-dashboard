import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsivedashboard/bloc/get_by_breed_cubit.dart';
import 'package:responsivedashboard/constants.dart';
import '../util/my_box.dart';
import '../util/my_tile.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
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
      drawer: myDrawer,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                        if (temp.subBreed) {
                          return MyBox(
                            data: temp,
                          );
                        } else {
                          return BlocBuilder<GetByBreedCubit, GetByBreedState>(
                            builder: (context, state) {
                              if (state is GetByBreedLoading) {
                                return CircularProgressIndicator(
                                  color: Color.fromRGBO(103, 0, 29, 1),
                                );
                              }
                              return MyBox(
                                data: temp,
                              );
                            },
                          );
                        }
                      },
                    ),
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
