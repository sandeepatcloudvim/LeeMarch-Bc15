page 50021 "Item Availability By Color"
{
    PageType = Card;
    SourceTable = "Item Color";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item.Description"; Item.Description)
                {
                    ApplicationArea = All;
                }
                field("Color Description"; "Color Description")
                {
                    ApplicationArea = All;
                }
                part(AvailByColorSubform; "Item Color Avail. by Size-copy")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin

        CurrPage.AvailByColorSubform.PAGE.SetItemColor("Item No.", "Color Code");
        CurrPage.AvailByColorSubform.PAGE.RefreshForm;
    end;

    trigger OnAfterGetRecord();
    begin
        Item.GET("Item No.");
    end;

    var
        Item: Record Item;
}

