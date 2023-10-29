import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:responsivedashboard/bloc/get_by_breed_cubit.dart';

part 'get_by_sub_breed_state.dart';

class GetBySubBreedCubit extends Cubit<GetBySubBreedState> {
  GetBySubBreedCubit() : super(GetBySubBreedInitial());
   void getAllBreads() async {
    String url = "https://dog.ceo/api/breeds/list/all";
    print("called");
    try {
      emit(GetBySubBreedLoading());
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        emit(GetBySubBreedLoaded(allBreeds: json.decode(res['message'])));
      } else {
        var res = json.decode(response.body);
        throw Exception(res['message']);
      }
    } catch (e) {
      print(e.toString());
      emit(
        GetBySubBreedError(
          error: e.toString(),
        ),
      );
    }
  }
}
