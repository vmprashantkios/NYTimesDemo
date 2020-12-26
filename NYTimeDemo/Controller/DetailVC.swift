//
//  DetailVC.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblCaption: UILabel!
    @IBOutlet weak var lblWriter: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgViewHeightConstraints: NSLayoutConstraint!
    
    
    var popularVM:PopularViewModel?
    var selectedIndex:Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setData()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func setData(){
        
        guard let popularVM = popularVM,let selectedIndex = selectedIndex else{return}
        lblTitle.text = popularVM.getTitle(forIndex: selectedIndex)
        lblDetail.text = popularVM.getAbstract(forIndex: selectedIndex)
        lblCaption.text = popularVM.getCaption(forIndex: selectedIndex)
        lblWriter.text = popularVM.getByLine(forIndex: selectedIndex)
        lblDate.text = popularVM.getDate(forIndex: selectedIndex)?.convertDateString(from: DateFormateType.yyyy_MM_dd.rawValue, to: DateFormateType.EEEE_dd_yyyy.rawValue)
        
        if let url = URL(string:popularVM.getImage(forIndex: selectedIndex) ?? ""){
            
            imgView.kf.setImage(with: url)
        }
        
         let (width,height) = popularVM.getImageDimenssion(forIndex: selectedIndex)
        
        if let width = width, let height = height{
        
        let aspectHeight = (imgView.frame.width * CGFloat(height))/CGFloat(width)
            
            imgViewHeightConstraints.constant = aspectHeight
            
        }
        
    }
   

}
