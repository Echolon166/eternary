import 'package:eternary/src/ui/widgets/entry_list/entry_list.dart';
import 'package:eternary/src/viewmodels/timeline_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TimelineViewModel>.reactive(
      viewModelBuilder: () => TimelineViewModel(),
      builder: (context, model, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            EntryList(
              entries: model.entries,
            ),
          ],
        ),
      ),
    );
  }
}
