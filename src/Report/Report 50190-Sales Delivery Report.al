report 50190 "Sales Delivery Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Delivery Line"; "Delivery Line")
        {
            column(Delivery_Challan_No_; "Delivery Challan No.")
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

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }

    var
        myInt: Integer;
}