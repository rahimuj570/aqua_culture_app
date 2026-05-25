import 'dart:io';

import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/custom_app_bar_widget.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_secondary.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/input_dropdown_form_field_widget.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/input_form_field_widget.dart';
import 'package:aqua_culture_app/features/farmer_role_features/units/view_models/create_unit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateUnitScreen extends StatefulWidget {
  const CreateUnitScreen({super.key});

  @override
  State<CreateUnitScreen> createState() => _CreateUnitScreenState();
}

class _CreateUnitScreenState extends State<CreateUnitScreen> {
  TextEditingController unitNameTEC = TextEditingController();
  TextEditingController speciesTEC = TextEditingController();
  TextEditingController totalCostTEC = TextEditingController();
  TextEditingController targetWeightTEC = TextEditingController();
  TextEditingController areaTEC = TextEditingController();
  TextEditingController depthTEC = TextEditingController();
  TextEditingController livestockCountTEC = TextEditingController();
  TextEditingController livestockAvgWeightTEC = TextEditingController();
  TextEditingController stockDateTEC = TextEditingController();
  TextEditingController targetHarvestTEC = TextEditingController();
  TextEditingController siteLocationTEC = TextEditingController();

  @override
  void dispose() {
    unitNameTEC.dispose();
    speciesTEC.dispose();
    totalCostTEC.dispose();
    targetWeightTEC.dispose();
    areaTEC.dispose();
    depthTEC.dispose();
    livestockCountTEC.dispose();
    livestockAvgWeightTEC.dispose();
    stockDateTEC.dispose();
    targetHarvestTEC.dispose();
    siteLocationTEC.dispose();
    super.dispose();
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Stock date is required';
    }

    try {
      DateFormat('MM/dd/yyyy').parseStrict(value);
    } catch (_) {
      return 'Invalid date';
    }

    return null;
  }

  XFile? image;
  void pickImage({required bool isCamera}) async {
    final picker = ImagePicker();
    if (isCamera) {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    print(image?.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Create Unit', showTrailing: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Consumer<CreateUnitProvider>(
            builder: (context, provider, child) => Column(
              children: [
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(16.0.r),
                          child: Row(
                            children: [
                              Expanded(
                                child: filledButtonPrimary(
                                  title: 'Take Photo',
                                  onTap: () {
                                    pickImage(isCamera: true);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: filledButtonSecondary(
                                  title: 'Pick from Gallery',
                                  onTap: () {
                                    pickImage(isCamera: false);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 170.h,
                    width: .maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(image != null ? 0 : 40.0.r),
                      child: image == null
                          ? Column(
                              children: [
                                Icon(
                                  MdiIcons.fileImagePlus,
                                  size: 50.r,
                                  color: AppColors.secondaryThemeColor,
                                ),
                                SizedBox(height: 16.7.h),
                                Text(
                                  'Upload Unit Photo',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w600,
                                    color: AppColors.secondaryThemeColor,
                                  ),
                                ),
                              ],
                            )
                          : Image.file(File(image!.path), fit: BoxFit.contain),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                inputDropdownFormFieldWidget(
                  title: 'Unit Type',
                  isRequired: true,
                  hintText: 'Select a unit type',
                  inputValidator: (p0) =>
                      p0 == null || p0.isEmpty ? 'Unit type is required' : null,
                  items: ['Pond', 'Cage', 'Tank', 'Fish Pen'],
                  onChanged: (value) {
                    provider.setUnitType = value;
                  },
                ),

                Row(
                  children: [
                    Expanded(
                      child: inputDropdownFormFieldWidget(
                        title: provider.unitType != 'Cage'
                            ? 'Pond lining'
                            : 'Cage Material',
                        isRequired: true,
                        hintText: 'Select a unit type',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Unit type is required'
                            : null,
                        items: provider.unitType == 'Cage'
                            ? [
                                'HDPE Net',
                                'Bamboo Frame',
                                'GI Pipe Frame',
                                'Floating HDPE',
                              ]
                            : [
                                'None(earthen)',
                                'Partial PE liner',
                                'Full PE liner',
                                'Concrete',
                              ],
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: inputDropdownFormFieldWidget(
                        title: 'Status',
                        isRequired: true,
                        hintText: 'Select status',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Status is required'
                            : null,
                        items: ['Active', 'Harvested'],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                inputFormFieldWidget(
                  title: 'Unit Name',
                  isRequired: true,
                  hintText: 'e.g., Pond A-1',
                  inputValidator: (p0) =>
                      p0 == null || p0.isEmpty ? 'Unit name is required' : null,
                  controller: unitNameTEC,
                ),

                inputFormFieldWidget(
                  title: 'Species',
                  isRequired: true,
                  hintText: 'e.g., Tilapia',
                  inputValidator: (p0) => p0 == null || p0.isEmpty
                      ? 'Species name is required'
                      : null,
                  controller: speciesTEC,
                ),

                Row(
                  children: [
                    Expanded(
                      child: inputFormFieldWidget(
                        keyboardType: TextInputType.number,
                        title: 'Total cost',
                        isRequired: true,
                        hintText: 'e.g., 500',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Total cost is required'
                            : null,
                        controller: totalCostTEC,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: inputFormFieldWidget(
                        keyboardType: TextInputType.number,
                        title: 'Target weight',
                        isRequired: true,
                        hintText: 'e.g., 1.5',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Target weight is required'
                            : null,
                        controller: targetWeightTEC,
                      ),
                    ),
                  ],
                ),
                provider.unitType != 'Cage'
                    ? Row(
                        children: [
                          Expanded(
                            child: inputFormFieldWidget(
                              keyboardType: TextInputType.number,
                              title: 'Area (meter²)',
                              isRequired: true,
                              hintText: 'e.g., 500',
                              inputValidator: (p0) => p0 == null || p0.isEmpty
                                  ? 'Area is required'
                                  : null,
                              controller: areaTEC,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: inputFormFieldWidget(
                              keyboardType: TextInputType.number,
                              title: 'Depth (meters)',
                              isRequired: true,
                              hintText: 'e.g., 1.5',
                              inputValidator: (p0) => p0 == null || p0.isEmpty
                                  ? 'Depth is required'
                                  : null,
                              controller: depthTEC,
                            ),
                          ),
                        ],
                      )
                    : inputFormFieldWidget(
                        keyboardType: TextInputType.number,
                        title: 'Area (meter²)',
                        isRequired: true,
                        hintText: 'e.g., 500',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Area is required'
                            : null,
                        controller: areaTEC,
                      ),
                Row(
                  children: [
                    Expanded(
                      child: inputFormFieldWidget(
                        keyboardType: TextInputType.number,
                        title: 'Livestock Count',
                        isRequired: true,
                        hintText: 'e.g., 500',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Stock count is required'
                            : null,
                        controller: livestockAvgWeightTEC,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: inputFormFieldWidget(
                        keyboardType: TextInputType.number,
                        title: 'Current Avg Weight',
                        isRequired: true,
                        hintText: 'e.g., 1.5',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Avg weight is required'
                            : null,
                        controller: unitNameTEC,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: inputFormFieldWidget(
                        keyboardType: TextInputType.datetime,
                        title: 'Stock Date',
                        isRequired: true,
                        hintText: '05/19/2026',
                        inputValidator: (p0) => validateDate(p0),
                        controller: stockDateTEC,
                        suffixIcon: Icons.calendar_month_rounded,
                        onSuffixTap: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365 * 5),
                            ),
                            initialDate: DateTime.now(),
                          ).then((value) {
                            if (value != null) {
                              stockDateTEC.text = DateFormat(
                                'MM/dd/yyyy',
                              ).format(value);
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: inputFormFieldWidget(
                        keyboardType: TextInputType.number,
                        title: 'Target Harvest Date',
                        isRequired: false,
                        hintText: '05/19/2026',
                        inputValidator: (p0) => validateDate(p0),
                        controller: targetHarvestTEC,
                        suffixIcon: Icons.calendar_month_rounded,
                        onSuffixTap: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365 * 5),
                            ),
                            initialDate: DateTime.now(),
                          ).then((value) {
                            if (value != null) {
                              targetHarvestTEC.text = DateFormat(
                                'MM/dd/yyyy',
                              ).format(value);
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                inputFormFieldWidget(
                  title: 'Site Location',
                  isRequired: true,
                  hintText: '43 A, Mohakhali, Dhaka',
                  inputValidator: (p0) => null,
                  controller: siteLocationTEC,
                  suffixIcon: MdiIcons.mapLegend,
                  onSuffixTap: () {},
                ),
                SizedBox(height: 16.h),
                filledButtonPrimary(title: 'Add Unit', onTap: () {}),
                SizedBox(height: 16.h),
                filledButtonSecondary(
                  title: 'Cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
