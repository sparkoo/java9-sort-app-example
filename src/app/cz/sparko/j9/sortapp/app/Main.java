package cz.sparko.j9.sortapp.app;

import cz.sparko.j9.sortapp.randomgenerator.RandomGenerator;
import cz.sparko.j9.sortapp.sort.Sort;
import cz.sparko.j9.sortapp.sort.help.SortChecker;

import java.util.Arrays;
import java.util.List;
import java.util.ServiceLoader;

public class Main {
    public static void main(String[] args) {
        List<Integer> randomNumbers = RandomGenerator.generate(10_000);
//        randomNumbers.forEach(System.out::println);
//        List<Integer> randomNumbers = Arrays.asList(5,4,3,2,1);
        ServiceLoader.load(Sort.class).iterator().forEachRemaining(service -> {
            //System.out.println("Sorting with " + service.getClass().getSimpleName());
            long startTime = System.currentTimeMillis();
            List<Integer> sorted = service.sort(randomNumbers);
            if (SortChecker.isSorted(sorted)) {
                System.out.println(service.getClass().getSimpleName() + ": sorted in " + (System.currentTimeMillis() - startTime) + "ms");
            } else {
                System.out.println(service.getClass().getSimpleName() + " sort failed");
                sorted.forEach(System.out::println);
            }
        });
    }
}
