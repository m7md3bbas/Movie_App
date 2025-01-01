import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/mytextfield.dart';
import 'package:movieapp/presentation/Search/manager/cubit/search_cubit.dart';

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;
  final ishomeNavi = false;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      type: "Search",
      obscure: false,
      suffixIcon: BlocListener<SearchCubit, SearchState>(
        bloc: Get.find<SearchCubit>(),
        listener: (context, state) {},
        child: IconButton(
            onPressed: () {
              var cubit = Get.find<SearchCubit>();
              String? name = _controller.text.toLowerCase().trim();
              cubit.movieName(name: name);
              FocusScope.of(context).unfocus();
            },
            icon: Icon(Icons.search)),
      ),
      controller: _controller,
    );
  }
}
