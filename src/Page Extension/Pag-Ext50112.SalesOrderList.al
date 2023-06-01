pageextension 50112 "Sales Order List" extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst(processing)
        {
            action("Bulk Upload Data")
            {
                Caption = 'Bulk Upload Data';
                PromotedCategory = New;
                PromotedIsBig = true;
                Promoted = true;
                ApplicationArea = all;
                Image = UpdateXML;
                trigger OnAction()
                var
                    SO: XmlPort 50101;
                begin
                    So.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}