page 50105 "Delivery Detail"
{
    ApplicationArea = All;
    Caption = 'Delivery Detail';
    PageType = Card;
    SourceTable = "Delivery Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Delivery Challan No."; Rec."Delivery Challan No.")
                {
                    ToolTip = 'Specifies the value of the Delivery Challan No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Driver Contact No."; Rec."Driver Contact No.")
                {
                    ToolTip = 'Specifies the value of the Driver Contact No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Delivery Boy"; Rec."Delivery Boy")
                {
                    ToolTip = 'Specifies the value of the Delivery Boy field.';
                }
                field("Delivery Boy Contact"; Rec."Delivery Boy Contact")
                {
                    ToolTip = 'Specifies the value of the Delivery Boy Contact field.';
                }
            }
            part(Lines; "Delivery Detail Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Delivery Challan No." = field("Delivery Challan No.");
                UpdatePropagation = Both;
            }

        }

    }
    actions
    {
        area(Navigation)
        {
            action("Get Invoice Lines")
            {
                ApplicationArea = all;
                Caption = 'Get Invoice Lines';
                Image = GetLines;
                trigger OnAction()
                begin
                    GetInvoiceLine();
                end;
            }
            action(Post)
            {
                ApplicationArea = all;
                Caption = 'Post';
                Image = PostOrder;
                ShortCutKey = 'F9';
                trigger OnAction()
                var
                begin
                    IF Confirm('Do you want to post the order', true) then
                        PostOrder(Rec);
                end;
            }

        }
    }
    local procedure PostOrder(DelHdr: Record "Delivery Header")
    var
        PostedDH: Record "Posted Delivery Header";
        DelLine: Record "Delivery Line";
        PostedDL: Record "Posted Delivery Line";
        Window: Dialog;
        Counter: Integer;
        PostingLinesMsg: Label 'Posting Invoive lines       #2######\', Comment = 'Counter';
    begin
        Window.Open(
                    '#1#################################\\' +
                    PostingLinesMsg);
        //Window.Update(1, StrSubstNo('%1 %2', SalesHeader."Document Type", SalesHeader."No."));
        DelHdr.Reset();
        DelHdr.SetRange("Delivery Challan No.", Rec."Delivery Challan No.");
        IF DelHdr.FindFirst() then begin
            PostedDH.Init();
            PostedDH.TransferFields(DelHdr);
            PostedDH.Insert();

            DelLine.Reset();
            DelLine.SetRange("Delivery Challan No.", rec."Delivery Challan No.");
            if DelLine.FindSet() then
                repeat
                    PostedDL.Init();
                    PostedDL.TransferFields(DelLine);
                    PostedDL.Insert();
                    Sleep(50);
                    Window.Update(2, DelLine."Invoice No.");
                until DelLine.Next() = 0;
        end;
        Message('Entry Posted......');
        if InstructionMgt.IsEnabled(InstructionMgt.ShowPostedConfirmationMessageCode()) then
            ShowPostedConfirmationMessage(PostedDL."Delivery Challan No.");
        CurrPage.Close();
    end;

    var

        InstructionMgt: Codeunit "Instruction Mgt.";
        OpenPostedSalesOrderQst: Label 'The Posted Delivery Order is Created as number %1 .\\Do you want to open the Posted Delivery Order?', Comment = '%1 = posted document number';

    local procedure ShowPostedConfirmationMessage(DelChalNo: code[20])
    var
        PostedDeliveryDetail: Record "Posted Delivery Header";
        InstructionMgt: Codeunit "Instruction Mgt.";
    begin

        PostedDeliveryDetail.SetRange("Delivery Challan No.", DelChalNo);
        if PostedDeliveryDetail.FindFirst() then
            if InstructionMgt.ShowConfirm(StrSubstNo(OpenPostedSalesOrderQst, PostedDeliveryDetail."Delivery Challan No."),
                 InstructionMgt.ShowPostedConfirmationMessageCode())
            then
                InstructionMgt.ShowPostedDocument(PostedDeliveryDetail, Page::"Posted delivery Detail");
    end;


    procedure GetInvoiceLine()
    var
        GetInvoiceLineDelivery: page "Get Invoice Lines Delivery";

        SalesInvLine: Record 113;
    Begin
        SalesInvLine.SetCurrentKey("Document No.");
        SalesInvLine.SetRange(Delivered, false);
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        SalesInvLine.SetFilter(Quantity, '<>%1', 0);
        GetInvoiceLineDelivery.SetTableView(SalesInvLine);
        GetInvoiceLineDelivery.SetSalesHeader(Rec);
        GetInvoiceLineDelivery.LookupMode := true;
        IF GetInvoiceLineDelivery.RUNMODAL <> ACTION::Cancel THEN;
    End;



}
