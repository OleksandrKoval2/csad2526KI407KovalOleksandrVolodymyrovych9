#include "gtest/gtest.h"
#include "math_operations.h"

// Додавання двох позитивних чисел
TEST(AdditionTests, PositiveNumbers) {
    EXPECT_EQ(add(2, 3), 5);
    EXPECT_EQ(add(10, 20), 30);
}

// Додавання від'ємних чисел
TEST(AdditionTests, NegativeNumbers) {
    EXPECT_EQ(add(-2, -3), -5);
    EXPECT_EQ(add(-10, -20), -30);
}

// Додавання нуля
TEST(AdditionTests, AddZero) {
    EXPECT_EQ(add(5, 0), 5);
    EXPECT_EQ(add(0, -5), -5);
}

// Додавання великого числа
TEST(AdditionTests, LargeNumbers) {
    EXPECT_EQ(add(1000000, 2000000), 3000000);
}

// NOTE: main() is provided by GTest's gtest_main. No main() here.
