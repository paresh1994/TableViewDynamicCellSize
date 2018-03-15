//
//  ViewController.swift
//  DynamicCellSize
//
//  Created by iDeveloper2 on 14/03/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import UIKit

class DataModel {
    let title:String
    let subtitle:String
    
    init(title:String, subtitle:String) {
        self.title = title
        self.subtitle = subtitle
    }
}

class ViewController: UIViewController {

    static let cellIdentifier = "textCell"
    @IBOutlet weak var tabelView: UITableView!
    var dataModel = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Self size cell"
    
        // iOS 11 tableview cell size default self-sizing, so do not required to set, if not iOS 11 uncomment below two line
        
        /*self.tabelView.estimatedRowHeight = 44
        self.tabelView.rowHeight = UITableViewAutomaticDimension*/
        
        self.dataModel = [
            DataModel(title: "SwiftThe Basics", subtitle: "Swift is a new programming language for iOS, macOS, watchOS, and tvOS app development. Nonetheless, many parts of Swift will be familiar from your experience of developing in C and Objective-C. "),
            DataModel(title: "Basic Operators", subtitle: "An operator is a special symbol or phrase that you use to check, change, or combine values. For example, the addition operator (+) adds two numbers, as in let i = 1 + 2, and the logical AND operator (&&) combines two Boolean values, as in if enteredDoorCode && passedRetinaScan. "),
            DataModel(title: "Strings and Characters", subtitle: "A string is a series of characters, such as hello, world or albatross."),
            DataModel(title: "Collection Types", subtitle: "Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values. Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associations. "),
            DataModel(title: "Control Flow", subtitle: "Swift provides a variety of control flow statements. These include while loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code. "),
            DataModel(title: "Functions", subtitle: "Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed. ")
        ]
        
        self.tabelView.delegate = self
        self.tabelView.dataSource = self
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableview delegate and datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellIdentifier, for: indexPath) as! CustomCell
        
        // Do not forgot label number of lines as 0, default is 1
        cell.labelTitle.numberOfLines = 0
        cell.labelSubTitle.numberOfLines = 0
        
        let data = self.dataModel[indexPath.row]
        cell.labelTitle.text = data.title
        cell.labelSubTitle.text = data.subtitle
        
        return cell
    }
    
    
}
