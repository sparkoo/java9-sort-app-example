package cz.sparko.j9.sortapp.sort.selection;

import cz.sparko.j9.sortapp.sort.Sort;
import cz.sparko.j9.sortapp.sort.help.Swapper;

import java.util.ArrayList;
import java.util.List;

public class SelectionSort implements Sort {
    @Override
    public List<Integer> sort(List<Integer> unsortedList) {
        List<Integer> sorted = new ArrayList<>();
        sorted.addAll(unsortedList);
        for (int i = 1; i < sorted.size(); i++) {
            for (int j = i; j > 0; j--) {
                if (sorted.get(j) < sorted.get(j - 1)) {
                    Swapper.swap(sorted, j, j - 1);
                }
            }
        }
        return sorted;
    }
}
