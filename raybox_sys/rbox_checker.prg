*Author: Mathias Jimenez Villamar
*Target: Create a new checker data in the menu for our hardware tools system
*Date: 14/sep/20242
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t. 
define windows pict from 1,50 to 15,132 title "                                                                                  Raybox.co | Hardware Tools"
define windows inpt from 12,50 to 45,132 title "Raybox | Data searcher"
define windows rest from 12,2 to 20,38 title ""+cdow(date())+". "+MDY(DATE())+"                                                                                                                                                   "+TIME()
use rbox_database index codexy
    STORE 0 TO rec, rec_final
activate windows pict
  @0,12 say "C:\raybox_sys\pict_sys/rbox_pict.jpg" bitmap isometric size 50,52
activate windows inpt
DO WHILE .t.
    CLEAR
       @3,5 say "Product code: "
       @6,5 say "Product descript: "
       @9,5 say "Product marque: "
       @12,5 say "Amount/Stock: "
       @15,5 say "Date: "
       @18,5 say "Product Descount: " 
       @21,5 say "Product price: "
       @24,5 say "Unit: "
       @27,5 say "Incomes/Total: " 
       &&Replace
       @3,25 say art_code
       @6,25 say descript
       @9,25 say marque
       @12,25 say amount
       @15,25 say date
       @18,25 say discount
       @21,25 say price
       @24,25 say uni
       @27,25 say incomes
       @1,50 say art_img bitmap isometric size 15,15
@30,16 get rec_final function "*h <#;<;>;#>;Delete It;Menu" size 2,5,4
      READ 
do case
    case rec_final=1
        go bottom
    case rec_final=2
        if !eof()
            skip
        if eof()
            messagebox("The end of the list", 0+32, "You've reached")
            go bottom
        endif
        endif
    case rec_final=3
        if !bof()
            SKIP -1
        if bof()
            messagebox("The Top of the list", 0+32, "You've reached")
            go TOP 
        endif
        endif
    case rec_final=4
        GO TOP 
    CASE rec_final=5
        IF MESSAGEBOX("Are you Sure? (Go to remover system)", 4+64, "Raybox Question")=6
            MESSAGEBOX("Sending information.. (Starting Subsystem)", 0+32, "Starting..")
            DEACTIVATE WINDOW rest, pict, inpt
            DO rbox_deleter WITH hisname, hissurname, pass_user, numbers, histype, one
        ELSE 
            MESSAGEBOX("Received, canceled proccess", 0+32, "Raybox Company")
            CLEAR
            LOOP 
        ENDIF 
    CASE rec_final=6 
        ACTIVATE WINDOW rest
            @1,2 say "Choose an option:"
            @3,2 get rec function "*H Look again;Back to Menú" size 3,2,3
                READ 
                    DO CASE 
                        case rec=1
                            DEACTIVATE WINDOW rest, pict, inpt
                            CLEAR
                            EXIT
                        CASE rec=2 
                            messagebox("Press Ok to exit", 0+32, "Returning to Menu")
                            deactivate windows pict,inpt,rest
                            CLEAR 
                            DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                    ENDCASE
ENDCASE
ENDDO
ENDDO


