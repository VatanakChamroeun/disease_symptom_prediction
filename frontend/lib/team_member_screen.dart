// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TeamMemberScreen extends StatelessWidget {
  TeamMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      color: Colors.grey[200],
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
    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
  ];
}
