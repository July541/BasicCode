#include <iostream>
#include <stdio.h>

using namespace std;

class MyListNode {
public:
    int val;
    MyListNode *next;
};

class MyList {
private:
    MyListNode *root;

public:
    MyList() {
        root = new MyListNode();
        root->next = nullptr;
    }

    void add(int val) {
        MyListNode *lastOne = root;
        while (lastOne->next != nullptr)
            lastOne = lastOne->next;
        MyListNode *p = new MyListNode();
        p->val = val;
        p->next = nullptr;
        lastOne->next = p;
    }

    void print() {
        MyListNode *p = root;
        while (p->next) {
            printf("%d ", p->next->val);
            p = p->next;
        }
        printf("\n");
    }
    
};

int main() {
    MyList l;
    l.add(3);
    l.add(4);
    l.print();
    return 0;
}