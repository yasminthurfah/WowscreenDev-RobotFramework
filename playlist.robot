*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome
${playlist_name}    Test Create Playlist
${playlist_note}    Test Note Playlist
${edit_playlist_name}    Test Edit Playlist
${edit_playlist_note}    Test Edit Note

*** Test Cases ***
##THIS IS END TO END TESTING FOR PLAYLIST MENU (FROM CREATE UNTIL DELETE)#
Create Playlist
    Login
    Go To Playlist
    Click Button    xpath://button[normalize-space()='Create']
    Sleep    4
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[1]/div/div[1]/div/div/input    30
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[1]/div/div[1]/div/div/input    ${playlist_name}
    Input Text    xpath://input[@placeholder='Insert Note']    ${playlist_note}
    Scroll Element Into View    xpath://input[@placeholder='Select Tag']
    Click Element    xpath://input[@placeholder='Select Tag']
    Click Element    xpath://div[@value='14']
    Click Element    xpath://input[@placeholder='Select Tag']
    Click Element    xpath://div[@value='10']
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[2]/button
    #filter layout in step 2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div[1]/div[1]/div[1]/div[2]/span/button
    Input Text    xpath://input[@placeholder='Search']    16:9/1
    Sleep    3
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div[1]/div[1]/div[2]/div
    Sleep    2
    Page Should Contain    16:9/1
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div[2]/button
    Sleep    4
    #next page
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[4]/div[2]/button[3]
    Sleep    7
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[1]
    ${media1}    Get Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]
    Log To Console    chosen media 1 : ${media1}
    #Set Suite Variable    ${media1}
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[2]
    ${media2}    Get Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[2]/div[1]/div[1]
    Log To Console    chosen media 2 : ${media2}
    #Set Suite Variable    ${media2}
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[4]
    ${media3}    Get Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[4]/div[1]/div[1]
    Log To Console    chosen media 3 : ${media3}
    #Set Suite Variable    ${media3}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[2]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[2]/button
    Sleep    4
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[4]/div[1]/div[2]/div/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]    ${media1}
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[4]/div[1]/div[2]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]    ${media2}
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[4]/div[1]/div[2]/div/div[2]/div[2]/div[2]/div[3]/div[1]/div[1]    ${media3}
    #save playlist
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[4]/div[2]/button
    Sleep    7
    Wait Until Location Is    https://tenant-wowscreen.inovasi.top/playlist
    Page Should Contain    ${playlist_name}
    Sleep    2
    Close Browser

Search by Playlist Name
    Login
    Go To Playlist
    Click Filter Button
    ${input_playlist_true}    Set Variable    speed
    Input Text    xpath://input[@placeholder='Search']    ${input_playlist_true}
    Sleep    4
    ${capitalized_input_playlist_true}    Evaluate    "${input_playlist_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[3]   ${capitalized_input_playlist_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    4
    Input Text    xpath://input[@placeholder='Search']    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Check Pagination
    Login
    Go To Playlist
    Sleep    2
    #click next
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[3]
    Sleep    2
    #click jump to first page
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[1]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[1]
    Sleep    2
    #click jump to last page
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[4]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[4]
    Sleep    2
    #click jump to prev page
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[2]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[2]
    Sleep    2
    Close Browser

Preview Playlist
    Login
    Go To Playlist
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/span/button
    Wait Until Page Contains    Detail    15
    Page Should Contain    ${playlist_name}
    Page Should Contain    ${playlist_note}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Page Should Contain    Manage and monitor your Playlists

Edit Playlist
    Login
    Go To Playlist
    Sleep    2
    Click Button    xpath://tr[@aria-label='enhanced-table-checkbox-0']//div[1]//div[1]//span[1]//button[1]
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/div/div/div[1]
    Sleep    5
    Wait Until Page Contains    Update Playlist
    Page Should Contain    Update Playlist
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[1]/div/div[1]/div/div/input
    Press Keys    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[1]/div/div[1]/div/div/input    CTRL+A    DELETE
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[1]/div/div[1]/div/div/input    ${edit_playlist_name}
    Press Keys    xpath://input[@placeholder='Insert Note']    CTRL+A    DELETE
    Input Text    xpath://input[@placeholder='Insert Note']    ${edit_playlist_note}
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[2]/button
    #step 2
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div[2]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div[2]/button
    Sleep    3
    #step 3
    #click next page
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[4]/div[2]/button[3]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[4]/div[2]/button[3]
    Sleep    3
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[3]
    ${media4}    Get Text    //*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[1]/div[1]/div[3]/div[3]/div[1]/div[1]
    Log To Console    chosen media 4 : ${media4}
    Set Suite Variable    ${media4}
    Click Button    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[4]/div[3]/div[1]/div[2]/div[3]/div[2]/div[2]/div[2]/button[2]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[2]/button
    #step 4
    Wait Until Page Contains    ${edit_playlist_name}    30
    Page Should Contain    ${edit_playlist_name}
    Page Should Contain    ${edit_playlist_note}
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[4]/div[1]/div[2]/div/div[2]/div[2]/div[2]/div[3]/div[1]/div[1]    ${media4}
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[4]/div[2]/button
    #verify the result
    Wait Until Location Is    https://tenant-wowscreen.inovasi.top/playlist
    Sleep    5
    Page Should Contain    ${edit_playlist_name}
    Click Button    xpath://tbody/tr[@aria-label='enhanced-table-checkbox-0']/td/div/span/button[1]
    Page Should Contain    ${edit_playlist_name}
    Page Should Contain    ${edit_playlist_note}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Close Browser

Delete Playlist
    Login
    Go To Playlist
    #wait until 3 dots menu appears
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/div/span/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/div/span/button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/div/div/div[2]
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/div/div/div[2]
    Wait Until Page Contains    Are you sure?    30
    #confirm delete
    Click Button   xpath://*[@id="__next"]/dialog[3]/div/div[2]/button[2]
    #wait until toast success delete appears
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[1]/div    15
    Element Should Contain    xpath://*[@id="__next"]/div[1]/div    Playlist has been deleted!
    Sleep    5
    Page Should Not Contain    ${edit_playlist_name}
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

Go To Playlist
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[4]/span/a
    Sleep    3
    Wait Until Page Contains   Manage and monitor your Playlists    15

Click filter button
    Wait Until Element Is Enabled   xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    15
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2