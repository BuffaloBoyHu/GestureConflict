//
//  ScrollViewController.swift
//  GestureConflict
//
//  Created by 黑影十三 on 2017/2/21.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit

let Identifier = "cellIdentifier"

class ScrollViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UIGestureRecognizerDelegate {

    let scrollView = UIScrollView()
    let firstTable = UITableView()
    let secondTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initialize() {
        firstTable.dataSource = self
        firstTable.delegate = self
        firstTable.frame = view.bounds
        firstTable.tag = 100
        firstTable.backgroundColor = .yellow
        
        secondTable.dataSource = self
        secondTable.delegate = self
        secondTable.frame = CGRect.init(origin: .init(x: view.bounds.width, y: 0), size: view.bounds.size)
        secondTable.tag = 200
        secondTable.backgroundColor = .brown
        
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.contentSize = CGSize.init(width: view.bounds.width * 2, height: view.bounds.height)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.frame = view.bounds
        scrollView.isPagingEnabled = true
        scrollView.delegate = self.navigationController?.topViewController as! UIScrollViewDelegate?
//        scrollView.delegate = self
        
        scrollView.addSubview(firstTable)
        scrollView.addSubview(secondTable)
        view.addSubview(scrollView)
        
        
    }
    
    //MARK: tableview delegate datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: Identifier)
        }
        cell?.textLabel?.text = "Cell_\(indexPath.row) of tableView_\(tableView.tag)"
        cell?.backgroundColor = .clear
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
    
    //MARK: scrollview delegate
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        firstTable.isScrollEnabled = false
//        secondTable.isScrollEnabled = false
//        if scrollView == self.scrollView || fabs(scrollView.contentOffset.x) > fabs(scrollView.contentOffset.y) {
//            let offset = scrollView.contentOffset.x
//            let page = Int((offset + view.bounds.width / 2) / view.bounds.width)
//            self.scrollView.setContentOffset(.init(x: CGFloat(page) * view.bounds.width, y: 0), animated: false)
//        }
//      
//        
//    }
    
    

}
