*Author: Mathias Jimenez Villamar
*Target: Create a new register input of the menú base.
*Date: 14/sep/2024
PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
define windows img from 1,50 to 15,130 title "                                                                                  Raybox.co | Hardware Tools"
define windows input from 12,50 to 35,130 title ""+cdow(date())+". "+MDY(DATE())+"                                                                                                                                                   "+TIME()
********************
USE rbox_database INDEX codexy
do while .t. 
    store space(8) to co,unid
    store space(20) to de
    store space(10) to ma
    STORE SPACE(150) TO img_file
    STORE 1 TO unit
    store 0 to amo, pri, inc, dis, cash, rec, pvp, taxes, tax
    store datetime() to day
    STORE DATE() TO date
activate windows img
   @0,12 say "C:\raybox_sys\pict_sys/rbox_pict.jpg" bitmap isometric size 50,52    
activate windows input 
    @1,34 say "Code: " font "arial black",12 color r/w**
    @1,42 get co pict "a-####" font "arial black",12 color r/w**
        read
            if readkey()=12
                messagebox("Press OK to exit",0+32,"Proccess finished")
                DEACTIVATE WINDOW input,img
                CLEAR
                DO raybox_principal WITH hisname, hissurname, numbers, histype, one, pass_user
            ENDIF 
            seek upper(co)
               if found()
                   messagebox("That code is already in use",0+48,"ERROR 404")
                   LOOP
               ENDIF
    @6,5 say "Product description: " get de valid not empty(de) error "This field can't be empty" color r+/w**
    @9,5 say "Product marque: " color r+/w**
    @7,21 get ma function "^ DeWalt;3M;Stanley;Bosch;Phillips;Makita;Austromex;Rotoplas;IUSA;Milwaukee;Ryobi;Trupper;Klein;Stihl"
    @12,5 say "Choose mode: " color r+/w**
    @12,18 get unit function "*RV Unit;Mayor" font "arial black",7
        DO case
            CASE unit=1
                unid="Unit"
            CASE unit=2
                unid="Mayor"
        ENDCASE 
    @12,26 say "Choose mode: " color r+/w**
    @12,39 get tax function "*RV 12% +C;15% +C" font "arial black",7
        DO case
            CASE tax=1
                tax=12.00
            CASE tax=2
                tax=20.00
        ENDCASE 
    @8,48 say "Amount/Stock: " get amo spinner 1,1,100 valid (amo>=1 and amo<=100) error "MAX AMOUNT 100 - MIN AMOUNT 1" color r+/w**
    @11,48 say "Product Descount: " color r+/w**
    @9,66 get dis function "^ 20%;25%;30%;35%;40%;60%;80%"
    @14,48 say "Product price: " get pri pict "999.99" color r+/w**
        READ
            DO CASE 
                case dis=1
                    discount=5.00
                case dis=2
                    discount=10.00
                case dis=3
                    discount=15.00
                case dis=4
                    discount=20.00
                case dis=5
                    discount=25.00
                case dis=6
                    discount=30.00
                case dis=7
                    discount=45.00
            ENDCASE 
    inc=(amo*pri)*((100-discount)/100)    
    taxes=inc*(1+(tax/100))
        @16,2 say "SubTotal: " font "Geologica",15 color r/w**
        @16,15 say TRANSFORM(inc, "999,999.99") font "Geologica",15
        @19,2 say "Total (+TAX): " font "Geologica",15 color r/w**
        @19,18 say TRANSFORM(taxes, "999,999.99") font "Geologica",15

@17,53 get rec function "*H Record;Cancel;Exit" size 3,2,3 color r/w**
  read
      do case
          case rec=1
              append blank
                  replace art_code with upper(co)
                  replace descript with de
                  replace marque with ma
                  replace amount with amo
                  replace price with pri
                  replace date with day
                  replace incomes with inc
                  replace discount with dis
                  replace uni with unid
                      messagebox("Inputs recordered successfully",0+32,"Success!")
                      IF messagebox("Enter a image file too?", 4+64, "Image File")=6
                          img_file=GETFILE()
                              IF !EMPTY(img_file)  
                                  replace art_img WITH ALLTRIM(img_file)
                                  messagebox("Image uploaded correctly",0+32,"Success!")
                              ELSE
                                  MESSAGEBOX("Any image selected",0+32,"No one have selected")
                              ENDIF
                      ELSE 
                          IF messagebox("Enter another register?",4+64,"Enter or Menu")=6 
                              clear
                              LOOP
                          ELSE
                              DEACTIVATE WINDOW input,img
                              CLEAR
                              DO raybox_principal WITH hisname, hissurname, histype, pass_user, one, numbers
                          ENDIF
                      endif
          case rec=2 
              messagebox("Received. Press Ok to reboot",0+32,"Correct!")
              clear
              loop
          case rec=3
              messagebox("Press OK to exit",0+32,"Menu")
              DEACTIVATE WINDOW input,img
              CLEAR
              DO raybox_principal WITH hisname, hissurname, histype, one, numbers, pass_user
      endcase
***************************************** 
deactivate windows img,input
ENDDO