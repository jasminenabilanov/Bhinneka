*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Variables  ../PageObjects/locator_bhinneka.py


*** Keywords ***
Buka Website Bhinneka  
  [Arguments]  ${url}  ${Browser}
   open browser  ${url}  ${Browser}
   Maximize Browser Window

Click button log in 
   Click Element  ${btn_login}

Masukkan Email
   Input Text  ${email_1}  minepotterhead19@gmail.com

Masukkan Email Salah
   Input Text  ${email_1}  jasmine123@gmail.com

Click Button "Selanjutnya"
   Click Element  ${btn_next}

Masukkan Password
   Input Text  ${password_2}  Jasminenabila123!@#

Click Button Login 1
   Wait Until Element Is Enabled  ${btn_login_2}
   Element Should Be Enabled  ${btn_login_2}
   Click Element  ${btn_login_2}  

Alert Error
   ${warning}  Get Text  ${warning_error}
   log to console   ${warning}

Alert User kosong
   ${data_null}  Get Text  ${warning_data_null}
   log to console  ${data_null}
   


