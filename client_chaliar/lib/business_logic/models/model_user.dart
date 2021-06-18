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
  final String siret;
  final String societe;

  UserChaliar(
      {this.id,
      this.name,
      this.email,
      this.userRole,
      this.surname,
      this.phone,
        this.siret,
      this.facturationAdresse,
      this.codePostal,
      this.city,
      this.street,
        this.societe
      });

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
  siret=data['siret'],
        societe=data['societe'],
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
      'city': city,
      'siret':siret,
      'societe':societe,
    };
  }
}
