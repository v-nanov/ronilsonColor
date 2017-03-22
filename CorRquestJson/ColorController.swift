//
//  ColorController.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import UIKit

class ColorController: UITableViewController {
    
    fileprivate var cores = [Cor]()
    fileprivate var corSction : CoresSction?
    fileprivate var corD = [CoresSction]()
    fileprivate var service = CorService()
    private let optionsCellIdentifier = "optionsCell"
    private let sectionHeight = CGFloat(40)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: optionsCellIdentifier)
        tableView.tableFooterView = UIView()
        self.downloadContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func downloadContent() {
        
        service.getApplication(
            success: {
                cor in
                self.corD = cor
                self.tableView.reloadData()
                print("json:\(cor)")
                
        }, fail: {
            failure in
            
            print(failure)
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let corSction = self.corSction else { return 0 }
        
        return corSction.cores.count
    }
    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: sectionHeight))
        header.backgroundColor = UIColor.white
        
        let title = UILabel(frame: CGRect(x: 20, y: 0, width: header.bounds.width - 40, height: header.bounds.height))
        title.text = corSction?.coresTitle
        title.font = UIFont(name: "RobotoCondensed-Bold", size: 20)
        title.textColor = UIColor.darkGray
        
        header.addSubview(title)
        
        return header
    }
    
    internal override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let corSction = self.corSction else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: optionsCellIdentifier, for: indexPath)
        cell.textLabel?.font = UIFont(name: "RobotoCondensed", size: 18)
        cell.textLabel?.textColor = .darkGray
        cell.textLabel?.text = corSction.cores[indexPath.row].cor
        
        return cell
    }    
}



