
class Configurations{

  final String? id;
  final String? label;
  final String? name;
  final String? value;

  Configurations({this.id,this.label,this.name,this.value});
  static Configurations fromJson(Map<String, dynamic> json) => Configurations(
    id: json['id'],
    label: json['label'],
    name: json['name'],
    value: json['value'],

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
    'name': name,
    'value': value,
  };

}