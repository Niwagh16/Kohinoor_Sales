page 50103 "Get Invoice Lines"
{
    Caption = 'Get Invoice Lines';
    Editable = false;
    PageType = List;
    SourceTable = "Sales Invoice Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Suite;
                    HideValue = DocumentNoHideValue;
                    StyleExpr = 'Strong';
                    ToolTip = 'Specifies the number of the related document.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Visible = false;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of posted sales shipments.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies information in addition to the description.';
                    Visible = false;
                }

                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                    Visible = false;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of item units, resource hours, general ledger account payments, or cost that have been shipped to the customer.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                    Visible = false;
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the item ledger entry that the document or journal line is applied to.';
                    Visible = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the related job.';
                    Visible = false;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                    Visible = false;
                }

                field(OrderNo; OrderNo)
                {
                    Caption = 'Order No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the sales order that this shipment was posted from.';
                    Visible = false;
                }
                field(ExternalDocumentNo; ExternalDocumentNo)
                {
                    Caption = 'External Document No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number that the customer uses in their own system to refer to this sales document.';
                    Visible = false;
                }
                field(YourReference; YourReference)
                {
                    Caption = 'Your Reference';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the customer''s reference. The content will be printed on sales documents.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Show Document")
                {
                    ApplicationArea = Suite;
                    Caption = 'Show Document';
                    Image = View;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the document that the selected line exists on.';

                    trigger OnAction()
                    begin
                        SalesInvHeader.Get(rec."Document No.");
                        PAGE.Run(PAGE::"Posted Sales Shipment", SalesInvHeader);
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin

                        CurrPage.SaveRecord();
                    end;
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;
                    ToolTip = 'View serial or lot numbers that are assigned to items.';

                    trigger OnAction()
                    begin
                        Rec.ShowItemTrackingLines();
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref("Show Document_Promoted"; "Show Document")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DocumentNoHideValue := false;
        DocumentNoOnFormat();
        GetDataFromShipmentHeader();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetDataFromShipmentHeader();
    end;

    trigger OnQueryClosePage(CloseAction: Action) Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit(Result);

        if CloseAction in [ACTION::OK, ACTION::LookupOK] then
            CreateLines();
    end;

    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesHeader: Record "Sales Header";
        TempSalesInvLine: Record "Sales Invoice Line" temporary;
        //SalesGetInvoice: Codeunit "Get Invoice Item Journal";
        //[InDataSet]
        DocumentNoHideValue: Boolean;
        OrderNo: Code[20];
        YourReference: Text[35];
        ExternalDocumentNo: Text[35];

    procedure SetSalesHeader(var SalesHeader2: Record "Sales Header")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        SalesHeader.Get(SalesHeader2."Document Type", SalesHeader2."No.");
        SalesHeader.TestField("Document Type", SalesHeader."Document Type"::Invoice);
    end;

    local procedure IsFirstDocLine(): Boolean
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        TempSalesInvLine.Reset();
        TempSalesInvLine.CopyFilters(Rec);
        TempSalesInvLine.SetRange("Document No.", rec."Document No.");
        if not TempSalesInvLine.FindFirst() then begin
            SalesInvLine.CopyFilters(Rec);
            SalesInvLine.SetRange("Document No.", rec."Document No.");
            //SalesInvLine.SetFilter("Qty. Shipped Not Invoiced", '<>0');
            if SalesInvLine.FindFirst() then begin
                TempSalesInvLine := SalesInvLine;
                TempSalesInvLine.Insert();
            end;
        end;
        if rec."Line No." = TempSalesInvLine."Line No." then
            exit(true);
    end;

    procedure CreateLines()
    begin
        CurrPage.SetSelectionFilter(Rec);
        CreateInvoiveLine(Rec);

    end;

    local procedure DocumentNoOnFormat()
    begin
        if not IsFirstDocLine() then
            DocumentNoHideValue := true;
    end;

    local procedure GetDataFromShipmentHeader()
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        SalesInvHeader.Get(rec."Document No.");

        OrderNo := SalesInvHeader."Order No.";
        YourReference := SalesInvHeader."Your Reference";
        ExternalDocumentNo := SalesInvHeader."External Document No.";
    end;

    procedure CreateInvoiveLine(Var SalInvLine: Record "Sales Invoice Line")
    var
        LineCount: Integer;
        Window: Dialog;
        ItemGenJnl: Record 83;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ItemJnlBatch: Record "Item Journal Batch";
        ILE: Record "Item Ledger Entry";
        TrackSpec: Record "Tracking Specification";
        ValueEntry: record "Value Entry";
    begin

        IF SalInvLine.FindSet() then
            repeat
                LineCount := LineCount + 1;
                Window.UPDATE(1, LineCount);
                ItemGenJnl.init;
                ItemGenJnl."Journal Template Name" := 'ITEM';
                ItemGenJnl."Journal Batch Name" := 'Default';
                ItemJnlBatch.Get(ItemGenJnl."Journal Template Name", ItemGenJnl."Journal Batch Name");
                ItemGenJnl."Document No." := NoSeriesMgt.TryGetNextNo(ItemJnlBatch."No. Series", Today);
                ItemGenJnl."Posting Date" := Today;
                ItemGenJnl."Entry Type" := ItemGenJnl."Entry Type"::"Positive Adjmt.";
                ItemGenJnl.Validate("Item No.", SalInvLine."No.");
                ItemGenJnl.Validate("Location Code", SalInvLine."Location Code");
                ItemGenJnl.Validate(Quantity, SalInvLine.Quantity);
                IF ItemGenJnl.FindLast() then
                    ItemGenJnl."Line No." := ItemGenJnl."Line No." + 10000
                else
                    ItemGenJnl."Line No." := 10000;
                ItemGenJnl.Validate("Unit of Measure Code", SalInvLine."Unit of Measure Code");
                ItemGenJnl.Validate("Shortcut Dimension 1 Code", SalInvLine."Shortcut Dimension 1 Code");
                ItemGenJnl.Validate("Shortcut Dimension 2 Code", SalInvLine."Shortcut Dimension 2 Code");
                ItemGenJnl.insert;

                ValueEntry.Reset;
                ValueEntry.Setrange("Document No.", SalInvLine."Document No.");
                ValueEntry.SetRange("Document Line No.", SalInvLine."Line No.");
                if ValueEntry.FindSet() then
                    repeat
                        if ILE.GET(ValueEntry."Item Ledger Entry No.") then begin
                            TrackSpec.Init;
                            TrackSpec."Entry No." := ILE."Entry No.";
                            TrackSpec.Validate("Item No.", ItemGenJnl."Item No.");
                            TrackSpec.Validate("Lot No.", ILE."Lot No.");
                            TrackSpec.Validate("Source Type", 83);
                            TrackSpec.Validate("Quantity (Base)", ILE.Quantity);
                            TrackSpec.Insert;
                        end;
                    until ValueEntry.Next = 0;

                ItemGenJnl.init;
                ItemGenJnl."Journal Template Name" := 'ITEM';
                ItemGenJnl."Journal Batch Name" := 'Default';
                ItemJnlBatch.Get(ItemGenJnl."Journal Template Name", ItemGenJnl."Journal Batch Name");
                ItemGenJnl."Document No." := NoSeriesMgt.TryGetNextNo(ItemJnlBatch."No. Series", Today);
                ItemGenJnl."Posting Date" := Today;
                ItemGenJnl."Entry Type" := ItemGenJnl."Entry Type"::"Negative Adjmt.";
                ItemGenJnl.Validate("Item No.", SalInvLine."No.");
                ItemGenJnl.Validate("Location Code", SalInvLine."Location Code");
                ItemGenJnl.Validate(Quantity, SalInvLine.Quantity);
                IF ItemGenJnl.FindLast() then
                    ItemGenJnl."Line No." := ItemGenJnl."Line No." + 10000
                else
                    ItemGenJnl."Line No." := 10000;
                ItemGenJnl.Validate("Unit of Measure Code", SalInvLine."Unit of Measure Code");
                ItemGenJnl.Validate("Shortcut Dimension 1 Code", SalInvLine."Shortcut Dimension 1 Code");
                ItemGenJnl.Validate("Shortcut Dimension 2 Code", SalInvLine."Shortcut Dimension 2 Code");
                ItemGenJnl.insert;
            until SalInvLine.Next() = 0;
    end;


}

