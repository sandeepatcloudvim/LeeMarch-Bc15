pageextension 50000 "LEE_Ext_SOSubform" extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(LEE_Embellishment; LEE_Embellishment)
            {
                Caption = 'Embellishment';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}