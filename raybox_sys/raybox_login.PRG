*Author: Mathias Jimenez Villamar
*Target: Create a new sign up program for our hardware tools system's users
*Date: 14/sep/20242
CLEAR ALL
CLEAR
SET SYSMENU TO
DO raybox_welcome.mpr
SET DEFAULT TO c:/raybox_sys
DO WHILE .t.
SET CENTURY ON 
define window inpt from 5,50 to 30,130 title "Raybox | Log In."+"                                                                                                                         "+cdow(date())+", "+mdy(date())
define WINDOW capt from 25,50 to 35,130 title "RBOX Captcha"
define WINDOW capt2 from 10,157 to 40,197 title "System Captcha | RBOX Captcha"
    USE rbox_users index ci
    STORE space(20) TO nam, sur
    STORE SPACE(4) TO tp, nu, ask
    STORE SPACE(350) TO ph, hisname, hissurname, histype, pass_user
    STORE space(10) TO id, nums, one
    STORE 0 TO cap, opt, num2, cptch, cptch_result
    STORE 1 TO ty
    STORE DATE() to dt
    STORE SPACE(12) TO pass
    STORE DATETIME() TO day
    STORE time() to time    
@1,86 say "C:\raybox_sys\pict_sys/raybox.jpg" bitmap isometric size 38,38
SET ESCAPE OFF
ACTIVATE WINDOW inpt
    @9,1 say "C:\raybox_sys\pict_sys/login/pass.jfif" bitmap isometric size 12,12
    @1,16 say "Raybox | Hardware Tools System" font "Ubuntu",20 color b+/w**
    @4,20 say "You are here! Please fill these fields." font "Poppins",15 color r+/w**
    @7,16 say "ID Number: " font "Arial black",10 get id pict "9999999999" valid not EMPTY(id) or LEN(ALLTRIM(id))=10 error "Enter a valid ID" font "Noto Sans",8
        READ
            SEEK(id)
                IF FOUND()
                    DEFINE WINDOW account FROM 5,160 TO 30,190 TITLE "Raybox User:  "+ALLTRIM(name)+" "+ALLTRIM(surname)
                    ACTIVATE WINDOW account 
                        @0,0 say user_photo bitmap isometric size 30,30
                ELSE 
                    MESSAGEBOX("Account not registered.",0+32,"Not found")
                    CLEAR
                    LOOP 
               ENDIF 
ACTIVATE WINDOW inpt
        @12,16 say "Password: " font "Arial black",10 get pass valid ALLTRIM(pass)==ALLTRIM(password) and !EMPTY(pass) error "INCORRECT PASSWORD"
            READ
                messagebox("Welcome "+name, 0+32, "Success") 
                 ACTIVATE WINDOW capt
                    @1,1 say "C:\raybox_sys\pict_sys/captcha.jpg" bitmap isometric size 10,10
                    @1,15 say "I'm not a robot" font "Arial black",12 color r/w**
                    @4,15 get cap function "*h CAPTCHA" size 3, 2, 3
                        READ
                            DEACTIVATE WINDOW account 
                            ACTIVATE WINDOW capt2
                                @0,2 say "Select all images than contain.." font "Arial black",10 color r/w**
                                @2,2 say "TRAFFIC LIGHTS" font "Arial black",15
                                @5,2 say "C:\raybox_sys\pict_sys\login/street1.jpg" bitmap isometric size 11,11
                                @5,12 say "C:\raybox_sys\pict_sys\login/street2.jpg" bitmap isometric size 11,11
                                @5,20 say "C:\raybox_sys\pict_sys\login/street3.jpeg" bitmap isometric size 11,11
                                @14,2 say "C:\raybox_sys\pict_sys\login/street4.jpeg" bitmap isometric size 11,11
                                @14,12 say "C:\raybox_sys\pict_sys\login/street5.jpeg" bitmap isometric size 11,11
                                @14,20 say "C:\raybox_sys\pict_sys\login/traffic_light.jpg" bitmap isometric size 11,11
                                    @26,1 say "Choose an Option: " font "Arial black",12 get cptch_result font "Arial black",10 valid !EMPTY(cptch_result) and (cptch_result==6) error "It's empty or is incorrect. Anyway, try again."
                                        READ 
                                            ACTIVATE WINDOW capt
                                                @4,24 get cptch function "*h CHECK" size 3, 2, 3
                                                    READ 
                                DEACTIVATE WINDOW capt2
                                ACTIVATE WINDOW account
                                    @0,0 say user_photo bitmap isometric size 30,30
                            ACTIVATE WINDOW capt
                            @2,40 say "LOADING    " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "LOADING.   " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "LOADING..  " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "LOADING... " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "LOADING    " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "LOADING.   " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "LOADING..  " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "LOADING... " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            @2,40 say "VERIFIED!  " font "Coiny",25 color r+/w**
                                WAIT"" timeout 0.25
                            define window inpt from 10,50 to 32,130 title "Raybox.co | Enter your Credentials.."
                        ACTIVATE WINDOW inpt
                            DEACTIVATE WINDOW capt, capt2, account
                            CLEAR
                            @2,14 say "�Welcome Back, "+ALLTRIM(name)+"!" font "Arial Black",25 color g/w**
                            @7,30 say "C:\raybox_sys\pict_sys/load1.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                CLEAR
                            @2,14 say "�Welcome Back, "+ALLTRIM(name)+"!" font "Arial Black",25 color g/w**
                            @7,30 say "C:\raybox_sys\pict_sys\load2.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                CLEAR
                            @2,14 say "�Welcome Back, "+ALLTRIM(name)+"!" font "Arial Black",25 color g/w**
                            @7,30 say "C:\raybox_sys\pict_sys/load3.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                CLEAR
                            @2,14 say "�Welcome Back, "+ALLTRIM(name)+"!" font "Arial Black",25 color g/w**
                            @7,30 say "C:\raybox_sys\pict_sys/load4.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                    DEACTIVATE WINDOW inpt, capt, capt2
                                        hisname=ALLTRIM(name)
                                        histype=ALLTRIM(type)
                                        hissurname=ALLTRIM(surname)
                                        pass_user=ALLTRIM(pass)                                     
                                        one=ALLTRIM(id)
                                        USE rbox_history_database
                                            APPEND BLANK
                                                replace username WITH hisname
                                                replace surname WITH hissurname
                                                replace type WITH histype
                                                replace date WITH day
                                    CLEAR
                                    DO CASE
                                        CASE histype="OPER"
                                            DO raybox_principal_oper WITH hisname, hissurname, pass_user, histype, one
                                        CASE histype="GEST"
                                            DO raybox_principal_gest WITH hisname, hissurname, pass_user, histype, one
                                        CASE histype="ADMN"
                                            DO raybox_principal WITH hisname, hissurname, pass_user, histype, one
                                    ENDCASE 
            ELSE
                messagebox("Canceled inputs. Press OK to exit", 0+32, "Canceled")
                CLEAR ALL 
                DEACTIVATE WINDOW inpt, capt, capt2
                exit
            ENDIF                    
ENDDO