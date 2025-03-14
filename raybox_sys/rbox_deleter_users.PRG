*Author: Mathias Jimenez Villamar
*Target: Create a new principal men� for the enterprise.
*Date: 14/sep/2024
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t.
CLEAR
DEFINE WINDOW pic FROM 1,50 TO 15,130 TITLE "Raybox System"
DEFINE WINDOW code FROM 13,50 TO 38,67 TITLE "          Reg Code"
DEFINE WINDOW only FROM 33,50 TO 39,130 TITLE "Raybox Rules  |  Admin Successfully Verified"
DEFINE WINDOW ipt FROM 13,74 TO 38,136 TITLE "                     Raybox.MJ | Hardware Tools"
    STORE 0 TO opt1, opt2, cod, co, opt_final, finalopt, codx
    STORE SPACE(8) TO cod1
USE rbox_users INDEX ci
SET DELETED ON
    CLEAR
    ACTIVATE WINDOW pic
        @0,12 say "C:\raybox_sys\pict_sys/rbox_pict.jpg" bitmap isometric size 50,52
    ACTIVATE WINDOW only
        @1,5 say "O" font "Arial Black",20
            WAIT"" timeout 0.15
        @1,8 say "N" font "Arial Black",20
            WAIT"" timeout 0.15
        @1,11 say "L" font "Arial Black",20
            WAIT"" timeout 0.15
        @1,13 say "Y" font "Arial Black",20
            WAIT"" timeout 0.15
        @1,18 say "A" font "Arial Black",20
            WAIT"" timeout 0.15         
        @1,21 say "D" font "Arial Black",20
            WAIT"" timeout 0.15  
        @1,24 say "M" font "Arial Black",20
            WAIT"" timeout 0.15  
        @1,27 say "I" font "Arial Black",20
            WAIT"" timeout 0.15  
        @1,29 say "N" font "Arial Black",20
            WAIT"" timeout 0.15     
        @1,32 say "S" font "Arial Black",20
            WAIT"" timeout 0.15  
        @1,38 say "C" font "Arial Black",20
            WAIT"" timeout 0.15 
        @1,41 say "A" font "Arial Black",20
            WAIT"" timeout 0.15 
        @1,44 say "N" font "Arial Black",20
            WAIT"" timeout 0.15 
        @1,50 say "D" font "Arial Black",20 color r/w**
            WAIT"" timeout 0.15 
        @1,53 say "E" font "Arial Black",20 color r/w**
            WAIT"" timeout 0.15 
        @1,56 say "L" font "Arial Black",20 color r/w**
            WAIT"" timeout 0.15 
        @1,59 say "E" font "Arial Black",20 color r/w**
            WAIT"" timeout 0.15 
        @1,62 say "T" font "Arial Black",20 color r/w**
            WAIT"" timeout 0.15 
        @1,65 say "E" font "Arial Black",20 color r/w**
            WAIT"" timeout 0.15
    ACTIVATE WINDOW code
       *FOR co=0 TO 5 co++
           BROWSE FIELDS id_number:h="ID NUMBER" NODELETE NOEDIT NOAPPEND 
              *wait"" timeout 0.100 
       *ENDFOR 
    ACTIVATE WINDOW ipt
        USE rbox_users INDEX ci 
        @1,3 say "Insert a Register number: " font "Gelasio",15
        @1,32 get cod pict "9" font "Gelasio",15 valid not EMPTY(cod) error "This filed need to be filled"
        @3,3 say "Insert a Register ID's Number: " font "Gelasio",15
        @3,38 get cod1 pict "9999999999" font "Gelasio",15 valid not EMPTY(cod1) error "This filed need to be filled"
            READ
            seek upper(cod1)
               if found()
                   @7,18 say name font "Arial Black",10 
                   @7,28 say surname font "Arial Black",10
                   @9,20 say user_photo bitmap isometric size 12,12
                   @18,10 get opt1 function "*h DELETE;DELETE PERMANETLY;CANCEL" size 3, 2, 3
                   @21,22 get opt_final function "*h DELETE NEXT" size 3, 2, 3
                       READ
                           DO CASE
                               CASE opt_final=1
                                           GO cod
                                           DELETE NEXT 1
                                           SHOW gets 
                                           messagebox("The next register "+id_number+" was deleted",0+32,"Successfull!")
                                               IF messagebox("Delete another register? or Back to menu?",4+64, "Ray Question")=6
                                                   CLEAR
                                                   LOOP 
                                               ELSE 
                                                   CLEAR
                                                   DEACTIVATE WINDOW pic, code, only, ipt
                                                   REINDEX
                                                   DO raybox_principal with hisname, hissurname, pass_user, numbers, histype, one
                                               ENDIF 
                                       ELSE 
                                           MESSAGEBOX("The register number next isn't added on the table.",0+32,"Anything deleted")
                                           IF messagebox("Delete somes registers? or Back to menu?",4+64, "Ray Question")=6
                                               CLEAR
                                               LOOP 
                                           ELSE 
                                               CLEAR
                                               DEACTIVATE WINDOW pic, code, only, ipt
                                               REINDEX
                                               DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                                           ENDIF
                                       ENDIF 
                          ENDCASE 
                          DO CASE
                               CASE opt1=1
                                   GO cod 
                                   DELETE 
                                   SHOW gets 
                                   messagebox("Register deleted",0+32,"Success!")
                                       IF messagebox("Delete another register? or Back to menu?",4+64, "Ray Question")=6
                                           CLEAR
                                           REINDEX
                                           LOOP
                                       ELSE 
                                           CLEAR
                                           DEACTIVATE WINDOW pic, code, only, ipt
                                           REINDEX
                                           DO raybox_principal with hisname, hissurname, pass_user, numbers, histype, one
                                       ENDIF 
                               CASE opt1=2
                                   GO cod
                                   DELETE
                                   PACK
                                   messagebox("Register deleted permanetly",0+32,"Success!")
                                       IF messagebox("Delete another register? or Back to menu?",4+64, "Ray Question")=6
                                           CLEAR
                                           REINDEX
                                           LOOP
                                       ELSE 
                                           CLEAR
                                           DEACTIVATE WINDOW pic, code, only, ipt
                                           REINDEX
                                           DO raybox_principal with hisname, hissurname, pass_user, numbers, histype, one
                                       ENDIF 
                               CASE opt1=3
                                   messagebox("Canceled inputs. Press OK to reboot",0+32,"Cancel?")
                                   CLEAR
                                   REINDEX
                                   LOOP
                           ENDCASE 
               ELSE 
                 MESSAGEBOX("The register number or code isn't added on the table. Try again",0+32,"Anything deleted")
                 CLEAR
                 REINDEX
                 LOOP
               ENDIF
enddo 