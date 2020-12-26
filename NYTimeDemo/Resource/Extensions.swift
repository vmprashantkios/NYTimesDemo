//
//  Extensions.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import Foundation


extension String{
    
    func convertDateString(from:String,to:String)->String?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        
        if let date = dateFormatter.date(from: self){
            
            dateFormatter.dateFormat = to
            
            return dateFormatter.string(from: date)
        }
        
        return nil
        
        
        
    }
}
