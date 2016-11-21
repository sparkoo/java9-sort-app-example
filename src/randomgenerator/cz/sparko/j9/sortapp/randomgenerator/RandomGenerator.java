package cz.sparko.j9.sortapp.randomgenerator;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.IntStream;

public class RandomGenerator {
    private static final Random random = new Random();

    public static List<Integer> generate(int count) {
        List<Integer> numbers = new ArrayList<>();
        IntStream.range(1, count).forEach(i -> numbers.add(random.nextInt()));
        return numbers;
    }
}
