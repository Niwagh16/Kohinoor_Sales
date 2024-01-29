page 50112 "Get Purch Inv Lines"
{
    Caption = 'Get Purch Inv Lines';
    Editable = false;
    PageType = List;
    SourceTable = "Purch. Inv. Line";

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
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field(Type; Rec.Type)
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of additional receipts posted.';
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
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                    Visible = false;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
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
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the quantity of the item on the line.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the related job.';
                    Visible = false;
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the related production order.';
                    Visible = false;
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the date you expect the items to be available in your warehouse. If you leave the field blank, it will be calculated as follows: Planned Receipt Date + Safety Lead Time + Inbound Warehouse Handling Time = Expected Receipt Date.';
                    Visible = false;
                }

                field(OrderNo; OrderNo)
                {
                    Caption = 'Order No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the line number of the order that created the entry.';
                }
                field(VendorOrderNo; VendorOrderNo)
                {
                    Caption = 'Vendor Order No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the vendor''s order number.';
                }
                field(VendorShptNo; VendorShptNo)
                {
                    Caption = 'Vendor Shipment No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the vendor''s shipment number. It is inserted in the corresponding field on the source document during posting.';
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                }
                field(ItemReferenceNo; ItemReferenceNo)
                {
                    Caption = 'Item Reference No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the referenced item number.';
                }
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                    Caption = 'Pay-to Vendor No.';
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the vendor that you received the invoice from.';
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
                        PurchRcptHeader.Get(rec."Document No.");
                        PAGE.Run(PAGE::"Posted Purchase Receipt", PurchRcptHeader);
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
                        rec.ShowDimensions();
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
                actionref("Item &Tracking Entries_Promoted"; "Item &Tracking Entries")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Line', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DocumentNoHideValue := false;
        DocumentNoOnFormat();
        GetDataFromRcptHeader();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetDataFromRcptHeader();
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
        PurchHeader: Record "Purchase Header";
        PurchRcptHeader: Record "Purch. Inv. Header";
        TempPurchRcptLine: Record "Purch. Inv. Line" temporary;
        // GetReceipts: Codeunit "Purch.-Get Receipt";
        VendorOrderNo: Code[35];
        VendorShptNo: Code[35];
        OrderNo: Code[20];
        ItemReferenceNo: Code[50];

    protected var
        [InDataSet]
        DocumentNoHideValue: Boolean;

    procedure SetPurchHeader(var PurchHeader2: Record "Purchase Header")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        PurchHeader.Get(PurchHeader2."Document Type", PurchHeader2."No.");
        PurchHeader.TestField("Document Type", PurchHeader."Document Type"::Invoice);
    end;

    protected procedure IsFirstDocLine(): Boolean
    var
        PurchRcptLine: Record "Purch. Inv. Line";
    begin
        TempPurchRcptLine.Reset();
        TempPurchRcptLine.CopyFilters(Rec);
        TempPurchRcptLine.SetRange("Document No.", Rec."Document No.");
        if not TempPurchRcptLine.FindFirst() then begin
            PurchRcptLine.CopyFilters(Rec);
            PurchRcptLine.SetRange("Document No.", Rec."Document No.");
            // PurchRcptLine.SetFilter("Qty. Rcd. Not Invoiced", '<>0');
            if PurchRcptLine.FindFirst() then begin
                TempPurchRcptLine := PurchRcptLine;
                TempPurchRcptLine.Insert();
            end;
        end;
        if Rec."Line No." = TempPurchRcptLine."Line No." then
            exit(true);
    end;

    local procedure CreateLines()
    begin
        CurrPage.SetSelectionFilter(Rec);
        CreatePurchInvLines(Rec);
    end;


    local procedure DocumentNoOnFormat()
    begin
        if not IsFirstDocLine() then
            DocumentNoHideValue := true;
    end;

    local procedure GetDataFromRcptHeader()
    var
        SrcPurchRcptHeader: Record "Purch. Inv. Header";
    begin
        SrcPurchRcptHeader.Get(Rec."Document No.");
        VendorOrderNo := SrcPurchRcptHeader."Vendor Order No.";
        //VendorShptNo := SrcPurchRcptHeader."Vendor Shipment No.";
        OrderNo := SrcPurchRcptHeader."Order No.";

        ItemReferenceNo := Rec."Item Reference No.";
    end;

    local procedure CreatePurchInvLines(var PurchInvLine: Record "Purch. Inv. Line")
    var
        LineCount: Integer;
        Window: Dialog;
        ItemGenJnl: Record 83;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ItemJnlBatch: Record "Item Journal Batch";
        ILE: Record "Item Ledger Entry";
        TrackSpec: Record "Tracking Specification";
        ValueEntry: record "Value Entry";
        Text000: Label 'Lines Counting to ------ #1';
        ItemJ: Record "Item Journal Line";
        GLS: Record "General Ledger Setup";
        Batch: Record 233;
    begin
        GLS.Get();
        GLS.TestField("Item Journal Batch for Purch.");
        Batch.Reset();
        Batch.SetRange("Journal Template Name", 'ITEM');
        Batch.SetRange(Name, GLS."Item Journal Batch for Purch.");
        if Batch.FindFirst() then;
        LineCount := 0;
        Window.Open(Text000, LineCount);
        IF PurchInvLine.FindSet() then
            repeat
                LineCount := LineCount + 1;
                Window.UPDATE();
                ItemGenJnl.init;
                ItemGenJnl."Journal Template Name" := 'ITEM';
                ItemGenJnl."Journal Batch Name" := GLS."Item Journal Batch for Purch.";
                ItemJ.Reset();
                ItemJ.SetRange("Journal Template Name", 'ITEM');
                ItemJ.SetRange("Journal Batch Name", GLS."Item Journal Batch for Purch.");
                IF ItemJ.FindLast() then
                    ItemGenJnl."Line No." := ItemJ."Line No." + 10000
                else
                    ItemGenJnl."Line No." := 10000;

                ItemGenJnl."Document No." := PurchInvLine."Document No.";
                ItemGenJnl."External Document No." := PurchInvLine."Document No.";
                ItemGenJnl.validate("Posting Date", Today);
                ItemGenJnl."Entry Type" := ItemGenJnl."Entry Type"::"Negative Adjmt.";
                ItemGenJnl.Validate("Item No.", PurchInvLine."No.");
                //ItemGenJnl.Validate("Bin Code", PurchInvLine."Bin Code");
                ItemGenJnl.Validate("Location Code", PurchInvLine."Location Code");
                ItemGenJnl.Validate(Quantity, PurchInvLine.Quantity);
                ItemGenJnl.Validate("Unit of Measure Code", PurchInvLine."Unit of Measure Code");
                ItemGenJnl.Validate("Shortcut Dimension 1 Code", PurchInvLine."Shortcut Dimension 1 Code");
                ItemGenJnl.Validate("Shortcut Dimension 2 Code", PurchInvLine."Shortcut Dimension 2 Code");
                ItemGenJnl."Reason Code" := GLS."Item Journal Batch for Sales";
                ItemGenJnl.Validate("Posting No. Series", Batch."Posting No. Series");
                ItemGenJnl.insert;
                // InsertTrackingSpecification(SalInvLine, ItemGenJnl); //For Create Tracking Specifications in Item Journal
                //*********************Negative Adjust Entry Creation******************************
                ItemGenJnl.init;
                ItemGenJnl."Journal Template Name" := 'ITEM';
                ItemGenJnl."Journal Batch Name" := GLS."Item Journal Batch for Purch.";
                ItemJ.Reset();
                ItemJ.SetRange("Journal Template Name", 'ITEM');
                ItemJ.SetRange("Journal Batch Name", GLS."Item Journal Batch for Purch.");
                IF ItemJ.FindLast() then
                    ItemGenJnl."Line No." := ItemJ."Line No." + 10000
                else
                    ItemGenJnl."Line No." := 10000;

                ItemGenJnl."Document No." := PurchInvLine."Document No.";
                ItemGenJnl."External Document No." := PurchInvLine."Document No.";
                ItemGenJnl.validate("Posting Date", Today);
                ItemGenJnl."Entry Type" := ItemGenJnl."Entry Type"::"Positive Adjmt.";
                ItemGenJnl.Validate("Item No.", PurchInvLine."No.");
                //ItemGenJnl.Validate("Bin Code", PurchInvLine."Bin Code");
                ItemGenJnl.Validate("Location Code", PurchInvLine."Location Code");
                ItemGenJnl.Validate(Quantity, PurchInvLine.Quantity);
                ItemGenJnl.Validate("Unit of Measure Code", PurchInvLine."Unit of Measure Code");
                ItemGenJnl.Validate("Shortcut Dimension 1 Code", PurchInvLine."Shortcut Dimension 1 Code");
                ItemGenJnl.Validate("Shortcut Dimension 2 Code", PurchInvLine."Shortcut Dimension 2 Code");
                ItemGenJnl."Reason Code" := GLS."Item Journal Batch for Sales";
                ItemGenJnl.Validate("Posting No. Series", Batch."Posting No. Series");
                ItemGenJnl.insert;
                InsertTrackingSpecification(PurchInvLine, ItemGenJnl); //For Create Tracking Specifications in Item Journal
            until PurchInvLine.Next() = 0;
        Window.Close();
    end;

    procedure InsertTrackingSpecification(var PurchInvLine: Record "Purch. Inv. Line"; var ItemGenJnl: Record "Item Journal Line")
    var
        ILE: Record "Item Ledger Entry";
        ReservEntry: Record "Reservation Entry";
        ValueEntry: record "Value Entry";
        ReservEntryInit: Record "Reservation Entry";
    Begin

        ValueEntry.Reset;
        ValueEntry.Setrange("Document No.", PurchInvLine."Document No.");
        ValueEntry.SetRange("Document Line No.", PurchInvLine."Line No.");
        if ValueEntry.FindSet() then
            repeat
                if ILE.GET(ValueEntry."Item Ledger Entry No.") then begin
                    ReservEntry.Reset();
                    ReservEntry.LockTable();
                    if ReservEntry.FindLast() then;
                    ReservEntryInit.Init();
                    ReservEntryInit."Entry No." := ReservEntry."Entry No." + 1;
                    ReservEntryInit."Item No." := ItemGenJnl."Item No.";
                    ReservEntryInit."Location Code" := ItemGenJnl."Location Code";
                    ReservEntryInit.validate("Quantity (Base)", ILE.Quantity);
                    ReservEntryInit."Reservation Status" := ReservEntryInit."Reservation Status"::Prospect;
                    ReservEntryInit."Source Type" := DATABASE::"Item Journal Line";
                    ReservEntryInit."Source Subtype" := 2;
                    ReservEntryInit."Source ID" := ItemGenJnl."Journal Template Name";
                    ReservEntryInit."Source Batch Name" := ItemGenJnl."Journal Batch Name";
                    ReservEntryInit."Source Ref. No." := ItemGenJnl."Line No.";
                    ReservEntryInit."Creation Date" := Today;
                    ReservEntryInit."Created By" := UserId;
                    ReservEntryInit."Serial No." := ILE."Serial No.";
                    ReservEntryInit."Expected Receipt Date" := Today;
                    ReservEntryInit.Positive := true;
                    ReservEntryInit."Item Tracking" := ReservEntryInit."Item Tracking"::"Serial No.";
                    ReservEntryInit.Insert();
                end;
            until ValueEntry.Next = 0;
    end;



}

