page 50012 "LEE_Web Order History"
{
    PageType = List;
    SourceTable = "LEE_Web Order";
    SourceTableView = SORTING("Entry No.")
                      WHERE("Sales Order Created" = FILTER(true));
    UsageCategory = History;
    ApplicationArea = All;
    Caption = 'Web Order History';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Store ID"; "Store ID")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; "Sales Order No.")
                {
                    ApplicationArea = All;
                }
                field("Order Created By User"; "Order Created By User")
                {
                    ApplicationArea = All;
                }
                field("Order Created Date"; "Order Created Date")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Style No."; "Style No.")
                {
                    ApplicationArea = All;
                }
                field(UPC; UPC)
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Order No."; "Order No.")
                {
                    ApplicationArea = All;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    ApplicationArea = All;
                }
                field("Ship-to City"; "Ship-to City")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    ApplicationArea = All;
                }
                field(Taxable; Taxable)
                {
                    ApplicationArea = All;
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Phone"; "Ship-to Phone")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Email"; "Ship-to Email")
                {
                    ApplicationArea = All;
                }
                field(Size; Size)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; "Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Shipping Total"; "Shipping Total")
                {
                    ApplicationArea = All;
                }
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Shipping Agent"; "Shipping Agent")
                {
                    ApplicationArea = All;
                }
                field("Shipping Agent Service"; "Shipping Agent Service")
                {
                    ApplicationArea = All;
                }
                field("Import Date"; "Import Date")
                {
                    ApplicationArea = All;
                }
                field("Import Time"; "Import Time")
                {
                    ApplicationArea = All;
                }
                field("Imported By User"; "Imported By User")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(History)
            {
                Image = History;
                ApplicationArea = All;
                RunObject = Page "LEE_Web Order History";
            }
            action("Make Order ")
            {
                ApplicationArea = All;
                Image = Create;
                trigger OnAction();
                var
                    rptMakeOrder: Report "LEE_Make Store Order";
                begin
                    if not CONFIRM('Would you like to make store orders?', false) then
                        exit;

                    CurrPage.SETSELECTIONFILTER(WebOrder);
                    if WebOrder.FINDSET then begin
                        rptMakeOrder.SETTABLEVIEW(WebOrder);
                        rptMakeOrder.InitStore(WebOrder);
                        rptMakeOrder.RUNMODAL;
                    end;
                end;
            }
            action(Import)
            {
                ApplicationArea = All;
                Image = Import;
                trigger OnAction();
                begin
                    StoreOrderMgt.ImportStoreOrders;
                    CurrPage.UPDATE;
                end;
            }
            action("Import with UPC")
            {
                ApplicationArea = All;
                Image = Import;
                trigger OnAction();
                begin
                    StoreOrderMgt.ImportStoreOrdersWithUPC;
                    CurrPage.UPDATE;
                end;
            }
        }
    }

    var
        StoreOrderMgt: Codeunit "Store Order Management";
        WebOrder: Record "LEE_Web Order";
}

