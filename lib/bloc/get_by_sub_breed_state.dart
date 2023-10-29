part of 'get_by_sub_breed_cubit.dart';

@immutable
abstract class GetBySubBreedState {
  Map<String,dynamic> allBreeds;
  GetBySubBreedState({this.allBreeds= const {}});
}

class GetBySubBreedInitial extends GetBySubBreedState {}

class GetBySubBreedLoading extends GetBySubBreedState {}

class GetBySubBreedLoaded extends GetBySubBreedState {
  GetBySubBreedLoaded({super.allBreeds});
}

class GetBySubBreedError extends GetBySubBreedState {
  String error;
  GetBySubBreedError({required this.error});
}
