import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/ui/widgets/entry_input/entry_input_form.dart';
import 'package:eternary/src/ui/widgets/entry_list/entry_item.dart';
import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              _newEntryInputCard(
                  context,
                  viewModel,
                  sizingInformation.deviceScreenType,
                  fieldWidth,
                  buttonSize,
                  iconSize),
              _previewEntryItem(viewModel),
            ] else
              viewModel.isPending
                  ? _entryButton(
                      viewModel,
                      sizingInformation.deviceScreenType,
                      Constants.pleaseWait,
                      null,
                    )
                  : _entryButton(
                      viewModel,
                      sizingInformation.deviceScreenType,
                      Constants.addNewEntry,
                      () => viewModel.updateIsSubmitting(true),
                    ),
          ],
        );
      },
    );
  }

  Widget _entryButton(
    HomeViewModel viewModel,
    DeviceScreenType deviceScreenType,
    String buttonText,
    VoidCallback onPressed,
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
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: descriptionTextStyle(
            deviceScreenType: deviceScreenType,
          ),
        ),
      ),
    );
  }

  Widget _newEntryInputCard(
    BuildContext context,
    HomeViewModel viewModel,
    DeviceScreenType deviceScreenType,
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
                    () {
                      _showToast(
                        context,
                        deviceScreenType,
                      );
                      viewModel.submitNewEntry();
                    },
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

  _showToast(BuildContext context, DeviceScreenType deviceScreenType) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(
            Constants.entrySent,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Overpass',
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}
