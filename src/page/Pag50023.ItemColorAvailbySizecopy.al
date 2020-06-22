page 50023 "Item Color Avail. by Size-copy"
{
    Caption = 'Item Color Avail. by Size';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = LEE_Size;
    SourceTableTemporary = true;
    PageType = CardPart;

    layout
    {
        area(content)
        {
            group(Control1102615002)
            {
                field("Date Filter"; DateFilter)
                {
                    ApplicationArea = All;
                }
                field("Location Filter"; LocationFilter)
                {
                    ApplicationArea = All;
                }
            }
            repeater(Control1102615003)
            {
                field("Code"; Code)
                {
                    ApplicationArea = All;
                }
                field("Qty. on Hand"; QtyonHand)
                {
                    ApplicationArea = All;
                }
                field("Qty. on Purch. Order"; QtyonPurchOrder)
                {
                    ApplicationArea = All;
                }
                field("Qty. on Work Order"; QtyonWorkOrder)
                {
                    ApplicationArea = All;
                }
                field("Qty. on Sales Order"; QtyonSalesOrder)
                {
                    ApplicationArea = All;
                }
                field("Qty. in Packages"; QtyinPackages)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin

        Item.SETRANGE("No.");
        Item.SETRANGE("Drop Shipment Filter", FALSE);
        // Item.SETRANGE("Build Kit Filter",FALSE); CV_PS
        FindPeriod('');


    end;

    trigger OnClosePage();
    begin

        IF Item."No." <> '' THEN BEGIN
            LastVariant := ItemVariant.Code;
        END;
    end;

    trigger OnInit();
    begin
        LineNo := 1;
    end;

    trigger OnOpenPage();
    begin

        // OPS23: Begin
        IF NOT (SRSetup.FINDFIRST) THEN
            CLEAR(SRSetup);
        IF (SRSetup."Default Availability Location" <> '') THEN BEGIN
            LocationFilter := SRSetup."Default Availability Location";
            Item.SETFILTER("Location Filter", LocationFilter);
        END;
        // OPS23: End

        AmountType := AmountType::"Balance at Date";
        FindPeriod('');
        LineInit(AvailType::All, Item);
        MakeWhat;
        FindPeriod('');
    end;

    var
        SRSetup: Record "Sales & Receivables Setup";
        Item: Record Item;
        ItemColor: Record "Item Color";
        ItemVariant: Record "Item Variant";
        Calendar: Record Date;
        ItemLedgerEntry: Record "Item Ledger Entry";
        SalesLine: Record "Sales Line";
        ServLine: Record "Service Line";
        PurchLine: Record "Purchase Line";
        TransLine: Record "Transfer Line";
        ReqLine: Record "Requisition Line";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComp: Record "Prod. Order Component";
        PlanningComponent: Record "Planning Component";
        AvailType: Option "Gross Requirement","Planned Order Receipt","Scheduled Order Receipt","Planned Order Release",All,"Packed Quantity";
        Sign: Integer;
        LineNo: Integer;
        ItemPeriodLength: Option Day,Week,Month,Quarter,Year,Period;
        AmountType: Option "Net Change","Balance at Date";
        LastVariant: Code[10];
        ColumnValue: Decimal;
        DateFilter: Text[250];
        LocationFilter: Text[250];
        Item2: Record Item;
        Text000: TextConst ENU = '%1 Receipt', FRC = 'Reçu %1', ENC = '%1 Receipt';
        Text001: TextConst ENU = '%1 Release', FRC = '%1 Relâcher', ENC = '%1 Release';
        Text002: TextConst ENU = 'Firm planned %1', FRC = 'Planifié ferme %1', ENC = 'Firm planned %1';
        Text003: TextConst ENU = 'Released %1', FRC = '%1 relâché', ENC = 'Released %1';
        QtyonHand: Integer;
        QtyonPurchOrder: Integer;
        QtyonWorkOrder: Integer;
        QtyonSalesOrder: Integer;
        QtyinPackages: Integer;

    local procedure FindPeriod(SearchText: Code[10]);
    var
        PeriodFormMgt: Codeunit PeriodFormManagement;
    begin
        IF Item.GETFILTER("Date Filter") <> '' THEN BEGIN
            Calendar.SETFILTER("Period Start", Item.GETFILTER("Date Filter"));
            IF NOT PeriodFormMgt.FindDate('+', Calendar, ItemPeriodLength) THEN
                PeriodFormMgt.FindDate('+', Calendar, ItemPeriodLength::Day);
            Calendar.SETRANGE("Period Start");
        END;
        PeriodFormMgt.FindDate(SearchText, Calendar, ItemPeriodLength);
        IF AmountType = AmountType::"Net Change" THEN BEGIN
            Item.SETRANGE("Date Filter", Calendar."Period Start", Calendar."Period End");
            IF Item.GETRANGEMIN("Date Filter") = Item.GETRANGEMAX("Date Filter") THEN
                Item.SETRANGE("Date Filter", Item.GETRANGEMIN("Date Filter"));
        END ELSE
            Item.SETRANGE("Date Filter", 0D, Calendar."Period End");
        DateFilter := Item.GETFILTER("Date Filter");
    end;

    procedure GetLastVariant(): Code[10];
    begin
        EXIT(LastVariant);
    end;

    procedure LineInit(NewType: Option "Gross Requirement","Planned Order Receipt","Scheduled Order Receipt","Planned Order Release",All,"Packed Quantity"; var NewItem: Record Item);
    begin
        AvailType := NewType;
        Item.COPY(NewItem);
    end;

    local procedure MakeEntries();
    begin
        CASE AvailType OF
            AvailType::"Packed Quantity":
                BEGIN
                    //Item.CALCFIELDS("Qty. in Packages"); CV_PS >>
                    //      InsertEntry(
                    //        DATABASE::"Package Line",
                    //        Item.FIELDNO("Qty. in Packages"),
                    //        Item.FIELDCAPTION("Qty. in Packages"),
                    //        Item."Qty. in Packages"); CV_PS<<

                END;
            AvailType::"Gross Requirement":
                BEGIN
                    InsertEntry(
                      DATABASE::"Sales Line",
                      Item.FIELDNO("Qty. on Sales Order"),
                      Item.FIELDCAPTION("Qty. on Sales Order"),
                      Item."Qty. on Sales Order");


                    /*
                          InsertEntry(
                            DATABASE::"Service Line",
                            Item.FIELDNO("Qty. on Service Order"),
                            ServLine.TABLECAPTION,
                            Item."Qty. on Service Order");
                          InsertEntry(
                            DATABASE::"Prod. Order Component",
                            Item.FIELDNO("Scheduled Need (Qty.)"),
                            ProdOrderComp.TABLECAPTION,
                            Item."Scheduled Need (Qty.)");
                          InsertEntry(
                            DATABASE::"Planning Component",
                            Item.FIELDNO("Planning Issues (Qty.)"),
                            PlanningComponent.TABLECAPTION,
                            Item."Planning Issues (Qty.)");
                          InsertEntry(
                            DATABASE::"Transfer Line",
                            Item.FIELDNO("Trans. Ord. Shipment (Qty.)"),
                            Item.FIELDCAPTION("Trans. Ord. Shipment (Qty.)"),
                            Item."Trans. Ord. Shipment (Qty.)");
                    */

                    //      InsertEntry( CV_PS>>
                    //        DATABASE::"Kit Sales Line",
                    //        Item.FIELDNO("Qty. on Kit Sales Lines"),
                    //        Item.FIELDCAPTION("Qty. on Kit Sales Lines"),
                    //        Item."Qty. on Kit Sales Lines");
                    //      InsertEntry(
                    //        DATABASE::"Kit BOM Journal Line",
                    //        Item.FIELDNO("Qty. on Kit Sales Lines"),
                    //        Item.FIELDCAPTION("Qty. on WO Kit Lines"),
                    //        Item."Qty. on WO Kit Lines"); CV_PS<<
                END;
            AvailType::"Planned Order Receipt":
                BEGIN
                    /*
                          InsertEntry(
                            DATABASE::"Requisition Line",
                            Item.FIELDNO("Purch. Req. Receipt (Qty.)"),
                            ReqLine.TABLECAPTION,
                            Item."Purch. Req. Receipt (Qty.)");
                          InsertEntry(
                            DATABASE::"Prod. Order Line",
                            Item.FIELDNO("Planned Order Receipt (Qty.)"),
                            STRSUBSTNO(Text000,ProdOrderLine.TABLECAPTION),
                            Item."Planned Order Receipt (Qty.)");
                    */
                END;
            AvailType::"Planned Order Release":
                BEGIN
                    /*
                          InsertEntry(
                            DATABASE::"Requisition Line",
                            Item.FIELDNO("Purch. Req. Release (Qty.)"),
                            ReqLine.TABLECAPTION,
                            Item."Purch. Req. Release (Qty.)");
                          InsertEntry(
                            DATABASE::"Prod. Order Line",
                            Item.FIELDNO("Planned Order Release (Qty.)"),
                            STRSUBSTNO(Text001,ProdOrderLine.TABLECAPTION),
                            Item."Planned Order Release (Qty.)");
                          InsertEntry(
                            DATABASE::"Requisition Line",
                            Item.FIELDNO("Planning Release (Qty.)"),
                            ReqLine.TABLECAPTION,
                            Item."Planning Release (Qty.)");
                    */
                END;
            AvailType::"Scheduled Order Receipt":
                BEGIN
                    InsertEntry(
                      DATABASE::"Purchase Line",
                      Item.FIELDNO("Qty. on Purch. Order"),
                      Item.FIELDCAPTION("Qty. on Purch. Order"),
                      1);

                    //      InsertEntry( CV_PS>>
                    //        DATABASE::"BOM Journal Line",
                    //        Item.FIELDNO("Qty. on Work Order"),
                    //        Item.FIELDCAPTION("Qty. on Work Order"),
                    //        Item."Qty. on Work Order"); CV_PS<<



                    /*
                          InsertEntry(
                            DATABASE::"Prod. Order Line",
                            Item.FIELDNO("FP Order Receipt (Qty.)"),
                            STRSUBSTNO(Text002,ProdOrderLine.TABLECAPTION),
                            Item."FP Order Receipt (Qty.)");
                          InsertEntry(
                            DATABASE::"Prod. Order Line",
                            Item.FIELDNO("Rel. Order Receipt (Qty.)"),
                            STRSUBSTNO(Text003,ProdOrderLine.TABLECAPTION),
                            Item."Rel. Order Receipt (Qty.)");
                          InsertEntry(
                            DATABASE::"Transfer Line",
                            Item.FIELDNO("Qty. in Transit"),
                            Item.FIELDCAPTION("Qty. in Transit"),
                            Item."Qty. in Transit");
                          InsertEntry(
                            DATABASE::"Transfer Line",
                            Item.FIELDNO("Trans. Ord. Receipt (Qty.)"),
                            Item.FIELDCAPTION("Trans. Ord. Receipt (Qty.)"),
                            Item."Trans. Ord. Receipt (Qty.)");
                    */

                END;
        END;

    end;

    local procedure MakeWhat();
    begin
        Sign := 1;
        IF AvailType <> AvailType::All THEN
            MakeEntries
        ELSE BEGIN
            Item.SETRANGE("Date Filter", 0D, Item.GETRANGEMAX("Date Filter"));
            Item.CALCFIELDS(
              "Qty. on Sales Order",
              //"Qty. on Kit Sales Lines", CV_PS
              "Qty. on Service Order",
              "Net Change",
              "Scheduled Receipt (Qty.)",
              "Scheduled Need (Qty.)",
              "Planned Order Receipt (Qty.)",
              "FP Order Receipt (Qty.)",
              "Rel. Order Receipt (Qty.)",
              "Planned Order Release (Qty.)",
              "Purch. Req. Receipt (Qty.)",
              "Planning Issues (Qty.)",
              "Purch. Req. Release (Qty.)",
              "Qty. in Transit",
              "Trans. Ord. Shipment (Qty.)",
              "Trans. Ord. Receipt (Qty.)");
            //    "Qty. in Packages", CV_PS
            //"Qty. on Work Order");CV_PS

            //"Table No." := DATABASE::"Item Ledger Entry";

            InsertEntry(999999998,
                        999999998,
                        'Supply',
                        1);

            InsertEntry(DATABASE::"Item Ledger Entry",
                        Item.FIELDNO(Inventory),
                        Item.FIELDCAPTION(Inventory),
                        1);

            AvailType := AvailType::"Planned Order Receipt";
            Sign := 1;
            MakeEntries;

            AvailType := AvailType::"Scheduled Order Receipt";
            Sign := 1;
            MakeEntries;

            InsertEntry(999999998,
                        999999998,
                        'Demand',
                        1);

            AvailType := AvailType::"Gross Requirement";
            Sign := -1;
            MakeEntries;

            AvailType := AvailType::"Packed Quantity";
            Sign := 1;
            MakeEntries;

            InsertEntry(999999998,
                        999999998,
                        '----------',
                        1);
            InsertEntry(999999999,
                        999999999,
                        'Open to Sell',
                        1);

            AvailType := AvailType::All;

        END;
    end;

    local procedure InsertEntry("Table": Integer; "Field": Integer; TableName: Text[100]; Qty: Decimal);
    begin
        //IF Qty = 0 THEN EXIT;
        //CV_PS>>
        // "Table No." := Table;
        // QuerySource := Field;
        // Name := TableName;
        // Quantity := Qty * Sign;
        // "Line No." := LineNo; CV_PS
        // INSERT;
        // LineNo += 1;
        //CV_PS<<
    end;

    procedure SetItemColor(ItemNo: Code[20]; ColorCode: Code[10]);
    begin
        IF NOT (Item.GET(ItemNo)) THEN
            CLEAR(Item);

        IF NOT (ItemColor.GET(ItemNo, ColorCode)) THEN
            CLEAR(ItemColor);

        // CurrForm.SizeMatrix.MatrixRec.SETRANGE("Item No.",ItemNo);
        // CurrForm.SizeMatrix.MatrixRec.SETCURRENTKEY("Size Sort Order");
        CurrPage.CAPTION := Item."No." + ' ' + Item.Description + ' - ' + ItemColor."Color Code" + ' - Avail. by Size';
    end;

    procedure RefreshForm();
    begin
        CurrPage.UPDATE(FALSE);
    end;
}

