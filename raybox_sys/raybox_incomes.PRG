*Author: Ing. Mathias Jimenez Villamar
*Date: Tuesday, November 19th.
*Target: Create a checker incomes program.
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
do while .t.
define windows sis from 1,10 to 16,100 title "Merchandise System"
define windows ing from 13,10 to 28,100 title "Incomes Checker"
use rbox_database
    CLEAR
    go 1
    store 0 to math, rec, inc
    STORE DATE() TO day
activate windows ing
activate windows sis
    browse fields art_code:h="CODE", descript:h="DESCRIPTION", incomes:h="INCOMES" noappend noedit nodelete
activate windows ing
    @1,5 say "Press to check your total income" get math function "*h INCOMES" size 3, 2, 3
        read
        do while !eof()
            math=incomes
            inc=math+inc
            SKIP
        enddo
    @5,32 say inc pict "$###,###.99" font "Arial Black",20
    @5,5 say inc pict "You've all these:" font "Arial Black",20 color r+/W**
    @5,58 get rec function "*h Save;Back to Menu" size 3, 2, 3
        read
        if rec=1
            USE rbox_inc_database
            append blank
                  replace username with hisname
                  replace surname with hissurname
                  replace total_inc with inc
                  replace date with day
                  messagebox("Incomes saved successfully",0+32,"Success!")
                  IF messagebox("Do you want to check again?",4+64,"Enter or Menu")=6 
                      CLEAR
                      LOOP
                  ELSE
                      DEACTIVATE WINDOW sis, ing
                      CLEAR
                      DO raybox_principal WITH hisname, hissurname, histype, pass_user, one, numbers
                 ENDIF
        ELSE
            DEACTIVATE WINDOW ing, sis
            CLEAR
            DO raybox_principal WITH hisname, hissurname, pass_user, numbers, histype, one
        endif
enddo