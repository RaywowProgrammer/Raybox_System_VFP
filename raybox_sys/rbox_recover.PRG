*Author: Mathias Jimenez Villamar
*Target: Create a new principal men� for the enterprise.
*Date: 14/sep/20242
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t.
CLEAR
SET ESCAPE OFF
DEFINE WINDOW pic FROM 1,50 TO 15,130 TITLE "Raybox System"
DEFINE WINDOW code FROM 13,50 TO 38,67 TITLE "          Reg Code"
DEFINE WINDOW only FROM 33,50 TO 39,130 TITLE "Raybox Rules  |  Admin Successfully Verified"
DEFINE WINDOW ipt FROM 13,74 TO 38,136 TITLE "                                              Raybox.CO | Hardware Tools"
    STORE 0 TO opt1, opt2, cod, co, opt_final, finalopt, codx
    STORE SPACE(8) TO cod1
USE rbox_database
SET DELETED OFF
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
        @1,50 say "R" font "Arial Black",20 color b/w**
            WAIT"" timeout 0.15 
        @1,53 say "E" font "Arial Black",20 color b/w**
            WAIT"" timeout 0.15 
        @1,56 say "C" font "Arial Black",20 color b/w**
            WAIT"" timeout 0.15 
        @1,59 say "O" font "Arial Black",20 color b/w**
            WAIT"" timeout 0.15 
        @1,62 say "V" font "Arial Black",20 color b/w**
            WAIT"" timeout 0.15 
        @1,65 say "E" font "Arial Black",20 color b/w**
            WAIT"" timeout 0.15
        @1,68 say "R" font "Arial Black",20 color b/w**
            WAIT"" timeout 0.15
    ACTIVATE WINDOW code
       *FOR co=0 TO 5 co++
           BROWSE FOR DELETED() FIELDS art_code:h="ART CODE" NODELETE NOEDIT NOAPPEND 
              *wait"" timeout 0.100 
       *ENDFOR 
    ACTIVATE WINDOW ipt
        USE rbox_database INDEX codexy
       @1,3 say "Insert a Register number: " font "Gelasio",15
        @1,32 get cod pict "9" font "Gelasio",15 valid not EMPTY(cod) error "This filed need to be filled"
        @3,3 say "Insert a Register's Number: " font "Gelasio",15
        @3,38 get cod1 pict "a-9999" font "Gelasio",15 valid not EMPTY(cod1) error "This filed need to be filled"
            READ
            seek upper(cod1)
               if found()
                   @8,5 say "Description:"
                   @10,5 say "Marque:"
                   @12,5 say "Price:"
                   &&Replace
                   @8,18 say descript
                   @10,14 say marque
                   @12,14 say price
                   @8,42 say art_img bitmap isometric size 12,12
                   @18,10 get opt1 function "*h RECOVER;RECOVER ALL;CANCEL" size 3, 2, 3
                       READ 
                           DO CASE
                               CASE opt1=1
                                   GO cod
                                   RECALL 
                                   SHOW gets
                                   messagebox("Register recovered",0+32,"Success!")
                                       IF messagebox("Recover another register? or Back to menu?",4+64, "Ray Question")=6
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
                                   IF messagebox("Are you Sure? (This cannot be undone)", 4+64, "Important!!")=6
                                       RECALL ALL
                                       SHOW gets
                                       MESSAGEBOX("All registers was recoverd", 0+32, "Success!")
                                       CLEAR
                                       DEACTIVATE WINDOW pic, code, only, ipt
                                       REINDEX
                                       DO raybox_principal with hisname, hissurname, pass_user, numbers, histype, one
                                   ELSE
                                       IF messagebox("Recover another register? or Back to menu?", 4+64, "Ray Question")=6
                                           CLEAR
                                           REINDEX
                                           LOOP 
                                       ELSE 
                                           CLEAR
                                           DEACTIVATE WINDOW pic, code, only, ipt
                                           REINDEX
                                           DO raybox_principal with hisname, hissurname, pass_user, numbers, histype, one
                                       ENDIF
                                   ENDIF 
                               CASE opt1=3
                                   messagebox("Canceled inputs. Press OK to reboot", 0+32, "Cancel?")
                                   CLEAR
                                   REINDEX
                                   LOOP 
                           ENDCASE 
               ELSE 
                 MESSAGEBOX("The register number or code isn't added on the table. Try again",0+32,"Anything recovered")
                 CLEAR
                 REINDEX
                 LOOP 
               ENDIF
ENDDO 