*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Variables  ../PageObjects/locator_bhinneka.py


*** Keywords ***
Buka Website Bhinneka  
  [Arguments]  ${link_verde}  ${Browser}
   open browser  ${link_verde}  ${Browser}
   Maximize Browser Window

Click button log in 
   Click Element  ${btn_login}

Masukkan Email
   Input Text  ${email_1}  jasminenabilanov@gmail.com

Click Button "Selanjutnya"
   Click Element  ${btn_next}

Masukkan Password
   Input Text  ${password_2}  Gadoyanoyong123!@#

Click Button Login 1
   Click Element  ${btn_login_2}  

click button beli
   Click button  ${catalog}

click image product
   Click Element  ${imageprod}

click image otomotif
   Click Element  ${imageotomotif}

click button buy
   Click Element  ${cart}

click button block
   Click Element  ${one_signal}

click barang tema software
   Click Element  ${software_home}

click icon cart 
  Click Element  ${icon_cart}

click button "Kembali Belanja"
  Click Element  ${btn_kembali_belanja}

Ambil data qty cart
   ${qty}  Get Text  ${badge_cart}
   log to console  ${qty}

click image product software
  Click Element  ${image_product_software}

click button "go To cart"
  Click Element  ${go_to_cart}

Total dan grandtotal sama
  ${totalpembelian} =  Get Text  ${total_pembelian}
  ${totalpengiriman} =  Get Text  ${total_pengiriman}
  ${totalpembelian_convert} =  Convert To Number  ${totalpembelian}  
  ${totalpengiriman_convert} =  Convert To Number  ${totalpengiriman}  
  ${result} =  Evaluate   ${totalpembelian_convert} +  ${totalpengiriman_convert}
  ${grandtotal} =  Get Text  ${grandtotal_locator}
  Run Keyword If  '${result}'=='${grandtotal}'  Log to console  ${result}
  Log to console  ${grandtotal}
  ...   ELSE  Log to console   ERROR !!!


Cari Produk
   Input Text  ${search}  Laptop
   Press Key  ${search}  \\13

Ambil data query title barang
    ${result}  Get Text  ${label_title}
  Run Keyword If  '${result}'=='LAPTOP'  Log  ${result}

Ambil data total barang di halaman shopping cart
   ${span_title}  Get Text  ${span_title_total_barang}
   log to console  ${span_title}

click image laptop
   Click Element  ${imagelaptop}


Click icon navbar cart
  Click Element  ${navbar_icon}

Isi coupun code
   Wait Until Element Is Enabled  ${couponcode}
   Element Should Be Enabled  ${couponcode}
  Input Text  ${couponcode}  BCAPAYDAYVA

click button submit coupon code
   Wait Until Element Is Enabled  ${btn_submit_couponcode}
   Element Should Be Enabled  ${btn_submit_couponcode}
  Click Element  ${btn_submit_couponcode}

Ambil data ecooupun
    Wait Until Element Is Enabled  ${coupun_valid}
   Element Should Be Enabled  ${coupun_valid}
   ${coupun}  Get Text  ${coupun_valid}
   log to console  ${coupun}

Alert warning kosong
   ${null_kupon}   Get Text  ${warning_kupon_null}
   log to console  ${null_kupon}

click delete couponcode
    Click Element  ${delete_coupun}

