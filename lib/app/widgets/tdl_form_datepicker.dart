import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/app/translations/locale_keys.g.dart';
import 'package:todo_flutter/app/utils/date_time_helper.dart';

class TdlFormDatePicker extends StatefulWidget {
  const TdlFormDatePicker({
    required this.onSelectedDate,
    this.selectedDate,
    super.key,
  });

  final Function onSelectedDate;
  final DateTime? selectedDate;

  @override
  State<TdlFormDatePicker> createState() => _TdlFormDatePickerState();
}

class _TdlFormDatePickerState extends State<TdlFormDatePicker> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.selectedDate != null) {
      textEditingController.text =
          dateFilterDisplayDateFormat().format(widget.selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: TextFormField(
        controller: textEditingController,
        enabled: false,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.arrow_drop_down),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
          hintText: LocaleKeys.add_todo_select_date.tr(),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        textEditingController.text =
            dateFilterDisplayDateFormat().format(picked);
        widget.onSelectedDate(picked);
      });
    }
  }
}
