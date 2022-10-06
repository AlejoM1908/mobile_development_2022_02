enum CompanyType {
  consulting,
  softwareDevelopment
}

extension ToString on CompanyType {
  String get string {
    switch (this) {
      case CompanyType.consulting:
        return 'Consulting';
      case CompanyType.softwareDevelopment:
        return 'Software Development';
      default:
        return 'Unknown';
    }
  }
}

extension ToEnum on String {
  CompanyType toCompanyType() {
    switch (this) {
      case 'Consulting':
        return CompanyType.consulting;
      case 'SoftwareDevelopment':
        return CompanyType.softwareDevelopment;
      default:
        return CompanyType.consulting;
    }
  }
}
