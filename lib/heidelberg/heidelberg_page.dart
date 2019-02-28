import 'package:flutter/material.dart';
import './data/heidelberg.dart';
import './data/lordsday.dart';
import './lordsday.dart';

class HeidelbergPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heidelberg Catechism'),
      ),
      body: ListView.builder(
        itemCount: Heidelberg.items.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return _buildSections(context, index);
        },
      ),
    );
  }

  Widget _buildSections(BuildContext context, int index) {
    return ExpansionTile(
      title: Text(Heidelberg.items[index].header),
      children:
          _buildExpandedListView(context, Heidelberg.items[index].lordsDays),
    );
  }

  List<Widget> _buildExpandedListView(
    BuildContext context, List<LordsDay> lordsDays) {
    List<Widget> expandedList = [];
    lordsDays.forEach((lordsDay) {
      expandedList.add(
        ListTile(
          title: Text('${lordsDay.header}'),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LordsDayPage(lordsDay: lordsDay))),
        ),
      );
    });
    return expandedList;
  }
}