report 50191 "Logistic Delivery Challan"
{
    //pcpl-064
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Logistic Delivery Challan -1.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Posted Delivery Header"; "Posted Delivery Header")
        {
            RequestFilterFields = "Delivery Challan No.", "Delivery Date";
            column(Delivery_Challan_No_; "Delivery Challan No.")
            {

            }
            column(Vehicle_No_; "Vehicle No.")
            {

            }
            column(Delivery_Boy; "Delivery Boy")
            {

            }
            column(Delivery_Boy_Contact; "Delivery Boy Contact")
            {

            }
            column(Delivery_Date; "Delivery Date")
            {

            }
            column(Driver_Contact_No_; "Driver Contact No.")
            {

            }
            column(Driver_Name; "Driver Name")
            {

            }

            column(cominfo_name; cominfo.Name) { }
            dataitem("Posted Delivery Line"; "Posted Delivery Line")
            {
                DataItemLink = "Delivery Challan No." = field("Delivery Challan No.");
                DataItemLinkReference = "Posted Delivery Header";
                DataItemTableView = sorting("Delivery Challan No.", "Line No.") order(ascending) where(Quantity = filter(<> 0));
                column(Invoice_No_; "Invoice No.")
                {

                }
                column(Customer_Name; "Customer Name")
                {

                }
                column(Customer_Phone_No_; "Customer Phone No.")
                {

                }
                column(Item_No_; "Item No.")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Warehouse; Warehouse)
                {

                }
                column(Delivery_Address; "Delivery Address" + ' ' + "Delivery Address 2")
                {

                }
                column(Store_Name; "Store Name")
                {

                }
                column(Remarks; Remarks)
                {

                }
                trigger OnAfterGetRecord() //PDL
                var
                    myInt: Integer;
                begin

                end;
            }
            trigger OnAfterGetRecord() //PDH

            begin
                cominfo.get();
                cominfo.CalcFields(Picture);
            end;
        }
    }


    requestpage
    {
        layout
        {
            area(Content)
            {
                /*  group(GroupName)
                 {
                     field(Name; SourceExpression)
                     {
                         ApplicationArea = All;

                     }
                 } */
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

    /* rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    } */

    var
        myInt: Integer;
        cominfo: Record "Company Information";
}