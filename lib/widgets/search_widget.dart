import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        hintText: "Iniciar búsqueda",
        hintStyle:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(1), fontSize: 16),
        filled: true,
        fillColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.32),
        prefixIcon: Icon(
          Icons.search,
          color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.85),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none), 
      ),
    );
  }
}
