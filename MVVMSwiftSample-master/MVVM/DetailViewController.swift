//
//  AddViewController.swift
//  MVVM
//
//  Created by Govind on 8/4/17.
//  Copyright (c) 2017 Govind Lokhande. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewModelDelegate {
    
    var viewModel: DetailViewModel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel.title
        nameField.text = viewModel.name
        amountField.text = viewModel.amount
        nameField.becomeFirstResponder()
        
        nameField.addTarget(self, action: #selector(DetailViewController.nameChanged), forControlEvents: UIControlEvents.EditingChanged)
        amountField.addTarget(self, action: #selector(DetailViewController.ammountChanged), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func nameChanged() {
        viewModel.name = nameField.text!
        resultLabel.text = viewModel.infoText
    }
    
    func ammountChanged() {
        viewModel.amount = amountField.text!
        resultLabel.text = viewModel.infoText
    }
    
    
    // MARK: - AddViewModelDelegate
    
    func showInvalidName() {
        let alert = UIAlertController(title: "Error", message: "Invalid name", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        nameField.becomeFirstResponder()
    }
    
    func showInvalidAmount() {
        let alert = UIAlertController(title: "Error", message: "Invalid amount", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        amountField.becomeFirstResponder()
    }
    
    func dismissAddView() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func cancelPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        viewModel.handleDonePressed()
    }

}
