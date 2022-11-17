create or replace 
Package Plsql_Pdf As
      Procedure Pdf_Uret(P_Pdfname Varchar2);
      PROCEDURE EMP_PDF (P_Pdfname Varchar2);
End;
/
create or replace 
Package Body Plsql_Pdf Is
     Procedure Pdf_Uret(P_Pdfname Varchar2) Is
        Font_Ariel  Pls_Integer;
        Font_Arieli  Pls_Integer;
        Font_Arielb  Pls_Integer;
        Font_ArielBI  Pls_Integer;
     Begin
        As_Pdf3.Init;
        As_Pdf3.Set_Page_Format('A4');
        As_Pdf3.Set_Page_Orientation('PORTRAIT');
        
         Font_Ariel := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arial.ttf','CID', P_Compress => True);
         Font_Arieli := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'ariali.ttf','CID', P_Compress => True);
         Font_Arielb := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbd.ttf','CID', P_Compress => True);
         Font_Arielbi := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbi.ttf','CID', P_Compress => True);
         
        -- As_Pdf3.Put_Image('PDF_DIR', 'ARAZI.jpg', 600, 780, 100, 40, 'center');
         As_Pdf3.Put_Image('PDF_DIR', 'LOGO.png', 100, 780, 100, 40, 'left');
       --  As_Pdf3.Put_Image('PDF_DIR', 'resim.jpg', 500, 780, 100, 40, 'right');
       /*  
         As_Pdf3.Set_Font('helvetica',15);
         as_pdf3.write('Türkçe Karakter Test öçþiðüý ÖÇÞÝÐÜÝ', -1, 730);
         
         As_Pdf3.Set_Font(Font_Ariel,15);
         as_pdf3.write('Türkçe Karakter Test öçþiðüý ÖÇÞÝÐÜÝ', -1, 710);
         
         As_Pdf3.Set_Font(Font_Arieli,12);
         as_pdf3.write('Türkçe Karakter Test öçþiðüý ÖÇÞÝÐÜÝ', -1, 690);
         
          As_Pdf3.Set_Font(Font_Arielb,8);
         As_Pdf3.Write('Türkçe Karakter Test öçþiðüý ÖÇÞÝÐÜÝ', -1, 670);
         
          As_Pdf3.Set_Font(Font_Arielbi,10);
         as_pdf3.write('Türkçe Karakter Test öçþiðüý ÖÇÞÝÐÜÝ', -1, 650);
         */
         /*As_Pdf3.Set_Font(Font_Arielbi,15);
         As_Pdf3.Write('PL/SQL ADVANCE LEVEL DERSLERÝ (2)', P_Y => 665, P_Alignment => 'center');
        
         As_Pdf3.Write(Chr(10));
         
         As_Pdf3.Set_Font(Font_Arielbi,15);
         As_Pdf3.Write('MEHMET ÇELEBÝOÐLU', P_Y =>765, P_Alignment => 'center');
     
      As_Pdf3.Write(Chr(10));
      
         As_Pdf3.Set_Font(Font_Arielbi,10);
         As_Pdf3.Write('Oracle DBA, Forms-Reports ISO 27001 (MSA/LA) PL/SQL Developer Matematikçi', P_Y =>745, P_Alignment => 'center');
         */
         As_Pdf3.Set_Font(Font_Arielbi,10);
         As_Pdf3.Write('PDF RAPOR', P_Y =>765, P_Alignment => 'center');
         As_Pdf3.Horizontal_Line(20, 720, 550, 1.5);
         As_Pdf3.Write('Ders No  : 123', P_X => 20, P_Y =>700, P_Alignment => 'left');
         As_Pdf3.Write('Sayýn Kursiyer', P_X => 72, P_Y =>680, P_Alignment => 'left');
          As_Pdf3.Write('Telefon : 1234567890', P_X => 63, P_Y =>660, P_Alignment => 'left');
          As_Pdf3.Set_Font(Font_Ariel,10);
          As_Pdf3.Write('Þu anda PDF üretecek bir Procedure Yazmaktayýz. O yüzden adým adým yazýyoruz', P_X => 30, P_Y =>630, P_Alignment => 'left');
            As_Pdf3.Write('       Sayýn öðrencim, Çalýþýrken takýldýðýn her noktada Mehmet Hocaya mail yollayark ya da Facedeki CELEBIHOCA grubundan sorabilsin.', P_X => 30, P_Y =>550, P_Alignment => 'left', P_Line_Height => 20);
            As_Pdf3.Write('       Baþarýlar dilerim', P_X => 30, P_Y =>450, P_Alignment => 'left');
            As_Pdf3.Horizontal_Line(20, 430, 550, 1.5);
            As_Pdf3.Set_Font(Font_Ariel,10);
            As_Pdf3.Write('Mehmet ÇELEBÝOÐLU', P_X => 30, P_Y => 250, P_Alignment => 'center');
            As_Pdf3.Write('Oracle DBA, Matematikçi', P_X => 30, P_Y => 235, P_Alignment => 'center');
            As_Pdf3.Write('Video Dersler -Udemy', P_X => 30, P_Y => 205, P_Alignment => 'center');
            As_Pdf3.Write('Tel : 12345677890', P_X => 30, P_Y => 190, P_Alignment => 'center');
            As_Pdf3.Write('mcAkademi9@gmail.com', P_X => 30, P_Y => 170, P_Alignment => 'center');
            
            As_Pdf3.Set_Font(Font_Ariel,30);
            as_pdf3.put_txt(150, 200, 'Mehmet ÇELEBÝOÐLU PL/SQL Advanced Level (2)', 60);
            
         as_pdf3.save_pdf(p_filename => P_Pdfname ||'.pdf');
     End;
     
     Procedure EMP_PDF(P_Pdfname Varchar2) Is
        Font_Ariel  Pls_Integer;
        Font_Arieli  Pls_Integer;
        Font_Arielb  Pls_Integer;
        Font_Arielbi  Pls_Integer;
        Wyaz Varchar2(2000);
        I NUMBER := -1;
     Begin
        As_Pdf3.Init;
        As_Pdf3.Set_Page_Format('A4');
        As_Pdf3.Set_Page_Orientation('PORTRAIT');
        
         Font_Ariel := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arial.ttf','CID', P_Compress => True);
         Font_Arieli := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'ariali.ttf','CID', P_Compress => True);
         Font_Arielb := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbd.ttf','CID', P_Compress => True);
         Font_Arielbi := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbi.ttf','CID', P_Compress => True);
         As_Pdf3.Put_Image('PDF_DIR', 'LOGO.png', 100, 780, 100, 40, 'left');
         
         as_pdf3.set_font(Font_Arielb, 15);
         As_Pdf3.Write(Rpad('SÝCÝL NO', 15, ' ') || Rpad('ÝSMÝ', 15, ' ') || Rpad('ÝÞÝ', 20, ' '), -1, -1, P_Alignment => 'center');
         
         As_Pdf3.Horizontal_Line(20, 725, 550, 1.5);
         as_pdf3.set_font(Font_Ariel, 12);
         For Oku In (Select Empno, Ename, Job From Emp) Loop
                I := I - 20;
                Wyaz := Rpad(Oku.Empno, 15, ' ') || Rpad(Oku.Ename, 15, ' ') || Rpad(Oku.Job, 20, ' ');
                As_Pdf3.Write(Wyaz, -1, I, P_Alignment => 'center');
                AS_PDF3.WRite(chr(10));
         End Loop;
         As_Pdf3.Horizontal_Line(20, 300, 550, 1.5);
         
         As_Pdf3.Set_Font(Font_Arieli, 30);
         As_Pdf3.Put_Txt(150, 200, 'Mehmet ÇELEBÝOÐLU PL/SQL Advanced Level (2)', 60);  
         
          as_pdf3.save_pdf(p_filename => P_Pdfname ||'.pdf');
     END;
END;