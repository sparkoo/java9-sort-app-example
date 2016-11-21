# Java 9 sort app example

Example app for new module system of Java 9. Used with EA build https://jdk9.java.net/download/

modules:
 * app
 * randomgenerator
 * sort
 * sort.bubble
 * sort.insertion
 * sort.selection

others:
 * buildscript - `src/build.sh`


### Howto run
Change `PROJECT_PATH` and `JAVA_HOME` to your values and run `bash src/build.sh`.

#### app
Main module which contains main class `cz.sparko.j9.sortapp.app.Main`. Gets random number list from `randomgenerator` module and sort it with provided sort algorithms.

Reads `randomgenerator` and `sort` modules.

`use cz.sparko.j9.sortapp.sort.Sort` to access to `Sort` implementations.


#### randomgenerator
Provides simple "service" to generate list of random numbers.

note: simple export/request


#### sort
Contains interface `Sort` and few helper classes.

note: `Sort` is exported -> modules that reads this module can work with sort service through this interface.


#### sort.'algorithm'
Particular implementations of sort algorithm. Always `provides` implmementation of `Sort` interface. Should not export anything.

note: Implementation is not exported -> not visible.