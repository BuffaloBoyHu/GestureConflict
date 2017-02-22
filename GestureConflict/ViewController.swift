//
//  ViewController.swift
//  GestureConflict
//
//  Created by HLH on 2017/2/21.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit

let cellIdentifier = "CellReuseIdentifier"
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {
  
    let tableView : UITableView = UITableView()
    let contentArray : Array<String> = ["scrollview + tableview","pageview + tableview","scrollview + imageview"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
    }
    
    func initalize() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: datatsource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = contentArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let scrollController = ScrollViewController()
            self.navigationController?.pushViewController(scrollController, animated: true)
        case 1:
            let pageController = PageViewController()
            self.navigationController?.pushViewController(pageController, animated: true)
        case 2:
            let imageController = ImageViewController()
            self.navigationController?.pushViewController(imageController, animated: true)
        default:
            break
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView != tableView {
            let offset = scrollView.contentOffset.x
            let page = Int((offset + view.bounds.width / 2) / view.bounds.width)
            scrollView.setContentOffset(.init(x: CGFloat(page) * view.bounds.width, y: 0), animated: false)
        }
        
    }


}

