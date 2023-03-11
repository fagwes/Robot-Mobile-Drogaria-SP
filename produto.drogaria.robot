*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary
*** Variables ***
#Dados do teste

${Pesquisar}       creme 

#Variaveis de configuracao
${url}    https://www.drogariasaopaulo.com.br/
${brownser}    chrome   
     
#Elementos
#Texto

${input_pesquisar}                        xpath= //*[@id="root-search-bar-component"]/div/div/form/fieldset/input
    
${input_cep}                              xpath= //*[@id="cep"]

#Botao

${buttons_seleciona}                        xpath: //*[@id="inicio-conteudo"]/div[2]/div/div/div/div[2]/div[1]/ul/li[1]/div[1]/a/img

${buttons_compra}                           xpath: //*[@id="inicio-conteudo"]/div[1]/div/div/div[4]/div/div[1]/div[4]/a

${buttons_adicionaproduto}                  xpath: //*[@id="inicio-conteudo"]/div[1]/div/div/div[4]/div/div[1]/div[4]/div[1]/div/button[2]

*** Keywords ***
Given que eu esteja no site Drogaria SP 
#PASS
    Open Browser    ${url}        ${brownser}    
    Maximize Browser Window
    Start Gif Recording

When digito nas lacunas
#PASS
    Input Text    ${input_pesquisar}                   ${Pesquisar}
    Submit Form
 
And clico nos botões
#PASS
    Wait Until Element Is Visible        ${buttons_seleciona}
    Click Element                        ${buttons_seleciona}


    Wait Until Element Is Visible        ${buttons_adicionaproduto}
    Click Element                        ${buttons_adicionaproduto} 


    Wait Until Element Is Visible        ${buttons_compra}
    Click Element                        ${buttons_compra} 

    
Then o produto é adicionado com sucesso
#PASS
    Close Browser
    Stop Gif Recording

*** Test Cases ***
Cenario 1: pesquisa produto no site
    Given que eu esteja no site Drogaria SP 
    When digito nas lacunas
    And clico nos botões
    Then o produto é adicionado com sucesso