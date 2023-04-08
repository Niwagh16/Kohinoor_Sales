page 50101 "Item Heirarchy"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Item heirarchy";

    layout
    {
        area(Content)
        {
            repeater(control001)
            {

                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field("Category 1"; Rec."Category 1")
                {
                    ToolTip = 'Specifies the value of the Category 1 field.';
                }
                field("Category 2"; Rec."Category 2")
                {
                    ToolTip = 'Specifies the value of the Category 2 field.';
                }
                field("Category 3"; Rec."Category 3")
                {
                    ToolTip = 'Specifies the value of the Category 3 field.';
                }
                field("Category 4"; Rec."Category 4")
                {
                    ToolTip = 'Specifies the value of the Category 4 field.';
                }
                field("Category 5"; Rec."Category 5")
                {
                    ToolTip = 'Specifies the value of the Category 5 field.';
                }
                field("Category 6"; Rec."Category 6")
                {
                    ToolTip = 'Specifies the value of the Category 6 field.';
                }
                field("Category 7"; Rec."Category 7")
                {
                    ToolTip = 'Specifies the value of the Category 7 field.';
                }
                field("Category 8"; Rec."Category 8")
                {
                    ToolTip = 'Specifies the value of the Category 8 field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}