import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/re_useable_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';

class TitleAndDescriptionFields extends StatelessWidget {
  const TitleAndDescriptionFields({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          AppStrings.title.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        CustomTextFormField(
          controller: titleController,
          validator: (val) {
            if (val == null || val.trim().isEmpty) {
              return AppStrings.thisFieldIsRequired.tr();
            }
            return null;
          },
          hintText: AppStrings.eventTitle.tr(),
          prefixIconImage: AppImages.titleSvg,
        ),
        Text(
          AppStrings.description.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 3,
          validator: (val) {
            if (val == null || val.trim().isEmpty) {
              return AppStrings.thisFieldIsRequired.tr();
            }
            return null;
          },
          controller: descriptionController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSecondary,
                width: 1.4,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.red, width: 1.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSecondary,
                width: 1.4,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSecondary,
                width: 1.4,
              ),
            ),
            hintStyle: Theme.of(context).textTheme.labelSmall,
            hintText: AppStrings.eventDescription.tr(),
          ),
        ),
      ],
    );
  }
}
