pageextension 50110 Customer_Sales extends "Customer Card"
{
    layout
    {
        addafter("Balance (LCY)")
        {

            field("Old Account No."; Rec."Old Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Old Account No. field.';
            }
        }
    }
}
