import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:movieapp/features/search/presentation/screens/widgets/search_form_widget.dart';
import 'package:movieapp/features/search/presentation/screens/widgets/search_loaded_widget.dart';
import 'package:movieapp/features/search/presentation/screens/widgets/search_loading_widget.dart';

class SearchViewModel extends StatelessWidget {
  const SearchViewModel({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchFormWidget(controller: _controller),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  bloc: Get.find<SearchCubit>(),
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return SearchLoadingWidget();
                    } else if (state is Searcherror) {
                      GetSnacbars.ErrorSnackbar(state.message);
                    } else if (state is SearchLoaded) {
                      return SearchLoadedWidget(
                        gotMovies: state.movies,
                      );
                    }
                    return Container(
                      child: Image.asset(
                        "assets/images/Empty.png",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
