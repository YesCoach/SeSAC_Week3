//
//  TodoInformation.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import Foundation

struct TodoInformation {
    var list: [Todo] = [
        Todo(main: "장보기", sub: "23.07.03", like: false, done: false),
        Todo(main: "영화보기", sub: "23.07.30", like: false, done: true),
        Todo(main: "잠자기", sub: "23.07.13", like: true, done: true)
    ]
}
