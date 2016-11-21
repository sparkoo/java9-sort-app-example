package cz.sparko.j9.sortapp.sort.insertion;

import cz.sparko.j9.sortapp.sort.Sort;
import cz.sparko.j9.sortapp.sort.help.Swapper;

import java.util.ArrayList;
import java.util.List;

public class InsertionSort implements Sort {
    @Override
    public List<Integer> sort(List<Integer> unsortedList) {
        List<Integer> sorted = new ArrayList<>();
        sorted.addAll(unsortedList);
        for (int i = 0; i < sorted.size() - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < sorted.size(); j++) {
                if (sorted.get(minIndex) > sorted.get(j)) {
                    Swapper.swap(sorted, minIndex, j);
                }
            }
        }
        return sorted;
    }
}
