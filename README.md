# Java 9 sort app example

Example app for new module system of Java 9. Used with EA build https://jdk9.java.net/download/

modules:
 * app
 * randomgenerator
 * sort
 * sortprovider
 * sort.bubble
 * sort.insertion
 * sort.selection

others:
 * buildscript - `src/build.sh`


### Howto run
Ensure that `java`, `javac`, `jlink`, `jar` and `jmod` are on `PATH` (basically jdk `bin` folder) and run `bash src/build.sh`.

#### app
Main module which contains main class `cz.sparko.j9.sortapp.app.Main`. Gets random number list from `randomgenerator` module and sort it with provided sort algorithms.

Reads `randomgenerator` and `sortprovider` modules.


#### randomgenerator
Provides simple "service" to generate list of random numbers.

note: simple export/request


#### sort
Contains interface `Sort` and few helper classes.

note: `Sort` is exported -> modules that reads this module can work with sort service through this interface.


#### sortprovider
Takes `Sort` interface and provides it's implementations.

`uses cz.sparko.j9.sortapp.sort.Sort` to access `Sort` implementations.

`requires transitive sort` to export `Sort` interface to all modules that reads `sortprovider` module. Those modules can't access particular implementations, but can work with them through interface. 


#### sort.'algorithm'
Particular implementations of sort algorithm. Always `provides` implmementation of `Sort` interface. Should not export anything.

note: Implementation is not exported -> not visible.