//
//  ServerIO.swift
//  TriSConfigMac
//
//  Created by Yu Luo on 2018/02/13.
//  Copyright © 2018 Yu Luo. All rights reserved.
//

import Foundation
import Cocoa

class ServerIO{
    
    //func runCommand(cmd : String, args : String...) -> (output: String, status: Int32, exitCode: Any?) {
        
        //var output : String = ""
        
        //let task = Process()
        //task.launchPath = cmd
        //task.arguments = args
        
        //let outpipe = Pipe()
        //task.standardOutput = outpipe
        //let errpipe = Pipe()
        //task.standardError = errpipe
        
        //task.launch()
        
        //let outdata = outpipe.fileHandleForReading.readDataToEndOfFile()
        //if var string = String(data: outdata, encoding: .utf8) {
            //string = string.trimmingCharacters(in: .newlines)
            //output = string
        //}
        
        //task.waitUntilExit()
        //let status = task.terminationStatus
        //let exitCode = task.standardError
        
        //return (output, status, exitCode)
    //}
    
    func runCommand(cmd : String, args : String...) -> (output: String, error: String, exitCode: Int32) {
        
        var output : String = ""
        var error : String = ""
        
        let task = Process()
        task.launchPath = cmd
        task.arguments = args
        
        let outpipe = Pipe()
        task.standardOutput = outpipe
        let errpipe = Pipe()
        task.standardError = errpipe
        
        task.launch()
        
        let outdata = outpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String(data: outdata, encoding: .utf8) {
            string = string.trimmingCharacters(in: .newlines)
            output = string
        }
        
        let errdata = errpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String(data: errdata, encoding: .utf8) {
            string = string.trimmingCharacters(in: .newlines)
            error = string
        }
        
        task.waitUntilExit()
        let status = task.terminationStatus
        
        return (output, error, status)
    }
    
    func alert(message: String, information0: String, information1: Int32) {
        let alert = NSAlert()
        alert.messageText = message
        alert.informativeText = "\(information0)\(information1)"
        alert.alertStyle = .warning
        alert.runModal()
        
   
    //let programpath = "/usr/bin/ssh"
    //let argument1 = "-i /Users/luoyu/.ssh/id_rsa"
    //let argument2 = "root@144.202.100.148"
    //let argument3 = "sudo apt update"
    //let (output, error, status) = runCommand(cmd: (programpath), args: (argument1), (argument2), (argument3))
    ///Users/yuluo/Desktop/SSHCon.sh
    
}
    
}


