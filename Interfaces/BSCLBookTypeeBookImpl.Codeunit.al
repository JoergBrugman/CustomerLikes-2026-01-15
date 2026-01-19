codeunit 50201 "BSCL Book Type eBook Impl."
{
    procedure StartDeployBook()
    begin
        Message('Auf Kundenportal hochladen');
    end;

    procedure StartDeliverBook()
    begin
        Message('E-Mailbenachrichtigung an Kunden versenden');
    end;
}