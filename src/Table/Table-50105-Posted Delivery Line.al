table 50105 "Posted Delivery Line"
{
    Caption = 'Posted Delivery Line';
    DataClassification = ToBeClassified;
    Permissions = tabledata "Sales Invoice Line" = RM;

    fields
    {
        field(1; "Delivery Challan No."; Code[20])
        {
            Caption = 'Delivery Challan No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Customer Phone No."; Text[30])
        {
            Caption = 'Customer Phone No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(8; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Delivery Address"; Text[100])
        {
            Caption = 'Delivery Address';
            DataClassification = ToBeClassified;
            Editable = false;
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
            Editable = false;
        }
        field(13; Warehouse; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Store Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(15; "Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Invoice Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; Delivered; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                SalInvLine: Record "Sales Invoice Line";
            begin
                If Rec.Delivered = true then begin
                    SalInvLine.Reset();
                    SalInvLine.SetRange("Document No.", "Invoice No.");
                    SalInvLine.SetRange("Line No.", "Invoice Line No.");
                    if SalInvLine.FindFirst() then begin
                        SalInvLine.Delivered := true;
                        SalInvLine.Modify();
                    end;
                end;
            end;
        }
        field(18; "Delivered Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Delivered by"; code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
            Editable = false;
        }
        field(20; "Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; Demo; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Item Category code 1"; Code[30])
        {
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
    var

}
