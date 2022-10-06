import 'package:company_directory/app/app.locator.dart';
import 'package:company_directory/app/app.router.dart';
import 'package:company_directory/models/company.dart';
import 'package:company_directory/services/details_service.dart';
import 'package:company_directory/services/sqlite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DetailsService _detailsService = locator<DetailsService>();
  final SQLiteService _sqliteService = locator<SQLiteService>();

  final String _title = 'Company Directory';
  List<Company> _companies = [];

  HomeViewModel() {
    loadCompanies();
  }

  // Getters
  String get title => _title;
  List<Company> get companies => _companies;

  void navigateToDetails(Company company) {
    _detailsService.company = company;
    _navigationService.navigateTo(Routes.detailsView);
  }

  Future loadCompanies() async {
    setBusy(true);
    _companies = await _sqliteService.getCompanies();
    setBusy(false);
  }

  void createCompany() {
    _detailsService.company = null;
    _navigationService
        .navigateTo(Routes.detailsView)
        ?.whenComplete(() => loadCompanies());
  }
}
