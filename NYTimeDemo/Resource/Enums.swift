//
//  Enums.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import Foundation

enum DateFormateType:String{
    
    case EEEE_dd_yyyy = "EEEE dd,yyyy"
    case yyyy_MM_dd = "yyyy-MM-dd"
}


enum APIError:Error{
    
    case NoInternetConnection
    case UnAutherised
    case NotFound
    case ServerError
    case Unkown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .UnAutherised : return "UnAutherised"
            case .NoInternetConnection: return "No internet connection"
            case .NotFound: return "Error 404"
            case .ServerError: return "Server Error"
            case .Unkown: return "Something went wrong"
    }
}
}

