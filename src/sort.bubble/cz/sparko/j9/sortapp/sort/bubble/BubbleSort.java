package cz.sparko.j9.sortapp.sort.bubble;

import cz.sparko.j9.sortapp.sort.Sort;
import cz.sparko.j9.sortapp.sort.help.Swapper;

import java.util.ArrayList;
import java.util.List;

public class BubbleSort implements Sort {
    @Override
    public List<Integer> sort(List<Integer> unsortedList) {
        List<Integer> sorted = new ArrayList<>();
        sorted.addAll(unsortedList);
        for (int i = 0; i < unsortedList.size(); i++) {
            for (int j = 0; j < unsortedList.size() - 1; j++) {
                if (sorted.get(j) > sorted.get(j + 1)) {
                    Swapper.swap(sorted, j, j + 1);
                }
            }
        }
        return sorted;
    }
}
