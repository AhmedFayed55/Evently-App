import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/di/di.dart';
import 'package:evently_app/core/re_useable_widgets/CustomButton.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/add_event/presentation/manager/add_avent_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/event_details.dart';
import '../../../../core/helpers/flutter_toast.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../providers/theme_provider.dart';
import '../../data/models/event.dart';
import '../widgets/choose_date_or_time.dart';
import '../widgets/choose_location_container.dart';
import '../widgets/event_categories_list_view.dart';
import '../widgets/event_image_widget.dart';
import '../widgets/title_and_description_fields.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> eventImagesDark = EventData.eventImages.keys.toList();
  final List<String> eventImagesLight = EventData.eventImages.values.toList();
  AddEventViewModel viewModel = injectAddEventViewModel();
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.createEvent.tr(),
          style: TextStyles.medium16Primary.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              EventImageWidget(
                eventImage:
                    provider.currentTheme == ThemeMode.light
                        ? eventImagesLight[selectedIndex]
                        : eventImagesDark[selectedIndex],
              ),
              EventCategoriesListView(
                onIndexChanged: (newIndex) {
                  setState(() {
                    selectedIndex = newIndex;
                  });
                },
              ),
              Form(
                key: formKey,
                child: TitleAndDescriptionFields(
                  titleController: titleController,
                  descriptionController: descriptionController,
                ),
              ),
              CustomDateOrTimeRow(
                chooseDate: chooseEventDate,
                chooseTime: chooseEventTime,
                dateText:
                    selectedDate != null
                        ? formatedDate!
                        : AppStrings.chooseDate,
                timeText:
                    selectedTime != null
                        ? formatedTime!
                        : AppStrings.chooseTime,
              ),
              ChooseLocationContainer(chooseLocation: () {}),
              CustomButton(
                title: AppStrings.addEvent.tr(),
                onPressed: addEvent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  DateTime? selectedDate;
  String? formatedDate;
  void chooseEventDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 370)),
      initialDate: selectedDate,
    );
    if (date != null) {
      selectedDate = date;
      // formatedDate = "${date.day}/${date.month}/${date.year}";
      formatedDate = DateFormat("dd/MM/yyyy").format(date);
      setState(() {});
    }
  }

  TimeOfDay? selectedTime;
  String? formatedTime;
  void chooseEventTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime == null ? TimeOfDay.now() : selectedTime!,
    );
    if (time != null) {
      selectedTime = time;
      setState(() {
        formatedTime =
            "${selectedTime!.hourOfPeriod}:${selectedTime!.minute} ${selectedTime!.period.name}";
      });
    }
  }

  void addEvent() async {
    if (formKey.currentState!.validate()) {
      if (selectedDate != null && selectedTime != null) {
        DateTime eventDate = DateTime(
            selectedDate!.year, selectedDate!.month, selectedDate!.day,
            selectedTime!.hour, selectedTime!.minute);
        viewModel.createEvent(Event(title: titleController.text,
            description: descriptionController.text,
            imagePath: eventImagesLight[selectedIndex],
            date: Timestamp.fromDate(eventDate),
            uId: FirebaseAuth.instance.currentUser!.uid,
            category: EventData.eventNames[selectedIndex]), context,
            selectedDate, selectedTime);
      } else {
        ToastMessage.toastMsg(
            AppStrings.pleaseEnterDateAndTime.tr(), Colors.red,
            AppColors.white);
      }
    }
  }
}
