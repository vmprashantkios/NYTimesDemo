//
//  ViewController.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {
    
    @IBOutlet weak var tblViewItem:UITableView!
    
    let popularVM = PopularViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblViewItem.dataSource = self
        tblViewItem.delegate = self
        
        getPopularItems()
    }

    
    func getPopularItems(){
        
        popularVM.getPopularItems {[weak self](success,errorMsg) in
            
            if let msg = errorMsg{
                
                print(msg)
            }
            self?.tblViewItem.reloadData()
        }
        
    }

}


extension ViewController:UITableViewDataSource,UITableViewDelegate{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return popularVM.getItemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblViewItem.dequeueReusableCell(withIdentifier: "PoplularItemCell") as! PoplularItemCell
        
        cell.lblTitle.text = popularVM.getTitle(forIndex: indexPath.row)
        cell.lblSubTitle.text = popularVM.getAbstract(forIndex: indexPath.row)
        cell.lblSource.text = popularVM.getSource(forIndex: indexPath.row)
        
        cell.lblDate.text = popularVM.getDate(forIndex: indexPath.row)
        
        if let imageURL = URL(string:popularVM.getImage(forIndex: indexPath.row) ?? ""){
            cell.imgView.kf.indicatorType = .activity
            cell.imgView.kf.setImage(with: imageURL)
        } else{
            
            cell.imgView.image = nil
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        vc.popularVM = popularVM
        vc.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
}


class PoplularItemCell:UITableViewCell{
    
    @IBOutlet weak var  lblTitle:UILabel!
    @IBOutlet weak var  lblSubTitle:UILabel!
    @IBOutlet weak var  lblDate:UILabel!
    @IBOutlet weak var  lblSource:UILabel!
    @IBOutlet weak var  imgView:UIImageView!
    
    
}

