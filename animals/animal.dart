class animal {
  int? id;
  String animal_name;
  String desc;
  int? weight;
  String? image;

  animal({
    this.id,
    required this.animal_name,
    required this.desc,
    this.weight,
    this.image,
  });
  factory animal.fromMap(Map<String, dynamic> map) {
    return animal(
      id: map['id'],
      animal_name: map['animal_name'],
      weight: map['weight'],
      desc: map['desc'],
      image: map['image'],
    );
  }
}
