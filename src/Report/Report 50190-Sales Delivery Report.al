report 50190 "Sales Delivery Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Sales Delivery Report -1.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Posted Delivery Line"; "Posted Delivery Line")
        {
            column(Delivery_Challan_No_; "Delivery Challan No.")
            {

            }
            column(Delivered_Date; "Delivered Date")
            {

            }
            column(Delivery_Date; "Delivery Date")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Item_Description; "Item Description")
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
            trigger OnAfterGetRecord()

            begin
                RecsalesInvheader.Reset();
                RecsalesInvheader.SetRange("No.", "Invoice No.");
                if RecsalesInvheader.FindFirst() then begin
                    shiptoadd1 := RecsalesInvheader."Ship-to Address" + ',' + RecsalesInvheader."Ship-to Address 2" + ',' + RecsalesInvheader."Ship-to City";
                    shiptocity := RecsalesInvheader."Ship-to City";
                    shiptocountry := RecsalesInvheader."Ship-to Country/Region Code";
                end;
            end;
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
        customer: Record Customer;
        RecsalesInvheader: Record "Sales Invoice Header";
        shiptoadd1: Text[200];
        shiptocity: Text[50];
        shiptocountry: Text[50];
        shiptostate: text[50];

}