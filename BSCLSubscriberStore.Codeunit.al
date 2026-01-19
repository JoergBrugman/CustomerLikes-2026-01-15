codeunit 50200 "BSCL Subscriber Store"
{
    var
        OnBeforeOnDeleteErr: Label 'You are not allowed to delete %1 %2 because it is liked by one or mor customer.',
            Comment = 'de-DE=Sie dürefen %1 %1 nicht löschen, da es bei Debitoren eingetragen ist.';

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", OnBeforeOnDelete, '', false, false)]
    local procedure "BSB Book_OnBeforeOnDelete"(var Rec: Record "BSB Book"; var xRec: Record "BSB Book"; var IsHandled: Boolean)
    var
        Customer: Record Customer;
    begin
        if IsHandled then
            exit;

        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnBeforeOnDeleteErr, Rec.TableCaption, Rec."No.");
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Page, Page::"BSB Book List", OnBeforeHandleBookType, '', false, false)]
    local procedure "BSB Book List_OnBeforeHandleBookType"(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    var
        BSCLBookTypeeBookImpl: Codeunit "BSCL Book Type eBook Impl.";
    begin
        if Rec.Type = "BSB Book Type"::eBook then begin
            BSCLBookTypeeBookImpl.StartDeployBook();
            BSCLBookTypeeBookImpl.StartDeliverBook();
        end;
    end;


}