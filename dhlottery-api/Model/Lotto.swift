//
//  Lotto.swift
//  dhlottery-api
//
//  Created by junehee on 6/7/24.
//

struct Lotto: Decodable {
    let returnValue: String
    let drwNoDate: String
    let totSellamnt: Int
    let firstWinamnt: Int
    let firstPrzwnerCo: Int
    let firstAccumamnt: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    let drwNo: Int
}

/*
{
    "returnValue": "success",            // 요청결과
    "drwNoDate": "2004-10-30",           // 날짜
    "totSellamnt": 56561977000,          // 총상금액
    "firstWinamnt": 3315315525,          // 1등 상금액
    "firstPrzwnerCo": 4,                 // 1등 당첨인원
    "firstAccumamnt": 0,
    "drwtNo1": 1,                        // 로또번호 1
    "drwtNo2": 7,                        // 로또번호 2
    "drwtNo3": 11,                       // 로또번호 3
    "drwtNo4": 23,                       // 로또번호 4
    "drwtNo5": 37,                       // 로또번호 5
    "drwtNo6": 42,                       // 로또번호 6
    "bnusNo": 6,                         // 로또 보너스 번호
    "drwNo": 100                         // 로또회차
}
 */
