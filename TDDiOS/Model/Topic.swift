//
//  Topic.swift
//  TDDiOS
//
//  Created by sanooj on 11/12/17.
//  Copyright © 2017 sanooj. All rights reserved.
//

import Foundation

class Topic
{
    var name:String
    var tag: String
    
    var questions: Array<Question> =
    []
    
    /*
     were added for designing tests
     */
    
    /*
    //convenience init
    convenience init()
    {
        self.init(withName: "", tag: "")
    }
    
    //adding initializer
    convenience init(withName name:String)
    {
        self.init(withName: name, tag: "")
    }
    */
    
    
    init(withName name: String, tag: String)
    {
        self.name =
        name
        
        self.tag =
        tag
    }
    
    
}


extension Topic
{
    func addQuestion(question:Question)
    {
        self.questions.append(question)
    }
    
    func recentQuestions() -> [Question]
    {
        return self.questions.sorted(by: { (lhs:Question, rhs:Question ) -> Bool in
            
            if lhs.date > rhs.date
            {
                return false
            }
            
            return true
        })
    }
}
