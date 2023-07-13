class AddUserDto {
  final String name;
  final String group;
  final String startTime;
  final String endTime;

  AddUserDto(
      {required this.name,
      required this.group,
      required this.startTime,
      required this.endTime});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'group': group,
      'start_time': startTime,
      'end_time': endTime
    };
  }
}
