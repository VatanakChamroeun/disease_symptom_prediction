import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({Key? key, this.title, this.controller}) : super(key: key);

  final String? title;
  final TextEditingController? controller;

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
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
                    child: TextField(
                      controller: widget.controller,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
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
