package cz.sparko.j9.sortapp.randomgenerator;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class RandomGenerator {
    private static final Random random = new Random();

    public static List<Integer> generate(int count) {
        return IntStream.range(0, count)
                .mapToObj(i -> random.nextInt())
                .collect(Collectors.toList());
    }
}
