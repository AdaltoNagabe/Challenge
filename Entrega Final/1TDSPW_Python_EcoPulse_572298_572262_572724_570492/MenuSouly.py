'''Aqui iniciamos o programa. Os varios \n são para dar um espaçamento para limpar a tela e deixar a leitura mais fluida.'''
print('\n\nOlá, seja bem-vindo(a) à SoulUp!')
print('Sou a Souly! Estou aqui para te ajudar a navegar pela nossa plataforma e aproveitar ao máximo as funcionalidades que oferecemos. \n')
print('VAMOS COMEÇAR? \n')
nome_usuario = input('Primeiro digite o seu nome: \n')

#Esta linha de identificacao do usuario é meramente didático. Na prática, a identificação do usuário seria feita por meio de um sistema de login, onde o usuário já estaria logado na plataforma.
print(f'\nOlá, {nome_usuario}! Escolha uma das opções e vamos navegar juntos: \n')

# funcao para exibir o menu de opções para o usuário
def exibir_menu():
    
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
        escolha_usuario = input('Digite a sua opção: \n')

        match escolha_usuario:
            case '1':
                print(f'\nOK {nome_usuario} você quer explorar posts! \n')
                historico_usuario.append(1)
                
            case '2':
                print(f'\nMuito bem {nome_usuario} você quer participar de um desafio! \n')
                historico_usuario.append(2)
                    
            case '3':
                print(f'\n{nome_usuario} você pode curtir um post ou então um comentário! \n')
                historico_usuario.append(3)
                
            case '4':
                print(f'\nBacana, {nome_usuario}! Vamos comentar um post!  \n')
                historico_usuario.append(4)
                
            case '5':
                print(f'\nQue legal, {nome_usuario}! Você quer compartilhar um post!  \n')
                historico_usuario.append(5)
                
            case '6':
                print(f'\n{nome_usuario} vamos salvar um post de perfil!  \n')
                historico_usuario.append(6)
                
            case '0':
                print(f'\nObrigado por usar a SoulUp! Até a próxima, {nome_usuario}!  \n')
                historico_usuario.append(0)
                break
                
            case _:
                print(f'\n{nome_usuario}, você escolheu uma opção incorreta!! \n')
                historico_usuario.append(escolha_usuario)
                _ = input("\nPressione qualquer tecla para continuar...\n")

# executa o menu 
menu()

# imprime o histórico final de navegação do usuário, mostrando as opções escolhidas durante a execução do menu
print(f'{nome_usuario}, aqui está o seu histórico final de navegação: {historico_usuario}\n')

# exibe o histórico de opções escolhidas pelo usuário, associando cada número a uma ação específica
j = 1
for i in historico_usuario:
    
    if i == 1:
        print(f'{j}º - Você explorou posts!')
        j += 1
    
    elif i == 2:
        print(f'{j}º - Você participou de um desafio!')
        j += 1
    
    elif i == 3:
        print(f'{j}º - Você curtiu um post ou comentário!')
        j += 1
    
    elif i == 4:
        print(f'{j}º - Você comentou um post!')
        j += 1
    
    elif i == 5:
        print(f'{j}º - Você compartilhou um post!')
        j += 1
    
    elif i == 6:
        print(f'{j}º - Você salvou um post de perfil!')
        j += 1
     
    elif i == 0:
        print(f'{j}º - Você saiu do menu!\n') 
        j += 1
        
    elif i not in range(0, 7):
        print(f'{j}º - Aqui você escolheu uma opção incorreta!')
        j += 1