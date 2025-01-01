import 'package:flutter/material.dart';
import 'package:movieapp/presentation/Search/screens/search_view_model.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  static final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchViewModel(controller: _controller),
    );
  }
}
