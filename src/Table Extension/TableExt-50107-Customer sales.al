tableextension 50107 Customer_sales extends Customer
{
    fields
    {
        field(50101; "Old Account No."; Code[15])
        {
            Caption = 'Old Account No.';
            DataClassification = ToBeClassified;
        }
    }
}
