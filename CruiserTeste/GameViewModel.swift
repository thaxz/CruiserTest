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
    
    @Published var gameScene: GameScenes = .home
    @Published var selectedLevel: GameLevels = .earth
    
    @Published var index = 0
    @Published var secondsPlayed: String = "00"
    @Published var secondsPlaying = 00
    
    var sprintSheetTimer: Timer?
    var rotationTimer: Timer?
    var startDate: Date?
    var winTimer: Timer?
    
    @Published var isMoving: Bool = false
    @Published var showGameOver: Bool = false
    @Published var showWin: Bool = false
    
    @Published var playerRotation = CGAffineTransform(rotationAngle: 0)
    @Published var planetRotation = CGAffineTransform(rotationAngle: 0)
    
    lazy var motionManager = CMMotionManager()
    
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
    
    func pauseGame(){
        secondsPlaying = 0
        showGameOver = false
        isMoving = false
        //startDate = Date()
        self.playerRotation = CGAffineTransform(rotationAngle: 0)
        self.planetRotation = CGAffineTransform(rotationAngle: 0)
        motionManager.stopDeviceMotionUpdates()
        self.rotationTimer?.invalidate()
        self.sprintSheetTimer?.invalidate()
        self.winTimer?.invalidate()
    }
    
    func setUpGame(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            self.startGame()
            self.showGameOver = false
        }
    }
    
    func startGame(){
        self.animateSpaceship()
        secondsPlaying = 0
        self.checkWin()
        showGameOver = false
        isMoving = false
        // pegando a data que começou
        startDate = Date()
        // resetando angulos
        self.playerRotation = CGAffineTransform(rotationAngle: 0)
        self.planetRotation = CGAffineTransform(rotationAngle: 0)
        
        // verificando se os sensores do dispositivo estão disponíveis
        if motionManager.isDeviceMotionAvailable {
            // chamando método sempre que conseguir novas infos
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                // se não tiver erro, roda
                if error == nil {
                    // desembrulhando
                    if let data = data {
                        //printando as informações dos eixos
                        //print("x: ", data.gravity.x, "y: ", data.gravity.y, "z: ", data.gravity.z)
                        // lógica
                        let angle = CGFloat(atan2(data.gravity.x, data.gravity.y) - .pi)
                        // aplicando isso no angulo do player
                        self.playerRotation = CGAffineTransform(rotationAngle: angle)
                        // se não estiver movimentando a terra, irá verificar se é gameover
                        if !self.isMoving {
                            self.checkGameOver()
                        }
                    }
                }
            }
        }
        // nível default terra gira a 4s
        rotationTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { (timer) in
            if self.showGameOver == false {
                self.rotateWorld()
            }
        })
    }
    
    func rotateWorld(){
        // Irá gerar um ângulo aleatório e rotacionar a terra a partir
        let randomAngle = Double(arc4random_uniform(120))/100 - 0.6
        print(randomAngle)
        withAnimation(.spring()){
            isMoving = true
            print("######## IS MOVING")
            planetRotation = CGAffineTransform(rotationAngle: randomAngle)
        }
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
            self.isMoving = false
            print("STOPPED MOVING#####")
        })
    }
    
    func checkWin(){
        winTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { time in
            if self.secondsPlaying >= 0 {
                self.secondsPlaying += 1
                print("\(self.secondsPlaying) SEGUNDOS" )
            } else if self.secondsPlaying >= 10 {
                print("WIN")
                self.showWin = true
                self.showGameOver = false
                self.pauseGame()
                self.secondsPlaying = 0
            }
        }
    }
    
    func checkGameOver(){
        // vai pegar o angulo do jogador e do mundo e comparar
        // angulo do mundo
        let worldAngle = atan2(Double(planetRotation.a), Double(planetRotation.b))
        // do jogador
        let playerAngle = atan2(Double(playerRotation.a), Double(playerRotation.b))
        // calculando a diferença, pegando apenas o valor positivo
        let difference = abs(worldAngle - playerAngle)
        
        // se não estiver dentro daquela área vermelha
        if difference > 0.35 {
            pauseGame()
            self.winTimer?.invalidate()
            // para de repetir o timer
            if let rotationTimer = rotationTimer {
                rotationTimer.invalidate()
            }
            // para de checar os updates
            motionManager.stopDeviceMotionUpdates()
            // quanto tempo se passou até o gameOver
            if let startDate = startDate {
                secondsPlayed = String(format: "%.2f", Date().timeIntervalSince(startDate))
            }
            // aparece a tela
            showGameOver = true
            print("GAME OVER!!!!!1")
        }
    }
    
    func playAgain(){
        startGame()
    }
    
}
