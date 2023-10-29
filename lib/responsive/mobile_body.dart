import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsivedashboard/bloc/get_by_breed_cubit.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/my_box.dart';
import 'package:responsivedashboard/util/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // first 4 boxes in grid
                  AspectRatio(
                    aspectRatio: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
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
                                  return const CircularProgressIndicator(
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

                  Expanded(
                      flex: 0,
                      child: BlocConsumer<GetByBreedCubit, GetByBreedState>(
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
                            return Column(
                              children: state.message.map((e) {
                                return MyTile(
                                  link: e,
                                );
                              }).toList(),
                            );
                          }
                        },
                      )),
                ],
              ),
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
