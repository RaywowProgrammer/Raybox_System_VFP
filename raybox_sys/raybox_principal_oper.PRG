*Author: Mathias Jimenez Villamar
*Target: Create a new principal menú for operators.
*Date: 14/sep/2024
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t.
SET SYSMENU TO
DO raybox_toolbars.mpr
SET CENTURY ON
ON KEY LABEL ESC
DEFINE WINDOW ch from 17,50 to 40,130 TITLE "                                                                Raybox.co | Hardware Tools - User:  "+hisname+" "+hissurname
DEFINE WINDOW pic FROM 1,50 to 22,130 TITLE ""+cdow(date())+". "+MDY(DATE())+"                                                                                                                                                "+TIME() COLOR SCHEME 4 RGB(0, 0, 0)
DEFINE WINDOW option1 FROM 30,50 to 36,130 TITLE "Raybox Options"
    CLEAR
    STORE 0 TO aga, opt, opt1, opt2, opt3, final_opt, final_opt2, sis1, sis2
    STORE 24 TO con
    STORE 45 TO rev
    STORE DATE() to dt
    STORE time() to time
ACTIVATE WINDOW pic
    @0,0 say "C:\raybox_sys\pict_sys/rbox_pict.jpg" bitmap isometric size 80, 80
ACTIVATE WINDOW ch
    DO WHILE con<41 AND rev>40
        clear
        @18,con say "C:\raybox_sys\pict_sys/raybo.jpg" bitmap isometric size 13,13
        @18,rev say "C:\raybox_sys\pict_sys/real_hammer.jpg" bitmap isometric size 5,5
            WAIT"" timeout 0.209
        con=con+1
        rev=rev-1
    ENDDO 
@0,22 say "Welcome" font "Arial Black",22 color r/w**
@0,42 say hisname font "Arial Black",22 color b/w**
    @1,1 get opt2 function "*h Options" size 3, 2, 3
    @4,1 get opt3 function "*h \\Delete all & Reset System" size 3, 2, 3
    @9,8 get opt function "*h Product.Register;\\Data.Checker;\\Data.Remover;\\Data.Recover" size 3, 2, 3
    @12,7 get opt1 function "*h Users.Options;\\History.Settings;\\Product.Viewer;Shopping.Center" size 3, 2, 3
        READ
        DO CASE 
            CASE opt1=1
                ACTIVATE WINDOW option1
                     @1,25 get sis1 function "*h User.Password.Change" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Maintenance 1.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Maintenance 1..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Maintenance 1... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                       " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_password_change_oper WITH hisname, hissurname, pass_user, histype, one
                            ENDCASE
            CASE opt1=2
                ACTIVATE WINDOW option1
                     @1,25 get sis1 function "*h History.Checker" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting History .   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting History ...  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting History .... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                        " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_history_checker WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE
             CASE opt1=3
                ACTIVATE WINDOW option1
                     @1,28 get sis1 function "*h Product.Viewer" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Viewer .   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Viewer ...  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Viewer .... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                        " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_checker WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE
            CASE opt1=4
                ACTIVATE WINDOW option1
                     @1,22 get sis1 function "*h \\Income.Checker;Purchase.Exterior" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Sells .   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Sells  ...  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Sells  .... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                        " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO raybox_incomes WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=2
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Sells .   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Sells  ...  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Sells  .... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                        " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_exterior_oper WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE
        ENDCASE 
        DO CASE 
            CASE opt=1
              ACTIVATE WINDOW ch 
                @20,1 say "Connecting system 1.   " font "Gelasio",10
                    wait"" timeout 0.560
                @20,1 say "Connecting system 1..  " font "Gelasio",10
                    wait"" timeout 0.560
                @20,1 say "Connecting system 1... " font "Gelasio",10
                    wait"" timeout 0.560
                @20,1 say "CONNECTED!                 " font "Gelasio",10
                    wait"" timeout 0.460
                DEACTIVATE WINDOW pic,ch
                clear
                DO rbox_input_oper WITH hisname, hissurname, pass_user, numbers, histype, one
            CASE opt=2
                ACTIVATE WINDOW option1
                    @1,14 get sis1 function "*h \\Register.Table;\\User.Accounts;Product.\\Amount.Searcher" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Review 1.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Review 1..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Review 1... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                  " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_registers_table WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=2
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Subsystem 2.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Subsystem 2..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Subsystem 2... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                      " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_usersec WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=3
                                  ACTIVATE WINDOW ch
                                    @20,1 say "Connecting Subsystem 3.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Subsystem 3..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Subsystem 3... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                    " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_amount_searcher WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE           
            CASE opt=3
                ACTIVATE WINDOW option1
                    @1,20 get sis1 function "*h Registers.REM;Users.REM" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Removal 1.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Removal 1..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Removal 1... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                 " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_deleter WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=2
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Removal 2.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Removal 2..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Removal 2... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                 " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_deleter_users WITH hisname, hissurname, pass_user, numbers, histype, one
                              ENDCASE                
              CASE opt=4
                ACTIVATE WINDOW option1
                    @1,15 get sis1 function "*h Product.REC;Backup.DAT;User.REC" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Recoverer 1.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Recoverer 1..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Recoverer 1... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                   " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_recover WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=2
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Backup System.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Backup System ..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Backup System ... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                   " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_backup WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=3
                                  ACTIVATE WINDOW ch 
                                    @20,1 say "Connecting Recoverer 3.   " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Recoverer 3..  " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "Connecting Recoverer 3... " font "Gelasio",10
                                        wait"" timeout 0.560
                                    @20,1 say "CONNECTED!                   " font "Gelasio",10
                                        wait"" timeout 0.460
                                    DEACTIVATE WINDOW pic, ch, option1
                                    clear
                                    DO rbox_recover_users WITH hisname, hissurname, pass_user, numbers, histype, one
                              ENDCASE
            ENDCASE
        DO CASE 
            CASE opt2=1
                ACTIVATE WINDOW option1
                    @1,25 get aga function "*h CLOSE.SYSTEM;LOG.OUT" size 3, 2, 3
                        read
                            DO CASE 
                                CASE aga=1
                                        MESSAGEBOX("Closing System..", 0+32, "SHUTTING DOWN")
                                        DEACTIVATE WINDOW ch, pic, option1
                                        CLEAR ALL 
                                        QUIT
                                CASE aga=2
                                    ACTIVATE WINDOW ch 
                                        @20,1 say "IN PROGRESS.   " font "Gelasio",10
                                            wait"" timeout 0.400
                                        @20,1 say "IN PROGRESS..  " font "Gelasio",10
                                            wait"" timeout 0.400
                                        @20,1 say "IN PROGRESS... " font "Gelasio",10
                                            wait"" timeout 0.600
                                        DEACTIVATE WINDOW ch, pic, option1
                                        CLEAR ALL 
                                        DO raybox_login
                            ENDCASE 
        ENDCASE     
        DO CASE 
            CASE opt3=1
                DEFINE WINDOW option1 FROM 30,50 to 36,130 TITLE "This action cannot be undone."
                ACTIVATE WINDOW option1 
                    @1,1 say "Are you sure?  1/2" font "Arial Black",20 
                    @1,48 get final_opt function "*h I'M SURE;CANCEL OPERATION" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE final_opt=1
                                    CLEAR
                                    @1,1 say "Are you sure?  2/2" font "Arial Black",20 color r/w**
                                        wait"" timeout 0.2000
                                    @1,50 get final_opt2 function "*h CONTINUE;CANCEL OPERATION" size 3, 2, 3
                                        READ 
                                            IF final_opt2=1
                                             ACTIVATE WINDOW ch 
                                                @20,1 say "DELETING ALL" font "Gelasio",12 color r+/w**
                                                    wait"" timeout 0.900
                                                @20,1 say "                             " font "Gelasio",12 color r+/w**
                                                    wait"" timeout 0.900
                                                @20,1 say "DELETING ALL" font "Gelasio",12 color r+/w**
                                                    wait"" timeout 0.900
                                                @20,1 say "                             " font "Gelasio",12 color r+/w**
                                                    wait"" timeout 0.900
                                                @20,1 say "DELETING ALL" font "Gelasio",12 color r+/w**
                                                    wait"" timeout 0.900
                                                @20,1 say "                             " font "Gelasio",12 color r+/w**
                                                    wait"" timeout 0.900
                                                @20,1 say "DELETING ALL" font "Gelasio",12 color r+/w**
                                                    wait"" timeout 0.900
                                                SET SAFETY OFF 
                                                    USE rbox_database EXCLUSIVE
                                                    ZAP 
                                                    USE rbox_users EXCLUSIVE
                                                    ZAP
                                                    USE rbox_history_database EXCLUSIVE
                                                    ZAP
                                                    DEACTIVATE WINDOW option1, pic, ch
                                                CLEAR ALL
                                                SET SYSMENU TO DEFAULT
                                                DO raybox_signup
                                            ELSE
                                                CLEAR
                                                LOOP 
                                            ENDIF  
                                CASE final_opt=2
                                    CLEAR
                                    LOOP 
                            ENDCASE            
        ENDCASE 
ENDDO