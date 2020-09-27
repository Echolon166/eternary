import 'package:eternary/src/ui/widgets/entry_input/entry_input.dart';
import 'package:eternary/src/ui/widgets/entry_list/entry_list.dart';
import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getEntries(),
      builder: (context, model, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(),
                  EntryInput(),
                  model.entries == null
                      ? Container(
                          margin: EdgeInsets.all(20),
                          child: CircularProgressIndicator(),
                        )
                      : EntryList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
