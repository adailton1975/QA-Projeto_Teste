*** Settings ***
Documentation    Teste de API
Library               RequestsLibrary
Library        Collections
Library        FakerLibrary        

                                                                                                                                                            
                                                                                                       
                  
                                                                                                       
*** Test Cases ***                                                                                     










GET Request Test                                                                                       
    Create Session    myssesion      ${URL}                                                                                                            
    &{headers}      Create Dictionary    Content-Type=application/json    


    ${resp}=      GET On Session  myssesion   /customer    ${headers}

POST Request Test  
    ${NOME1}             FakerLibrary.First Name    
    ${SOBRENOME}         FakerLibrary.Last Name                                                                         
    Create Session    myssesion      ${URL}
    &{body}           Create Dictionary    birthDate=1975-09-14      lastName=${NOME1}    name=${SOBRENOME}
    &{headers}        Create Dictionary    Content-Type=application/json    serverSide=false    content-type=application/json
    ${resp}=          POST On Session      myssesion    /customer     json=${body}    headers=${headers}
   



    # Request Should Be Successful    ${resp}   
                                             
                                                                                                       
# Post Request Test                                                                                      
#     &{data}=    Create dictionary  title=Robotframework requests  body=This is a test!  userId=1       
#     ${resp}=    POST On Session    jsonplaceholder  /posts  json=${data}  expected_status=anything     
                                                                                                       
#     Status Should Be                 201  ${resp}   
# *** Test Cases ***
# deve_salvar_novo_card_no_sistema
#     ${response}=     GET    ${URL}

deve_retornar_status_400_quando_salvar_card_com_cvv_maior_que_999
    ${NOME1}             FakerLibrary.First Name    
    ${SOBRENOME}         FakerLibrary.Last Name 
    ${NOME}              FakerLibrary.Name                                                                        
    Create Session       myssesion      ${URL}
    &{body}              Create Dictionary     brand=MASTER        customerId=2        cvc=1000        expirationMoth=2        expirationYear=2023        holderName=${NOME}      number=1001200230034004     
    &{headers}           Create Dictionary    Content-Type=application/json   
    ${resp}=             POST On Session    myssesion    /card     json=${body}    headers=${headers}        expected_status=400
    Should Be Equal As Strings   <Response [400]>    ${resp}
    Log To Console    ${resp.content}
    
deve_retornar_status_400_quando_salvar_card_com_expiration_month_maior_que_12
    ${NOME1}             FakerLibrary.First Name    
    ${SOBRENOME}         FakerLibrary.Last Name 
    ${NOME}              FakerLibrary.Name                                                                        
    Create Session       myssesion      ${URL}
    &{body}              Create Dictionary     brand=MASTER        customerId=2        cvc=222        expirationMoth=22        expirationYear=2023        holderName=${NOME}      number=1001200230034004       status=False
    &{headers}           Create Dictionary    Content-Type=application/json   
    ${resp}=             POST On Session     myssesion    /card     json=${body}    headers=${headers}        expected_status=400
     Should Be Equal As Strings   <Response [400]>    ${resp}
    Log To Console    ${resp.content}
deve_retornar_status_400_quando_salvar_card_com_expiration_year_menor_que_2022
    ${NOME1}             FakerLibrary.First Name    
    ${SOBRENOME}         FakerLibrary.Last Name 
    ${NOME}              FakerLibrary.Name                                                                        
    Create Session       myssesion      ${URL}
    &{body}              Create Dictionary     brand=MASTER        customerId=2        cvc=333        expirationMoth=2        expirationYear=2021        holderName=${NOME}      number=1001200230034004       status=False
    &{headers}           Create Dictionary    Content-Type=application/json   
    ${resp}=             POST On Session     myssesion    /card     json=${body}    headers=${headers}    expected_status=400
     Should Be Equal As Strings   <Response [400]>    ${resp}
    Log To Console    ${resp.content}

deve_retornar_status_400_quando_salvar_card_com_number_de_15_digitos
    ${NOME1}             FakerLibrary.First Name    
    ${SOBRENOME}         FakerLibrary.Last Name 
    ${NOME}              FakerLibrary.Name                                                                        
    Create Session       myssesion      ${URL}
    &{body}              Create Dictionary     brand=MASTER        customerId=2        cvc=444        expirationMoth=2        expirationYear=2023        holderName=${NOME}      number=100120023003400       status=False
    &{headers}           Create Dictionary    Content-Type=application/json   
    ${resp}=             POST On Session     myssesion    /card     json=${body}    headers=${headers}    expected_status=400
     Should Be Equal As Strings   <Response [400]>    ${resp}
    Log To Console    ${resp.content}

deve_retornar_status_400_quando_salvar_card_com_number_de_17_digitos
    ${NOME1}             FakerLibrary.First Name    
    ${SOBRENOME}         FakerLibrary.Last Name 
    ${NOME}              FakerLibrary.Name                                                                        
    Create Session       myssesion      ${URL}
    &{body}              Create Dictionary     brand=MASTER        customerId=2        cvc=555        expirationMoth=2        expirationYear=2023        holderName=${NOME}      number=10012002300340041       status=False
    &{headers}           Create Dictionary    Content-Type=application/json   
    ${resp}=             POST On Session     myssesion    /card     json=${body}    headers=${headers}    expected_status=400
     Should Be Equal As Strings   <Response [400]>    ${resp}
    Log To Console    ${resp.content}

deve_deletar_um_card_salvo_no_sistema
    #cria um customer
    ${NOME1}             FakerLibrary.First Name    
    ${SOBRENOME}         FakerLibrary.Last Name 
    Create Session    myssesion    ${URL}    
    &{body}    Create Dictionary        birthDate=1975-09-14     lastName=${NOME1}     name=${SOBRENOME} 
    &{headers}    Create Dictionary    Content-Type=application/json
    ${resp}=             Post Request     myssesion    /customer     json=${body}    headers=${headers}
    Log To Console    ${resp.content}
    #Cria um cartao
    Create Session    myssesion    ${URL}    
    &{body}    Create Dictionary         brand=MASTER        customerId=2        cvc=555        expirationMoth=2        expirationYear=2023        holderName=${SOBRENOME} + ${NOME1}     number=1001200230034004
    &{headers}    Create Dictionary    Content-Type=application/json
    ${resp}=             Post Request     myssesion    /card     json=${body}    headers=${headers}
    Log To Console    ${resp.content}
    #deleta cartão existente
    Create Session    myssesion    ${URL}
    ${resp}=        DELETE On Session    myssesion     card/134
    &{headers}    Create Dictionary    Content-Type=application/json



   


deve_retornar_status_404_ao_deletar_um_card_com_id_nao_salvo_no_sistema
    Create Session    myssesion    ${URL}
    ${resp}=        DELETE On Session    myssesion     card/12        expected_status=404
    &{headers}    Create Dictionary    Content-Type=application/json
    Should Be Equal As Strings   <Response [404]>    ${resp}
    Log To Console    ${resp.content}


*** Variables ***
${URL}    http://localhost:9090
${NOME}          FakerLibrary.Name


    




