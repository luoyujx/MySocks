//
//  JsonGenerator.swift
//  TriSConfigMac
//
//  Created by Yu Luo on 2018/02/14.
//  Copyright © 2018 Yu Luo. All rights reserved.
//

import Foundation
import Cocoa

let viewcontroller = ViewController()
let port = viewcontroller.port
let password = viewcontroller.password

class JsonGenerator{
    
    var output: String = ""
    
    func fileGenerator(port: String, password: String, path: String){
        let jsonObject = [
            "server": "0.0.0.0",
            "local_port": 1080,
            "port": port,
            "password": password,
            "timeout": 120,
            "method": "aes-256-cfb"
            ] as [String: Any]
        
        if JSONSerialization.isValidJSONObject(jsonObject) {
            if let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: []) {
                
                if var string = String(data: data, encoding: .utf8) {
                    string = string.trimmingCharacters(in: .newlines)
                    output = string
                }
                
                // Set the contents
                let contents = output
                
                do {
                // Write contents to file
                    try contents.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
                }
                
                catch let error as NSError {
                    let errorString =  "wrong: \(error)"
                    let alert = NSAlert()
                    alert.messageText = "Something went wrong"
                    alert.informativeText = errorString
                    alert.alertStyle = .warning
                    alert.runModal()
                    //print("Ooops! Something went wrong: \(error)")
                }
                
                let resultString = "Generation succeed"
                let alert = NSAlert()
                alert.messageText = "Succeed"
                alert.informativeText = resultString
                alert.alertStyle = .warning
                alert.runModal()
                
            }
        }
    }
}
