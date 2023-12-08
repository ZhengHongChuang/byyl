#include<iostream>
#include<cstring>

using namespace std;

char stack[30]; // 定义字符栈
int top = -1; // 栈顶指针初始化为-1

// 将字符压入栈中的函数
void push(char c) {
    top++;
    stack[top] = c;
}

// 从栈中弹出字符的函数
char pop() {
    char c;
    if (top != -1) {
        c = stack[top];
        top--;
        return c;
    }
    return 'x'; // 如果栈为空，返回特殊字符'x'
}

// 打印栈中内容的函数
void printstat() {
    int i;
    printf("\n\t\t\t $");
    for (i = 0; i <= top; i++) printf("%c", stack[i]);
}

int main(int argc, char *argv[]) {
    int i, j, k, l;
    char s1[20], s2[20], ch1, ch2, ch3;

    printf("\n\n\t\t LR PARSING");
    printf("\n\t\t 输入表达式:");
    scanf("%s", s1);
    l = strlen(s1);
    j = 0;
    printf("\n\t\t $");
    for (i = 0; i < l; i++) {
        if (s1[i] == 'i' && s1[i + 1] == 'd') { // 如果遇到'id'字符串
            s1[i] = ' '; // 替换'i'为' '
            s1[i + 1] = 'E'; // 替换'd'为'E'
            printstat(); // 打印当前栈状态
            printf("id"); // 打印'id'
            push('E'); // 将'E'压入栈
            printstat(); // 打印当前栈状态
        } else if (s1[i] == '+' || s1[i] == '-' || s1[i] == '*' || s1[i] == '/' || s1[i] == 'd') {
            push(s1[i]); // 将运算符或'd'压入栈
            printstat(); // 打印当前栈状态
        }
    }
    printstat(); // 打印最终栈状态
//    l = strlen(s2);
    while (1) {
        ch1 = pop(); // 从栈中弹出字符
        if (ch1 == 'x') {
            printf("\n\t\t\t $\n"); // 如果栈为空，打印提示
            break;
        }
        if (ch1 == '+' || ch1 == '/' || ch1 == '*' || ch1 == '-') {
            ch3 = pop(); // 从栈中弹出字符
            if (ch3 != 'E') {
                printf("errror"); // 如果不符合条件，打印错误
                exit(0); // 退出程序
            } else {
                push('E'); // 将'E'压入栈
                printstat(); // 打印当前栈状态
            }
        }
//        ch2 = ch1;
    }
    return 0;
}
