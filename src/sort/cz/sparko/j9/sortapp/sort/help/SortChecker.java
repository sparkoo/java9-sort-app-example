package cz.sparko.j9.sortapp.sort.help;

import java.util.List;

public class SortChecker {
    public static boolean isSorted(List<Integer> sortedList) {
        for (int i = 1; i < sortedList.size(); i++) {
            if (sortedList.get(i - 1) > sortedList.get(i)) {
                return false;
            }
        }
        return true;
    }
}
