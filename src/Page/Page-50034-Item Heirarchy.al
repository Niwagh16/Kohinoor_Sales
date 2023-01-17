page 50034 "Item Heirarchy"
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


                field(A; Rec.A)
                {
                    ToolTip = 'Specifies the value of the A field.';
                }
                field(B; Rec.B)
                {
                    ToolTip = 'Specifies the value of the B field.';
                }
                field(C; Rec.C)
                {
                    ToolTip = 'Specifies the value of the C field.';
                }
                field(D; Rec.D)
                {
                    ToolTip = 'Specifies the value of the D field.';
                }
                field(E; Rec.E)
                {
                    ToolTip = 'Specifies the value of the E field.';
                }
                field(F; Rec.F)
                {
                    ToolTip = 'Specifies the value of the F field.';
                }
                field(G; Rec.G)
                {
                    ToolTip = 'Specifies the value of the G field.';
                }
                field(H; Rec.H)
                {
                    ToolTip = 'Specifies the value of the H field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
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