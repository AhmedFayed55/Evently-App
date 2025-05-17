import 'package:flutter/material.dart';

class EventImageWidget extends StatelessWidget {
  const EventImageWidget({super.key, required this.eventImage});

  final String eventImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(eventImage),
    );
  }
}
