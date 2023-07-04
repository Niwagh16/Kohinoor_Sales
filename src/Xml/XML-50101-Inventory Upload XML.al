xmlport 50101 "Inventory Upload XML"
{
    Direction = Both;
    Format = VariableText;
    Permissions = TableData 454 = rm;
    UseRequestPage = true;
    TextEncoding = UTF8;
    FieldSeparator = ',';
    Caption = 'Inventory Upload XML';

    schema
    {
        textelement(root)
        {
            tableelement("Item Journal"; 83)
            {
                AutoSave = false;
                AutoUpdate = false;
                AutoReplace = false;
                XmlName = 'Itemjournal';
                SourceTableView = WHERE("Location Code" = FILTER(1));
                UseTemporary = true;
                textelement(Docno)
                {
                }
                textelement(PostDate)
                {
                    MinOccurs = Zero;
                }
                textelement(EntryType)
                {
                    MinOccurs = Zero;
                }
                textelement(ItemNo)
                {
                    MinOccurs = Zero;
                }
                textelement(variantcode)
                {
                    MinOccurs = Zero;
                }

                textelement(LocCode)
                {
                    MinOccurs = Zero;
                }
                textelement(BinCode)
                {
                    MinOccurs = Zero;
                }
                textelement(QTY)
                {
                    MinOccurs = Zero;
                }
                textelement(UnitCost)
                {
                    MinOccurs = Zero;
                }
                textelement(LotNo)
                {
                    MinOccurs = Zero;
                }
                textelement(ShortCodeDim1)
                {
                    MinOccurs = Zero;
                }
                textelement(ShortCodeDim2)
                {
                    MinOccurs = Zero;
                }
                textelement(GenProdPostGroup)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                var
                    ApprovalEntry: Record 454;
                    ApprovalsMgmt: Codeunit 1535;
                begin
                    IF firstline THEN BEGIN
                        firstline := FALSE;
                        currXMLport.SKIP;
                    END;
                    ItemJournalLine.RESET;
                    ItemJournalLine.SETRANGE("Journal Batch Name", 'OPBAL');//OPBAL
                    ItemJournalLine.SETRANGE("Journal Template Name", 'ITEM');
                    IF ItemJournalLine.FINDLAST THEN
                        linNo := ItemJournalLine."Line No.";

                    ItemJnlLine.INIT;
                    ItemJnlLine.VALIDATE("Journal Template Name", 'ITEM');
                    ItemJnlLine.VALIDATE("Journal Batch Name", 'OPBAL');//OPBAL
                    ItemJnlLine.VALIDATE("Document No.", Docno);
                    EVALUATE(PDate, PostDate);
                    ItemJnlLine.VALIDATE("Posting Date", PDate);
                    ItemJnlLine.VALIDATE("Line No.", linNo + 10000);

                    EVALUATE(EType, EntryType);
                    ItemJnlLine.VALIDATE("Entry Type", EType);

                    ItemJnlLine.VALIDATE("Item No.", ItemNo);
                    ItemJnlLine.VALIDATE("Location Code", LocCode);
                    //  ItemJnlLine.Validate("Part No.", PartNo);
                    ItemJnlLine.Validate("Variant Code", variantcode);
                    ItemJnlLine.VALIDATE("Shortcut Dimension 1 Code", ShortCodeDim1);
                    ItemJnlLine.VALIDATE("Shortcut Dimension 2 Code", ShortCodeDim2);
                    ItemJnlLine.VALIDATE("Bin Code", BinCode);
                    ItemJnlLine.Validate("Gen. Prod. Posting Group", GenProdPostGroup);

                    QTY := DELCHR(QTY, '=', '"');
                    EVALUATE(Amt, QTY);
                    ItemJnlLine.VALIDATE(Quantity, Amt);

                    UnitCost := DELCHR(UnitCost, '=', '"');
                    EVALUATE(DecCost, UnitCost);
                    ItemJnlLine.VALIDATE("Unit Cost", DecCost);
                    ItemJnlLine.VALIDATE(Quantity);
                    //ItemJnlLine.VALIDATE("Lot No.",LotNo);
                    ItemJnlLine.INSERT;

                    ReservationEntry12.RESET;
                    IF ReservationEntry12.FINDLAST THEN
                        cnt := ReservationEntry12."Entry No.";

                    ReservationEntry.INIT;
                    ReservationEntry.VALIDATE("Entry No.", cnt + 1);
                    ReservationEntry.VALIDATE("Source Type", 83);
                    ReservationEntry.VALIDATE("Source ID", 'ITEM');
                    ReservationEntry.VALIDATE("Source Batch Name", 'OPBAL');//OPBAL
                    ReservationEntry.VALIDATE("Source Subtype", ReservationEntry."Source Subtype"::"2");
                    ReservationEntry.VALIDATE("Source Ref. No.", ItemJnlLine."Line No.");
                    ReservationEntry.VALIDATE("Item No.", ItemJnlLine."Item No.");
                    ReservationEntry.VALIDATE("Serial No.", LotNo);
                    ReservationEntry.VALIDATE(Quantity, ItemJnlLine.Quantity);
                    ReservationEntry.VALIDATE("Quantity (Base)", ItemJnlLine."Quantity (Base)");
                    ReservationEntry.VALIDATE("Location Code", ItemJnlLine."Location Code");
                    ReservationEntry.VALIDATE("Reservation Status", ReservationEntry."Reservation Status"::Prospect);
                    ReservationEntry.VALIDATE("Created By", USERID);
                    ReservationEntry.VALIDATE("Creation Date", ItemJnlLine."Posting Date");
                    ReservationEntry.VALIDATE("Expected Receipt Date", ItemJnlLine."Posting Date");
                    ReservationEntry.VALIDATE("Item Tracking", ReservationEntry."Item Tracking"::"Serial No.");
                    ReservationEntry.VALIDATE(Positive, TRUE);
                    ReservationEntry.INSERT;
                    //ReservationEntry.Validate("Variant Code", ItemJnlLine."Variant Code");

                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        MESSAGE('Data import sucessfully....');
    end;

    trigger OnPreXmlPort()
    begin
        firstline := TRUE;
    end;

    var
        ItemJnlLine: Record 83;
        firstline: Boolean;
        PDate: Date;
        EType: Option Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output";
        Amt: Decimal;
        DecCost: Decimal;
        ReservationEntry: Record 337;
        ReservationEntry12: Record 337;
        cnt: Integer;
        ItemJournalLine: Record 83;
        linNo: Integer;
}

