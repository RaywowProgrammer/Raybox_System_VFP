*Author: Mathias Jimenez Villamar
*Target: Create a new program cheker register.
*Date: 30/sep/2024
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t.
CLEAR
USE rbox_history_database
SET DELETED ON 
SET CENTURY ON 
DEFINE WINDOW ta from 12,15 to 35,155 TITLE "                                                                                                                                                                "+cdow(date())+", "+mdy(date())
DEFINE WINDOW pic FROM 1,50 to 15,130 TITLE "                                                                          Raybox.CO | Hardware Tools"
DEFINE WINDOW opt FROM 30,50 TO 37,130 TITLE "Raybox Option"
    STORE 0 TO opt1
    ACTIVATE WINDOW pic
        @0,12 say "C:\raybox_sys\pict_sys/rbox_pict.jpg" bitmap isometric size 50,52
    ACTIVATE WINDOW ta
        BROWSE FIELDS username:h="Usernames", surname:h="Surnames", type:h="Type", passkey_ch:h="Password Change", date:h="Login/Change Date" NOEDIT NOAPPEND NODELETE 
    ACTIVATE WINDOW opt
        @1,1 say "Options:" font "Arial Black",20 color b+/w**
            wait"" timeout 0.200
        @1,1 say "                           " font "Arial Black",20 color r+/w**
            wait"" timeout 0.200
        @1,1 say "Options:" font "Arial Black",20 color b+/w**
            wait"" timeout 0.200
        @1,1 say "                           " font "Arial Black",20 color r+/w**
            wait"" timeout 0.200
        @1,1 say "Options:" font "Arial Black",20 color b+/w**
            wait"" timeout 0.200
        @1,1 say "                           " font "Arial Black",20 color r+/w**
            wait"" timeout 0.200
        @1,1 say " Select an option:" font "Arial Black",20 color r/w**
        @1,46 get opt1 function "*h See Again;Back to the menu" size 3, 2, 3 
            READ
                DO CASE 
                    CASE opt1=1
                        CLEAR 
                        LOOP
                    CASE opt1=2
                        messagebox("Press OK to exit",0+32,"Menu")
                        DEACTIVATE WINDOW ta, pic, opt
                        CLEAR
                        DO raybox_principal with hisname, hissurname, pass_user, numbers, histype, one
                ENDCASE
ENDDO