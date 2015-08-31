//
//  ViewController.swift
//  webView
//
//  Created by 卢伟斌 on 15/8/28.
//  Copyright © 2015年 webview.dyqfcl.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate,UITextFieldDelegate {
    



    @IBOutlet weak var urlInput: UITextField!
    
    
    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var juHua: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                let url:NSURL = NSURL(string:"http://www.baidu.com")!
                let request:NSURLRequest = NSURLRequest(URL:url)
                self.webView.loadRequest(request)
        
                urlInput.keyboardType = UIKeyboardType.ASCIICapable
                urlInput.returnKeyType = UIReturnKeyType.Done
                urlInput.delegate=self
                juHua.hidden=true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("end")
        urlInput.resignFirstResponder()
    }
    
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if(textField == urlInput){
            
            urlInput.resignFirstResponder()
            
        }
        
        return true
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    @IBAction func didTap(sender: UIButton) {
        var str:NSString = urlInput.text!
        if !str.hasPrefix("http://")
        {
            str = "http://" + (str as String)
        }
        let url: NSURL = NSURL(string: str as String)!
        let request:NSURLRequest = NSURLRequest(URL:url)
        self.webView.loadRequest(request)
        juHua.startAnimating()
        
    }
    
    
    @IBAction func didBack(sender: UIButton) {
        webView.goBack()
    }
    
    
    /**
    @IBAction func didForward(sender : UIButton) {
        webView.goForward()
    }
    
    @IBAction func didStop(sender : UIButton) {
        webView.stopLoading()
        juHua.stopAnimating()
    }

    **/
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        juHua.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        juHua.stopAnimating()
    }
    
}


