pageextension 50104 "Item Journal Ext" extends "Item Journal"
{
    layout
    {
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                GL: Record "General Ledger Setup";
            begin
                // GL.Get();
                // IF Rec."Reason Code" = Gl."Item Journal Batch for Sales" then
                //     ConfirmDatamovetoTabel();
            end;
        }
        addafter("E&xplode BOM")
        {
            action("Get Invoice Lines")
            {
                Caption = 'Get Invoice Lines';
                ApplicationArea = all;
                Image = GetLines;
                PromotedIsBig = true;
                Promoted = true;
                trigger OnAction()
                begin
                    IF Confirm('Do you want fetch the sales invoice line', true) then
                        GetInvoiceLine();
                end;
            }
            action("Get Purch. Invoice Lines")
            {
                Caption = 'Get Purch. Invoice Lines';
                ApplicationArea = all;
                Image = GetLines;
                PromotedIsBig = true;
                Promoted = true;
                trigger OnAction()
                begin
                    IF Confirm('Do you want fetch the Purchase invoice line', true) then
                        GetPurchInvoiceLine();
                end;
            }
            action("Confirm Post")
            {
                Caption = 'Confirm Post';
                ApplicationArea = all;
                Image = Confirm;
                PromotedIsBig = true;
                Promoted = true;
                trigger OnAction()
                begin
                    IF Confirm('Do you want Confirm Selected sales invoice line', true) then
                        ConfirmDatamovetoTabel();
                end;
            }

        }
    }
    //     GetShipments.SETTABLEVIEW(SalesShptLine);
    // GetShipments.SetSalesHeader(SalesHeader);
    // GetShipments.LOOKUPMODE := TRUE;
    // IF GetShipments.RUNMODAL <> ACTION::Cancel THEN;

    procedure GetInvoiceLine()
    var
        GetInvoiceLine: page "Get Invoice Lines";
    Begin
        SalesInvLine.SetCurrentKey("Document No.");
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        SalesInvLine.SetFilter(Quantity, '<>%1', 0);
        GetInvoiceLine.SetTableView(SalesInvLine);
        GetInvoiceLine.LookupMode := true;
        IF GetInvoiceLine.RUNMODAL <> ACTION::Cancel THEN;
    End;

    procedure GetPurchInvoiceLine()
    var
        GetPurchInvoiceLine: page "Get Purch Inv Lines";
    Begin
        PurchInvLine.SetCurrentKey("Document No.");
        PurchInvLine.SetRange(Type, SalesInvLine.Type::Item);
        PurchInvLine.SetFilter(Quantity, '<>%1', 0);
        GetPurchInvoiceLine.SetTableView(PurchInvLine);
        GetPurchInvoiceLine.LookupMode := true;
        IF GetPurchInvoiceLine.RUNMODAL <> ACTION::Cancel THEN;
    End;

    procedure ConfirmDatamovetoTabel()
    var
        IJRD: Record "Item Journal Replace Data";
        IJRDEntry: Record "Item Journal Replace Data";
        GL: Record "General Ledger Setup";
        ItemJou: Record "Item Journal Line";
        Entryno: Integer;
    begin
        GL.get();
        IF GL."Item Journal Batch for Sales" = 'REPL-SALES' then begin
            ItemJou.Reset();
            ItemJou.SetRange("Reason Code", GL."Item Journal Batch for Sales");
            ItemJou.SetRange("Journal Batch Name", GL."Item Journal Batch for Sales");
            IF ItemJou.FindSet() then
                repeat
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
                    IJRD.Insert();
                until ItemJou.Next() = 0;
        end;
    end;

    var
        SalesInvLine: Record 113;
        PurchInvLine: Record "Purch. Inv. Line";

}