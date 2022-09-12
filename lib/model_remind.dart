

class Reminder {
  String title;
  DateTime date;

  List<Names> nameList;
  Reminder({required this.date, required this.nameList, required this.title });
}

class Names {
  String name;
  bool isActive;
  Names({required this.isActive, required this.name});
}

List<Reminder> nameReminder = [
  Reminder(
    title: 'Today',
    date: DateTime.now(),
    nameList: [
      Names(name: 'Naseer', isActive: true),
      Names(name: 'Ahsan', isActive: true),
      Names(name: 'Syed', isActive: false),
      Names(name: 'Naveed', isActive: false),
      Names(name: 'Ali', isActive: false),
    ],
  ),
  Reminder(
    title: 'Yesterday',
    date: DateTime.now(),
    nameList: [
      Names(name: 'Naseer', isActive: true),
      Names(name: 'Ahsan', isActive: true),
      Names(name: 'Syed', isActive: true),
      Names(name: 'Naveed', isActive: false),
      Names(name: 'Ali', isActive: false),
    ],
  ),
  Reminder(
    title: 'Tomorrow',
    date: DateTime.now(),
    nameList: [
      Names(name: 'Naseer', isActive: true),
      Names(name: 'Ahsan', isActive: true),
      Names(name: 'Syed', isActive: false),
      Names(name: 'Naveed', isActive: false),
      Names(name: 'Ali', isActive: false),
    ],
  ),
];