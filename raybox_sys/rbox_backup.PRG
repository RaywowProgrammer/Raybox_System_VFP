*Author: Ing. Mathias Jimenez Villamar
*Target: Create a new principal menú for backup tables.
*Date: 14/sep/20242
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
define windows fit from 1,50 to 15,130 title "                                                                                  Raybox.MJ | Hardware Tools"
define windows back from 12,50 to 35,130 title ""+cdow(date())+". "+MDY(DATE())+"                                                                                                                                                   "+TIME()
x=0
do while .t.
    store space(15) to path, pass
    store 0 to a, e, rec
    STORE SPACE(5) TO t
     x=x+1
     s=alltrim(str(x))
           do case
              case x<10
               z="0000"
              case x>9 and x<100
                z="000"
              case x>99 and x<1000
                z="00"
              case x>999 and x<10000
              z="0"
           ENDCASE
         t=z+s
    activate WINDOW fit
        @0,12 say "C:\raybox_sys\pict_sys/rbox_pict.jpg" bitmap isometric size 50,52
    activate WINDOW back
        @20,33 say "You can back to menú, click over the Menú below UP" font "Verdana",10 color r/w**
        @1,2 say "Let's Make a Backup " font "Verdana",15 color r/w**
        @1,29 say hisname font "Verdana",15 color r/w**
        @4,2 say "Please, confirm you password: " font "Arial black",10 get pass valid ALLTRIM(pass)==ALLTRIM(pass_user) and !EMPTY(pass) error "INCORRECT PASSWORD"
            READ 
                IF readkey()=12
                   DEACTIVATE WINDOW back, fit
                   CLEAR
                   DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                ENDIF
        @10,4 get rec function "*H Products.Database;Access.History;Users.Profile;Incomes.Currency;Invoices" size 3, 2, 3 color r/w**
            READ
                DO CASE
                    CASE rec=1
                        USE rbox_database
                        path=PUTFILE("Save as:", "raybox_data_"+ALLTRIM(t), "XLS")
                        copy to rbox_database TYPE XLS
                            IF messagebox("Make Another backup? or Remain to menu?",4+64, "Ray Question")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF 
                    CASE rec=2
                        USE rbox_history_database
                        path=PUTFILE("Save as:", "raybox_hist_"+ALLTRIM(t), "XLS")
                        copy to rbox_history_database TYPE XLS
                            IF messagebox("Make Another backup? or Remain to menu?",4+64, "Ray Question")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                    CASE rec=3
                        USE rbox_users
                        path=PUTFILE("Save as:", "raybox_users_"+ALLTRIM(t), "XLS")
                        copy to rbox_users TYPE XLS
                            IF messagebox("Make Another backup? or Remain to menu?",4+64, "Ray Question")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                    CASE rec=4
                        USE rbox_inc_database
                        path=PUTFILE("Save as:", "raybox_inc_"+ALLTRIM(t), "XLS")
                        copy to rbox_inc TYPE XLS
                            IF messagebox("Make Another backup? or Remain to menu?",4+64, "Ray Question")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                    CASE rec=5
                        USE rbox_invoice
                        path=PUTFILE("Save as:", "raybox_inv_"+ALLTRIM(t), "XLS")
                        copy to rbox_invoice TYPE XLS
                            IF messagebox("Make Another backup? or Remain to menu?",4+64, "Ray Question")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                ENDCASE         
enddo
