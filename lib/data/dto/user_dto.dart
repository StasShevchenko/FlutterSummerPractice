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
      id: json['id'] ,
      name: json['name'],
      startTime: json['start_time'] ?? '7/11/2023',
      endTime: json['end_time'] ?? '7/11/2023',
      position: json['position'] ?? 0,
      isActive: json['active'],
      group: json['groupId'] ?? 0);
}
