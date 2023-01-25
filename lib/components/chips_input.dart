import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:infoflight/core/models/airfield.dart';
import 'package:infoflight/core/models/selected_airfields_list.dart';
import 'package:provider/provider.dart';

Widget inputCircleColor(String? label) {
  const List<Map<String, Color>> matchColors = [
    {'y': Colors.yellow},
    {'g': Colors.green},
    {'r': Colors.red},
    {'gw': Colors.green},
    {'cinza': Colors.grey}
  ];

  Widget widget = CircleAvatar(
    radius: 10,
    backgroundColor: matchColors
        .firstWhere((element) => element.containsKey(label),
            orElse: (() => {'NR': const Color.fromRGBO(1, 1, 1, 0.0)}))
        .values
        .first,
  );
  return widget;
}

class ChipsInputWidget extends StatefulWidget {
  const ChipsInputWidget({
    Key? key,
    required this.mockResults,
  }) : super(key: key);

  final List<Airfield> mockResults;

  @override
  State<ChipsInputWidget> createState() => _ChipsInputWidgetState();
}

class _ChipsInputWidgetState extends State<ChipsInputWidget> {
  @override
  Widget build(BuildContext context) {
    return ChipsInput(
      autofocus: true,
      textStyle: const TextStyle(color: Colors.white, fontSize: 18),
      decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(1, 1, 1, 0.0)),
          ),
          hintText: 'Digite o código ICAO',
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
          )),
      maxChips: 3,
      findSuggestions: (String query) {
        if (query.isNotEmpty) {
          var lowercaseQuery = query.toLowerCase();
          return widget.mockResults.where((profile) {
            return profile.icao.toLowerCase().contains(query.toLowerCase()) ||
                profile.city.toLowerCase().contains(query.toLowerCase());
          }).toList(growable: false)
            ..sort(((a, b) => a.icao
                .toLowerCase()
                .indexOf(lowercaseQuery)
                .compareTo(b.icao.toLowerCase().indexOf(lowercaseQuery))));
        }
        return widget.mockResults;
      },
      onChanged: (data) {
       Provider.of<SelectedAirfieldsList>(context, listen: false)
            .updateSelectedAirfieldList(data);
      },
      chipBuilder: (context, state, Airfield profile) {
        return InputChip(
          deleteIcon: CircleAvatar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            radius: 10,
            child: const Icon(
              Icons.close,
              size: 15,
              color: Colors.white,
            ),
          ),
          key: ObjectKey(profile),
          label: Text(profile.icao),
          onDeleted: () => state.deleteChip(profile),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, Airfield airfield) {
        return Column(
          children: [
            ListTile(
                key: ObjectKey(airfield),
                title: Text(airfield.icao),
                subtitle: Text(airfield.city),
                onTap: () => state.selectSuggestion(airfield),
                trailing: inputCircleColor(airfield.color)),
                const Divider(thickness: 1.3,)
          ],
        );
      },
    );
  }
}
