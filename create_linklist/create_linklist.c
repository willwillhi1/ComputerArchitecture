#include <stdio.h>
#include <stdlib.h>

struct node{
    int val;
    struct node* next;
};

const int nums[] = {1, 0, 3};
const int numsSize = 3;

void create_list(struct node** cur)
{
    for (int i = 0; i < numsSize; ++i) {
        struct node* n = malloc(sizeof(struct node));
        n->val = nums[i];
        n->next = NULL;
        (*cur) = n;
        cur = &((*cur)->next);
    }   
}

void print_list(struct node* head)
{
    struct node* cur = head;
    while (cur) {
        printf("%d ", cur->val);
        cur = cur->next;
    }
    printf("\n");
}

int main()
{
    struct node* head = NULL;
    create_list(&head);
    print_list(head);
    return 0;
}
