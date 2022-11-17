create or replace Package Mobilmesaj Is
        Procedure Send_Sms ( P_Username In Varchar2,
                                            P_Pasword In Varchar2,
                                            P_Sirket_Kodu In Varchar2,
                                            P_Message In Varchar2,
                                            P_Tonumbers In Varchar2,
                                            P_Statuscode Out Varchar2,
                                            P_Statustext Out Varchar2);
      End;
      /
create or replace PACKAGE BODY Mobilmesaj IS
              Procedure Send_Sms ( P_Username In Varchar2,
                                                    P_Pasword In Varchar2,
                                                    P_Sirket_Kodu In Varchar2,
                                                    P_Message In Varchar2,
                                                    P_Tonumbers In Varchar2,
                                                    P_Statuscode Out Varchar2,
                                                    P_Statustext Out Varchar2) Is
                Soap_Req_Msg Varchar2(32000);
                Soap_Resp_Msg Varchar2(32000);
                
                Http_Req    Utl_Http.Req;
                Http_Resp    Utl_Http.Resp;
                Responsebody Clob := Null;
                Buffer Varchar2(32767);
                L_XMLTYPE XMLTYPE;                                
            Begin
                Soap_Req_Msg :=replace( 'http://api.iletimerkezi.com/v1/send-sms/get/?username=' || P_Username
                || '@password=' || P_Pasword
                ||'@text=' || Replace(P_Message,' ','%20')
                || '@receipents=' || P_Tonumbers
                || '@sender=' || P_Sirket_Kodu,'@', '&');
                
                Http_Req := Utl_Http.Begin_Request(Soap_Req_Msg,'GET','HTTP/1.1');
                Utl_Http.Set_Header(Http_Req,'Content-Type','text/xml');
                Utl_Http.Set_Header(Http_Req,'Host', 'api.iletimerkezi.com');
                Utl_Http.Set_Header(Http_Req,'Connection','Keep_Alive');
                Utl_Http.Set_Header(Http_Req,'User-Agent', 'Apache-HttpClient/4.1.1 (java 1.5)');
                Http_Resp := Utl_Http.Get_Response(Http_Req);
                Begin
                    Loop
                        Sys.Utl_Http.Read_Text(Http_Resp, Buffer, 32766);
                        Responsebody := Responsebody || Buffer;
                    End Loop;
                    Exception When UTL_Http.End_Of_Body Then
                        UTL_HTTP.END_RESPONSE(Http_Resp);
                End;
                    L_XMLTYPE := XMLTYPE.createXML(Responsebody);
            End;
    END;