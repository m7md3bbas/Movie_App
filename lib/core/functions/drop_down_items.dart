import 'package:flutter/material.dart';

class DropDownItems {
  
 static List<DropdownMenuItem<String>> get dropdownitems {
    return [
                        DropdownMenuItem(value: 'All', child: Text("All")),
                        DropdownMenuItem(
                            value: 'Action', child: Text("Action")),
                        DropdownMenuItem(
                            value: 'Comedy', child: Text("Comedy")),
                        DropdownMenuItem(
                            value: 'Drama', child: Text("Drama")),
                        DropdownMenuItem(
                            value: 'Horror', child: Text("Horror")),
                        DropdownMenuItem(
                            value: 'Thriller', child: Text("Thriller")),
                        DropdownMenuItem(
                            value: 'Sci-Fi', child: Text("Sci-Fi")),
                        DropdownMenuItem(
                            value: 'Romance', child: Text("Romance")),
                        DropdownMenuItem(
                            value: 'Family', child: Text("Family")),
                        DropdownMenuItem(
                            value: 'Fantasy', child: Text("Fantasy")),
                        DropdownMenuItem(
                            value: 'Animation', child: Text("Animation")),
                        DropdownMenuItem(
                            value: 'Documentary', child: Text("Documentary")),
                        DropdownMenuItem(
                            value: 'Crime', child: Text("Crime")),
                      ];
  }
}

