//
//  BigNumber.swift
//  ProjectEulerSwift
//
//  Created by Furkan Erturk on 16/06/2021.
//  Copyright © 2021 Nuh Furkan Erturk. All rights reserved.
//

import Foundation

class BigNumber {
    var myNumber: [Int] = []
    
    init(newNumber: String) {
        for x in newNumber {
            if let num: Int = x.wholeNumberValue {
                myNumber.append(num)
            } else {
                print("something happened!")
            }
        }
    }
    
    static func + (left: BigNumber, right: BigNumber) -> BigNumber {
        var newNumber: [Int] = []
        let smallNr: Int
        let bigNr: Int
        var carry: Int = 0
        if left.myNumber.count < right.myNumber.count {
            smallNr = left.myNumber.count
            bigNr = right.myNumber.count
            for x in 1...left.myNumber.count {
                let temp = right.myNumber[right.myNumber.count-x] + left.myNumber[left.myNumber.count-x]+carry
                newNumber.insert((temp%10), at: 0)
                carry = temp/10
            }
            if smallNr != bigNr {
                for m in smallNr+1...bigNr {
                    let temp = right.myNumber[right.myNumber.count-m]+carry
                    newNumber.insert((temp%10), at: 0)
                    carry = temp/10
                }
            }
            
            
            // 99
            // 9999
        } else {
            smallNr = right.myNumber.count
            bigNr = left.myNumber.count
            for x in 1...right.myNumber.count {
                let temp = right.myNumber[right.myNumber.count-x] + left.myNumber[left.myNumber.count-x]+carry
                newNumber.insert((temp%10), at: 0)
                carry = temp/10
            }
            if smallNr != bigNr {
                for m in smallNr+1...bigNr {
                    let temp = left.myNumber[left.myNumber.count-m]+carry
                    newNumber.insert((temp%10), at: 0)
                    carry = temp/10
                }
            }
        }
        if carry != 0 {
            //print("carry = \(carry)")
            newNumber.insert(carry, at: 0)
        }
        var num: String = ""
        for x in newNumber {
            num.append(String(x))
        }
        return BigNumber(newNumber: num)
    }
    
    func toString() -> String {
        var num: String = ""
        for x in myNumber {
            num.append(String(x))
        }
        return num
    }
}
