//
//  Array.h
//  Data Structures and AAlgorithms
//
//  Created by Furkan Erturk on 02/07/2021.
//  Copyright © 2021 Nuh Furkan Erturk. All rights reserved.
//

#ifndef Array_h
#define Array_h

using namespace std;

template <typename T>
void printArr(T *arr, int begin, int end) {
    for (int l = begin; l < end; l++) {
        cout << *(arr+l) << " ";
    }
    
    cout << endl;
}

template <typename T>
void swapPtr(T* first, T* second) {
    T temp = *first;
    *first = *second;
    *second = temp;
}


#endif /* Array_h */
