import 'package:company_directory/models/company_type.dart';

class Company {
  final int _id;
  final String _name;
  final String _url;
  final String _phone;
  final String _email;
  final List<String> _products;
  final CompanyType _type;

  Company({
    required id,
    required name,
    required url,
    required phone,
    required email,
    required products,
    required type, CompanyType? companyType,
  })  : _id = id,
        _name = name,
        _url = url,
        _phone = phone,
        _email = email,
        _products = products,
        _type = type;

  // Getters
  int get id => _id;
  String get name => _name;
  String get url => _url;
  String get phone => _phone;
  String get email => _email;
  List<String> get products => _products;
  String get productString => _products.join(', ');
  String get type => _type.string;
  CompanyType get companyType => _type;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      phone: json['phone'],
      email: json['email'],
      products: json['products'].split(','),
      type: json['type'].toString().toCompanyType(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': _name,
        'url': _url,
        'phone': _phone,
        'email': _email,
        'products': productString,
        'type': _type.string == 'Consulting' ? 0 : 1,
      };
}
