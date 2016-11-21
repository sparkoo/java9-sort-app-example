package cz.sparko.j9.sortapp.sort.help;

import java.util.List;

public class Swapper {
    public static void swap(List<Integer> list, int i, int j) {
        Integer tmp = list.get(i);
        list.set(i, list.get(j));
        list.set(j, tmp);
    }
}
