//
//  SelectionSort.h
//  Data Structures and AAlgorithms
//
//  Created by Furkan Erturk on 02/07/2021.
//  Copyright © 2021 Nuh Furkan Erturk. All rights reserved.
//

#ifndef SelectionSort_h
#define SelectionSort_h
#define MIN -1000000
#include "Array.h"

using namespace std;

template <typename T>
T* selectionSort(T* arr, int begin, int end) {
    for (; begin < end; begin++) {
        int bgn = begin;
        while (bgn >= 0) {
            if (*(arr+bgn) > *(arr+begin)) {
                swapPtr((arr+bgn), (arr+begin));
            }
            bgn--;
        }
    }
    return arr;
}

#endif /* SelectionSort_h */
