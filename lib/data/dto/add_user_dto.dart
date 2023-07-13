class AddUserDto {
  final String name;
  final String group;

  AddUserDto({required this.name, required this.group});

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'group' : group
    };
  }
}
