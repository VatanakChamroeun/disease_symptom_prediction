// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TeamMemberScreen extends StatelessWidget {
  TeamMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          buildTitle(context),
          buildTeamMember(context),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Made with ☕ by Group 4'),
      ],
    );
  }

  Widget buildTeamMember(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(memberPictures![index]),
                ),
              ),
            ),
            Text(memberNames![index]),
          ],
        );
      }),
    );
  }

  List<String>? memberNames = ['Vatanak', 'Sophanon', 'Manuth', 'Sovichea'];

  List<String>? memberPictures = [
    'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
    'https://i0.wp.com/www.cssscript.com/wp-content/uploads/2020/12/Customizable-SVG-Avatar-Generator-In-JavaScript-Avataaars.js.png?fit=438%2C408&ssl=1',
    'https://img.ibxk.com.br/2017/12/26/26113640402098.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6DV--0QFWZYJ0vYl2vInKkgz6X8LCDeldzUi8WM3MnKQ837ov9guuSEiNP2xpgRqMR4I&usqp=CAU',
  ];
}
