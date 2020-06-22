tableextension 50000 "LEE_ExtSalesShpmentLine" extends "Sales Shipment Line"
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