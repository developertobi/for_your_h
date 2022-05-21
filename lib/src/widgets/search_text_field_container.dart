import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final double borderRadius;
  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool isSearch;

  const SearchTextField({
    Key? key,
    this.borderRadius = 50,
    this.hintText,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.isSearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        isDense: true,
        fillColor: const Color(0xffF6F6F6),
        filled: true,
        suffixIcon: const Icon(
          Icons.search_outlined,
          size: 17,
          color: Color(0xff484444),
        ),
        contentPadding: const EdgeInsets.all(16),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
