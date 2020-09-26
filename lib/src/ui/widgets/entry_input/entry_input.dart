import 'package:eternary/src/ui/widgets/entry_input/entry_input_form.dart';
import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class EntryInput extends ViewModelWidget<HomeViewModel> {
  const EntryInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double fieldWidth = sizingInformation.isMobile
            ? 420
            : sizingInformation.isTablet
                ? 500
                : 720;
        double buttonSize = sizingInformation.isMobile ? 45 : 50;
        double iconSize = sizingInformation.isMobile ? 16 : 18;

        return Card(
          margin: EdgeInsets.only(
            bottom: 20.0,
          ),
          color: Colors.white,
          elevation: 2,
          child: SizedBox(
            width: fieldWidth,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: EntryInputForm(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: buttonSize,
                    height: buttonSize,
                    child: FlatButton(
                      color: Colors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Color(0xFFC4C4C4),
                          width: 1.2,
                        ),
                      ),
                      onPressed: () => viewModel.submitNewEntry(),
                      child: Icon(
                        Icons.check,
                        size: iconSize,
                        semanticLabel: Constants.save,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
