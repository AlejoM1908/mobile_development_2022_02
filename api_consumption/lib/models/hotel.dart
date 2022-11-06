class Hotel{
  String name;
  String telephone;
  String address;
  double long;
  double lat;

  Hotel({required this.name, required this.telephone, required this.address, required this.long, required this.lat});

  factory Hotel.fromJson(Map<String, dynamic> json) {  
    var test = Hotel(
      name: json['nombre'],
      telephone: json['telefono'],
      address: json['direccion'],
      long: double.parse(json['longitud'].replaceAll(',', '.')),
      lat: double.parse(json['latitud'].replaceAll(',', '.')),
    );

    return test;
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': name,
      'telefono': telephone,
      'direccion': address,
      'longitud': long,
      'latitud': lat,
    };
  }

  @override
  String toString() {
    return 'Hotel{name: $name, telephone: $telephone, address: $address, long: $long, lat: $lat}';
  }
}
