module sortprovider {
    requires transitive sort;
    exports cz.sparko.j9.sortapp.sortprovider;
    uses cz.sparko.j9.sortapp.sort.Sort;
}