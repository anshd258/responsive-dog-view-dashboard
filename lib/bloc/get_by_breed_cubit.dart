import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:responsivedashboard/API.dart';
import 'package:http/http.dart' as http;
part 'get_by_breed_state.dart';

class GetByBreedCubit extends Cubit<GetByBreedState> {
  GetByBreedCubit() : super(GetByBreedInitial());

  String currentImage = "";

  void getByBreed(String breed) async {
    print("called");
    String url = "${baseUrl + breed}/images/random";
    try {
      emit(GetByBreedLoading());
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("got the response");
        currentImage = res['message'];
        emit(GetByBreedLoaded(
          currentlink: res['message'],
        ));
      } else {
        var res = json.decode(response.body);
        throw Exception(res['message']);
      }
    } catch (e) {
      print(e.toString());
      emit(
        GetByBreedError(
          error: e.toString(),
        ),
      );
    }
  }

  void getByBreedAndList(
    String breed,
  ) async {
    String url = "https://dog.ceo/api/breed/$breed/images";
    print("called");
    try {
      emit(GetByBreedLoading(list: true, subBreed: false));
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        emit(GetByBreedLoaded(
            message: res['message'].cast<String>(),
            list: state.list,
            subBreed: state.subBreed));
      } else {
        var res = json.decode(response.body);
        throw Exception(res['message']);
      }
    } catch (e) {
      print(e.toString());
      emit(
        GetByBreedError(
          error: e.toString(),
        ),
      );
    }
  }

  void getByBreedAndSubBreed(String breed, String subBreed) async {
    String url = "${baseUrl + breed}/$subBreed/images/random";
    print("called");
    try {
      emit(GetByBreedLoading(list: false, subBreed: true));
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        currentImage = res['message'];
        emit(GetByBreedLoaded(
            currentlink: res['message'],
            list: state.list,
            subBreed: state.subBreed));
      } else {
        var res = json.decode(response.body);
        throw Exception(res['message']);
      }
    } catch (e) {
      print(e.toString());
      emit(
        GetByBreedError(
          error: e.toString(),
        ),
      );
    }
  }

  void getByBreedAndListAndSubBreed(String breed, String subBreed) async {
    String url = "https://dog.ceo/api/breed/$breed/$subBreed/images";
    print("called");
    try {
      emit(GetByBreedLoading(list: true, subBreed: true));
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        emit(GetByBreedLoaded(
            message: res['message'].cast<String>(),
            list: state.list,
            subBreed: state.subBreed));
      } else {
        var res = json.decode(response.body);
        throw Exception(res['message']);
      }
    } catch (e) {
      print(e.toString());
      emit(
        GetByBreedError(
          error: e.toString(),
        ),
      );
    }
  }

 
}
