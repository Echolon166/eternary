import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class EntryInputForm extends HookViewModelWidget<HomeViewModel> {
  const EntryInputForm({Key key})
      : super(
          key: key,
          reactive: false,
        );

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    var _entryController = useTextEditingController();

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return TextField(
          maxLines: 8,
          decoration: InputDecoration(
            hintText: Constants.entryHintText,
            labelText: Constants.entryLabelText,
            hintStyle: smallDescriptionTextStyle(
              deviceScreenType: sizingInformation.deviceScreenType,
            ),
            labelStyle: smallDescriptionTextStyle(
              deviceScreenType: sizingInformation.deviceScreenType,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Color(0xFFC4C4C4),
              ),
            ),
          ),
          controller: _entryController,
          onChanged: viewModel.updateNewEntry,
          textAlign: TextAlign.justify,
        );
      },
    );
  }
}
