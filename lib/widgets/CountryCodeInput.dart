import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi_app/bloc/global/GlobalCubit.dart';
import 'package:livi_app/values/LiviTheme.dart';
import 'package:livi_app/values/colors/BasicColors.dart';
import 'package:livi_app/values/constants/CountryCodes.dart';

typedef ValueChanged<T> = void Function(T value);

class CountryCodeInput extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const CountryCodeInput({Key? key, this.onChanged, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasicColors colors = LiviTheme.getColors(context);

    return Autocomplete<MapEntry<String, String>>(
      optionsBuilder: (textEditValue) {
        return COUNTRY_CODES.entries
            .where((x) =>
                x.key.toLowerCase().contains(textEditValue.text.toLowerCase()) || x.value.toLowerCase().contains(textEditValue.text.toLowerCase()))
            .toList();
      },
      displayStringForOption: (options) {
        if (onChanged != null) onChanged!(options.value);
        return options.value;
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              /// Total window width - padding
              width: MediaQuery.of(context).size.width - 32,
              color: colors.dropdownBg,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemExtent: 60,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final MapEntry<String, String> option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () => onSelected(option),
                    child: ListTile(
                      title: Text(option.value + ' - ' + option.key),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        controller.text = initialValue ?? '';

        return TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.border)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.border)),
          ),
        );
      },
    );
  }
}
