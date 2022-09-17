import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserRegisterPage extends HookConsumerWidget {
  const UserRegisterPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rideId = useState<int?>(null);
    final numberOfPeople = useState<int>(1);
    final selectedCard = useState<QuestionCategory?>(null);
    final selectedQuizCase = useState<int?>(null);
    final textController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  名前入力用のTextFormField
              DropdownButtonFormField<int>(
                value: rideId.value,
                decoration: const InputDecoration(
                  labelText: 'ライドID',
                  border: OutlineInputBorder(),
                ),
                items: List<int>.generate(6, (index) => index + 1)
                    .map<DropdownMenuItem<int>>(
                      (e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text(e.toString()),
                      ),
                    )
                    .toList(),
                onChanged: (value) => rideId.value = value,
              ),
              const SizedBox(height: 16),
              FittedBox(
                child: ToggleSwitch(
                  totalSwitches: 2,
                  radiusStyle: true,
                  customTextStyles: const [
                    TextStyle(fontSize: 20),
                    TextStyle(fontSize: 20)
                  ],
                  iconSize: 30,
                  labels: const ['1人', '2人'],
                  icons: const [Icons.person, Icons.people],
                  onToggle: (index) => numberOfPeople.value = index! + 1,
                  minWidth: 200,
                  minHeight: 60,
                ),
              ),
              const Divider(),
              const Text(
                'カテゴリ選択',
                style: TextStyle(fontSize: 20),
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.center,
                children: [
                  for (final category in QuestionCategory.values)
                    Card(
                      shape: (selectedCard.value == category)
                          ? RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.green,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            )
                          : null,
                      child: InkWell(
                        onTap: () {
                          selectedQuizCase.value = null;
                          selectedCard.value = category;
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              category.imagePath,
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const Divider(),
              if (selectedCard.value != null)
                const Text(
                  '大問セットの選択',
                  style: TextStyle(fontSize: 20),
                ),
              if (selectedCard.value != null)
                for (final question in ref
                    .watch(questionProvider)
                    .where((e) => e.category == selectedCard.value))
                  RadioListTile<int>(
                    title: Text(question.title),
                    value: question.id,
                    groupValue: selectedQuizCase.value,
                    onChanged: (value) => selectedQuizCase.value = question.id,
                  ),
            ],
          ),
        ),
      ),
      floatingActionButton: (selectedCard.value != null &&
              selectedQuizCase.value != null &&
              rideId.value != null)
          ? FloatingActionButton.extended(
              onPressed: () async {
                try {
                  final res = await Supabase.instance.client
                      .from('users')
                      .insert(<String, dynamic>{
                    'big_question_group_id': selectedQuizCase.value,
                    'ride_id': rideId.value,
                    'number_of_people': numberOfPeople.value,
                  }).execute();

                  final user = UserModel.fromJson(
                    (res.data as List)[0] as Map<String, dynamic>,
                  );

                  selectedCard.value = null;
                  selectedQuizCase.value = null;
                  rideId.value = null;
                  // ignore: use_build_context_synchronously
                  // show AlertDialog
                  await showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('登録完了'),
                      content: Text(
                        'ID:${user.id}\n'
                        'ライドID: ${user.rideId}\n'
                        '大問ID: ${selectedQuizCase.value}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: [
                        FloatingActionButton.extended(
                          label: const Text('OK'),
                          icon: const Icon(Icons.check),
                          onPressed: () {
                            Navigator.of(context).pop<void>();
                          },
                        ),
                      ],
                    ),
                  );
                  textController.clear();
                } on Exception catch (e) {
                  print('ERROR');
                  await showDialog<void>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('エラー'),
                        content: Text((e).toString()),
                        actions: [
                          FloatingActionButton.extended(
                            label: const Text('OK'),
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              Navigator.of(context).pop<void>();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              label: const Text('登録'),
              icon: const Icon(Icons.add),
            )
          : null,
    );
  }
}
