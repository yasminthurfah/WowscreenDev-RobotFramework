*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
Search by Name
    Login
    Go To Report Device
    Click Filter Button
    ${input_rep_media_true}    Set Variable    spring
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div/div/div/input    ${input_rep_media_true}
    Sleep    4
    ${capitalized_input_rep_media_true}    Evaluate    "${input_rep_media_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_media_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    4
    Input Text    xpath://input[@placeholder='Search']    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Detail Media
    Login
    Go To Report Device
    Click Filter Button
    ${input_rep_media_true}    Set Variable    spring
    Input Text    xpath://input[@placeholder='Search']    ${input_rep_media_true}
    Sleep    4
    ${capitalized_input_rep_media_true}    Evaluate    "${input_rep_media_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_media_true}
    Click Element    xpath://div[@class='page-header']
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/span/a/button
    Sleep    5
    Page Should Contain    Media Reports
    #check total play and total duration is visible
    Element Should Be Visible    xpath://div[contains(@class,'page-head')]//div[contains(@class,'right')]
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[2]/div[1]/div/p[2]    ${capitalized_input_rep_media_true}
    Click Button    xpath://button[normalize-space()='Timeline']
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[5]/div/div[2]/div[2]/div[1]/div[1]/div/button[1]
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[5]/div/div[2]/div[2]/div[1]/div[1]/button
    Sleep    2
    Click Button    xpath://button[normalize-space()='Table View']
    Sleep    2
    #click filter inside
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/span/button
    #filter by status
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[2]/div[1]/div/input
    Click Element    xpath://div[@value='finished']
    Sleep    4
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/div    finished
    Sleep    2
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[2]/div[1]/div/input
    Click Element    xpath://div[@value='canceled']
    Sleep    4
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/div    canceled
    Sleep    2
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[2]/div[1]/div/input
    Click Element    xpath://div[@value='ready']
    Sleep    4
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    #filter by name
    ${input_name_inside}    Set Variable    emul
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[1]/div/div/input    ${input_name_inside}
    Sleep    4
    ${capitalized_input_name_inside}    Evaluate    "${input_name_inside}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[2]    ${capitalized_input_name_inside}
    Click Element    xpath://div[contains(@class,'page-header')]
    #open campaign schedule
    Click Button    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[4]/div[1]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[8]/div[1]/span[1]/button[1]
    Sleep    3
    Page Should Contain    Detail
    Page Should Contain    ${capitalized_input_name_inside}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Sleep    3
    #open detail campaign
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[8]/div/span[2]/a/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[8]/div/span[2]/a/button
    Sleep    4
    Page Should Contain    Media Reports
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[2]/div[1]/div/p[2]    ${capitalized_input_name_inside}
    #Open device detailed report
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[7]/span/a/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[7]/span/a/button
    Sleep    5
    Wait Until Page Contains    Displaying a detailed report of the device inside the campaign    30
    Scroll Element Into View    xpath://div[contains(@class,'card chart')]
    Sleep    2
    Scroll Element Into View    xpath://div[@class='card summary']
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

Go To Report Device
    Click Element    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[6]/div/span/div
    Sleep    2
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[6]/div/div/div[2]/span/a
    Sleep    3
    Wait Until Location Is    https://tenant-wowscreen.inovasi.top/media-report
    Wait Until Page Contains    Display the list of media reports    15

Click filter button
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2