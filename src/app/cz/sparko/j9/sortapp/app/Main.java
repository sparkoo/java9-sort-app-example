package cz.sparko.j9.sortapp.app;

import cz.sparko.j9.sortapp.randomgenerator.RandomGenerator;
import cz.sparko.j9.sortapp.sort.Sort;
import cz.sparko.j9.sortapp.sort.help.SortChecker;
import cz.sparko.j9.sortapp.sortprovider.SortProvider;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Integer> randomNumbers = RandomGenerator.generate(10_000);

        measureSort(randomNumbers, SortProvider.getSort());

        SortProvider.getAllSorts().forEach(service -> measureSort(randomNumbers, service));
    }

    private static void measureSort(List<Integer> unsortedList, Sort sort) {
        long startTime = System.currentTimeMillis();
        List<Integer> sorted = sort.sort(unsortedList);
        if (SortChecker.isSorted(sorted)) {
            System.out.println(sort.getClass().getSimpleName() + ": sorted in " + (System.currentTimeMillis() - startTime) + "ms");
        } else {
            System.out.println(sort.getClass().getSimpleName() + " sort failed");
        }
    }
}
