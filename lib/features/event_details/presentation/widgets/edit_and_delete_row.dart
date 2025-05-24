import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_images.dart';

class EditAndDeleteRow extends StatelessWidget {
  const EditAndDeleteRow({super.key, required this.edit, required this.delete});

  final void Function() edit;
  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: edit,
          icon: SvgPicture.asset(AppImages.editIconSvg),
        ),
        IconButton(
          onPressed: delete,
          icon: SvgPicture.asset(AppImages.deleteIconSvg),
        ),
      ],
    );
  }
}
