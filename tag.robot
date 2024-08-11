*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
#THIS IS END TO END TESTING FROM CREATE TAG UNTIL DELETE TAG
Create Tag
    Login
    Go To Tag
    Wait Until Element Is Enabled    xpath://button[normalize-space()='Create']    30
    Click Button    xpath://button[normalize-space()='Create']
    ${new_tag}    Set Variable    jaya luar biasa
    Input Text    xpath://input[contains(@placeholder,'Input here..')]    ${new_tag}
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button[2]
    Sleep    5
    Wait Until Page Contains    ${new_tag}    15
    Close Browser

Search by Name
    Login
    Go To Tag
    Click Filter Button
    #input true
    ${input_tag}    Set Variable    jaya
    Input Text    xpath://input[@placeholder='Search']    ${input_tag}
    Sleep    4
    Table Should Contain   xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]     ${input_tag}
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://input[@placeholder='Search']    dublin
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Edit Tag
    Login
    Go To Tag
    Click Filter Button
    #input true
    ${input_tag}    Set Variable    jaya
    Input Text    xpath://input[@placeholder='Search']    ${input_tag}
    Sleep    5
    Table Should Contain   xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]     ${input_tag}
    Click Element    xpath://div[contains(@class,'page-header')]
    ${input_edit}    Set Variable    jaya edit
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[4]/div/button[1]
    Page Should Contain    Update
    #empty input
    Press Keys    xpath://input[contains(@placeholder,'Input here..')]    CTRL+A    DELETE
    Click Button    xpath://button[normalize-space()='Save Changes']
    #verify pop up is appearing
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[1]/div
    Element Should Contain    xpath://*[@id="__next"]/div[1]/div    Name cannot be empty!
    Sleep    4
    #input true
    Input Text    xpath://input[contains(@placeholder,'Input here..')]    ${input_edit}
    Click Button    xpath://button[normalize-space()='Save Changes']
    Sleep    5
    Page Should Contain    ${input_edit}
    Close Browser

Delete Tag
    Login
    Go To Tag
    Click Filter Button
    ${input_tag}    Set Variable    jaya
    Input Text    xpath://input[@placeholder='Search']    ${input_tag}
    Sleep    5
    Table Should Contain   xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]     ${input_tag}
    Click Element    xpath://div[contains(@class,'page-header')]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[4]/div/button[2]
    Wait Until Element Is Enabled    xpath://button[normalize-space()='Confirm']
    Click Button    xpath://button[normalize-space()='Confirm']
    Sleep    5
    #verify that tag already deleted
    Click Filter Button
    ${tag_filter}    Get Value    xpath://input[@placeholder='Search']
    Should Be Equal    ${input_tag}    ${tag_filter}
    Page Should Contain    Sorry, no data available
    Close Browser

Check Pagination
    Login
    Go To Tag
    Sleep    2
    #click next
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[3]
    Sleep    2
    #click jump to first page
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[1]
    Sleep    2
    #click jump to last page
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[4]
    Sleep    2
    #click jump to prev page
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[2]
    Sleep    2
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

Go To Tag
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[7]/span/a
    Sleep    3
    Wait Until Page Contains   Manage and monitor your Tags    30
    Page Should Contain    Manage and monitor your Tags

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2