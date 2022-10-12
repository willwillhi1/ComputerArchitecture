.data
nums:    .word 3, 0, 1
numsSize:    .word 3

.text
#include<stdio.h>
#
#int missingNumber(const int*, const int);
#
#int main()
#{
#    const int nums[] = {3, 0, 1};
#    const int numsSize = 3;
#    printf("%d\n", missingNumber(nums, numsSize));
#    return 0;
#}
#
#int missingNumber(const int* nums, const int numsSize)
#{
#    int ans = numsSize;
#    for (int i = 0; i < numsSize; ++i) {
#        ans ^= i ^ nums[i];
#    }
#    return ans;
#}

main:
    la     a0, nums         # s1 = nums[];  // array
    lw     a1, numsSize     # s2 = numsSize;     // length of the array
    jal    ra, missingNumber   # Function call

    # a0 is the return value and also the value we want to print
    li     a7, 1            # print a0
    ecall
    li     a0, 0            # return 0
    li     a7, 10           # Exit code
    ecall                   
    
missingNumber:
    addi   s0, x0, 1        # s0 = m
    addi   s1, x0, 0        # s1 = res
    addi   s2, x0, 0        # s2 = i
    bltu   a2, s0, exit     # m < n
    loop:
        slli   t0, s2, 2    # i*4
        add    t0, a0, t0   # nums + i*4
        lw     t0, (0)t0    # t0 = nums[i]
        bge    s2, a1, else # i >= numsSize
        bltu   s0, t0, else # m < nums[i]
        addi   s2, s2, 1    # ++i
        j      done         # jump out of if-else statement
        else:
        addi   s1, s1, 1    # ++res
        mv     t0, s0       # t0 = m
        done:
        add    s0, s0, t0   # m += nums[i] or m
        bgeu   a2, s0, loop # n <= m
exit:
    mv     a0, s1           # return value = res
    ret
