//
//  PageViewController.swift
//  GestureConflict
//
//  Created by 黑影十三 on 2017/2/22.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit

let cellReusedIdentifier = "Cell"
class PageViewController: UIPageViewController,UITableViewDelegate,UITableViewDataSource,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    let firstTable = UITableView()
    let secondTable = UITableView()
    let thirdTable = UITableView()
    var controllers : Array<UIViewController>? = []
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [UIPageViewControllerOptionInterPageSpacingKey: 20])
    }
    
    init() {
         super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [UIPageViewControllerOptionInterPageSpacingKey: 20])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        firstTable.dataSource = self
        firstTable.delegate = self
        firstTable.frame = view.bounds
        firstTable.tag = 100
        firstTable.backgroundColor = .yellow
        let firstController = UIViewController()
        firstController.view = firstTable
        
        secondTable.dataSource = self
        secondTable.delegate = self
        secondTable.frame = CGRect.init(origin: .init(x: view.bounds.width, y: 0), size: view.bounds.size)
        secondTable.tag = 200
        secondTable.backgroundColor = .brown
        let secondController = UIViewController()
        secondController.view = secondTable
        
        thirdTable.dataSource = self
        thirdTable.delegate = self
        thirdTable.frame = CGRect.init(origin: .init(x: view.bounds.width * 2, y: 0), size: view.bounds.size)
        thirdTable.tag = 300
        thirdTable.backgroundColor = .gray
        let thirdController = UIViewController()
        thirdController.view = thirdTable
        
        controllers?.append(firstController)
        controllers?.append(secondController)
        controllers?.append(thirdController)
        
        self.setViewControllers([(controllers?.first)!], direction: .reverse, animated: true, completion: nil)
        self.delegate = self
        self.dataSource = self
        self.view.backgroundColor = .lightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pageviewcontroller delegate datasource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index : Int = (controllers?.index(of: viewController))!
        if index == 0 || index == NSNotFound {
            return nil
        }
        index -= 1
        return controllers?[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index : Int = (controllers?.index(of: viewController))!
        if index == (controllers?.count)! - 1 || index == NSNotFound {
            return nil
        }
        index += 1
        return controllers?[index]
    }
    
    
    // tableview datasource delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReusedIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReusedIdentifier)
        }
        cell?.textLabel?.text = "cell_\(indexPath.row) of tableview_\(tableView.tag)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }

}
