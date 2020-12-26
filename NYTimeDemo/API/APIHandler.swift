//
//  APIHandler.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import Foundation
import Alamofire



class APIHandler{
    
    
    static let shared = APIHandler()
    
    func getData(url:String,parameter:[String:Any]?,success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error?)->()){
        
        
        
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                   method: .get,
                   parameters: parameter,
                   encoding: JSONEncoding.default,
                   headers: nil).responseJSON { (response) in
                    
                    
                    
                    switch response.result{
                                        
                    case .success(_):
                        
                        let statusCode = response.response?.statusCode
                        
                        let validateCode = self.Validate(statusCode:statusCode ?? 0)
                        
                        if validateCode.0{
                            
                            if let data = response.data {
                                success(data)
                            } else{
                                
                                failure(APIError.Unkown)
                            }
                            
                        }
                        else{
                            
                            failure(validateCode.1)
                        }
                        
                        
                        
                        break
                        
                    case .failure(let error):
                        failure(error)
                        
                    }
                   }
        
    }
    
    
    private func Validate(statusCode code:Int)->(Bool,Error?){
        
        switch code {
        case 200...299:
            return (true,nil)
        case 401: return (true,APIError.UnAutherised)
        case 400...499:
            return (false,APIError.NotFound)
        case 500...599:
            return (false,APIError.NotFound)
        default:
            return (false,APIError.Unkown)
        }
    }
    
}




class ApiDataHandler{
    
  class  func parseData<T:Codable>(model:T.Type,data:Data)->T?{
        
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
                return response
            return response
             }catch let error as NSError{
                 return nil
             }
         }
    }
