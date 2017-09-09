# GoogleBooksAPIResearch
Working on Google Books API research work

### Architectures & Design Patterns

* [VIPER](https://medium.com/@ankoma22/the-good-the-bad-and-the-ugly-of-viper-architecture-for-ios-apps-7272001b5347) - I've implemented VIPER for UI modules.
* [CLEAN](https://marcinkuptel.com/2015/11/21/clean-architecture-on-ios/) - I've implemented clean architecture with different layers like SDK, Services, Core.
* Singleton design pattern
* Delegation design pattern
* Facade design pattern
* Decorator design pattern

### Multi-threading

* GCD - For UI operations, I've used Grand-center-dispatch.
* OperationQueues - For Web-service calls, I've used inbuilt operation queue of URLSession

### Screen-shots

| Screenshot | Description |
| -----------| ----------- |
| ![Image1](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/01.png?raw=true)| Application Logo |
| ![Image2](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/02.png?raw=true)| Dashbloard |
| ![Image3](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/03.png?raw=true)| Search - loading |
| ![Image4](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/04.png?raw=true)| Search - Results |
| ![Image5](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/05.png?raw=true)| Search - Paging |
| ![Image6](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/06.png?raw=true)| Book Details |
| ![Image7](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/07.png?raw=true)| Book Reader |
| ![Image8](https://github.com/sag333ar/GoogleBooksAPIResearch/blob/master/Screenshots/08.png?raw=true)| Book Reader Landscape |

### Dependencies

1. Fabric - for release management
2. Crashlytics - for crash reports management
3. Gloss - for JSON Mapping
4. SKRequestManager - for request & json response management
5. SDWebImage - for async image caching management
6. MBProgressHUD - for displaying progress indication
7. TTGSnackbar - for showing snackbar message
