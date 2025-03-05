*Author: Mathias Jimenez Villamar
*Target: Create a new log in program for our hardware tools system
*Date: 14/sep/2024
CLEAR ALL
SET SYSMENU TO
DO raybox_welcome.mpr
SET DEFAULT TO c:/raybox_sys
DO WHILE .t.
SET ESCAPE OFF
SET CENTURY ON 
define window inpt from 5,50 to 30,130 title "Raybox | Enter Credentials."+"                                                                                                   "+cdow(date())+", "+mdy(date())
define WINDOW capt from 25,50 to 35,130 title "RBOX Captcha"
define WINDOW capt2 from 25,157 to 35,194 title "System Captcha | RBOX Captcha"
    USE rbox_users INDEX ci
    STORE space(20) TO nam, sur
    STORE SPACE(4) TO tp, nu
    STORE SPACE(10) TO capt_result, capt_result_entered
    STORE SPACE(350) TO ph
    STORE space(10) TO id, num
    STORE 0 TO cap, opt, num2
    STORE 1 TO ty
    STORE DATE() to dt
    STORE SPACE(15) TO pass, pass_rep, adm
    STORE DATETIME() TO day
    STORE time() to time    
    capt_result="DT"+ALLTRIM(STR(6))+"JX"
    nu="NA"
    adm="admin"
    cond=.t.
@1,86 say "C:\raybox_sys\pict_sys/raybox.jpg" bitmap isometric size 38,38
ACTIVATE WINDOW inpt
    @1,6 say "Welcome to Raybox | Hardware tools System" font "Ubuntu",20 color b+/w**
    @4,8 say "The best Hardware tools system. Register and Operate now!" font "Poppins",15 color r+/w**
    @7,4 say "ID Number: " font "Arial black" get id pict "9999999999" valid not EMPTY(id) or LEN(ALLTRIM(id))=10 error "Enter a valid ID" font "Noto Sans",8
        READ
            seek id
                if found()
                    messagebox("The ID is already used", 0+48, "RBOX ERROR 204")
                    loop
                ENDIF
    @10,8 say "Cellphone: " font "Arial black", 8
    @10,18 get num pict "9999999999" valid not LEN(ALLTRIM(num))==10 error "Enter a valid cellphone number"
    @12,8 get num2 function "*rv Don't have cellphone number" font "Noto sans",8
    @14,8 say "Names: " font "Arial black",10
    @14,20 get nam pict "AAAAAAAAAAAAAAAAAAAA" valid not EMPTY(nam) error "This field can't be empty" font "Noto Sans",8
    @16,8 say "Surnames: " font "Arial black",10
    @16,20 get sur pict "AAAAAAAAAAAAAAAAAAAA" valid not EMPTY(sur) error "This field can't be empty" font "Noto Sans",8
    @19,8 say "Password:   " font "Arial black",10 get pass valid not EMPTY(pass) and LEN(ALLTRIM(pass))>=5 error "This field need to be filled & It must have more than 4 characters"
       READ 
        IF !EMPTY(pass)
            @21,8 say "Repeat it:    " font "Arial black",10 get pass_rep valid not EMPTY(pass_rep) and pass=pass_rep error "This field need to be filled & Match with the password"
                read
        ENDIF
    @7,28 say "Type: " font "Arial black",10 get ty function "*rv Operator;Gestor;Administrator" font "Arial black",10
        READ 
        do CASE 
            case ty=1
                tp="OPER"
            case ty=2
                tp="GEST"
            case ty=3
                tp="ADMN"
        ENDCASE 
    @20,42 get opt function "*h Register!;Cancel Register & Exit" size 3, 2, 3
        READ 
            IF opt=1
                APPEND BLANK 
                    replace id_number with id
                    replace name with ALLTRIM(nam)
                    replace surname WITH ALLTRIM(sur)
                    replace type with ALLTRIM(tp)
                    replace date with day
                    replace password WITH ALLTRIM(pass)
                    replace phone_num WITH num
                    DO CASE
                        CASE EMPTY(pass)
                            replace password WITH ALLTRIM(adm)
                        CASE EMPTY(num)
                            replace phone_num WITH nu
                        CASE num2=1
                            replace phone_num WITH nu
                    ENDCASE
                    IF messagebox("Enter a image file?", 4+64, "Image File")=6
                        DO WHILE cond
                            ph=getfile()
                            IF !EMPTY(ph)  
                                replace user_photo WITH ALLTRIM(ph)
                                messagebox("Image uploaded correctly", 0+64, "Success!")
                                cond=.f.
                            ELSE 
                                messagebox("You need to enter a image file..", 00+48, "Image File")
                                loop
                            ENDIF
                            cond=.f.
                        ENDDO
                    ELSE
                        DO WHILE cond
                            messagebox("You need to enter a image file..", 0+48, "Image File")
                            ph=getfile()
                            IF !EMPTY(ph)  
                                replace user_photo WITH ALLTRIM(ph)
                                messagebox("Image uploaded correctly", 0+64, "Success!")
                                cond=.f.
                            ELSE 
                                loop
                            ENDIF
                            cond=.f.
                        ENDDO 
                    ENDIF
                @12,47 say "S" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                @12,50 say "u" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                @12,53 say "c" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                @12,56 say "c" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                @12,59 say "e" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                @12,62 say "s" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                @12,65 say "s" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                @12,68 say "!" font "Arial Black",25 color r/w**
                     WAIT"" timeout 0.10
                 ACTIVATE WINDOW capt
                    @1,1 say "C:\raybox_sys\pict_sys/captcha.jpg" bitmap isometric size 10,10
                    @1,15 say "I'm not a Robot" font "Arial black",10 color r/w**
                    @4,15 get cap function "*h CAPTCHA" size 3,2,3
                        READ
                            ACTIVATE WINDOW capt2
                                @0,2 say "C:\raybox_sys\pict_sys\login/captchita.jpg" bitmap isometric size 32,32
                                @6,1 say "Type the words: " font "Arial black",13 color b+/w** get capt_result_entered font "Arial black",10 color r/w**  valid not EMPTY(capt_result_entered) and ALLTRIM(capt_result_entered)==ALLTRIM(capt_result) error "It's empty or is incorrect. Anyway, try again."
                                    READ 
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
                            DEACTIVATE WINDOW capt, capt2
                            clear
                            @2,18 say "¡Welcome to Raybox!" font "Arial Black",25 color b+/w**
                            @7,30 say "C:\raybox_sys\pict_sys/load1.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                CLEAR
                            @2,18 say "¡Welcome to Raybox!" font "Arial Black",25 color b+/w**
                            @7,30 say "C:\raybox_sys\pict_sys/load2.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                CLEAR
                            @2,18 say "¡Welcome to Raybox!" font "Arial Black",25 color b+/w**
                            @7,30 say "C:\raybox_sys\pict_sys/load3.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                CLEAR
                            @2,18 say "¡Welcome to Raybox!" font "Arial Black",25 color b+/w**
                            @7,30 say "C:\raybox_sys\pict_sys/load4.jpg" bitmap isometric size 14,14
                                WAIT"" timeout 0.20
                                    DEACTIVATE WINDOW inpt, capt, capt2
                                    CLEAR 
                                    DO raybox_login                   
            ELSE
                messagebox("Canceled inputs. Press OK to exit", 0+32, "Canceled")
                CLEAR ALL 
                DEACTIVATE WINDOW inpt, capt, capt2
                QUIT
            ENDIF                    
ENDDO