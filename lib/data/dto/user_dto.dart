class UserDto {
  final int id;
  final String name;
  final String startTime;
  final String endTime;
  final int position;
  final bool isActive;
  final int group;

  const UserDto(
      {required this.id,
      required this.name,
      required this.startTime,
      required this.endTime,
      required this.position,
      required this.isActive,
      required this.group});

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'],
      name: json['name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      position: json['position'],
      isActive: json['active'],
      group: json['group']);
}
