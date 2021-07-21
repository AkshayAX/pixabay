//
//  download.swift
//  pixabay
//
//  Created by Akshaya Kumar N on 1/9/21.
//

import Foundation
import Alamofire

class dwnldimage:ObservableObject
{
    @Published var model:[immodel] = []
    
    init() {
        downloadImages(categ: categ ?? namArray[0])
    }
    
    func  downloadImages(categ:String)
    {
        
        
        
        
        var arraylast = [String]()
        
        AF.request("https://pixabay.com/api/?key=\(key)&category=\(categ)").response
        {
            response in
            
            
            if (response.error != nil) && (response.data == nil)
            {
                return
            }
            
            let result = try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String:Any]
            
            
            
            
            let result1 = result!["hits"] as! NSArray
            
            
            self.model = []
            
            for  i in 0..<result1.count
            {
                
                let result2 = result1[i] as! [String:Any]
                
                let result3 = result2["largeImageURL"]
                arraylast.append(result3 as! String)
                
            }
            self.model.append(immodel(img: arraylast))
            
        }
    }
}
