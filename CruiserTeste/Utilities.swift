//
//  Utilities.swift
//  CruiserTeste
//
//  Created by thaxz on 23/02/23.
//

import Foundation
import SwiftUI

enum GameScenes: String {
    
    case home
    case levels
    case dialogue
    case gameScreen
    case credits
    case tutorial
    case relatory
}

enum GameLevels: String {
    
    case earth
    case planet
}

enum ButtonTypes: String {
    
    case primary
    case secondary
}

struct Dialogues{
    
    let earth: [String] = [
    "Olá, bem-vinda à nossa equipe de pilotas espaciais! Estamos muito felizes em tê-la a bordo.",
    "Este instituto foi criado com o objetivo de expandir o conhecimento humano sobre o universo e sua vastidão. Somos dedicados a explorar o espaço e coletar informações sobre os planetas que nos rodeiam.",
    "Quero lembrá-la que, como uma mulher nessa área, você representa uma grande parte do que acreditamos aqui. Ver uma mulher como você pilotando nossas naves é um grande orgulho para nós.",
    "Acredito que você esteja ansiosa para começar suas missões. Mas antes de você partir para outras partes do universo, gostaríamos que você se familiarizasse aqui na Terra.",
    "Seu objetivo principal será coletar informações importantes sobre os planetas e trazê-las de volta para nossa equipe. Sua nave está equipada com ferramentas necessárias para a coleta.",
    "Sua maior tarefa é manter a nave sob controle enquanto experiencia diferentes rotas. Esperamos que você esteja pronta para o desafio.",
    "Este é apenas o primeiro passo para as suas futuras missões. Boa sorte, pilota. Estamos ansiosos para seu retorno."
    ]
    
    let planet: [String] = [
    "Olá novamente! Estou muito feliz em ver que você completou sua primeira missão com sucesso. Parabéns!",
    "Fiquei muito impressionada com o seu trabalho na missão anterior. Você coletou dados valiosos e pilotou a nave com habilidade.",
    "A próxima parada é a Lua! Precisamos que você colete dados sobre a topografia lunar e a composição do solo.",
    "A nave está equipada com os instrumentos necessários para coleta, como radares de penetração lunar, espectrômetros e sismômetros.",
    "Mas lembre-se, a Lua é um ambiente imprevisível e você precisa estar sempre alerta.",
    "Este teste é fundamental para nossa pesquisa espacial. Nossa fundadora, Nancy Grace, dedicou a vida a isso, e é nossa responsabilidade honrar esse legado.",
    "Tenho certeza de que você fará um ótimo trabalho novamente. A ciência espera ansiosamente pelos seus dados!"
    ]
    
}


