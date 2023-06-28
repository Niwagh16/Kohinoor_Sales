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

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterCopyFromItem', '', false, false)]
    local procedure OnAfterCopyFromItem(var SalesLine: Record "Sales Line"; Item: Record Item; CurrentFieldNo: Integer; xSalesLine: Record "Sales Line")
    begin
        SalesLine.Demo := Item.Demo;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Batch", 'OnCodeOnBeforePostLines', '', false, false)]
    local procedure OnCodeOnBeforePostLines(var ItemJournalLine: Record "Item Journal Line"; var NoOfRecords: Integer)
    var
        IJRD: Record "Item Journal Replace Data";
        IJRDEntry: Record "Item Journal Replace Data";
        GL: Record "General Ledger Setup";
        ItemJou: Record "Item Journal Line";
        Entryno: Integer;

    begin
        GL.get();
        IF (GL."Item Journal Batch for Sales" = 'REPL-SALES') then begin
            ItemJou.Reset();
            ItemJou.SetRange("Journal Template Name", 'ITEM');
            ItemJou.SetRange("Journal Batch Name", GL."Item Journal Batch for Sales");
            IF ItemJou.FindSet() then
                repeat
                    IF (ItemJournalLine."Reason Code" = 'REPL-SALES') then begin
                        IJRDEntry.Reset();
                        IJRDEntry.LockTable();
                        if IJRDEntry.FindLast() then
                            Entryno := IJRDEntry."Entry No.";

                        IJRD.Init();
                        IJRD."Entry No." := Entryno + 1;
                        IJRD."Document No." := ItemJou."Document No.";
                        IJRD."Entry Type" := ItemJou."Entry Type";
                        IJRD."Item No." := ItemJou."Item No.";
                        IJRD.Description := ItemJou.Description;
                        IJRD."Location Code" := ItemJou."Location Code";
                        IJRD."Posting Date" := ItemJou."Posting Date";
                        IJRD.Quantity := ItemJou.Quantity;
                        IJRD."UOM Code" := ItemJou."Unit of Measure Code";
                        IJRD."Reason code" := ItemJou."Reason Code";
                        IJRD."Shortcut Dimension 1 Code" := ItemJou."Shortcut Dimension 1 Code";
                        IJRD."Shortcut Dimension 2 Code" := ItemJou."Shortcut Dimension 2 Code";
                        IJRD.Amount := ItemJou.Amount;
                        IJRD."Bin Code" := ItemJou."Bin Code";
                        IJRD."External Document No." := ItemJou."External Document No.";
                        IJRD."Entry Posted" := true;
                        IJRD.Insert();
                    end;
                until ItemJou.Next() = 0;
        end;
        GL.get();
        IF (Gl."Item Journal Batch for Purch." = 'REPL-PURCH') then begin
            ItemJou.Reset();
            ItemJou.SetRange("Journal Template Name", 'ITEM');
            ItemJou.SetRange("Journal Batch Name", GL."Item Journal Batch for Purch.");
            IF ItemJou.FindSet() then
                repeat
                    IF (ItemJournalLine."Reason Code" = 'REPL-PURCH') then begin
                        IJRDEntry.Reset();
                        IJRDEntry.LockTable();
                        if IJRDEntry.FindLast() then
                            Entryno := IJRDEntry."Entry No.";

                        IJRD.Init();
                        IJRD."Entry No." := Entryno + 1;
                        IJRD."Document No." := ItemJou."Document No.";
                        IJRD."Entry Type" := ItemJou."Entry Type";
                        IJRD."Item No." := ItemJou."Item No.";
                        IJRD.Description := ItemJou.Description;
                        IJRD."Location Code" := ItemJou."Location Code";
                        IJRD."Posting Date" := ItemJou."Posting Date";
                        IJRD.Quantity := ItemJou.Quantity;
                        IJRD."UOM Code" := ItemJou."Unit of Measure Code";
                        IJRD."Reason code" := ItemJou."Reason Code";
                        IJRD."Shortcut Dimension 1 Code" := ItemJou."Shortcut Dimension 1 Code";
                        IJRD."Shortcut Dimension 2 Code" := ItemJou."Shortcut Dimension 2 Code";
                        IJRD.Amount := ItemJou.Amount;
                        IJRD."Bin Code" := ItemJou."Bin Code";
                        IJRD."External Document No." := ItemJou."External Document No.";
                        IJRD."Entry Posted" := true;
                        IJRD.Insert();
                    end;
                until ItemJou.Next() = 0;
        end;
    end;
    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnCodeOnBeforeItemJnlPostBatchRun', '', false, false)]
    local procedure OnCodeOnBeforeItemJnlPostBatchRun(var ItemJournalLine: Record "Item Journal Line")
    var
        IJRD: Record "Item Journal Replace Data";
        IJRDEntry: Record "Item Journal Replace Data";
        GL: Record "General Ledger Setup";
        ItemJou: Record "Item Journal Line";
        Entryno: Integer;
    begin
        GL.get();
        IF GL."Item Journal Batch for Sales" = 'REPL-SALES' then begin
            // ItemJournalLine.Reset();
            // ItemJournalLine.SetRange("Reason Code", GL."Item Journal Batch for Sales");
            // ItemJournalLine.SetRange("Journal Batch Name", GL."Item Journal Batch for Sales");
            // IF ItemJournalLine.FindSet() then
            //     repeat
            IF ItemJournalLine."Reason Code" = 'REPL-SALES' then begin
                IJRDEntry.Reset();
                IJRDEntry.LockTable();
                if IJRDEntry.FindLast() then
                    Entryno := IJRDEntry."Entry No.";

                IJRD.Init();
                IJRD."Entry No." := Entryno + 1;
                IJRD."Document No." := ItemJournalLine."Document No.";
                IJRD."Entry Type" := ItemJournalLine."Entry Type";
                IJRD."Item No." := ItemJournalLine."Item No.";
                IJRD.Description := ItemJournalLine.Description;
                IJRD."Location Code" := ItemJournalLine."Location Code";
                IJRD."Posting Date" := ItemJournalLine."Posting Date";
                IJRD.Quantity := ItemJournalLine.Quantity;
                IJRD."UOM Code" := ItemJournalLine."Unit of Measure Code";
                IJRD."Reason code" := ItemJournalLine."Reason Code";
                IJRD."Shortcut Dimension 1 Code" := ItemJournalLine."Shortcut Dimension 1 Code";
                IJRD."Shortcut Dimension 2 Code" := ItemJournalLine."Shortcut Dimension 2 Code";
                IJRD.Amount := ItemJournalLine.Amount;
                IJRD."Bin Code" := ItemJournalLine."Bin Code";
                IJRD.Insert();
                //                until ItemJou.Next() = 0;

            end;
        end;
    end;
    */

}
