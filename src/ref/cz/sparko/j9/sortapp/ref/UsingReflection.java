package cz.sparko.j9.sortapp.ref;

//import cz.sparko.j9.sortapp.randomgenerator.RandomGenerator;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class UsingReflection {

    public void foo() {
//        RandomGenerator.generate(10);
        try {
            Class class1 = Class.forName("cz.sparko.j9.sortapp.randomgenerator.RandomGenerator");
            Method m = class1.getMethod("generate", int.class);
            Object o = m.invoke(null, 10);
            System.out.println(o);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
