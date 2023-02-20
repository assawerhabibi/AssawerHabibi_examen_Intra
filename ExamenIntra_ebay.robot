*** Settings ***
Documentation    ce script est écrit pour tester plusieurs scénarios
Library    SeleniumLibrary
Test Setup    ouvrir navigateur
Test Teardown    fermer navigateur

*** Variables ***
${url}=    https://ebay.com
${browser}=    chrome
*** Test Cases ***
Scénario A    Log To Console    Scénario A : lien de recherche avancée
    [Tags]    smoke
    Click Element    xpath://*[@id="gh-as-a"]
    Sleep    2
    Element Text Should Be       xpath://aside/span[1]/div    Advanced search
    Page Should Contain Element    xpath://aside/span[1]/div 
    # Naviger sur la page 
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Sleep    3   
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)
 
    Sleep    2
Scénario B    Log To Console    Scénario B: nombre éléments de recherche
    [Tags]    smoke
    Input Text    xpath://*[@id="gh-ac"]    iPhone 11
    Sleep    2
    Click Button    xpath://*[@id="gh-btn"]
    Sleep    2
    Capture Element Screenshot    xpath://*[@id="mainContent"]/div[1]/div[2]/div[2]/div[1]/div[1]/h1/span[1]
    Sleep    2
Scénario C    Log To Console    Scénario C: nombre éléments recherchés2    
    [Tags]    smoke
    Input Text    xpath://*[@id="gh-ac"]    Toy Cars
    Sleep    2
    Click Button    xpath://*[@id="gh-btn"]
    Sleep    2
    Capture Element Screenshot    xpath://*[@id="mainContent"]/div[1]/div/div[2]/div[1]/div[1]/h1/span[1]
    Sleep    2
Scénario D    Log To Console    scenario D:Rechercher un article dans la catégorie
    [Tags]    smoke
    Input Text    xpath://*[@id="gh-ac"]    soup
    Sleep    2
    Select From List By Index    xpath://*[@id="gh-cat"]    3
    Sleep    2
    Click Button    xpath://*[@id="gh-btn"]
    Sleep    2
    Capture Element Screenshot    xpath://*[@id="mainContent"]/div[1]/div/div[2]/div[1]/div[1]/h1/span[1]
    Sleep    2
      

    
*** Keywords ***
ouvrir navigateur
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    2
fermer navigateur
    Sleep    2
    Close Browser