import 'package:get/get.dart';
import 'package:movieapp/presentation/moviedetails/manager/cubit/moviedetails_cubit.dart';

class Moviedetails extends Bindings {
  @override
  void dependencies() {
    Get.put<MoviedetailsCubit>(
      MoviedetailsCubit(),
    );
  }
}
