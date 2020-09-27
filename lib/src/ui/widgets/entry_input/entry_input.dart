import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/ui/widgets/entry_input/entry_input_form.dart';
import 'package:eternary/src/ui/widgets/entry_list/entry_item.dart';
import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:eternary/theme/text_styles.dart';
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

        return Column(
          children: [
            if (viewModel.isSubmitting) ...[
              _newEntryInputCard(viewModel, fieldWidth, buttonSize, iconSize),
              _previewEntryItem(viewModel),
            ] else
              _addNewEntryButton(viewModel, sizingInformation.deviceScreenType),
          ],
        );
      },
    );
  }

  Widget _addNewEntryButton(
    HomeViewModel viewModel,
    DeviceScreenType deviceScreenType,
  ) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      width: 300,
      height: 47,
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFFC4C4C4),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () => viewModel.updateIsSubmitting(true),
        child: Text(
          Constants.addNewEntry,
          style: descriptionTextStyle(
            deviceScreenType: deviceScreenType,
          ),
        ),
      ),
    );
  }

  Widget _newEntryInputCard(
    HomeViewModel viewModel,
    double fieldWidth,
    double buttonSize,
    double iconSize,
  ) {
    return Card(
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      color: Colors.white,
      elevation: 2,
      child: SizedBox(
        width: fieldWidth,
        height: 314,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    viewModel,
                    buttonSize,
                    iconSize,
                    Icons.cancel_outlined,
                    Colors.red,
                    () => viewModel.updateIsSubmitting(false),
                  ),
                  _circleButton(
                    viewModel,
                    buttonSize,
                    iconSize,
                    Icons.check,
                    Colors.green,
                    () => viewModel.submitNewEntry(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleButton(
    HomeViewModel viewModel,
    double buttonSize,
    double iconSize,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      child: FlatButton(
        color: Colors.white,
        shape: CircleBorder(
          side: BorderSide(
            color: color,
            width: 1.2,
          ),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: color,
          size: iconSize,
        ),
      ),
    );
  }

  Widget _previewEntryItem(HomeViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
        top: 10.0,
      ),
      child: Banner(
        message: Constants.preview,
        location: BannerLocation.topEnd,
        child: EntryItem(
          entry: EntryItemModel(
            text: viewModel.newEntry,
          ),
        ),
      ),
    );
  }
}
