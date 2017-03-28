//
//  ColorController.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import UIKit

class ColorController: UITableViewController {

    
        var cores: [Cor]?
//    fileprivate var corSction : CoresSction?
    fileprivate var coresSction = [CoresSction]()
    fileprivate var service = CorService()

    private let sectionHeight = CGFloat(40)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadContent()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func downloadContent() {
        
        service.getApplication(
            success: {
                cor in
                self.coresSction = cor
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
    
        return coresSction.count
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let x = CGFloat(10)
        let section_ = section
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: sectionHeight))
        header.backgroundColor = .white
        
        let title = UILabel(frame: CGRect(x: x, y: 0, width: view.frame.width - (x * 2), height: header.bounds.height))
        title.text = coresSction[section_].coresSction
        title.textColor = UIColor.darkGray
        
        header.addSubview(title)
        
        return header
    }

    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as! ColorCell
        let cores = self.cores?[indexPath.row]
        
        if let title = cores?.cor {
            cell.setup(title: title)
        }
        return cell
    }
}



