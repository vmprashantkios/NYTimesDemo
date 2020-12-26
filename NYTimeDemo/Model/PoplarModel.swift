//
//  PoplarModel.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import Foundation


struct PopularModelResult:Codable{
    
    let status:String?
    let result:[PopularItem]?
    let fault:Fault?
    
    
    enum CodingKeys: String, CodingKey {
            case status = "status"
            case result = "results"
            case fault = "fault"
           
        }
    
}

struct Fault:Codable {
    
    let faultstring:String?
}

struct PopularItem : Codable{
    let uri:String?
    let url: String?
    let id:Int?
    let source:String?
    let published_date:String?
    let byline:String?
    let title:String?
    let type:String?
    let abstract:String?
    let media:[Media]?
}


struct Media: Codable {
    
    let type:String?
    let subtype:String?
    let caption:String?
    let metadata:[MediaData]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case metadata = "media-metadata"
    }
}


struct MediaData: Codable{
    let url:String?
    let format:String?
    let height:Double?
    let width:Double?
}
