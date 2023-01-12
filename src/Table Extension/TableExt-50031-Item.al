tableextension 50031 "Item Ext" extends Item
{
    fields
    {
        field(50000; "Parent Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}