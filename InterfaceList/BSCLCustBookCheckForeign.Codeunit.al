codeunit 50202 "BSCL Cust. Book Check Foreign" implements "BSB Cust. Book Check Step"
{
    procedure Execute(Customer: Record Customer): Text
    var
        BSBBook: Record "BSB Book";
    begin
        if Customer."Country/Region Code" = '' then
            exit('');
        BSBBook.Get(Customer."BSB Favorite Book No.");
        if BSBBook.Type = "BSB Book Type"::eBook then
            exit(StrSubstNo(
                'Der %1 %2 darf das E-Book %3 nicht liken, da er ein ausländuscher Debitor ist',
                Customer.TableCaption, Customer."No.", BSBBook."No."));
    end;

    procedure GetSequence(): Integer
    begin
        exit(5);
    end;

    procedure IsEnabled(Customer: Record Customer): Boolean
    begin
        exit(Customer."BSB Favorite Book No." <> '');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BSB Cust. Book Check Pipeline", OnRegisterCustBookCheckSteps, '', false, false)]
    local procedure "BSB Cust. Book Check Pipeline_OnRegisterCustBookCheckSteps"(var Steps: List of [Interface "BSB Cust. Book Check Step"])
    begin
        Steps.Add(this);
    end;

}