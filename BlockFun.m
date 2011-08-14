#import <Foundation/Foundation.h>
#include <stdio.h>

typedef BOOL (^isMultipleOfNBlk_t)(int);

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    int n = 3;
    isMultipleOfNBlk_t isMultipleOfThree = ^BOOL(int value){return (value % n == 0);};

    for (int ii=0; ii < 10; ii++) {
        if (isMultipleOfThree(ii)) {
            printf("So %d is a multiple of 3. n is now %d\n", ii, n);
            n++;
        }
    }
    printf("after first loop, n is now %d.\n", n);

    isMultipleOfNBlk_t isMultipleOfSomething = ^BOOL(int value){return (value % n == 0);};

    for (int ii=0; ii < 20; ii++) {
        if (isMultipleOfSomething(ii)) {
            printf("it turns out %d is actually a multiple of %d\n", ii, n);
        }
    }

    [pool drain];
    return 0;
}

