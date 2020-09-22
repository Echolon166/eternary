import 'package:eternary/src/ui/widgets/entry_list/entry_list.dart';
import 'package:eternary/src/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getEntries(),
      builder: (context, model, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            model.entries == null
                ? CircularProgressIndicator()
                : EntryList(
                    entries: model.entries,
                  ),
          ],
        ),
      ),
    );
  }
}
