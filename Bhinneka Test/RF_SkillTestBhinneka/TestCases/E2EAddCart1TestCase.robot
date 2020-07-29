*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/E2EAddCart1.robot
Library  DateTime

*** Variables ***
${Browser}  chrome
${url}  https://bhinneka.com
${DELAY}  3
${url_1}  https://bhinneka.com/cart


*** Test Cases ***
Login dengan data user yang sudah terdaftar
    [Tags]  regression
        Buka Website Bhinneka   ${url}  ${Browser}
        Click button log in 
        Masukkan Email
        Click Button "Selanjutnya"
        Sleep  3
        Masukkan Password
        Click Button Login 1

Tambah beberapa item belanja kedalam cart (multiple item)
    [Tags]  regression
        Sleep  5
        click image product
        Sleep  2
        click image otomotif
        Sleep  2
        click icon cart
        Sleep  2
        click button "Kembali Belanja"
        Ambil data qty cart
        Sleep  1
        Go To  ${url}
        Sleep  2
        click barang tema software
        Sleep  2
        click image product software
        Sleep  2
        click icon cart
        Sleep  2
        click button "go To cart"
        Sleep  3
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Sleep  3
        Total dan grandtotal sama

Tambah 1 item product dari trigger Search dan tambahkan ke cart
    [Tags]  regression
        Go To  ${url}
        Sleep  1
        Cari Produk
        Sleep  1
        Ambil data query title barang
        Sleep  3
        click image laptop
        Sleep  1
        click icon cart
        Sleep  3
        click button "go To cart"
        Sleep  3
        Ambil data total barang di halaman shopping cart
    
Add CoupunCode valid
    [Tags]  regression
        Click icon navbar cart
        Sleep  3
        Go To  ${url_1}
        # Sleep  2
        # click delete couponcode
        Sleep  2
        # Go To  ${url_1}
        Isi coupun code
        Sleep  1
        click button submit coupon code
        Ambil data ecooupun
        Sleep  5

Add CoupunCode invalid
    [Tags]  regression
        Go To   ${url}
        Click icon navbar cart
        Sleep  3
        Go To  ${url_1}
        Sleep  2
        click delete couponcode
        Sleep  3
        Go To  ${url_1}
        click button submit coupon code
        Sleep  2
        Alert warning kosong
        [Teardown]  Close Browser