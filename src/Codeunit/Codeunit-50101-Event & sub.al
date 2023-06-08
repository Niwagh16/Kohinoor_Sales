codeunit 50101 "Event & Subs"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Instruction Mgt.", 'OnShowPostedDocumentOnBeforePageRun', '', false, false)]

    local procedure OnShowPostedDocumentOnBeforePageRun(RecVariant: Variant; CalledFromPageId: Integer; var PageId: Integer)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(RecVariant);
        case RecRef.Number of
            DataBase::"Posted Delivery Header":
                PageId := Page::"Posted delivery Detail";
        end;
    end;
}