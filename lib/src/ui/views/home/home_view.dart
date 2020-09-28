import 'package:eternary/src/ui/widgets/entry_input/entry_input.dart';
import 'package:eternary/src/ui/widgets/entry_list/entry_list.dart';
import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getEntries(),
      builder: (context, model, child) => ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(),
                      EntryInput(),
                      model.entries == null
                          ? _fetchingIndicator(
                              model,
                              sizingInformation.deviceScreenType,
                            )
                          : EntryList(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _fetchingIndicator(
      HomeViewModel viewModel, DeviceScreenType deviceScreenType) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            Constants.fetchingEntries,
            style: smallDescriptionTextStyle(
              deviceScreenType: deviceScreenType,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          Text(
            Constants.walletAddress,
            style: smallDescriptionTextStyle(
              deviceScreenType: deviceScreenType,
            ),
          ),
          Text(
            viewModel.address,
            style: smallDescriptionTextStyle(
              deviceScreenType: deviceScreenType,
            ),
          ),
        ],
      ),
    );
  }
}
