pageextension 50002 "LEE_Ext_SOShipmentSubform" extends "Posted Sales Invoice Subform"
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