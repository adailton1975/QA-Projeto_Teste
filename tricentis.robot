***Settings***
Documentation    Teste WEB Tricents Page
Resource     resources.robot
Library    OperatingSystem
Library    Screenshot

*** Test Cases ***
Acessar Page Tricentis
    Acesso a Inicial Page
    Entro na Target Page
    Estou logado na Page

Enter Vehicle Data
    Seleciono o veiculo
    Engine Performance
    Date of Manufacture
    Number of Seats
    Fuel Type
    List Price
    License Plate Number
    Annual Mileage
    Click no button NEXT

Enter Insurant Data
    First Name
    Last Name
    Date of Birth
    Gender
    Street Address
    Country
    Zip Code
    City
    Occupation
    Hobbies
    Website
    # Picture

Enter Product Data
    Start Date
    Insurance Sum
    Merit Rating
    Damage Insurance
    Optional Products
    Courtesy Car

Select Price Option
    Select Option

Send Quote
    E-Mail
    Phone
    Username
    Password
    Confirm Password
    Comments
    Main page
    Validar Pop Up Send Email Success
    Click Button    xpath=/html/body/div[4]/div[7]/div/button
    [Teardown]    Close Browser



*** Keywords ***
Acesso a Inicial Page
    Open Browser      http://sampleapp.tricentis.com/101/#     chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Maximize Browser Window

Entro na Target Page
    Click Element    nav_automobile

Estou logado na Page
    Page Should Contain    Home

Seleciono o veiculo
    Select From List By Value     make    Honda

Engine Performance
    Input Text    engineperformance      306

Date of Manufacture
    Input Text    dateofmanufacture    10/04/2008 

Number of Seats
    Select From List By Value     numberofseats        5

Fuel Type 
    Select From List By Value    fuel     Gas

List Price
    Input Text      listprice        18000

License Plate Number    
   Input Text    licenseplatenumber    HDP77CA1

Annual Mileage
    Input Text       annualmileage        70000
    
Click no button NEXT
    Click Button    nextenterinsurantdata
    
First Name
    Input Text     firstname     Carl
Last Name
    Input Text        lastname        Zeiss
Date of Birth
    Input Text    birthdate   09/03/1968
Gender
    Click Element    xpath=//*[@id="insurance-form"]/div/section[2]/div[4]/p/label[1]/span
Street Address
    Input Text       streetaddress        N Hammond Ave, 512
Country
    Select From List By Value     country    United States
Zip Code
    Input Text    zipcode        73013
City
    Input Text    city    Oklahoma
Occupation
    Select From List By Value    occupation    Employee
Hobbies
    Page Should Contain Checkbox    other
    Click Element        xpath=//*[@id="insurance-form"]/div/section[2]/div[10]/p/label[5]/span
Website
    Input Text      website      ${WEBSITE}
    Click Button    nextenterproductdata 

# Picture
    # Click Button    open    
    # File Should Exist      ./images/CivicRtype2008.jpg
    # Select Frame    NEW
    # Take Screenshot
    # Close Window
    # Click Button    nextenterproductdata    

Start Date
    Input Text    startdate    09/23/2022

Insurance Sum
    Select From List By Value        insurancesum        25000000

Merit Rating
    Select From List By Value    meritrating    Bonus 9
    
Damage Insurance
    Select From List By Value    damageinsurance    Full Coverage

Optional Products
    Click Element    xpath=//*[@id="insurance-form"]/div/section[3]/div[5]/p/label[1]/span

Courtesy Car
    Select From List By Value    courtesycar    Yes
    Click Button    nextselectpriceoption


Select Option  
    Wait Until Element Is Enabled    xpath=//*[@id="priceTable"]/tfoot/tr/th[2]/label[3]/span
    Click Element     //*[@id="priceTable"]/tfoot/tr/th[2]/label[3]/span
    Sleep     5s
    Wait Until Element Is Visible  Download Quote
    Click Button    nextsendquote
    
E-Mail
    Input Text    email    ${EMAIL}  

Phone
    Input Text    phone    ${PHONE} 

Username
    Input Text    username    ${USERNAME}

Password
    Input Password     password    ${PWD}
Confirm Password
    Input Password     confirmpassword    ${PWD}

Comments
    Input Text    Comments        ${COMMENTS}
Main page
    Page Should Contain    Main page
    Click Button    sendemail
    

Validar Pop Up Send Email Success
    Sleep    10s
    Wait Until Page Contains       Sending e-mail success!
    Sleep    5s
    Page Should Contain    Sending e-mail success!


    

    






*** Variables ***

${WEBSITE}     https://github.com/adailton1975/srlab-qa-test
${EMAIL}    adailton.1975@gmail.com
${PWD}    neruj9Wr@
${COMMENTS}    "Well, the best way to get to know new software is to use an example to try it out. This sample application has been"
${PHONE}     5511988029719
${USERNAME}    Uere_Isma_Manei_Lol
    

    