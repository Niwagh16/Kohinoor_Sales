table 50103 "Delivery Line"
{
    Caption = 'Delivery Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Delivery Challan No."; Code[20])
        {
            Caption = 'Delivery Challan No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Cust: Record 18;
            begin
                IF Cust.get("Customer No.") then begin
                    "Customer Name" := Cust.Name;
                    "Customer Phone No." := Cust."Phone No.";
                end;
            end;
        }
        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(6; "Customer Phone No."; Text[30])
        {
            Caption = 'Customer Phone No.';
            DataClassification = ToBeClassified;
        }
        field(7; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;

        }
        field(8; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
            DataClassification = ToBeClassified;
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(10; "Delivery Address"; Text[100])
        {
            Caption = 'Delivery Address';
            DataClassification = ToBeClassified;
        }
        field(11; Remarks; Text[50])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(12; "Delivery Address 2"; Text[50])
        {
            Caption = 'Delivery Address 2';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Delivery Challan No.", "Line No.", "Delivery Date")
        {
            Clustered = true;
        }
    }
}
