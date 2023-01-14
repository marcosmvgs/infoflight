import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:infoflight/models/airfield.dart';
import 'package:infoflight/models/selected_airfields_list.dart';
import 'package:provider/provider.dart';

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
          deleteIcon: const CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 10,
            child: Icon(
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
        );
      },
    );
  }
}
