//
//  main.swift
//  apple-finalchallenge
//
//  Created by YASMIN CAROLINA FERNANDES LOPES on 14/11/25.
//

import Foundation


//variaveis


// funcoes

var spellbookList: [String] = [];

func spellbook(){
    print("Feiticos contidos no livro: ")
    if spellbookList.isEmpty{
        print("O livro esta vazio :(")
        voltarOuSair()
    } else {
        print(spellbookList)
        voltarOuSair()
    }
}

var newSpells: [String] = []

func missao(){
    print("Para entrar na missao, digite 'entrar', para sair digite 'sair'")
    let entrarMissao = readLine()
    switch entrarMissao{
    case "Entrar".lowercased():
        print("Iniciando missao...")
        let missaoIniciada = Int.random(in: 1...100)
        print("Voce recebeu \(missaoIniciada) de dano na sua missao, ")
        if missaoIniciada >= 1 && missaoIniciada <= 50{
            print("voce ganhou a missao! Parabens")
//            missaoGanha += 1
            voltarOuSair()
        } else {
            print("voce perdeu, que pena...")
            voltarOuSair()
        }
        break
    case "Sair".lowercased():
        print("voltando ao menu principal...")
        menu()
        break
    default:
        print("Opcao invalida.")
        missao()
        break
    }
}

func addNewSpells(){
    print("Digite as magias para acrescentar no livro de magias, e sair quando estiver satisfeito: ");
    while let input = readLine(){
        if input == "Sair".lowercased(){
            break;
        } else {
            newSpells.append(input)
            spellbookList = newSpells
        }
    }
    print("Novas magias adicionadas ao livro: \(newSpells)")
    print("Magias no livro de magias: \(spellbookList)")
    voltarOuSair()
}

var magiasAprendidas: [String] = []

func learnNewSpell(){
    print(spellbookList)
    print("Escolha um feitico: ")
    let chooseSpell = readLine() ?? ""
    if spellbookList.contains(chooseSpell.lowercased()){
        print("Aprendendo feitico...")
        print("Feitico \(chooseSpell) aprendido!")
        magiasAprendidas.append(chooseSpell.lowercased())
        voltarOuSair()
    }
    else {
        print("Opcao invalida")
        voltarOuSair()
    }
}


func yourSpells(){
    print("Lista de feiticos aprendidos: ")
    if magiasAprendidas.isEmpty{
        print("voce nao aprendeu nenhum feitico")
        voltarOuSair()
    } else {
        print(magiasAprendidas)
        voltarOuSair()
    }
}

func menu(){
    print("Selecione o que deseja visualizar:")
    print("1. Abrir livro de feiticos")
    print("2. Adicionar magia ao livro de feiticos")
    print("3. Aprender feitico novo")
    print("4. Entrar em missao")
    print("5. Ver feiticos ja aprendidos")
    print("6. Sair")
    if let inputMenu = readLine(), let escolhaMenu = Int(inputMenu){
        switch escolhaMenu{
        case 1:
            spellbook()
            break
        case 2:
            addNewSpells()
            break
        case 3:
           learnNewSpell()
            break
        case 4:
            missao()
            break
        case 5:
            yourSpells()
            break
        case 6:
            print("ate a proxima!")
            break
        default:
            print("Opcao invalida...")
            voltarOuSair()
            break
        }
    }
}

func voltarOuSair(){
    print("O que deseja fazer agora? Digite 'sair' para finalizar a sessao, ou 'voltar' para ir ao menu principal")
    let decisaoVoltarSair = readLine()
    if decisaoVoltarSair == "Sair".lowercased(){
        print("ate a proxima!")
    } else if decisaoVoltarSair == "Voltar".lowercased(){
        menu()
    } else {
        print("Opcao invalida. Voltando ao menu principal.")
        menu()
    }
}

print("Digite o nome do aluno: ")
let nomeDoAluno = readLine() ?? "";
let nivel = Int.random(in: 1...500)
let forca = Int.random(in: 1...1000)
let moedas = Int.random(in: 1...5000)

print("Ola, \(nomeDoAluno)! Seja bem-vinda(o) a Escola de Magia!")
print("Nivel: \(nivel) -- Forca: \(forca) -- Moedas: \(moedas)")
print("Voce ja aprendeu \(magiasAprendidas.count) feiticos!")
menu()

// learnSpells()
