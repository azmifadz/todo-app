import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/app/models/todo.dart';
import 'package:todo_flutter/app/translations/locale_keys.g.dart';
import 'package:todo_flutter/app/utils/date_time_helper.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({required this.todo, super.key});

  final Todo todo;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool checked = false;

  @override
  void initState() {
    super.initState();

    checked = widget.todo.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    final startDate = widget.todo.startDate;
    final endDate = widget.todo.endDate;

    return SizedBox(
      height: 180,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
              ),
              child: Text(
                widget.todo.title!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CardItemColumn(
                      title: LocaleKeys.main_todo_todo_card_start_date.tr(),
                      value: startDate != null ? formattedDateStringFromString(startDate) : '',
                    ),
                    _CardItemColumn(
                      title: LocaleKeys.main_todo_todo_card_end_date.tr(),
                      value: endDate != null ? formattedDateStringFromString(endDate) : '',
                    ),
                    _CardItemColumn(
                      title: LocaleKeys.main_todo_todo_card_time_left.tr(),
                      value: startDate != null && endDate != null
                          ? getTimeRemaining(
                              inputStartDate: startDate,
                              inputEndDate: endDate,
                            )
                          : '--',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ColoredBox(
              color: const Color(0xffe8e2d0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Text('${LocaleKeys.main_todo_todo_card_status.tr()}:'),
                    const SizedBox(width: 4),
                    Text(
                      getStatusBasedOnCheckBox(isChecked: checked),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(LocaleKeys.main_todo_todo_card_tick_to_complete.tr()),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: checked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checked = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getStatusBasedOnCheckBox({required bool isChecked}) {
    return isChecked ? LocaleKeys.main_todo_todo_card_completed.tr() : LocaleKeys.main_todo_todo_card_incomplete.tr();
  }
}

class _CardItemColumn extends StatelessWidget {
  const _CardItemColumn({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
