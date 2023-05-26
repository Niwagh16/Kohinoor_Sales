pageextension 50111 "Sales & Receivable" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Direct Debit Mandate Nos.")
        {

            field("Delivery No Series"; Rec."Delivery No Series")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Delivery No Series field.';
            }
        }
    }
}
