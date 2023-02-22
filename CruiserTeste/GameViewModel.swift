//
//  GameViewModel.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import Foundation
import SwiftUI
import CoreMotion

class GameViewModel: ObservableObject {
    
    var sprintSheetTimer : Timer?
    @Published var index = 0
    @Published var secondsPlayed: String = "error"
    
    @Published var isMoving: Bool = false
    var gameTimer: Timer?
    var startDate: Date?
    
    @Published var showGameOver: Bool = false
    
    @Published var playerRotation: Angle = Angle(radians: 0)
    @Published var planetRotation: Angle = Angle(radians: 0)
    
    lazy var motionManager = CMMotionManager()
    
    init(){
        setUpGame()
    }
    
    func animateSpaceship() {
            index = 0
            sprintSheetTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: {_ in
                if self.index < 7 {
                    self.index += 1
                    print(self.index)
                } else if self.sprintSheetTimer != nil {
                    self.index = 0
                    //timer.invalidate()
                }
            })
      }
    
    func setUpGame(){
        showGameOver = false
        animateSpaceship()
        //Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            self.startGame()
        //}
    }
    
    func startGame(){
        showGameOver = false
        isMoving = false
        // pegando a data que começou
        startDate = Date()
        // resetando angulos
        self.playerRotation = Angle(radians: 0)
        self.planetRotation = Angle(radians: 0)
        
        // verificando se os sensores do dispositivo estão disponíveis
        if motionManager.isDeviceMotionAvailable {
            // chamando método sempre que conseguir novas infos
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                // se não tiver erro, roda
                if error == nil {
                    // desembrulhando
                    if let data = data {
                        //printando as informações dos eixos
                        print("x: ", data.gravity.x, "y: ", data.gravity.y, "z: ", data.gravity.z)
                        // lógica
                        let angle = atan2(data.gravity.x, data.gravity.y) - .pi
                        // aplicando isso no angulo do player
                        self.playerRotation = Angle(radians: angle)
                        // se não estiver movimentando a terra, irá verificar se é gameover
                        if !self.isMoving {
                            self.checkGameOver()
                        }
                    }
                }
            }
        }
        // nível default terra gira a 4s
        gameTimer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true, block: { (timer) in
            self.rotateWorld()
        })
        
    }
    
    func rotateWorld(){
        // Irá gerar um ângulo aleatório e rotacionar a terra a partir
        let randomAngle = Double(arc4random_uniform(120))/100 - 0.6
        print(randomAngle)
        isMoving = true
        planetRotation = Angle(radians: randomAngle)
        // animando
    }
    
    func checkGameOver(){
        // vai pegar o angulo do jogador e do mundo e comparar
        // angulo do mundo
        let worldAngle = atan2(Double(planetRotation.transform.a), Double(planetRotation.transform.b))
        // do jogador
        let playerAngle = atan2(Double(player.transform.a), Double(player.transform.b))
        // calculando a diferença, pegando apenas o valor positivo
        let difference = abs(worldAngle - playerAngle)
        // se não estiver dentro daquela área vermelha
        if difference > 0.25 {
            // para de repetir o timer
            if let gameTimer = gameTimer {
                gameTimer.invalidate()
            }
            // aparece a tela
            showGameOver = true
            // para de checar os updates
            motionManager.stopDeviceMotionUpdates()
            // quanto tempo se passou até o gameOver
            if let startDate = startDate {
                secondsPlayed = String(round(Date().timeIntervalSince(startDate)))
            }
        }
    }
    
    func playAgain(){
        
    }
    
}
