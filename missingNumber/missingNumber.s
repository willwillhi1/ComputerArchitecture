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
    la     a0, nums         # a0 = nums[];  // array
    lw     a1, numsSize     # a1 = numsSize;     // length of the array
    jal    ra, missingNumber   # Function call

    # a0 is the return value and also the value we want to print
    li     a7, 1            # print a0
    ecall
    li     a0, 0            # return 0
    li     a7, 10           # Exit code
    ecall                   
    
missingNumber:
    addi   s0, a1, 0        # s0 = ans
    addi   s1, x0, 0        # s1 = i
    bgeu   s1, a1, exit     # i < numsSize
    loop:
        slli   t0, s1, 2    # t0 = i*4
        add    t0, a0, t0   # t0 = nums + i*4
        lw     t0, (0)t0    # t0 = nums[i]
        #nop
        xor    t0, t0, s1   # t0 = i XOR num[i]
        xor    s0, s0, t0   # ans = ans XOR t0
        addi   s1, s1, 1    # ++i
        bgeu   s1, a1, exit # i < numsSize
        j      loop
exit:
    mv     a0, s0           # return value = ans
    ret
