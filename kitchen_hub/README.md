# kitchen_hub

The purpose of this repository is to upload all the code for the final project developed during the mobile development course at the National University of Colombia.
## Architecture

The project architecture is based on a reference architecture proposed by the flutter community. This architecture is called stacked. For more information [click here](https://www.filledstacks.com/post/flutter-and-provider-architecture-using-stacked/)
## Adding a new route
- Add a new folder for the view in the `ui/views` directory.
- Add a View to the `ui/views` directory.
- Add a ViewModel in the `ui/views` directory.
- Reference the new view in the `app.dart` file in the `app/` directory.
- Execute the command:
```
flutter pub run build_runner build
```
## Imports Auto-Sorting
- We are making use of a package that automatically sorts the imports, for more information [click here](https://pub.dev/packages/import_sorter)
- Before sending a Pull Request you must update the routes by executing the following command:
```
flutter pub run import_sorter:main
```
## Authors

- [@AlejoM1908](https://www.github.com/AlejoM1908)
- [@jcvillotab](https://www.github.com/jcvillotab)
