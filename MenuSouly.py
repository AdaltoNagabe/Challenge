# funcao para exibir o menu de opções para o usuário
def exibir_menu():
    
    print('Escolha uma das opções e vamos navegar juntos: \n')
    print('1 - Explorar posts')
    print('2 - Participar de um desafio')
    print('3 - Curtir')
    print('4 - Comentar')
    print('5 - Compartilhar')
    print('6 - Salvar post de perfil')
    print('0 - Sair \n')
    
# cria uma lista vazia para armazenar o histórico de opções escolhidas pelo usuário
historico_usuario = []    

# funcao para rodar o menu e processar as escolhas do usuário, adicionando cada escolha ao histórico
def menu():
    
    while True:
        exibir_menu()
        escolha_usuario = int(input('Digite a sua opção: \n'))

        match escolha_usuario:
            case 1:
                print('OK! Você quer explorar posts! \n')
                historico_usuario.append(1)
                
            case 2:
                print('Muito bem! Você quer participar de um desafio! \n')
                historico_usuario.append(2)
                    
            case 3:
                print('Você pode curtir um post ou então um comentário! \n')
                historico_usuario.append(3)
                
            case 4:
                print('Você quer comentar um post!  \n')
                historico_usuario.append(4)
                
            case 5:
                print('Você quer compartilhar um post!  \n')
                historico_usuario.append(5)
                
            case 6:
                print('Você quer salvar um post de perfil!  \n')
                historico_usuario.append(6)
                
            case 0:
                print('Obrigado por usar a SoulUp! Até a próxima!  \n')
                historico_usuario.append(0)
                break
                
            case _:
                print('Você escolheu uma opção incorreta!! \n')
                _ = input("Pressione qualquer tecla para continuar...")

# executa o menu 
menu()

# imprime o histórico final de navegação do usuário, mostrando as opções escolhidas durante a execução do menu
print(f'Histórico final de navegação: {historico_usuario}\n')

# exibe o histórico de opções escolhidas pelo usuário, associando cada número a uma ação específica
for i in historico_usuario:
    
    j = historico_usuario.index(i) + 1
    
    if i == 1:
        print(f'{j} - Você explorou posts!')
    
    elif i == 2:
        print(f'{j} - Você participou de um desafio!')
    
    elif i == 3:
        print(f'{j} - Você curtiu um post ou comentário!')
    
    elif i == 4:
        print(f'{j} - Você comentou um post!')
    
    elif i == 5:
        print(f'{j} - Você compartilhou um post!')
    
    elif i == 6:
        print(f'{j} - Você salvou um post de perfil!')
    
    elif i == 0:
        print(f'{j} - Você saiu do menu!\n')
