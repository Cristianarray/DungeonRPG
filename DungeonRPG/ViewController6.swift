//
//  ViewController6.swift
//  DungeonRPG
//
//  Created by CristianK on 05/01/2019.
//  Copyright © 2019 DAM. All rights reserved.
//
import UIKit

var enemigoFight : Monstruo!

var heroeFight : Heroe!


class ViewController6: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate  {
    

    static var arrayDadosHeroe:[String] = [String]()
    static var arrayDadosEnemigo : [String] = [String]()
    
    @IBOutlet weak var mensajeLabel: UILabel!
    @IBOutlet weak var imagenEnemigo: UIImageView!
    @IBOutlet weak var imagenHeroe: UIImageView!
    
    @IBOutlet weak var DadosMonstruo: UIPickerView!
    @IBOutlet weak var DadosHeroe: UIPickerView!
    
    @IBOutlet weak var buttonAttack: UIButton!
    @IBOutlet weak var golpeEnemigo: UILabel!
    @IBOutlet weak var golpeHeroe: UILabel!
    
    @IBOutlet weak var corazon1Enemigo: UIImageView!
    @IBOutlet weak var corazon2Enemigo: UIImageView!
    @IBOutlet weak var corazon3Enemigo: UIImageView!
    @IBOutlet weak var corazon4Enemigo: UIImageView!
    
    
    @IBOutlet weak var corazon1Heroe: UIImageView!
    @IBOutlet weak var corazon2Heroe: UIImageView!
    @IBOutlet weak var corazon3Heroe: UIImageView!
    @IBOutlet weak var corazon4Heroe: UIImageView!
    
    
    
    func mostrarAlerta(title: String, message: String) {
        
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "OK", style: .default, handler: {(action) in
            
            self.mensajeLabel.text = ""
        })
        
        alertaGuia.addAction(OK)
        present(alertaGuia, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     mensajeLabel.text = ""
        
        let view:ViewController = ViewController()
        
        
        
        view.mostrarCorazones(numerovidas : heroeFight.getVida(),corazon1: corazon1Heroe,corazon2: corazon2Heroe,corazon3: corazon3Heroe,corazon4: corazon4Heroe)
        
         view.mostrarCorazones(numerovidas : enemigoFight.getVidaMonstruo(),corazon1: corazon1Enemigo,corazon2: corazon2Enemigo,corazon3: corazon3Enemigo,corazon4: corazon4Enemigo)
        
        imagenHeroe.image = UIImage(named: heroeFight.getImagen())
        imagenEnemigo.image = UIImage(named: enemigoFight.getImagen())
        
        ViewController6.arrayDadosEnemigo = ["dice1U.png","dice2U.png","dice3U.png","dice4U.png","dice5U.png","dice6U.png","dice7U.png","dice8U.png","dice9U.png","dice10U.png","dice11U.png","dice12U.png"]
        ViewController6.arrayDadosHeroe = ["dice1.png","dice2.png","dice3.png","dice4.png","dice5.png","dice6.png","dice7.png","dice8.png","dice9.png","dice10.png","dice11.png","dice12.png"]
        
        DadosMonstruo.delegate = self
        DadosMonstruo.dataSource = self
        DadosMonstruo.tag = 1
        DadosHeroe.delegate = self
        DadosHeroe.dataSource = self
        DadosHeroe.tag = 2
        buttonAttack.layer.cornerRadius = 10

 }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "secueVolverFight" ) {
            let cuartaView = segue.destination as! ViewController4
            cuartaView.heroeLucha = heroeFight
        }
    }
    
    

 
    
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ViewController6.arrayDadosEnemigo.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
          let myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
if(pickerView.tag == 1){
 
    if(component==0){
        let myImageView = UIImageView(frame: CGRect(x: 14, y: 22, width: 60, height: 57))
        myImageView.image = UIImage(named:ViewController6.arrayDadosEnemigo[row] as! String)
        myView.addSubview(myImageView)
        }
    if(component==1){
            let myImageView = UIImageView(frame: CGRect(x: 25, y: 22, width: 60, height: 57))
            myImageView.image = UIImage(named:ViewController6.arrayDadosEnemigo[row] as! String)
            myView.addSubview(myImageView)
        }
    if(component==2){
            let myImageView = UIImageView(frame: CGRect(x: 32, y: 22, width: 60, height: 57))
            myImageView.image = UIImage(named:ViewController6.arrayDadosEnemigo[row] as! String)
            myView.addSubview(myImageView)
        }
    
        }

if(pickerView.tag == 2){
  
    if(component==0){
            let myImageView = UIImageView(frame: CGRect(x: 14, y: 22, width: 60, height: 57))
            myImageView.image = UIImage(named:ViewController6.arrayDadosHeroe[row] as! String)
            myView.addSubview(myImageView)
            }
    if(component==1){
            let myImageView = UIImageView(frame: CGRect(x: 25, y: 22, width: 60, height: 57))
            myImageView.image = UIImage(named:ViewController6.arrayDadosHeroe[row] as! String)
            myView.addSubview(myImageView)
            }
    if(component==2){
            let myImageView = UIImageView(frame: CGRect(x: 32, y: 22, width: 60, height: 57))
            myImageView.image = UIImage(named:ViewController6.arrayDadosHeroe[row] as! String)
            myView.addSubview(myImageView)
            }
    
        }
       return myView
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 120.0
    }
    
    
    var ataqueEnemigo: Int = 0
    var ataqueHeroe: Int = 0
    
    @IBAction func funtionAttack(_ sender: Any) {
     
           animateFight(num:ViewController6.arrayDadosEnemigo.count)
           animateFight(num:ViewController6.arrayDadosHeroe.count)
        
        ataque(atakEnemigo : ataqueEnemigo, atakHeroe : ataqueHeroe ,heroe : heroeFight, monstruo : enemigoFight )
    }
    
    
    func animateFight(num:Int) {
        
        let randomNumber1 = Int(arc4random_uniform(UInt32(num)))
        let randomNumber2 = Int(arc4random_uniform(UInt32(num)))
        let randomNumber3 = Int(arc4random_uniform(UInt32(num)))
        let randomNumber4 = Int(arc4random_uniform(UInt32(num)))
        let randomNumber5 = Int(arc4random_uniform(UInt32(num)))
        let randomNumber6 = Int(arc4random_uniform(UInt32(num)))
        
         ataqueEnemigo = randomNumber1+randomNumber2+randomNumber3
         ataqueHeroe = randomNumber4+randomNumber5+randomNumber6
       
        golpeEnemigo.text = "   golpe: " + String (ataqueEnemigo)
        golpeHeroe.text = "   golpe: " + String (ataqueHeroe)
        
        DadosMonstruo.selectRow(randomNumber1, inComponent: 0, animated: true)
        DadosMonstruo.selectRow(randomNumber2, inComponent: 1, animated: true)
        DadosMonstruo.selectRow(randomNumber3, inComponent: 2, animated: true)
        
        
        DadosHeroe.selectRow(randomNumber4, inComponent: 0, animated: true)
        DadosHeroe.selectRow(randomNumber5, inComponent: 1, animated: true)
        DadosHeroe.selectRow(randomNumber6, inComponent: 2, animated: true)
        
        
         print ("num1:" + String (randomNumber1))
         print ("num2:" + String (randomNumber2))
         print ("num3:" + String (randomNumber3))
        
         print ("num4:" + String (randomNumber4))
         print ("num5:" + String (randomNumber5))
         print ("num6:" + String (randomNumber6))
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        }, completion: { (finished) in
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
             }, completion: nil)
         /*    UIView.animate(withDuration: 1, animations: { self.DadosMonstruo.backgroundColor = .red}, completion: nil)*/
        })
    
    }
    
    func ataque(atakEnemigo : Int,atakHeroe : Int,heroe : Heroe, monstruo : Monstruo ){
        
        if(atakEnemigo>atakHeroe){
            heroe.setVidas(valor: heroe.getVida()-1)
       
        }
        if(atakHeroe>atakEnemigo){
            monstruo.setVida(valor: monstruo.getVidaMonstruo()-1)
        
        }
        
        let view:ViewController = ViewController()
        
        view.mostrarCorazones(numerovidas : heroeFight.getVida(),corazon1: corazon1Heroe,corazon2: corazon2Heroe,corazon3: corazon3Heroe,corazon4: corazon4Heroe)
        
        view.mostrarCorazones(numerovidas : enemigoFight.getVidaMonstruo(),corazon1: corazon1Enemigo,corazon2: corazon2Enemigo,corazon3: corazon3Enemigo,corazon4: corazon4Enemigo)
        
        if (heroeFight.getVida()==0){
            imagenHeroe.image = UIImage(named: "RIP.png")
            
        mostrarAlerta(title: "MUERTO", message: "No tienes suficiente vidas! Te han matado!")
     
        //implementar el equals
        //let index = ViewController.listaMonstruos.index(value(forKey: enemigoFight.getNombreMonstruo()))
            
        ViewController.listaMonstruos.remove(at: selected!)
           
        }
        if(enemigoFight.getVidaMonstruo()==0){
            imagenEnemigo.image = UIImage(named: "RIP.png")
            
          mostrarAlerta(title: "KILL HIM", message: "Felicidades Has Ganado la Batalla!!")
            
          heroeFight.setMonedas(valor: heroeFight.getMonedas() + enemigoFight.getPremioMonstruo())
          heroeFight.setExperiencia(valor: heroeFight.getExperiencia() + enemigoFight.getExperienciaMonstruo())
          mostrarAlerta(title: "RECOMPENSA", message: "Obtienes su dinero y experiencia!")
            
            
            
        }
        
        
        
    }
    
    var  arrayCorazones :Array<UIImage> = []
    
    func perderCorazones(numerovidas : Int , corazon1 : UIImageView, corazon2 : UIImageView, corazon3 : UIImageView, corazon4 : UIImageView){
       
        
        // arrayCorazones = [UIImage(named: "heart.png")!,UIImage(named: "heartEmpty.png")!]
        
         // animateLostcorazones(imageView: corazon4, images:[arrayCorazones[])
        
        switch (numerovidas) {
   
        case 3:
            
          //  ViewController6.animate (withDuration: 2.0, delay: 0, opciones: [.repeat, .autoreverse], animaciones: {corazon4.opacity = 0},
            corazon4.isHidden = true
            break
        case 2:
            corazon1.isHidden = false
            corazon2.isHidden = false
            corazon3.isHidden = true
            corazon4.isHidden = true
            break
        case 1:
            corazon1.isHidden = false
            corazon2.isHidden = true
            corazon3.isHidden = true
            corazon4.isHidden = true
            break
        case 0:
            corazon1.isHidden = true
            corazon2.isHidden = true
            corazon3.isHidden = true
            corazon4.isHidden = true
            break
        default:
            break
        }
    }
    
   /* func animateLostcorazones(imageView: UIImageView, images:[UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 2
        imageView.startAnimating()
        
        
    }*/
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
/*
extension UIImage{
    
    func flash(){
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name:)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        self.add(flash, forKey:nil)
    }
    
 
}*/
