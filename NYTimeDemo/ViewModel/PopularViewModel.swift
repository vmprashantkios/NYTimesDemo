//
//  PopularViewModel.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import Foundation


class PopularViewModel{
    
    
    private var popularItemArray:[PopularItem]?
    
    
    func getPopularItems(completion:@escaping(Bool,String?)->()){
        
        APIHandler.shared.getData(url:ApiConstant.popular, parameter: nil) { (data) in
            
            
            let result = ApiDataHandler.parseData(model: PopularModelResult.self, data: data)
            print(result)
            
            if let fault = result?.fault{
                
                completion(false,fault.faultstring)
                
            }
            
            else if let itemArray = result?.result{
                
                
                self.popularItemArray = itemArray
                completion(true,nil)
            }
            
           
            
            
        } failure: { (error) in
            print(error)
            completion(false,error?.localizedDescription)
        }

        
    }
    
    
    func getItemsCount()->Int{
        
        return popularItemArray?.count ?? 0
    }
    
    
    func getTitle(forIndex index:Int)->String?{
        
        return popularItemArray?[index].title
    }
    
    func getAbstract(forIndex index:Int)->String?{
        
        return popularItemArray?[index].abstract
    }
    
    func getSource(forIndex index:Int)->String?{
        
        return popularItemArray?[index].source
    }
    
    func getDate(forIndex index:Int)->String?{
        
        return popularItemArray?[index].published_date
    }
    
    func getImage(forIndex index:Int)->String?{
        
        return popularItemArray?[index].media?.first?.metadata?.last?.url
    }
    
    
    func getByLine(forIndex index:Int)->String?{
        
        return popularItemArray?[index].byline
    }
    
    func getCaption(forIndex index:Int)->String?{
        
        return popularItemArray?[index].media?.first?.caption
    }
    
    func getImageDimenssion(forIndex index:Int)->(Double?,Double?){
        
        return (popularItemArray?[index].media?.first?.metadata?.last?.width,popularItemArray?[index].media?.first?.metadata?.last?.height)
    }
    
}

    

