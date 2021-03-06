//
//  ViewController4.swift
//  DungeonRPG
//
//  Created by CristianK on 30/12/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit
var selected:Int?

class ViewController4: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {
    
    var heroeLucha : Heroe!
    var monstruoElegido : Monstruo!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var buttonFight: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       /* if (segue.identifier == "secueMenu2" ) {
            let segundaView = segue.destination as! ViewController2
            segundaView.heroeElegido = heroeLucha
            
        }
        if (segue.identifier == "secueFight" ) {
            let sextaView = segue.destination as! ViewController6
            sextaView.heroeFight = heroeLucha
            sextaView.enemigoFight = monstruoElegido
            //sextaView.enemigoFight = ViewController.listaMonstruos[0]
            //selected = pickerView.selectedRow(inComponent: 0)
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        buttonFight.layer.cornerRadius = 10
        //pickerView.selectRow(0, inComponent: 0, animated: true)
        print("entro al viewdidload")
        print(pickerView.selectedRow(inComponent: 0))
        print (ViewController.listaMonstruos[0].getNombreMonstruo())
        monstruoElegido = ViewController.listaMonstruos[0]
        //pickerView.selectRow(0, inComponent: 0, animated: true)
        heroeFight = heroeLucha
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ViewController.listaMonstruos.count
    }
   
    
    
  

    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //monstruo = ViewController.listaMonstruos[row]
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let myImageView = UIImageView(frame: CGRect(x: 0, y: -20, width: 100, height: 100))
       
        myImageView.image = UIImage(named:ViewController.listaMonstruos[row].getImagen())
        
        myView.addSubview(myImageView)
        let nombre = UILabel(frame: CGRect(x: -50, y: 90, width: 200, height: 55))
        nombre.text = ViewController.listaMonstruos[row].getNombreMonstruo()
        nombre.textColor = UIColor.white
    
        nombre.textAlignment = .center
        nombre.font = UIFont(name: "Zapfino", size: 15)
        nombre.textColor = UIColor.yellow
        nombre.layer.borderWidth = 2
        nombre.layer.cornerRadius = 1
        myView.addSubview(nombre)
        return myView
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: NSInteger, inComponent component: Int) {
        
        print("elegido",ViewController.listaMonstruos[pickerView.selectedRow(inComponent: 0)].getNombreMonstruo())
        
        //enemigoFight = ViewController.listaMonstruos[row]
        
        monstruoElegido = ViewController.listaMonstruos[pickerView.selectedRow(inComponent: 0)]
        
    }
    
    
    @IBAction func clickFight(_ sender: UIButton) {
        
        enemigoFight = monstruoElegido
        heroeFight = heroeLucha
    }
    
 
    @IBAction func clickBack(_ sender: Any) {
        
        heroeElegido = heroeLucha
        
    }
    
    
    
    
    
    
    
    
    
    
    
 
    
}
