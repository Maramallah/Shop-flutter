import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      expandedValue: 'Item Purchased ${index + 1}',
      headerValue: 'This is saved item number ${index + 1}',
    );
  });
}

class ExpanssionPanelListFeature extends StatefulWidget {
  const ExpanssionPanelListFeature({
    super.key,
    required this.numberOfItems,
  });

  final int numberOfItems;

  @override
  State<ExpanssionPanelListFeature> createState() => _ExpanssionPanelListFeatureState();
}

class _ExpanssionPanelListFeatureState extends State<ExpanssionPanelListFeature> {
  final List<Item> _data = generateItems(15); // Initialize with a default value

  @override
  void initState() {
    super.initState();
    _data.clear();
    _data.addAll(generateItems(widget.numberOfItems));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: const Text('To delete this panel, tap the trash can icon.'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => currentItem == item);
                });
              },
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

