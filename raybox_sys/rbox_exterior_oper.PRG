*Author: Mathias Jimenez Villamar
*Date: 21/11/24
*Target: Make a functional program easy for sale.
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
define windows men from 1,10 to 14,100 title "Raybox Merchandise"
define windows cliente from 11,10 to 20,100 title "Customer Credentials"   
define windows ingreso from 18.5,10 to 30,100 title " Cod.                   Descript                              Marque                             Price                                    Amount.                                     Total "
define windows x from 27.9,80 to 37,117.59 title "                                       TOTAL" 
define windows xx from 17,140 to 26,175 title "                             Raybox Shooping "
define windows total from 6,140 to 16,175 title "Total to Pay:                                  Raybox Shooping"
define windows pay from 20,145 to 25,170 title "Enter another Invoice:"
  select 1
  use rbox_invoice
  go bottom
  select 2
  USE rbox_database index codexy
  do while .t.
     CLEAR 
     store space(30) to cli
     store space(13) to ced
     store space(40) to dir, correo
     store datetime() to fe
     store space(1) to z
     store space(5) to t
     STORE DATE() TO day
     store 0 to des, mar, inc, amo, can, sub, iva, tot
     lin=0
     lin_min=1
     lin_max=6
       select 1
         x=VAL(inv_number)
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
           endcase
   activate windows men 
       @0,0 say "C:\raybox_sys\pict_sys/rbox_pict.jpg" bitmap isometric size 50, 52
       t=z+s
       select 1
       append blank
           replace inv_number with t
 activate windows cliente 
     @1,2 say "Invoice Numb: "+t font "Arial Black",10
     @3,2 say "Customer: " get cli
     @5,2 say "Address: " get dir
     @2,45 say "E-Mail: " get correo
     @5,55 say "ID-Ruc: " get ced pict "##########" valid not EMPTY(ced) and LEN(ALLTRIM(ced))==10 error "Please enter a valid RUC OR ID Number"
       READ 
 do while .t.
     store space(7) to cod
     store 0 to can
     activate windows ingreso 
     @lin,0 get cod pict "a-####" font "arial black",12 color r/w**
       READ
           IF readkey()=12
              EXIT
           ENDIF
     select 2
     seek upper(cod)
         if !FOUND()
           messagebox("The code doesn't exit",0+48,"ERROR INFO")
           LOOP
         endif
     @lin,10 say descript font "arial",10
     @lin,28 say marque font "arial",10
     @lin,44 say price pict "##.##" font "arial",10
     @lin,54 say "|" font "Arial Black",12
     @lin,60 get can spinner 1,1,100 font "arial",10
       read
           t=incomes*can
           tt=alltrim(str(t))
           @lin,80 say tt pict "####,999.99" font "arial",10
    sub=sub+t
    iva=sub*0.15
    tot=sub+iva
    IF lin>=lin_max        
        lin_min=lin_min+1       
        CLEAR GETS        
        SHOW GETS  
    ELSE        
        lin=lin+1.8      
    ENDIF
    activate windows total
        CLEAR
        @1,5 say "Subtotal: "+transform(sub, "####,999.99") font "Arial Black",10
        @3,5 say "TAX +12%: "+transform(iva, "####,999.99") font "Arial Black",10
        @6,5 say "Total to pay: "+transform(tot, "####,999.99") font "Arial Black",10
enddo
  activate windows xx
     store 0 to pp
     STORE SPACE(24) TO pt
     @2,5 get pp function "*h Purchase;Cancel" SIZE 4 ,10, 2
       read
         DO CASE 
           CASE pp=1
               SELECT 1
               IF messagebox("Want to pay with Diners or FINAL?", 4+64, "Raybox Shooping")=6
                   pt="DINERSCLUB 0953463423"
               ELSE
                   pt="FINAL TRANSACTION"
               ENDIF
                  replace pay_type WITH ALLTRIM(pt)
                  replace customer with ALLTRIM(cli)
                  replace ruc with ALLTRIM(ced)
                  replace email with ALLTRIM(correo)
                  replace address with ALLTRIM(dir)
                  replace tax with ALLTRIM(STR(iva))
                  replace total with ALLTRIM(STR(tot))
                  replace date WITH day
                  messagebox("Your purchase has been successfully completed", 0+32 ,"EXCELENT")
                  MESSAGEBOX("Returning...", 0+32, "Raybox Returning..")
                  DEACTIVATE WINDOW ingreso, men, cliente, X, XX, total
                  CLEAR ALL
                  DO raybox_login
               ELSE  
                   MESSAGEBOX("Received, your purchase was cancelled", 4+64, "Raybox Returning..")
                   DEACTIVATE WINDOW ingreso, men, cliente, X, XX, total
                   CLEAR ALL 
                   DO raybox_login
               ENDIF 
           CASE pp=2
             MESSAGEBOX("Received, your purchase was cancelled", 4+64, "Raybox Returning..")
             DEACTIVATE WINDOW ingreso, men, cliente, X, XX, total
             CLEAR ALL 
             DO raybox_login
         ENDCASE
exit
endcase 
enddo