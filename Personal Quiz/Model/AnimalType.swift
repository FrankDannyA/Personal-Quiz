//
//  AnimalType.swift
//  Personal Quiz
//
//  Created by Даниил Франк on 29.01.2022.
//

import Foundation

enum AnimalType: String{
    case dog = "🐶"
    case cat = "🐱"
    case rabit = "🐰"
    case turtle = "🐢"
    
    var divinition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда вы готовы помочь!"
        case .cat:
            return "Вы себе на уме. Вы любите гулять сами по себе. Вы цените одиночество."
        case .rabit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила в мудрости. Медленный и вдумчивый вы выигрываете на дальних дистанциях."
        }
    }
}
