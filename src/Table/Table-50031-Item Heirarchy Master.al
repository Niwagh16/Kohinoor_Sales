table 50031 "Item Heirarchy Master"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Option Type"; Enum "Option Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Option Type';
        }
        field(3; "Description"; text[20])
        {
            DataClassification = ToBeClassified;

        }
    }



    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}