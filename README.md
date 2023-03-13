# Flutter GetX State Management Example

## About Get

GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

GetX has 3 basic principles. This means that these are the priority for all resources in the library: PRODUCTIVITY, PERFORMANCE AND ORGANIZATION.

PERFORMANCE: GetX is focused on performance and minimum consumption of resources. GetX does not use Streams or ChangeNotifier.

PRODUCTIVITY: GetX uses an easy and pleasant syntax. No matter what you want to do, there is always an easier way with GetX. It will save hours of development and will provide the maximum performance your application can deliver.

Generally, the developer should be concerned with removing controllers from memory. With GetX this is not necessary because resources are removed from memory when they are not used by default. If you want to keep it in memory, you must explicitly declare "permanent: true" in your dependency. That way, in addition to saving time, you are less at risk of having unnecessary dependencies on memory. Dependency loading is also lazy by default.

ORGANIZATION: GetX allows the total decoupling of the View, presentation logic, business logic, dependency injection, and navigation. You do not need context to navigate between routes, so you are not dependent on the widget tree (visualization) for this. You don't need context to access your controllers/blocs through an inheritedWidget, so you completely decouple your presentation logic and business logic from your visualization layer. You do not need to inject your Controllers/Models/Blocs classes into your widget tree through MultiProviders. For this, GetX uses its own dependency injection feature, decoupling the DI from its view completely.

With GetX you know where to find each feature of your application, having clean code by default. In addition to making maintenance easy, this makes the sharing of modules something that until then in Flutter was unthinkable, something totally possible. BLoC was a starting point for organizing code in Flutter, it separates business logic from visualization. GetX is a natural evolution of this, not only separating the business logic but the presentation logic. Bonus injection of dependencies and routes are also decoupled, and the data layer is out of it all. You know where everything is, and all of this in an easier way than building a hello world. GetX is the easiest, practical, and scalable way to build high-performance applications with the Flutter SDK. It has a large ecosystem around it that works perfectly together, it's easy for beginners, and it's accurate for experts. It is secure, stable, up-to-date, and offers a huge range of APIs built-in that are not present in the default Flutter SDK.

GetX is not bloated. It has a multitude of features that allow you to start programming without worrying about anything, but each of these features are in separate containers and are only started after use. If you only use State Management, only State Management will be compiled. If you only use routes, nothing from the state management will be compiled.

GetX has a huge ecosystem, a large community, a large number of collaborators, and will be maintained as long as the Flutter exists. GetX too is capable of running with the same code on Android, iOS, Web, Mac, Linux, Windows, and on your server. It is possible to fully reuse your code made on the frontend on your backend with Get Server.

In addition, the entire development process can be completely automated, both on the server and on the front end with Get CLI.

In addition, to further increase your productivity, we have the extension to VSCode and the extension to Android Studio/Intellij

## Installing

Add Get to your pubspec.yaml file:

   `dependencies:
   get:`

Import get in files that it will be used:

   `import 'package:get/get.dart';`
   
### The Three pillars 

### State management 

Get has two different state managers: the simple state manager (we'll call it GetBuilder) and the reactive state manager (GetX/Obx)

Reactive State Manager

Reactive programming can alienate many people because it is said to be complicated. GetX turns reactive programming into something quite simple:

You won't need to create StreamControllers.
You won't need to create a StreamBuilder for each variable
You will not need to create a class for each state.
You will not need to create a get for an initial value.
You will not need to use code generators
Reactive programming with Get is as easy as using setState.

Let's imagine that you have a name variable and want that every time you change it, all widgets that use it are automatically changed.

This is your count variable:

   `var name = 'Jonatas Borges';`

To make it observable, you just need to add ".obs" to the end of it:

   `var name = 'Jonatas Borges'.obs;`

And in the UI, when you want to show that value and update the screen whenever the values changes, simply do this:

   `Obx(() => Text("${controller.name}"));`

That's all. It's that simple.

More details about state management

See an more in-depth explanation of state management here. There you will see more examples and also the difference between the simple state manager and the reactive state manager

You will get a good idea of GetX power.

### Route management

If you are going to use routes/snackbars/dialogs/bottomsheets without context, GetX is excellent for you too, just see it:

Add "Get" before your MaterialApp, turning it into GetMaterialApp

   `GetMaterialApp( // Before: MaterialApp(
   home: MyHome(),
   )`

Navigate to a new screen:

   `Get.to(NextScreen());`

Navigate to new screen with name. See more details on named routes here

   `Get.toNamed('/details');`

To close snackbars, dialogs, bottomsheets, or anything you would normally close with Navigator.pop(context);

   `Get.back();`

To go to the next screen and no option to go back to the previous screen (for use in SplashScreens, login screens, etc.)

   `Get.off(NextScreen());`

To go to the next screen and cancel all previous routes (useful in shopping carts, polls, and tests)

   `Get.offAll(NextScreen());`

Noticed that you didn't have to use context to do any of these things? That's one of the biggest advantages of using Get route management. With this, you can execute all these methods from within your controller class, without worries.

More details about route management

Get works with named routes and also offers lower-level control over your routes! There is in-depth documentation here


#### Dependency management 

Get has a simple and powerful dependency manager that allows you to retrieve the same class as your Bloc or Controller with just 1 lines of code, no Provider context, no inheritedWidget:

   `Controller controller = Get.put(Controller()); // Rather Controller controller = Controller();`

Instead of instantiating your class within the class you are using, you are instantiating it within the Get instance, which will make it available throughout your App. So you can use your controller (or class Bloc) normally

Tip: Get dependency management is decoupled from other parts of the package, so if for example, your app is already using a state manager (any one, it doesn't matter), you don't need to rewrite it all, you can use this dependency injection with no problems at all

   `controller.fetchApi();`

Imagine that you have navigated through numerous routes, and you need data that was left behind in your controller, you would need a state manager combined with the Provider or Get_it, correct? Not with Get. You just need to ask Get to "find" for your controller, you don't need any additional dependencies:

   `Controller controller = Get.find();
   //Yes, it looks like Magic, Get will find your controller, and will deliver it to you. You can have 1 million controllers instantiated, Get will always give you the right controller.`

And then you will be able to recover your controller data that was obtained back there:

   `Text(controller.textFromApi);`
   
