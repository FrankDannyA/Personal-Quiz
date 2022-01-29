//
//  Question.swift
//  Personal Quiz
//
//  Created by Даниил Франк on 29.01.2022.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestion() -> [Question]{
        return [
        Question(text: "Какую пищу вы предпочитаете?",
                 type: .single,
                 answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabit),
                    Answer(text: "Кукуруза", type: .turtle)
                 ]),
        Question(text: "Что вам нравится больше?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabit),
                    Answer(text: "Есть", type: .turtle)
                 ]),
        Question(text: "Любите ли вы поездки на машине?",
                 type: .ranged,
                 answers: [
                    Answer(text: "Ненавижу", type: .dog),
                    Answer(text: "Нервничаю", type: .cat),
                    Answer(text: "Незамечаю", type: .rabit),
                    Answer(text: "Обожаю", type: .turtle)
                 ])
        ]
    }
}
