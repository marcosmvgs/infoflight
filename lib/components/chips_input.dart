import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:infoflight/models/airfield.dart';
import 'package:infoflight/models/selected_airfields_list.dart';
import 'package:provider/provider.dart';

enum StatusColor {
  g(cor: Colors.green, label: 'g'),
  cinza(cor: Colors.grey, label: 'cinza'),
  y(cor: Colors.yellow, label: 'y'),
  r(cor: Colors.red, label: 'r');

  const StatusColor({
    required this.cor,
    required this.label,
  });

  final Color cor;
  final String label;
}

Color status(String label) {
  Color color = Colors.purple;
  if(label == 'r') color = Colors.red;
  if(label == 'g') color = Colors.green;
  if(label == 'y') color = Colors.yellow;
  return color;

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
      maxChips: 5,
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
            backgroundColor: profile.color == null ? null
          : status(profile.color!),
            radius: 10,
            child: const Icon(
              Icons.close,
              size: 15,
              color: Colors.black,
            ),
          ),
          key: ObjectKey(profile),
          label: Text(profile.icao),
          onDeleted: () => state.deleteChip(profile),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, Airfield profile) {
        return ListTile(
          key: ObjectKey(profile),
          title: Text(profile.icao),
          subtitle: Text(profile.city),
          onTap: () => state.selectSuggestion(profile),
          trailing: CircleAvatar(
            radius: 10,
            backgroundColor: profile.color == null ? null
          : status(profile.color!),
        ));
      },
    );
  }
}
