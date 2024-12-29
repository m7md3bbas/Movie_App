import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/functions/drop_down_items.dart';
import 'package:movieapp/features/home/presentation/manager/cubit/genric_cubit.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenricCubit, GenricState>(
      bloc: Get.find<GenricCubit>(),
      listener: (context, state) {},
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField2<String>(
          iconStyleData: const IconStyleData(
            iconDisabledColor: Colors.amberAccent,
            iconEnabledColor: Colors.amberAccent,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200, // Dropdown height
            offset: const Offset(0, 0), // Offset for dropdown
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          decoration: InputDecoration(
            labelText: "Select Genre",
            labelStyle: TextStyle(color: Colors.amberAccent),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.amberAccent,
              ),
            ),
          ),
          hint: const Text(
            'Select Genre',
            style: TextStyle(fontSize: 16, color: Colors.amberAccent),
          ),
          value: 'All',
          style: const TextStyle(color: Colors.amberAccent),
          items: DropDownItems.dropdownitems,
          onChanged: (value) {
            if (value != null) {
              Get.find<GenricCubit>().genresMovies(genres: value);
            }
          },
          barrierDismissible: true,
        ),
      ),
    );
  }
}
