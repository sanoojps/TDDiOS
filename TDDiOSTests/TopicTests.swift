//
//  TopicTests.swift
//  TDDiOSTests
//
//  Created by sanooj on 11/12/17.
//  Copyright © 2017 sanooj. All rights reserved.
//

import XCTest
@testable import TDDiOS

class TopicTests: XCTestCase {
    
    static var topicName =
    "iPhone"
    
    static var tagName =
    "iphone"
    
    var topic: Topic! =
    nil
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.topic =
            { (topicName,tagName) in
                let topic =
                    Topic.init(
                        withName: topicName,
                        tag: tagName
                )
                
                return topic
            }(TopicTests.topicName,
              TopicTests.tagName)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        self.topic =
        nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


extension TopicTests
{
    //test for existence of Model Class
    func testThatTopicExists()
    {
        //        let newTopic:Topic =
        //        Topic.init(withName: TopicTests.topicName, tag: TopicTests.tagName)
        
        XCTAssertNotNil(self.topic, "should be able to cretae a Topic instance")
    }
    
    func testThatTopicCanBeNamed()
    {
        //        let topicName =
        //        TopicTests.topicName
        //
        //        let namedTopic =
        //            Topic.init(withName:topicName, tag: TopicTests.tagName)
        
        XCTAssertEqual(
            self.topic?.name,
            TopicTests.topicName,
            "should have the same name as given")
    }
    
    func testThatTopicHasATag()
    {
        XCTAssertEqual(
            self.topic?.tag,
            TopicTests.tagName,
            "should have the same tag name as given")
    }
}


extension TopicTests
{
    func testForAListOfQuestions()
    {
        guard let topic = self.topic else
        {
            XCTAssertNotNil(self.topic)
            return
        }
        
        XCTAssertTrue(type(of:topic.recentQuestions()) == Array<Question>.self, "Topics should provide a lits of recentQuestions" )
    }
}


extension TopicTests
{
    func testForInitallyEmptyQuestionList()
    {
        XCTAssertEqual(topic.recentQuestions().count, 0, "No question added yet, Count should be zero")
    }
    
    func testAddingQuestionToList()
    {
        let question: Question =
            Question.init()
        
        self.topic.addQuestion(question: question)
        
        XCTAssertEqual(topic.recentQuestions().count, 1, "Add a question , could of Questions should go up")
    }
    
    func testQuestionsAreListedChronologically()
    {
        let question_one: Question =
            Question()
        
        question_one.date =
            Date.distantPast
        
        let question_two: Question =
            Question()
        
        question_two.date =
            Date.distantFuture
        
        self.topic.addQuestion(question: question_one)
        self.topic.addQuestion(question: question_two)
        
        let questions :[Question] =
            self.topic.recentQuestions()
        
        let question_list_first: Question =
            questions[0]
        
        let question_list_second: Question =
            questions[1]
        
        XCTAssertEqual(
            question_list_first.date,
            question_one.date,
            "The later question should appear first in the list"
        )
    }
}
