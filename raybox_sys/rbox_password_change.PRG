*Author: Mathias Jimenez Villamar
*Target: Create a new program for password change.
*Date: 14/sep/20242
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
CLEAR
SET ESCAPE OFF
USE rbox_history_database
define window inpt from 5,50 to 30,135 title "Raybox.MJ | Password Change"+"                                                                                                                       "+cdow(date())+", "+mdy(date())
    STORE space(20) TO reppass, pass, pass_entered
    STORE DATE() to day 
@1,1 say "C:\raybox_sys\pict_sys/raybox.jpg" bitmap isometric size 38,38
ACTIVATE WINDOW inpt
    @9,1 say "C:\raybox_sys\pict_sys/login/pass.jfif" bitmap isometric size 12,12
    @1,2 say "Raybox | Hardware tools company" font "Ubuntu",20 color b+/w**
    @4,2 say "Password Trial. Please fill these fields. "+hisname font "Poppins",12 color r+/w**
    @22,43 say "Raybox System 2025 (Raybox.MJ) All Rights Reserved." font "Verdana", 8 color b/w**
    @7,12 say "Enter Password: " font "Arial black",10 get pass_entered valid ALLTRIM(pass_entered)==ALLTRIM(pass_user) and !EMPTY(pass_entered) error "Enter your password corretly." font "Noto Sans",8
        READ
        IF readkey()=12
            messagebox("Press OK to exit",0+32,"Proccess finished")
            DEACTIVATE WINDOW inpt
            CLEAR
            DO raybox_principal WITH hisname, hissurname, numbers, histype, one, pass_user
        ENDIF 
    @10,15 say "Change Password: " font "Arial black",10 get pass valid not EMPTY(pass) and LEN(ALLTRIM(pass))>=5 error "Add your new password. It must be greater than or equal to 5"
    @12,15 say "Repeat Password: " font "Arial black",10 get reppass valid ALLTRIM(pass)==ALLTRIM(reppass) and !EMPTY(reppass) error "Passwords doesn't match."     
            READ 
            APPEND BLANK
                replace username WITH ALLTRIM(hisname)
                replace surname WITH ALLTRIM(hissurname)
                replace passkey_ch WITH ALLTRIM(reppass)
                replace date WITH day
            USE rbox_users
                LOCATE FOR name=hisname
                    replace date WITH day
                    replace password WITH ALLTRIM(reppass)
                @15,30 say "LOADING    " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,30 say "LOADING.   " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,30 say "LOADING..  " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,30 say "LOADING... " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,30 say "LOADING    " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,30 say "LOADING.   " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,30 say "LOADING..  " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,30 say "LOADING... " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @15,22 say "SUCCESSFULLY PROCCESS!   " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.90
                            DEACTIVATE WINDOW inpt
                            DO raybox_login