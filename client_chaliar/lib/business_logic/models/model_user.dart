class UserChaliar {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String userRole;
  final String phone;
  final String street;
  final String facturationAdresse;
  final String codePostal;
  final String city;

  UserChaliar(
      {this.id,
      this.name,
      this.email,
      this.userRole,
      this.surname,
      this.phone,
      this.facturationAdresse,
      this.codePostal,
      this.city,
      this.street});

  UserChaliar.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        surname = data['surname'],
        email = data['email'],
        phone = data['phone'],
        street = data['street'],
        facturationAdresse = data['facturationAdresse'],
        codePostal = data['codePostal'],
        city = data['city'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'userRole': userRole,
      'phone': phone,
      'street': street,
      'facturation_adresse': facturationAdresse,
      'code_postal': codePostal,
      'city': city
    };
  }
}
