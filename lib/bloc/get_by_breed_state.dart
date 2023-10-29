part of 'get_by_breed_cubit.dart';

@immutable
abstract class GetByBreedState {
  String currentlink;
  bool list;
  bool subBreed;
  List<String> message;
  GetByBreedState(
      {this.currentlink = '',
      this.message = const [],
      this.list = false,
      this.subBreed = false});
}

class GetByBreedInitial extends GetByBreedState {}

class GetByBreedLoading extends GetByBreedState {
  GetByBreedLoading(
      {super.currentlink,
      super.message,
      super.list,
      super.subBreed,
     });
}

class GetByBreedLoaded extends GetByBreedState {
  GetByBreedLoaded(
      {super.currentlink,
      super.message,
      super.list,
      super.subBreed,
      });
}

class GetByBreedError extends GetByBreedState {
  String error;
  GetByBreedError({required this.error});
}
