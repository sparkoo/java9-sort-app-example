package cz.sparko.j9test.app;

import cz.sparko.j9test.m1.MyClass1;
import cz.sparko.j9test.m2.MyClass2;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello World");
        new MyClass1().sayHello();
        new MyClass1().getM2().sayHelloFromClass2();
        new MyClass2().sayHelloFromClass2();
        MyClass2 m = new MyClass2();
        m.sayHelloFromClass2();
    }
}
