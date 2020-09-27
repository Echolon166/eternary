import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:eternary/utils/constants.dart' as Constants;
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MarkdownTextInput(
              (String value) => viewModel.updateNewEntryText(value),
              _entryController.text,
              label: Constants.entryLabelText,
              maxLines: 6,
            ),
          ],
        );
      },
    );
  }
}
