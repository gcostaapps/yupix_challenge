
# YUPIX_Challenge

Project developed for Yupix Challenge.




## Project Structure

The code was structured using modules to provide a better separation of features. The system has the following modules:
* **design_system**: Responsible for design elements that are used in the presentation layer. A storybook has been made and it's available in: [Design System Storybook.](https://shopping-list-8820b.web.app/#/) 
* **dependencies_core**: This module is responsible for keeping all dependencies that are commom to many modules (bloc, freezed, dartz, etc). With this is harder to use different package versions across the app modules.
* **shopping_app_core**: This module has core layers that are used in the other shopping_app modules, commom domain classes, datasources, repositories and blocs are all here.
* **shopping_app**: This module is the entrypoint for our application, it uses other modules and provides the services/blocs to be injected in the tree and used across the app.
* **shopping_app_favorites**: Module responsible for favorite screen.
* **shopping_app_form**: Module responsible for form (create category/item) screen.
* **shopping_app_items**: Module responsible for list items screen.


## Module structure

A module can have up to 5 folders:
* **application**: Bloc/cubits.
* **domain**: Domain classes, failures, interfaces for repositories.
* **presentation**: UI elements.
* **infrastructure**: Datasources, repositories and services.
* **utils**: Auxiliary classes.


## Troubles in the development

Altough the user interface wasn't the main focus of this challenge, I wanted to create a custom UI with animations without using many packages. This in addition to the short available time that I had caused some issues. 

The main issue was not developing the search feature, altough it was simple. Besides that, some cubits and services were not tested with unit testing.

Despite that, all repositories, datasources, and some cubits are covered with unit tests.

## Improvements that can be made

For a limited time project some production standarts were skipped, resulting in some future improvements that can be made:

* As already said, the unit test coverage could be greater, covering all application. 
* Adding golden, widget and integration tests could also be a great improvement.
* The items could be lazy loaded to save requests and shrimmers could be used instead of CircularProgressIndicator
* Localization could also be done with ease.
* Firebase rules could be enabled.
* Loggers and analytics could be implemented.
* It could use the 'melos' package to manage the monorepo.

