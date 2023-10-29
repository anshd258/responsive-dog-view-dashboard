import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsivedashboard/bloc/get_by_breed_cubit.dart';
import 'package:responsivedashboard/bloc/get_by_sub_breed_cubit.dart';
import 'package:responsivedashboard/responsive/desktop_body.dart';
import 'package:responsivedashboard/responsive/tablet_body.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'responsive/mobile_body.dart';
import 'responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GetByBreedCubit(),
      ),BlocProvider(
        create: (context) => GetBySubBreedCubit(),
      )
    ],
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          breakpoints: [
            const ResponsiveBreakpoint.resize(240, name: MOBILE),
            const ResponsiveBreakpoint.resize(650, name: TABLET),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.resize(2468, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: ResponsiveLayout(
          mobileBody: const MobileScaffold(),
          tabletBody: const TabletScaffold(),
          desktopBody: const DesktopScaffold(),
        ),
      ),
    );
  }
}
