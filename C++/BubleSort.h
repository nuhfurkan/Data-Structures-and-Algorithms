//
//  BubleSort.h
//  Data Structures and AAlgorithms
//
//  Created by Furkan Erturk on 02/07/2021.
//  Copyright © 2021 Nuh Furkan Erturk. All rights reserved.
//

#ifndef BubleSort_h
#define BubleSort_h
#include "Array.h"

template <typename T>
T* BubleSort(T* arr, int begin, int end) {
    for (; begin < end-1; begin++) {
        for (int bgn = begin; bgn < end-1; bgn++) {
            if (*(arr+bgn) > *(arr+bgn+1)) {
                swapPtr((arr+bgn), (arr+bgn+1));
            }
        }
    }
    return arr;
}

template <typename T>
T* RecursiveBubleSort(T* arr, int begin, int end) {
    if (begin == end) {
        return arr;
    } else {
        arr = RecursiveBubleSort(arr, begin+1, end);
    }
    
    for (; begin < end-1; begin++) {
        if (*(arr+begin) > *(arr+begin+1)) {
            swapPtr((arr+begin), (arr+begin+1));
        }
    }
    return arr;
}



#endif /* BubleSort_h */
