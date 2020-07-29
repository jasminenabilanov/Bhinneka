*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Login.robot
Library  DateTime

*** Variables ***
${Browser}  chrome
${url}  https://bhinneka.com
${DELAY}  3


*** Test Cases ***
Login Valid
    [Documentation]  User sebelumnya sudah terdaftar terlebih dahulu
    [Tags]  regression
        Buka Website Bhinneka   ${url}  ${Browser}
        Click button log in 
        Masukkan Email
        Click Button "Selanjutnya"
        Sleep  3
        Masukkan Password
        Click Button Login 1
        [Teardown]  Close Browser

Login username salah
    [Documentation]  User belum terdaftar , akan menampilkan warning !
    [Tags]  regression
        Buka Website Bhinneka   ${url}  ${Browser}
        Click button log in 
        Masukkan Email Salah
        Sleep  3
        Click Button "Selanjutnya"
        Sleep  3
        Alert Error
        [Teardown]  Close Browser

Login username kosong
    [Documentation]  User tidak menginput username, akan menampilkan warning !
    [Tags]  regression
        Buka Website Bhinneka   ${url}  ${Browser}
        Click button log in 
        Click Button "Selanjutnya"
        Sleep  2
        Alert User kosong   
        [Teardown]  Close Browser




