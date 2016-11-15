package cz.sparko.j9test.m1;

import cz.sparko.j9test.m2.MyClass2;

public class MyClass1 {
    public void sayHello() {
        System.out.println("Hello");
    }
    public MyClass2 getM2() {
        return new MyClass2();
    }
}
