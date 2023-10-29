# Dessert Recipe Application
Dessert Recipe App is a native iOS application designed for iOS 16 and above, developed using Xcode 15.0.1. This app empowers dessert enthusiasts to explore a wide variety of dessert recipes. Users can conveniently sort recipes alphabetically, search for recipes by name, and delve into detailed information about each recipe, including its image, name, category, area, instructions, and ingredients.

## Preview
<img src="https://github.com/JChen255/DessertRecipeApp/assets/98052549/0ae47c60-b7bf-4a2e-97f9-b2d0f464a081" width="280" >
<img src="https://github.com/JChen255/DessertRecipeApp/assets/98052549/3ed6f4df-2dda-4e23-9e97-1ec2eaee69ea" width="280" >
<img src="https://github.com/JChen255/DessertRecipeApp/assets/98052549/ca692fee-52b1-40f9-8f79-075c4a01a0af" width="280" >
<img src="https://github.com/JChen255/DessertRecipeApp/assets/98052549/aabf6303-6605-42f3-b3c1-00e29fadd8e4" width="280" >
<img src="https://github.com/JChen255/DessertRecipeApp/assets/98052549/a48a4ce4-6f9b-4df4-82a3-25b42aa922d0" width="280" >
<img src="https://github.com/JChen255/DessertRecipeApp/assets/98052549/662cbc6f-57a2-42d2-8ae0-2aed47e30e23" width="280" >

## APIs used

1. [The MealDB API](https://themealdb.com/api.php): A comprehensive database of meal-related data.
2. [Filter API](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert): Fetches a list of meals in the dessert category.
3. [Lookup API](https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID): Retrieves detailed information about a specific meal by its ID.

## Technical Stack and Design Principles
Dessert Recipe App is meticulously crafted, leveraging a robust technical stack, smart strategies, and design patterns to deliver a seamless user experience.

### Technology Stack
* Swift: The app is built entirely in Swift, ensuring it benefits from the latest advancements in the language for iOS development.

* SwiftUI: A modern declarative framework is used to design the app's user interface, allowing for a responsive and intuitive user experience.

* MVVM (Model-View-ViewModel): Following the MVVM architectural pattern, the app maintains a clear separation of concerns. The Model handles data, the ViewModel processes and exposes that data to the View, and the View represents the UI.

* Singleton: Singleton pattern is employed to manage shared resources efficiently and prevent redundant instances.

* Dependency Injection: The Dependency Injection pattern is implemented, enabling the app to maintain flexibility and testability by providing external dependencies to components.

* Foundation: The Foundation framework is utilized for essential data types, data management, and a strong foundation for app development.

* URLSession: Network requests are efficiently managed using URLSession to fetch data from remote endpoints.

* Error Handling: The app employs robust error handling to gracefully handle issues and provide meaningful feedback to users.

### Testing and Quality Assurance
* XCTest and XCUITest: The codebase is comprehensively tested, achieving an impressive 96% test coverage, ensuring the app's reliability and stability. XCTest is used for unit testing, while XCUITest handles UI testing.
<img width="800" alt="coverage" src="https://github.com/JChen255/DessertRecipeApp/assets/98052549/a8c08561-3db8-4c36-9bab-404332ecafe1">

* Instruments: Instruments, a powerful profiling and debugging tool, is utilized to monitor memory, network usage, and performance. It includes dedicated tools such as Leaks, Network, and Allocations.

* Memory Graph: The Memory Graph tool within Instruments is employed to visualize object relationships and monitor memory usage, allowing for optimization and early detection of memory leaks.

### Concurrency and Asynchrony
* Async/Await: Asynchronous programming is employed to fetch data from API endpoints, enhancing app responsiveness and user experience.

* DispatchQueue: DispatchQueue is used to manage concurrency, allowing tasks to be executed concurrently and in parallel, promoting a smoother user experience.

### Data Handling
* NSCache: Images fetched from API endpoints are cached using NSCache, improving performance by reducing redundant network requests and data consumption.

* Codable: Codable is utilized to decode JSON data efficiently, simplifying the process of translating data between the app and external APIs.

### Accessibility
* Dynamic Type: Dynamic Type is supported, enabling text size adjustments to cater to a wide range of user preferences, including accessibility needs.

* Accessibility Modifiers: Accessibility modifiers are thoughtfully implemented to ensure the app is accessible to users with varying needs and preferences.

## Getting Started
* Clone the repository to your local machine.
* Open the project in Xcode 15.0.1 or a compatible version.
* Build and run the app on your iOS 16+ device or simulator.

