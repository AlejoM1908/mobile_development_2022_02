/// Class used to represent the database model for the Storage table.
class Storage{
  final int _id;
  final String _name;

  Storage({required int id, required String name})
      : _id = id,
        _name = name;
  
  // Getters
  int get id => _id;
  String get name => _name;

  Map <String, dynamic> toJson() => {
    'id': _id,
    'name': _name,
  };

  factory Storage.fromMap(Map<String, dynamic> map) => Storage(
    id: map['id'],
    name: map['name'],
  );

  @override
  String toString() => 'Storage(id: $_id, name: $_name)';
}

/// Class used to represent the database model for the Category table.
class Category{
  final int _id;
  final int _icon;
  final String _name;

  Category({required int id, required int icon, required String name})
      : _id = id,
        _icon = icon,
        _name = name;
  
  // Getters
  int get id => _id;
  int get icon => _icon;
  String get name => _name;

  Map <String, dynamic> toJson() => {
    'id': _id,
    'icon': _icon,
    'name': _name,
  };

  factory Category.fromMap(Map<String, dynamic> map) => Category(
    id: map['id'],
    icon: map['icon'],
    name: map['name'],
  );

  @override
  String toString() => 'Category(id: $_id, icon: $_icon, name: $_name)';
}

/// Class used to represent the database model for the Product table.
class Product{
  final int _id;
  final int _category;
  final String _name;
  final int _icon;
  final String _description;

  Product({required int id, required int category, required String name, required int icon, required String description})
      : _id = id,
        _category = category,
        _name = name,
        _icon = icon,
        _description = description;

  // Getters
  int get id => _id;
  int get category => _category;
  String get name => _name;
  int get icon => _icon;
  String get description => _description;

  Map <String, dynamic> toJson() => {
    'id': _id,
    'category': _category,
    'name': _name,
    'icon': _icon,
    'description': _description,
  };

  factory Product.fromMap(Map<String, dynamic> map) => Product(
    id: map['id'],
    category: map['category'],
    name: map['name'],
    icon: map['icon'],
    description: map['description'],
  );

  @override
  String toString() => 'Product(id: $_id, category: $_category, name: $_name, icon: $_icon, description: $_description)';
}

/// Class used to represent the database model for the Products stored in some Storage.
class Savings{
  final int _id;
  final int _storage;
  final int _product;
  final int _amount;
  final DateTime _added;
  final DateTime _expiry;

  Savings({required int id, required int storage, required int product, required int amount, required DateTime added, required DateTime expiry})
      : _id = id,
        _storage = storage,
        _product = product,
        _amount = amount,
        _added = added,
        _expiry = expiry;

  // Getters
  int get id => _id;
  int get storage => _storage;
  int get product => _product;
  int get amount => _amount;
  DateTime get added => _added;
  DateTime get expiry => _expiry;

  Map <String, dynamic> toJson() => {
    'id': _id,
    'storage': _storage,
    'product': _product,
    'amount': _amount,
    'added': _added.toIso8601String(),
    'expiry': _expiry.toIso8601String(),
  };

  factory Savings.fromMap(Map<String, dynamic> map) => Savings(
    id: map['id'],
    storage: map['storage'],
    product: map['product'],
    amount: map['amount'],
    added: DateTime.parse(map['added']),
    expiry: DateTime.parse(map['expiry']),
  );

  @override
  String toString() => 'Savings(id: $_id, storage: $_storage, product: $_product, amount: $_amount, added: $_added, expiry: $_expiry)';
}

class Record{
  final int _id;
  final String _storageName;
  final String _productName;
  final int _amount;
  final int _icon;
  final DateTime _added;
  final DateTime _expiracy;

  Record({required int id, required String storageName, required String productName, required int amount, required int icon, required DateTime added, required DateTime expiracy})
      : _id = id,
        _storageName = storageName,
        _productName = productName,
        _amount = amount,
        _icon = icon,
        _added = added,
        _expiracy = expiracy;

  // Getters
  int get id => _id;
  String get storageName => _storageName;
  String get productName => _productName;
  int get amount => _amount;
  int get icon => _icon;
  DateTime get added => _added;
  DateTime get expiry => _expiracy;

  Map <String, dynamic> toJson() => {
    'id': _id,
    'storageName': _storageName,
    'productName': _productName,
    'amount': _amount,
    'icon': _icon,
    'added': _added.toIso8601String(),
    'expiry': _expiracy.toIso8601String(),
  };

  factory Record.fromMap(Map<String, dynamic> map) => Record(
    id: map['id'],
    storageName: map['storageName'],
    productName: map['productName'],
    amount: map['amount'],
    icon: map['icon'],
    added: DateTime.parse(map['added']),
    expiracy: DateTime.parse(map['expiry']),
  );

  @override
  String toString() => 'Record(id: $_id, storageName: $_storageName, productName: $_productName, amount: $_amount, icon: $_icon, added: $_added, expiry: $_expiracy)';
}
