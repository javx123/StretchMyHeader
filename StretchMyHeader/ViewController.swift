//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Javier Xing on 2017-12-05.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

//Why when the height for the imageview is set lower, more of the tableview is covered, while when it is greater, less of the tableview is covered?
    private let tableViewHeaderHeight: CGFloat = 300.0
    
    var headerView:UIView!

    var newsItems:[NewsItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.estimatedRowHeight = 71
        tableView.rowHeight = UITableViewAutomaticDimension
        self.navigationController?.isNavigationBarHidden = true
        UIApplication.shared.isStatusBarHidden = true
        
        self.headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width,height: tableViewHeaderHeight))
        self.tableView.addSubview(headerView)
        
        let imageView = UIImageView(image: UIImage(named: "image"))
        headerView.addSubview(imageView)
        self.headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        
        let dateLabel:UILabel = UILabel()
        dateLabel.text = dateFormatter.string(from: Date())
        dateLabel.textColor = .white
        dateLabel.frame = CGRect(x: 20, y: 20, width: self.view.frame.width/2, height: 20)
        
        headerView.addSubview(dateLabel)
        headerView.backgroundColor = .black
        headerView.frame = CGRect(x: 0, y: -tableViewHeaderHeight, width: tableView.bounds.width, height: tableViewHeaderHeight)
        self.tableView.contentInset = UIEdgeInsets(top: tableViewHeaderHeight, left: 0, bottom: 0, right: 0)
        self.tableView.contentOffset = CGPoint(x: 0, y: -tableViewHeaderHeight)
        
        updateHeaderView()
        populateTableView()
        
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: -tableViewHeaderHeight, width: tableView.bounds.width, height: tableViewHeaderHeight)
        if tableView.contentOffset.y < -tableViewHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }

    func populateTableView(){
        let newsItem1 = NewsItem(category: .World, headline: "Climate change protests, divestments meet fossil fuels realities")
        let newsItem2 = NewsItem(category: .Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        let newsItem3 = NewsItem(category: .MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let newsItem4 = NewsItem(category: .Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let newsItem5 = NewsItem(category: .AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let newsItem6 = NewsItem(category: .America, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let newsItem7 = NewsItem(category: .World, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let newsItem8 = NewsItem(category: .Europe, headline: "'One million babies' created by EU student exchanges")
        
        self.newsItems = [newsItem1, newsItem2, newsItem3, newsItem4, newsItem5, newsItem6, newsItem7, newsItem8]
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let newsItems = self.newsItems {
            return newsItems.count
        }
        return 0
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "newsCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsTableViewCell else{
             fatalError("The dequeued cell is not an instance of NewsTableViewCell.")
        }
        let newsItem = self.newsItems?[indexPath.row]
        cell.categoryLabel.text = newsItem?.category.simpleDescription()
        cell.categoryLabel.textColor = newsItem?.category.categoryColour()
        
        cell.headLineLabel.text = newsItem?.headline
        
        return cell
    }



}

