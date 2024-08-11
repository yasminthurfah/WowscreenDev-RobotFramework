*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
Quick Search
    Login
    Go To Quick Search
    #true input
    ${input_search_true}    Set Variable    test
    Input Text    xpath://input[contains(@placeholder,'Search here')]    ${input_search_true}
    ${capitalized_input_search_true}    Evaluate    "${input_search_true}".capitalize()
    #verify device result is visible
    Wait Until Element Is Visible    xpath://body/div[@id='__next']/dialog[1]/div[2]/div[1]/div[2]/div[1]    30
    Sleep    5
    #click playlist
    Click Element    xpath://*[@id="__next"]/dialog[1]/div[2]/div/div[2]/div[1]/div[2]/div[1]
    Sleep    5
    #verify playlist information pop up is visible
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[2]/div[2]    30
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[2]/div[2]/div/div[1]/p[2]    ${capitalized_input_search_true}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button    10
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Wait Until Page Contains    Manage and monitor your Playlists    30
    #false input
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/div/div[2]/div[2]/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/div/div[2]/div[2]/button
    Sleep    3
    Press Keys    xpath://input[contains(@placeholder,'Search here')]    CTRL+A    DELETE
    Sleep    3
    ${input_search_false}    Set Variable    paris
    Input Text    xpath://input[contains(@placeholder,'Search here')]    ${input_search_false}
    Wait Until Page Contains    No results for "${input_search_false}"    30
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/dialog[1]/div[2]/div/div[1]/button    10
    Click Button    xpath://*[@id="__next"]/dialog[1]/div[2]/div/div[1]/button
    Sleep    3
    Close Browser

*** Keywords ***
Login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    xpath://input[@placeholder='ex: inovasi']    inovasi
    Input Text    xpath://input[@placeholder='ex: johnsmith@xxxxx.xxx']    nandamehisa@gmail.com
    Input Text    xpath://input[@placeholder='*****']    nanda05!!!
    Click Button    xpath://button[normalize-space()='Login']
    Sleep    8
    Wait Until Page Contains   Discover your experiences with Wowscreen    30
    Page Should Contain    Discover your experiences with Wowscreen
    Sleep    2

Go To Quick Search
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/div/div[2]/div[2]/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/div/div[2]/div[2]/button
    Sleep    3
    Wait Until Page Contains   Your search input is empty.     30

