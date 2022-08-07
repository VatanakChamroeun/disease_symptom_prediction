import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

class DropdownInputWidget extends StatefulWidget {
  const DropdownInputWidget({Key? key, this.title, this.controller, this.dropdownData}) : super(key: key);

  final String? title;
  final DropdownEditingController<String>? controller;
  final List<String>? dropdownData;

  @override
  State<DropdownInputWidget> createState() => _DropdownInputWidgetState();
}

class _DropdownInputWidgetState extends State<DropdownInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: [
                  Text(widget.title!),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: widget.dropdownData!,
                      controller: widget.controller,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
