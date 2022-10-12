/**
 * 268. Missing Number
 * Given an array nums containing n distinct numbers in the range [0, n], 
 * return the only number in the range that is missing from the array.
 * Return the minimum number of patches required.
 * 
 * Thought:
 * 1. Because we know that nums array contains n numbers and that it is missing exactly one number on the range [0..n−1].
 * 2. we know that n definitely replaces the missing number in nums. 
 * 3. Therefore, if we initialize an integer to n and XOR it with every index and value, we will be left with the missing number.
 */

#include<stdio.h>

int missingNumber(const int*, const int);

int main()
{
    const int nums[] = {3, 0, 1};
    const int numsSize = 3;
    printf("%d\n", missingNumber(nums, numsSize));
    return 0;
}

int missingNumber(const int* nums, const int numsSize)
{
    int ans = numsSize;
    for (int i = 0; i < numsSize; ++i) {
        ans ^= i ^ nums[i];
    }
    return ans;
}
