package cz.sparko.j9.sortapp.sortprovider;

import cz.sparko.j9.sortapp.sort.Sort;

import java.util.ArrayList;
import java.util.List;
import java.util.ServiceLoader;

public class SortProvider {

    private static final List<Sort> sorts = new ArrayList<>();

    static {
        ServiceLoader.load(Sort.class).iterator().forEachRemaining(sorts::add);
    }

    public static Sort getSort() {
        return sorts.isEmpty() ? null : sorts.get(0);
    }

    public static List<Sort> getAllSorts() {
        return sorts;
    }
}
