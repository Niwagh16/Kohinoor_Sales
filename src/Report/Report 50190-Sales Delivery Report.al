report 50190 "Sales Delivery Report"
{
    //pcpl-064
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Sales Delivery Report -1.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Posted Delivery Line"; "Posted Delivery Line")
        {
            DataItemTableView = where(Demo = filter(false));
            column(Delivery_Challan_No_; "Delivery Challan No.")
            {

            }
            column(Delivered_Date; "Delivered Date")
            {

            }
            column(Delivery_Date; "Delivery Date")
            {
            }
            column(Item_No_; "Posted Delivery Line"."Item No.")
            {

            }
            column(Item_Description; "Posted Delivery Line"."Item Description")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Customer_No_; "Customer No.")
            {

            }
            column(Customer_Phone_No_; "Customer Phone No.")
            {

            }
            column(Quantity; Quantity)

            {

            }
            column(Store_Name; "Store Name")
            {

            }
            column(Delivery_Address; "Delivery Address")
            {

            }
            column(Delivery_Address_2; "Delivery Address 2")
            {

            }
            column(shiptoadd1; shiptoadd1)
            {

            }
            column(shiptocity; shiptocity)
            {

            }
            column(shiptocountry; shiptocountry)
            {

            }
            column(shiptopostcode; shiptopostcode)
            {

            }
            column(customer_mob; customer."Mobile Phone No.")
            {

            }
            column(customer_email; customer."E-Mail")
            {

            }
            column(Salesorderid; Salesorderid)
            {

            }
            // column(Srno; "Posted Delivery Line"."Item No.")
            // {

            // }
            column(Srno; Srno)
            {

            }
            column(serialno; serialno)
            {

            }
            column(Recstate; Recstate.Description)
            {

            }
            column(Category_1; RecItem."Category 1")
            {

            }
            column(Category_2; RecItem."Category 2")
            {

            }
            column(Category_3; RecItem."Category 3")
            {

            }
            column(RecItem_No2; RecItem."No. 2")
            {

            }
            column(StoreNo; StoreNo)
            {

            }

            trigger OnPreDataItem()
            begin
                // itemheirchy.SetRange(Code, "Posted Delivery Line"."Item Category code 1");
            end;

            trigger OnAfterGetRecord()

            begin
                Srno += 1;

                RecsalesInvheader.Reset();
                RecsalesInvheader.SetRange("No.", "Invoice No.");
                if RecsalesInvheader.FindFirst() then begin
                    shiptoadd1 := RecsalesInvheader."Ship-to Address" + ',' + RecsalesInvheader."Ship-to Address 2" + ',' + RecsalesInvheader."Ship-to City";
                    shiptocity := RecsalesInvheader."Ship-to City";
                    shiptocountry := RecsalesInvheader."Ship-to Country/Region Code";
                    shiptopostcode := RecsalesInvheader."Ship-to Post Code";
                end;
                if customer.get("Customer No.") then;
                if Recstate.Get(customer."State Code") then;

                if RecSIL.Get("Invoice No.") then;
                if RecItem.Get("Item No.") then;


                // SH.Reset();
                // SH.SetRange("Sell-to Customer No.", "Customer No.");
                // if SH.FindFirst() then begin
                //     Salesorderid := SH."No.";
                // end;
                if SIH.get("Invoice No.") then begin
                    Salesorderid := SiH."Order No.";
                end;
                //SIL.Reset();
                //sil.SetRange("Document No.","Invoice No.");
                //if SIL.get("Invoice No.") then begin
                SIL.Reset();
                SIL.SetRange("Document No.", "Invoice No.");
                SIL.SetRange("No.", "Item No.");
                SIL.SetRange("Line No.", "Invoice Line No.");
                if SIL.FindFirst() then begin
                    valueentry.Reset();
                    valueentry.SetRange("Document No.", "Invoice No.");
                    valueentry.SetRange("Document Line No.", "Invoice Line No.");
                    valueentry.SetRange("Source No.", "Customer No.");
                    valueentry.SetRange("Item No.", "Item No.");
                    if valueentry.FindFirst() then begin
                        ILE.Reset();
                        ILE.SetRange("Entry No.", valueentry."Item Ledger Entry No.");
                        if ILE.FindFirst() then begin
                            serialno := ILE."Serial No.";
                        end;
                    end;
                end;
                RecSIL.Reset();
                RecSIL.SetRange("Document No.", "Invoice No.");
                RecSIL.SetRange("No.", "Item No.");
                RecSIL.SetRange("Line No.", "Invoice Line No.");
                if RecSIL.FindFirst() then begin
                    StoreNo := RecSIL."Shortcut Dimension 2 Code";
                end;

            end;
            //end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        myInt: Integer;
        serialno: code[50];
        RecSIL: record "Sales Invoice Line";
        Recstate: record State;
        valueentry: Record "Value Entry";
        ILE: Record "Item Ledger Entry";
        SIH: Record "Sales Invoice Header";
        SIL: Record "Sales Invoice Line";
        customer: Record Customer;
        RecsalesInvheader: Record "Sales Invoice Header";
        shiptoadd1: Text[200];
        shiptocity: Text[50];
        shiptocountry: Text[50];
        shiptostate: text[50];
        shiptopostcode: code[30];
        PDL: record "Posted Delivery Line";
        Salesorderid: Code[50];
        SH: Record "Sales Header";
        Srno: Integer;
        itemheirchy: Record "Item Heirarchy Master";
        RecItem: Record Item;
        StoreNo: Code[20];


}