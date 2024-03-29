tableextension 50103 "Sales Header Dim" extends "Sales Header"
{
    fields
    {
        modify("Location Code")
        {
            trigger OnAfterValidate()
            var
                RecLocation: Record 14;
            begin
                // If RecLocation.get("Location Code") then begin
                //     Validate("Shortcut Dimension 1 Code", RecLocation."Global Dimension 1 Code");
                //     Validate("Shortcut Dimension 2 Code", RecLocation."Global Dimension 2 Code");
                // end;
            end;
        }
        field(50000; "Pro-forma Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-064';
        }
    }

    var
        myInt: Integer;
}