tableextension 50001 "LEE_ExtSalesInvLine" extends "Sales Invoice Line"
{
    fields
    {
        // Add changes to table fields here
        field(50035; LEE_Embellishment; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = LEE_Embellishment;
            Caption = 'Embellishment';
        }
    }

    var
        myInt: Integer;
}