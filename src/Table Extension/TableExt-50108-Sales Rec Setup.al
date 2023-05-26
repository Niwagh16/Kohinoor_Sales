tableextension 50108 Sales_Rec_Setup extends "Sales & Receivables Setup"
{
    fields
    {
        field(50101; "Delivery No Series"; Code[20])
        {
            Caption = 'Delivery No Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }
}
