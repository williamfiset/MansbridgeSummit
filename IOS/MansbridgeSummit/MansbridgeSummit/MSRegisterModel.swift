//
//  MSRegisterModel.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-14.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation

// Use to make regex: http://regexr.com/
// Use capture groups instead of nested regex?
let inputBoxRegex = "(<input.*/>)"
let valueTagRegex = "value=\"[^\"]*\""

let page = "http://www.mta.ca/Community/Campus_life/Campus_events/Mansbridge_Summit/Application/Mansbridge_Summit_application_form/"

var postParameters = [
    
    // User input fields
    "Name" : "",
    "E-mail" : "elmo10@gmail.com",
    "Gender" : "",
    "Major_minor" : "",
    "Grad_year" : "",
    "Hometown" : "",
    "Dietary_restrictions" : "",
    "Question1" : "",
    "Question2" : ""
    
]

func matchesForRegexInText(regex: String!, text: String!) -> [String] {
    
    do {
        
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        let results = regex.matchesInString(text, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substringWithRange($0.range)}
        
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

/*
* nth_InputBox    - The position the input box was found in the html file
* value           - the raw html of the value tag (ex: value="hello world" )
* postParameters  - The dictionary of recorded parameters
*/
func populatePostParameters ( let nth_InputBox : Int, var value : String, inout postParameters : Dictionary<String, String> ) {
    
    // Shave off the value="" from the sting
    value = value[ 7..<value.length-1 ]
    
    // The input boxes
    switch nth_InputBox {
        
        // The first input box does not contain a field for the POST request
    case 0: break;
        
        // Ektron hidden inputs
    case 1:  postParameters["EktronClientManager"] = value
    case 2:  postParameters["__VIEWSTATE"] = value
    case 3:  postParameters["__VIEWSTATEGENERATOR"] = value
    case 4:  postParameters["__ekFormId_ctl00_PageContent_FormBlock1"] = value
    case 5:  postParameters["__ekFormState_ctl00_PageContent_FormBlock1"] = "in" // Fails POST request if value happens to be "out" for some unknown reason
    case 6:  postParameters["ApplicationAPI4156"] = value
    case 7:  postParameters["EktFormId"] = value
    case 8:  postParameters["EktFormTitle"] = value
    case 9:  postParameters["EktFormDescription"] = value
    case 10:  postParameters["EktFormLang"] = value
    case 11: postParameters["EktFormPublishDate"] = value
        
    default: break;
        
    }
    
}

func findMSPostParametersAndExecFunc( link : String, var postParameters : Dictionary<String, String> ) {
    
    if let url = NSURL(string: link) {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
            data, response, error in
            
            if error == nil {
                if let data = data {
                    
                    let htmlData = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
                    let inputBoxes = matchesForRegexInText(inputBoxRegex, text: htmlData)
                    
                    for (index, inputBoxHtml) in inputBoxes.enumerate() {
                        
                        let values = matchesForRegexInText(valueTagRegex, text: inputBoxHtml)
                        
                        // Skip empty input boxes without a value
                        if values.count > 0 {
                            
                            // There should only be one value tag per input block, otherwise the regex is probably messed up
                            assert(values.count == 1)
                            let value = values[0]
                            populatePostParameters(index, value: value, postParameters: &postParameters)
                            
                        }
                    }
                    
                    // Once we have collected all the parameters call the next function
                    postRequest(link, postData: postParameters, closure: postRequestCompletion, failureClosure: onRegisterFailure, successClosure: onRegisterSuccess)
                }
            }
        }
        task!.resume()
    }
}

// performs a POST request to a certain link with specified parameters
// The function also requires a closure for when the request completes as well
// as two methods which execute depending on success or failure
func postRequest(
    
    link : String,
    postData : Dictionary<String, String>,
    closure : ( NSData?, NSURLResponse?,  NSError?, (err : NSError?) -> Void, ()->Void  ) -> Void,
    failureClosure : (err : NSError?) -> Void,
    successClosure : () -> Void  ) {
        
    if let url = NSURL(string: link) {
        
        let request = NSMutableURLRequest(URL: url)
        
        request.HTTPMethod = "POST"
        request.setBodyContent(postData)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in closure(data, response, error, failureClosure, successClosure );
        }
        
        if task != nil {
            task!.resume()
        }
        
    }
        
}

// Analyse the reponse given by the post request
func postRequestCompletion(data : NSData?, response : NSURLResponse?,  err : NSError?, failureClosure : (err : NSError?) -> Void, successClosure : () -> Void ) -> Void {
    
    if err == nil {
        if let data = data {
            if let responseString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                
                // If this string in present in the response the response was successful
                if responseString.containsString("Thank you </strong>for filling out the Mansbridge Summit application form") {
                    
                    successClosure()
                    return;
                    
                }
                
            }
        }
    }
    
    failureClosure(err: err)
    
}

func onRegisterSuccess() {
    
    // Show success message to user
    // Give then a nice green checkmark and some text:
    
    // "Thank you for filling out the Mansbridge Summit application form. You will be contacted regarding your application shortly."
    
    print("Success")
    
}

func onRegisterFailure( err : NSError? ) {
    
    // Try to identify the souce of the failure and give user some sort of indication
    
    // 1) Is wifi off?
    // 2) Has the regeristration deadline passed?
    // 3) other
    
    print("Failure")
    
}

























