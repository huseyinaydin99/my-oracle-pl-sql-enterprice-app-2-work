create or replace 
Procedure Kutlama(P_Mesno Mesajlar.Mesno%Type)
 Is
 Wpdf_Name Varchar2(100) := Null;
 Font_Arialbi 			Pls_Integer;
 Wkonu 				Mesajlar.Konu%Type;
  Wmesaj 			Mesajlar.Mesaj%Type;
  Wmail_Sender 			Mailbilgileri.Mail_Sender%Type;
  Wsmtp_Server  		Mailbilgileri.Smtp_Server%Type;
  Wsmtp_Server_Port  		Mailbilgileri.Smtp_Server_Port%Type;
  Wsmtp_Username    		Mailbilgileri.Smtp_Username%Type;
  Wsmtp_Password    		Mailbilgileri.Smtp_Password%Type;
  Woracle_Dir             	Mailbilgileri.Oracle_Dir%TYPE;
 Begin
    As_Pdf3.Init;
    If P_Mesno = 1 Then
        As_Pdf3.Put_image('PDF_DIR', 'BAYRAM.jpg', 50, 500, 1000, 500, 'left');
        wpdf_name := 'BAYRAM.pdf';
    Elsif P_Mesno = 2 Then
        As_Pdf3.Put_image('PDF_DIR', 'DOGUM.jpg', 50, 500, 1000, 500, 'left');
         wpdf_name := 'DOGUM.pdf';
    End If;

    Font_Arialbi := As_Pdf3.Load_Ttf_Font('FONT_DIR', 'arialbi.ttf', 'CID', P_Compress => True);
    As_Pdf3.Set_Font(Font_Arialbi, 30);
    Select Konu, Mesaj Into Wkonu, Wmesaj From Mesajlar where Mesno = P_Mesno;
    As_Pdf3.Write(Wmesaj, -1, 750);
    
    As_Pdf3.Put_Txt(150,200, 'Mehmet ÇELEBÝOÐLU PL/SQL Addvanced Level (2)', 55);
    
     As_Pdf3.Save_Pdf(P_Filename => Wpdf_Name);
    
     Select Mail_Sender, Smtp_Server, Smtp_Server_Port, Smtp_Username, 
          Smtp_Password, Oracle_Dir Into Wmail_Sender, Wsmtp_Server, Wsmtp_Server_Port, 
          Wsmtp_Username, Wsmtp_Password, Woracle_Dir From Mailbilgileri;
          
     For Oku In (Select Musadi, Email From Musteriler Order By Musno) Loop
                  Mail_Pkg.Mail_Gonder(Wmail_Sender, Oku.Email, Null, Wkonu, Wmesaj,
                  Woracle_Dir, Wpdf_Name, Wsmtp_Server, Wsmtp_Server_Port, Wsmtp_Username,
                  Wsmtp_Password);
     END LOOP;
 End;