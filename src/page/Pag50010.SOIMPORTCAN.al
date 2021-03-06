page 50010 "SO IMPORT - CAN"
{
    PageType = List;
    SourceTable = "SO IMPORT - CAN";
    Caption = 'Leemarc Order Import';
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }
                field(Value1; "Value1")
                {
                    ApplicationArea = All;
                }
                field("Item Not Exists"; "Item Not Exists")
                {
                    ApplicationArea = All;
                }
                field(Value2; "Value2")
                {
                    ApplicationArea = All;
                }
                field(Value3; "Value3")
                {
                    ApplicationArea = All;
                }
                field(Value4; "Value4")
                {
                    ApplicationArea = All;
                }
                field(Value5; "Value5")
                {
                    ApplicationArea = All;
                }
                field(Value6; "Value6")
                {
                    ApplicationArea = All;
                }
                field(Value7; "Value7")
                {
                    ApplicationArea = All;
                }
                field(Value8; "Value8")
                {
                    ApplicationArea = All;
                }
                field(Value9; "Value9")
                {
                    ApplicationArea = All;
                }
                field(Value10; "Value10")
                {
                    ApplicationArea = All;
                }
                field(Value11; "Value11")
                {
                    ApplicationArea = All;
                }
                field(Value12; "Value12")
                {
                    ApplicationArea = All;
                }
                field(Value13; "Value13")
                {
                    ApplicationArea = All;
                }
                field(Value14; "Value14")
                {
                    ApplicationArea = All;
                }
                field(Value15; "Value15")
                {
                    ApplicationArea = All;
                }
                field(Value16; "Value16")
                {
                    ApplicationArea = All;
                }
                field(Value17; "Value17")
                {
                    ApplicationArea = All;
                }
                field(Value18; "Value18")
                {
                    ApplicationArea = All;
                }
                field(Value19; "Value19")
                {
                    ApplicationArea = All;
                }
                field(Value20; "Value20")
                {
                    ApplicationArea = All;
                }
                field(Value21; "Value21")
                {
                    ApplicationArea = All;
                }
                field(Value22; "Value22")
                {
                    ApplicationArea = All;
                }
                field(Value23; "Value23")
                {
                    ApplicationArea = All;
                }
                field(Value24; "Value24")
                {
                    ApplicationArea = All;
                }
                field(Value25; "Value25")
                {
                    ApplicationArea = All;
                }
                field(Value26; "Value26")
                {
                    ApplicationArea = All;
                }
                field(Value27; "Value27")
                {
                    ApplicationArea = All;
                }
                field(Value28; "Value28")
                {
                    ApplicationArea = All;
                }
                field(Value29; "Value29")
                {
                    ApplicationArea = All;
                }
                field(Value30; "Value30")
                {
                    ApplicationArea = All;
                }
                field(Value31; "Value31")
                {
                    ApplicationArea = All;
                }
                field(Value32; "Value32")
                {
                    ApplicationArea = All;
                }
                field(Value33; "Value33")
                {
                    ApplicationArea = All;
                }
                field(Value34; "Value34")
                {
                    ApplicationArea = All;
                }
                field(Value35; "Value35")
                {
                    ApplicationArea = All;
                }
                field(Value36; "Value36")
                {
                    ApplicationArea = All;
                }
                field(Value37; "Value37")
                {
                    ApplicationArea = All;
                }
                field(Value38; "Value38")
                {
                    ApplicationArea = All;
                }
                field(Value39; "Value39")
                {
                    ApplicationArea = All;
                }
                field(Value40; "Value40")
                {
                    ApplicationArea = All;
                }
                field(Value41; "Value41")
                {
                    ApplicationArea = All;
                }
                field(Value42; "Value42")
                {
                    ApplicationArea = All;
                }
                field(Value43; "Value43")
                {
                    ApplicationArea = All;
                }
                field(Value44; "Value44")
                {
                    ApplicationArea = All;
                }
                field(Value45; "Value45")
                {
                    ApplicationArea = All;
                }
                field(Value46; "Value46")
                {
                    ApplicationArea = All;
                }
                field(Value47; "Value47")
                {
                    ApplicationArea = All;
                }
                field(Value48; "Value48")
                {
                    ApplicationArea = All;
                }
                field(Value49; "Value49")
                {
                    ApplicationArea = All;
                }
                field(Value50; "Value50")
                {
                    ApplicationArea = All;
                }
                field(Value51; "Value51")
                {
                    ApplicationArea = All;
                }
                field(Value52; "Value52")
                {
                    ApplicationArea = All;
                }
                field(Value53; "Value53")
                {
                    ApplicationArea = All;
                }
                field(Value54; "Value54")
                {
                    ApplicationArea = All;
                }
                field(Value55; "Value55")
                {
                    ApplicationArea = All;
                }
                field(Value56; "Value56")
                {
                    ApplicationArea = All;
                }
                field(Value57; "Value57")
                {
                    ApplicationArea = All;
                }
                field(Value58; "Value58")
                {
                    ApplicationArea = All;
                }
                field(Value59; "Value59")
                {
                    ApplicationArea = All;
                }
                field(Value60; "Value60")
                {
                    ApplicationArea = All;
                }
                field(Value61; "Value61")
                {
                    ApplicationArea = All;
                }
                field(Value62; "Value62")
                {
                    ApplicationArea = All;
                }
                field(Value63; "Value63")
                {
                    ApplicationArea = All;
                }
                field(Value64; "Value64")
                {
                    ApplicationArea = All;
                }
                field(Value65; "Value65")
                {
                    ApplicationArea = All;
                }
                field(Value66; "Value66")
                {
                    ApplicationArea = All;
                }
                field(Value67; "Value67")
                {
                    ApplicationArea = All;
                }
                field(Value68; "Value68")
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
            action("Delete Non Existing Items")
            {
                Image = Delete;
                ApplicationArea = All;
                trigger OnAction();
                begin
                    DeleteNonexistingItemfunc;
                    CurrPage.UPDATE;
                end;
            }
            group(Import)
            {
                action("Import Canari")
                {
                    ApplicationArea = All;
                    Image = Import;

                    trigger OnAction();
                    begin
                        //DATAPORT.RUN(50005);
                        Xmlport.RUN(50005, TRUE);
                        CurrPage.UPDATE;
                        COMMIT;

                        //DeleteBlankValues;
                        ValidateItem(Rec);
                        RESET;
                        FINDFIRST;
                    end;
                }
                action("Import Shopify")
                {
                    Image = Import;
                    ApplicationArea = All;
                    trigger OnAction();
                    begin

                        ImportShopify;
                        ValidateItemsShopify(Rec);
                        RESET;
                        FINDFIRST;
                    end;
                }
                action("Import DSG")
                {
                    ApplicationArea = All;
                    Image = Import;

                    trigger OnAction();
                    begin
                        ImportDSG;
                    end;
                }
                action("Import QVC")
                {
                    ApplicationArea = All;
                    Image = Import;

                    trigger OnAction();
                    begin
                        ImportDSG;
                    end;
                }
            }
        }
    }
    var
        SH: Record "Sales Header";
        SL: Record "Sales Line";
        SL2: Record "Sales Line";
        TextImport: Record "SO IMPORT - CAN";
        RecItm: Record Item;
        RecSCL: Record "Sales Comment Line";
        RecSCL2: Record "Sales Comment Line";
        CustOpt: Record "Custom Option";
        CustNo: Text[50];
        OrderDate: Date;
        ShipDate: Date;
        ItmNo: array[500] of Code[10];
        I: Integer;
        LineNo: Integer;
        J: Integer;
        K: Integer;
        RepCode: Code[10];
        Qty: array[500] of Decimal;
        UnitPrce: array[500] of Decimal;
        Desc: array[500] of Text[50];
        CmtLineNo: Integer;
        PONo: Text[30];
        DesignerCode: Text[30];
        PhNo: Text[30];
        Email: Text[50];
        AcaExtDocNo: Code[20];
        ShipAgent: Code[10];
        AgentService: Code[20];
        Lycracode: array[500] of Code[20];
        Fabric: array[500] of Code[20];
        Pad: array[500] of Code[20];
        Sizes: array[500] of Code[10];
        InvDiscValueTxt: Text[250];
        InvDiscValueDec: Decimal;
        PromoCode: Code[250];
        PkgCustom3: Integer;

    procedure ProcessValuesShebeest(var TempTextImport: Record "SO IMPORT - CAN");
    begin
        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'Ship Date:':
                        BEGIN
                            CLEAR(CustNo);
                            CustNo := TempTextImport.Value17;
                            CLEAR(RepCode);
                            RepCode := TempTextImport.Value10;
                            CLEAR(ShipDate);
                            EVALUATE(ShipDate, TempTextImport.Value3);
                        END;
                END;

                CASE TempTextImport.Value1 OF
                    'Order Date:':
                        BEGIN
                            CLEAR(OrderDate);
                            EVALUATE(OrderDate, TempTextImport.Value3);
                        END;
                END;
            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure FindItemsShebeest(var TempTextImport: Record "SO IMPORT - CAN");
    begin
        I := 4;
        CLEAR(ItmNo);
        CLEAR(Qty);
        CLEAR(UnitPrce);
        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'Sku':
                        BEGIN

                            IF Value1 = 'Sku' THEN
                                NEXT := I;
                            REPEAT
                                IF (TempTextImport.Value1 <> '') THEN BEGIN
                                    IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                        Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                    ELSE
                                        ItmNo[I] := TempTextImport.Value1;
                                    IF ItmNo[I] <> '' THEN BEGIN
                                        EVALUATE(Qty[I], TempTextImport.Value17);
                                        IF (TempTextImport.Value18 <> '') OR (TempTextImport.Value18 <> ' $-') THEN
                                            EVALUATE(UnitPrce[I], COPYSTR(TempTextImport.Value18, 4, STRLEN(TempTextImport.Value18)));
                                        I += 1;
                                    END;
                                END;
                            //I += 1;
                            UNTIL NEXT = 0;
                        END;
                END;

            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure CreateSalesLineCanari();
    var
        ItemRec: Record Item;
        ItemVarRec: Record "Item Variant";
        ItemSizeRec: Record "Item Size";
    begin
        K := 4;

        //FOR J := 4 TO (I-10) DO BEGIN
        FOR J := 4 TO I DO BEGIN
            SL.INIT;
            //SL.SetHideValidationDialog(TRUE);
            SL.VALIDATE("Document Type", SL."Document Type"::Order);
            SL.VALIDATE("Document No.", SH."No.");
            LineNo += 10000;
            SL."Line No." := LineNo;
            //SL.VALIDATE("Line No.",LineNo);
            SL.INSERT(TRUE);
            SL.VALIDATE(Type, SL.Type::Item);
            SL.VALIDATE("No.", ItmNo[K]);
            IF ItmNo[K] <> '' THEN BEGIN

                SL.VALIDATE(Quantity, Qty[K]);
                SL.VALIDATE("Unit Price", UnitPrce[K]);
                //    SL.Description := Desc[K];
                IF ItemRec.GET(ItmNo[K]) THEN BEGIN
                    SL.Description := ItemRec.Description;
                    //CAN_PS 01032019 START
                    SL."Pattern Code" := ItemRec.LEE_Pattern;
                    SL."Custom Item No." := ItemRec."LEE_Custom Item No.";
                    SL."Custom Item Group" := ItemRec."LEE_Custom Item Group"; //CAN_PS 26042019
                    SL.Fit := ItemRec.LEE_Fit;
                    SL.Zip := ItemRec.LEE_Zip;
                    SL."Flat Lock" := ItemRec."LEE_Flat Lock";
                    SL."LEE_Color Code" := 'CUS';
                    SL.VALIDATE("Production Status", 'ART SETUP');  //CAN_PS 25042019

                    //IF CustOpt.GET(CustOpt.Type::Fabric,Fabric[K]) THEN //CAN_PS 01032019 COMMENTED
                    IF (Fabric[K] = 'SH') THEN                              //CAN_PS 01032019 ADDED
                        SL.VALIDATE(Fabric, Fabric[K])
                    ELSE                                                //CAN_PS 01032019 COMMENTED
                        SL.VALIDATE(Fabric, ItemRec.LEE_Fabric);                 //CAN_PS 01032019 COMMENTED

                    //CAN_PS 13032019 START
                    IF Sizes[K] = '' THEN BEGIN
                        ItemSizeRec.RESET;
                        ItemSizeRec.SETRANGE(ItemSizeRec."Item No.", SL."No.");
                        IF NOT ItemSizeRec.FINDFIRST THEN BEGIN
                            IF (ItemSizeRec.COUNT = 1) THEN
                                SL."Size Code" := ItemSizeRec."Size Code";
                        END;
                    END ELSE
                        SL."Size Code" := '1';
                    //CAN_PS 13032019 STOP
                    IF Sizes[K] <> '' THEN
                        SL."Size Code" := Sizes[K]; //CAN_PS 15022019

                    IF CustOpt.GET(CustOpt.Type::"Lycra Color", Lycracode[K]) THEN
                        SL.VALIDATE("Lycra Color", Lycracode[K]);
                    IF CustOpt.GET(CustOpt.Type::Pad, Pad[K]) THEN
                        SL.VALIDATE(Pad, Pad[K]);


                    //CAN_PS 04032019 START
                    ItemVarRec.RESET;
                    ItemVarRec.SETRANGE("Item No.", ItmNo[K]);
                    ItemVarRec.SETRANGE("Color Code", 'CUS');
                    IF Sizes[K] <> '' THEN
                        ItemVarRec.SETRANGE("Size Code", Sizes[K]);
                    IF ItemVarRec.FINDFIRST THEN
                        SL.VALIDATE("Variant Code", ItemVarRec.Code);
                    //CAN_PS 04032019 END
                END;
                //CAN_PS 01032019 END
            END;
            //SL.Description := Desc[K];

            SL.MODIFY(TRUE);
            K += 1;

        END;
        //This Function Updates Promo,Creates Dicount line,Expediting fee line,ExpressShippingfee
        UpdatePromoCode_ExpFee_ExpShip(); //CAN_PS 14052019
    end;

    procedure CreateSalesLine();
    var
        ItemRec: Record Item;
    begin
        K := 4;

        //FOR J := 4 TO (I-10) DO BEGIN
        FOR J := 4 TO I DO BEGIN
            SL.INIT;
            //SL.SetHideValidationDialog(TRUE);
            SL.VALIDATE("Document Type", SL."Document Type"::Order);
            SL.VALIDATE("Document No.", SH."No.");
            LineNo += 10000;
            SL."Line No." := LineNo;
            //SL.VALIDATE("Line No.",LineNo);
            SL.INSERT(TRUE);
            SL.VALIDATE(Type, SL.Type::Item);
            SL.VALIDATE("No.", ItmNo[K]);
            IF ItmNo[K] <> '' THEN BEGIN

                SL.VALIDATE(Quantity, Qty[K]);
                SL.VALIDATE("Unit Price", UnitPrce[K]);
                //    SL.Description := Desc[K];
                IF ItemRec.GET(ItmNo[K]) THEN
                    SL.Description := ItemRec.Description;
            END;
            //SL.Description := Desc[K];

            IF CustOpt.GET(CustOpt.Type::"Lycra Color", Lycracode[K]) THEN
                SL.VALIDATE("Lycra Color", Lycracode[K]);
            IF CustOpt.GET(CustOpt.Type::Fabric, Fabric[K]) THEN
                SL.VALIDATE(Fabric, Fabric[K]);
            IF CustOpt.GET(CustOpt.Type::Pad, Pad[K]) THEN
                SL.VALIDATE(Pad, Pad[K]);

            SL.MODIFY(TRUE);
            K += 1;

        END;
    end;

    procedure ProcessValuesLeemarc(var TempTextImport: Record "SO IMPORT - CAN");
    begin
        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'Order Date:':
                        BEGIN
                            //CLEAR(CustNo);
                            //CustNo := TempTextImport.Value16;
                            //CLEAR(RepCode);
                            //RepCode := TempTextImport.Value11;
                            CLEAR(OrderDate);
                            EVALUATE(OrderDate, TempTextImport.Value3);
                        END;
                END;

                CASE TempTextImport.Value1 OF
                    'Estimated Ship Date**:':
                        BEGIN
                            CLEAR(ShipDate);
                            EVALUATE(ShipDate, TempTextImport.Value3);
                            CLEAR(CustNo);
                            CustNo := TempTextImport.Value17;
                            CLEAR(RepCode);
                            RepCode := TempTextImport.Value12;
                            CLEAR(PONo);
                            PONo := TempTextImport.Value8;
                            CLEAR(DesignerCode);
                            DesignerCode := TempTextImport.Value14;
                        END;
                END;

                CASE TempTextImport.Value1 OF
                    'Req. Ship Date:':
                        BEGIN
                            PhNo := '';
                            Email := '';
                            PhNo := TempTextImport.Value11;
                            Email := TempTextImport.Value15;
                        END;
                END;
            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure FindItemsLeemarc(var TempTextImport: Record "SO IMPORT - CAN");
    begin
        I := 4;
        CLEAR(ItmNo);
        CLEAR(Qty);
        CLEAR(UnitPrce);
        CLEAR(Lycracode);
        CLEAR(Fabric);
        CLEAR(Pad);

        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'Sku':
                        BEGIN

                            IF Value1 = 'Sku' THEN
                                NEXT := I;
                            REPEAT

                                //CAN_PS START 15022019
                                IF TempTextImport.Value9 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value9);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019
                                                EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            Sizes[I] := 'XXS';
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;
                                IF TempTextImport.Value10 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value10);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019
                                                EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            Sizes[I] := 'XS';
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;

                                IF TempTextImport.Value11 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value11);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019

                             EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            Sizes[I] := 'SM';
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;
                                IF TempTextImport.Value12 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value12);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019

                             EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            Sizes[I] := 'MD';
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;

                                IF TempTextImport.Value13 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value13);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019

                             EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            Sizes[I] := 'LG';
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;

                                IF TempTextImport.Value14 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value14);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019

                             EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            Sizes[I] := 'XL';
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;

                                IF TempTextImport.Value15 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value15);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019

                             EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            Sizes[I] := 'XXL';
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;

                                IF TempTextImport.Value16 <> '' THEN
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value16);
                                            //                   IF TempTextImport.Value18 <> '' THEN //CAN_PS Commented code 26022019 for avoiding the $- value
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN //CAN_PS Added Code 26022019

                             EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            Sizes[I] := 'XXXL';
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                        //END;
                                    END;
                                IF (TempTextImport.Value9 = '') AND (TempTextImport.Value10 = '') AND (TempTextImport.Value11 = '') AND
                                (TempTextImport.Value12 = '') AND (TempTextImport.Value13 = '') AND (TempTextImport.Value14 = '') AND
                                (TempTextImport.Value15 = '') AND (TempTextImport.Value16 = '') THEN BEGIN
                                    //CAN_PS END 15022019
                                    IF (TempTextImport.Value1 <> '') THEN BEGIN
                                        IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10)) THEN
                                            Desc[I] := COPYSTR(TempTextImport.Value1, 1, 50)
                                        ELSE //BEGIN
                                            ItmNo[I] := TempTextImport.Value1;
                                        IF ItmNo[I] <> '' THEN BEGIN
                                            EVALUATE(Qty[I], TempTextImport.Value17);
                                            //                IF (TempTextImport.Value18 <> '') THEN //CAN_PS Commented Code 26022019
                                            IF (TempTextImport.Value18 <> '') AND (TempTextImport.Value18 <> ' $-   ') THEN  //CAN_PS Added Code 26022019
                                                EVALUATE(UnitPrce[I], DELCHR(DELCHR(TempTextImport.Value18, '=', '"'), '=', '$'));
                                            EVALUATE(Lycracode[I], COPYSTR(TempTextImport.Value5, 1, 10));
                                            EVALUATE(Fabric[I], TempTextImport.Value7);
                                            EVALUATE(Pad[I], TempTextImport.Value8);
                                        END;

                                        I += 1;
                                    END;
                                END; //CAN_PS 15022019

                            //I += 1;
                            UNTIL NEXT = 0;
                        END;
                END;
                IF (RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 10))) AND ((TempTextImport.Value15 = '0') OR (TempTextImport.Value15 = '')) THEN
                    TempTextImport.DELETE;
            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure CreateCommentSheebeest(var TempTextImport: Record "SO IMPORT - CAN"; var DocNo: Code[20]);
    var
        CmtLineNo: Integer;
        TextImport: Record "SO IMPORT - CAN";
        CmtText: Text[1024];
        TT: Integer;
        Len: Integer;
    begin
        //'PAYMENT INFORMATION'
        I := 1;
        Len := 1;
        CmtText := '';

        CLEAR(CmtText);
        TextImport.RESET;
        IF TextImport.FIND('-') THEN
            REPEAT
                CASE TextImport.Value1 OF
                    '** REORDERS':
                        BEGIN
                            CmtText := TextImport.Value1 + TextImport.Value2 + TextImport.Value3 + TextImport.Value4 + TextImport.Value5;
                            Len := 1;
                            FOR TT := 1 TO 5 DO BEGIN
                                RecSCL2.INIT;
                                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                                RecSCL2."No." := DocNo;
                                RecSCL2."Document Line No." := 0;
                                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                                //RecSCL2."Line No." := RecSCL2."Line No." +10000;
                                RecSCL2.INSERT(TRUE);
                                RecSCL2.Comment := COPYSTR(CmtText, Len, 80);
                                RecSCL2.MODIFY;
                                Len += 80;
                            END;
                        END;
                    'NOTES:':
                        BEGIN
                            CmtText := TextImport.Value1 + TextImport.Value2 + TextImport.Value3 + TextImport.Value4;
                            Len := 1;
                            FOR TT := 1 TO 4 DO BEGIN
                                RecSCL2.INIT;
                                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                                RecSCL2."No." := DocNo;
                                RecSCL2."Document Line No." := 0;
                                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                                //RecSCL2."Line No." := RecSCL2."Line No." +10000;
                                RecSCL2.INSERT(TRUE);
                                RecSCL2.Comment := COPYSTR(CmtText, Len, 80);
                                RecSCL2.MODIFY;
                                Len += 80;
                            END;
                        END;

                END;
            UNTIL TextImport.NEXT = 0;

        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'PAYMENT INFORMATION':
                        BEGIN
                            REPEAT
                                CmtText := TempTextImport.Value1 + ' ' + TempTextImport.Value3;
                                RecSCL2.INIT;
                                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                                RecSCL2."No." := DocNo;
                                RecSCL2."Document Line No." := 0;
                                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                                RecSCL2.INSERT(TRUE);
                                IF NOT (CmtText = 'Agreement') THEN BEGIN
                                    IF STRLEN(CmtText) > 80 THEN
                                        RecSCL2.Comment := COPYSTR(CmtText, Len, 80)
                                    ELSE
                                        RecSCL2.Comment := COPYSTR(CmtText, 1, 80);
                                    RecSCL2.MODIFY;
                                    Len += 80;
                                END ELSE
                                    EXIT;
                            UNTIL NEXT = 0;
                        END;
                END;
            UNTIL TempTextImport.NEXT = 0;


        /*
        IF TempTextImport.Value1 = '** REORDERS' THEN
        BEGIN
                CmtText := TempTextImport.Value1 + TempTextImport.Value2 + TempTextImport.Value3 + TempTextImport.Value4;
                RecSCL2.INIT;
                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                RecSCL2."No." := DocNo;
                RecSCL2."Document Line No." := 0;
                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                RecSCL2.INSERT(TRUE);
                IF CmtText <> '' THEN BEGIN
                RecSCL2.Comment  := COPYSTR(CmtText,Len,80);
                RecSCL2.MODIFY;
                Len += 80;
                END;
        END;
        
        */

    end;

    procedure CmtLastLineNo(var DocNo: Code[10]): Integer;
    begin
        RecSCL.RESET;
        RecSCL.SETFILTER("Document Type", '%1', RecSCL."Document Type"::Order);
        RecSCL.SETRANGE("No.", DocNo);
        IF NOT RecSCL.FINDLAST THEN
            CmtLineNo := RecSCL."Line No." + 10000
        ELSE
            CmtLineNo := RecSCL."Line No." + 10000;

        EXIT(CmtLineNo);
    end;

    procedure ValidateItem(var TempTextImport: Record "SO IMPORT - CAN");
    var
        TempSOImp: Record "SO IMPORT - CAN";
    begin
        I := 4;
        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'Sku':
                        BEGIN

                            IF Value1 = 'Sku' THEN
                                NEXT := I;
                            REPEAT
                                //           IF (TempTextImport.Value1 <> '') THEN BEGIN
                                IF NOT RecItm.GET(COPYSTR(TempTextImport.Value1, 1, 20)) THEN BEGIN
                                    IF TempTextImport.Value1 <> 'NOTES:' THEN
                                        TempTextImport."Item Not Exists" := TRUE;
                                    TempTextImport."Item No" := COPYSTR(TempTextImport.Value1, 1, 20);
                                    TempTextImport.MODIFY;
                                END;
                                //           END;
                                I += 1;
                                IF Value1 = 'NOTES:' THEN
                                    EXIT;

                            UNTIL NEXT = 0;
                        END;
                    'NOTES:':
                        BEGIN
                            REPEAT
                                TempTextImport."Item Not Exists" := FALSE;
                                TempTextImport."Item No" := '';
                                TempTextImport.MODIFY;
                            UNTIL NEXT = 0;
                        END;

                END;

            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure CheckIfItmNotExists();
    var
        RecTempImp: Record "SO IMPORT - CAN";
    begin
        RecTempImp.RESET;
        RecTempImp.SETRANGE("Item Not Exists", TRUE);
        IF RecTempImp.FINDFIRST THEN
            ERROR('Item does not exists! %1', RecTempImp."Item No");
    end;

    procedure DeleteBlankValues();
    var
        TempSOImp: Record "SO IMPORT - CAN";
    begin
        TempSOImp.RESET;
        TempSOImp.SETRANGE(Value1, '');
        IF TempSOImp.FINDSET THEN
            TempSOImp.DELETEALL;
    end;

    procedure DeleteNonexistingItemfunc();
    var
        TempSOImp: Record "SO IMPORT - CAN";
    begin
        TempSOImp.RESET;
        TempSOImp.SETRANGE("Item Not Exists", TRUE);
        IF TempSOImp.FINDSET THEN
            TempSOImp.DELETEALL;
    end;

    procedure DeleteIfQtyZero(var SHDocNo: Code[20]);
    var
        TempSOImp2: Record "SO IMPORT - CAN";
    begin
        SL.RESET;
        SL.SETRANGE("Document No.", SHDocNo);
        SL.SETFILTER(SL.Type, '%1', SL.Type::Item);
        SL.SETRANGE(SL.Quantity, 0);
        IF SL.FIND('-') THEN
            REPEAT
                //IF RecItm.GET(SL."No.") THEN
                SL.DELETE;

            UNTIL SL.NEXT = 0;
    end;

    procedure UpdatePromoCode(var SoImp: Record "SO IMPORT - CAN"): Text[30];
    begin
        IF SoImp.FINDSET THEN
            REPEAT
                CASE SoImp.Value15 OF
                    'Promo Code:':
                        BEGIN
                            //InvDiscValueTxt := SoImp.Value19; //CAN_PS 05022019

                            EXIT(SoImp.Value16);
                        END;
                END;

            UNTIL SoImp.NEXT = 0;
    end;

    procedure DeleteEmptyComments(DocNo: Code[20]);
    begin
        RecSCL2.RESET;
        RecSCL2.SETRANGE(RecSCL2."Document Type", RecSCL2."Document Type"::Order);
        RecSCL2.SETRANGE("No.", DocNo);
        RecSCL2.SETRANGE("Document Line No.", 0);
        RecSCL2.SETRANGE(Comment, '');
        IF RecSCL2.FIND('-') THEN
            RecSCL2.DELETEALL;
    end;

    procedure ProcessValuesAcademy(var TempTextImport: Record "SO IMPORT - CAN");
    begin
        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'HD':
                        BEGIN
                            AcaExtDocNo := '';
                            ShipAgent := '';
                            AgentService := '';
                            EVALUATE(AcaExtDocNo, TempTextImport.Value2);
                            CLEAR(OrderDate);
                            //EVALUATE(OrderDate,TempTextImport.Value6);
                            OrderDate := GetDateValue(TempTextImport.Value6);
                            CLEAR(ShipDate);
                            //EVALUATE(ShipDate,TempTextImport.Value7);
                            ShipDate := GetDateValue(TempTextImport.Value7);
                            EVALUATE(ShipAgent, TempTextImport.Value9);
                            EVALUATE(AgentService, TempTextImport.Value10);
                        END;
                END;

            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure FindItemsAcademy(var TempTextImport: Record "SO IMPORT - CAN");
    begin
        I := 1;
        CLEAR(ItmNo);
        CLEAR(Qty);
        CLEAR(UnitPrce);
        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'PD':
                        BEGIN
                            REPEAT
                                IF (TempTextImport.Value7 <> '') THEN BEGIN
                                    IF NOT RecItm.GET(COPYSTR(TempTextImport.Value7, 1, 10)) THEN
                                        Desc[I] := COPYSTR(TempTextImport.Value7, 1, 50)
                                    ELSE
                                        ItmNo[I] := TempTextImport.Value7;
                                    IF ItmNo[I] <> '' THEN BEGIN
                                        EVALUATE(Qty[I], TempTextImport.Value3);
                                        EVALUATE(UnitPrce[I], (TempTextImport.Value5));
                                        I += 1;
                                    END;
                                END;
                            //I += 1;
                            UNTIL NEXT = 0;
                        END;
                END;

            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure CreateSalesLineforAcademy();
    var
        ItemRec: Record Item;
    begin
        K := 1;
        FOR J := 1 TO I DO BEGIN
            SL.INIT;
            //SL.SetHideValidationDialog(TRUE);
            SL.VALIDATE("Document Type", SL."Document Type"::Order);
            SL.VALIDATE("Document No.", SH."No.");
            LineNo += 10000;
            SL."Line No." := LineNo;
            SL.INSERT(TRUE);
            SL.VALIDATE(Type, SL.Type::Item);
            SL.VALIDATE("No.", ItmNo[K]);
            IF ItmNo[K] <> '' THEN BEGIN

                SL.VALIDATE(Quantity, Qty[K]);
                SL.VALIDATE("Unit Price", UnitPrce[K]);
                //    SL.Description := Desc[K];
                IF ItemRec.GET(ItmNo[K]) THEN
                    SL.Description := ItemRec.Description;
            END;
            //SL.Description := Desc[K];
            SL.MODIFY(TRUE);
            K += 1;

        END;
    end;

    procedure GetDateValue(var InputDate: Text[30]): Date;
    var
        DD: Integer;
        MM: Integer;
        YY: Integer;
        OutputDate: Date;
    begin
        EVALUATE(YY, COPYSTR(InputDate, 1, 4));
        EVALUATE(MM, COPYSTR(InputDate, 5, 2));
        EVALUATE(DD, COPYSTR(InputDate, 7, 2));
        OutputDate := DMY2DATE(DD, MM, YY);
        EXIT(OutputDate);
    end;

    procedure ImportDSG();
    begin
        Xmlport.Run(50006, TRUE);
        CurrPage.UPDATE;
        COMMIT;
    end;

    procedure CreateCommentCanari(var TempTextImport: Record "SO IMPORT - CAN"; var DocNo: Code[20]);
    var
        CmtLineNo: Integer;
        TextImport: Record "SO IMPORT - CAN";
        CmtText: Text[1024];
        TT: Integer;
        Len: Integer;
    begin
        //'PAYMENT INFORMATION'
        I := 1;
        Len := 1;
        CmtText := '';

        CLEAR(CmtText);
        TextImport.RESET;
        IF TextImport.FIND('-') THEN
            REPEAT
                CASE TextImport.Value1 OF
                    '** REORDERS':
                        BEGIN
                            CmtText := TextImport.Value1 + TextImport.Value2 + TextImport.Value3 + TextImport.Value4 + TextImport.Value5;
                            Len := 1;
                            FOR TT := 1 TO 5 DO BEGIN
                                RecSCL2.INIT;
                                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                                RecSCL2."No." := DocNo;
                                RecSCL2."Document Line No." := 0;
                                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                                //RecSCL2."Line No." := RecSCL2."Line No." +10000;
                                RecSCL2.INSERT(TRUE);
                                RecSCL2.Comment := COPYSTR(CmtText, Len, 80);
                                RecSCL2.MODIFY;
                                Len += 80;
                            END;
                        END;
                    'NOTES:':
                        BEGIN
                            CmtText := TextImport.Value1 + TextImport.Value2 + TextImport.Value3 + TextImport.Value4;
                            Len := 1;
                            FOR TT := 1 TO 4 DO BEGIN
                                RecSCL2.INIT;
                                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                                RecSCL2."No." := DocNo;
                                RecSCL2."Document Line No." := 0;
                                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                                //RecSCL2."Line No." := RecSCL2."Line No." +10000;
                                RecSCL2.INSERT(TRUE);
                                RecSCL2.Comment := COPYSTR(CmtText, Len, 80);
                                RecSCL2.MODIFY;
                                Len += 80;
                            END;
                        END;

                END;
            UNTIL TextImport.NEXT = 0;

        IF TempTextImport.FIND('-') THEN
            REPEAT
                CASE TempTextImport.Value1 OF
                    'PAYMENT INFORMATION':
                        BEGIN
                            REPEAT
                                //CAN_PS Added 04302019 START
                                IF TempTextImport.Value1 = 'Card Number' THEN
                                    TempTextImport.NEXT(4);
                                //CAN_PS Added 04302019 STOP

                                CmtText := TempTextImport.Value1 + ' ' + TempTextImport.Value3;
                                RecSCL2.INIT;
                                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                                RecSCL2."No." := DocNo;
                                RecSCL2."Document Line No." := 0;
                                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                                RecSCL2.INSERT(TRUE);
                                IF NOT (CmtText = 'Agreement') THEN BEGIN
                                    IF STRLEN(CmtText) > 80 THEN
                                        RecSCL2.Comment := COPYSTR(CmtText, Len, 80)
                                    ELSE
                                        RecSCL2.Comment := COPYSTR(CmtText, 1, 80);
                                    RecSCL2.MODIFY;
                                    Len += 80;
                                END ELSE
                                    EXIT;
                            UNTIL NEXT = 0;
                        END;
                END;
            UNTIL TempTextImport.NEXT = 0;


        /*
        IF TempTextImport.Value1 = '** REORDERS' THEN
        BEGIN
                CmtText := TempTextImport.Value1 + TempTextImport.Value2 + TempTextImport.Value3 + TempTextImport.Value4;
                RecSCL2.INIT;
                RecSCL2."Document Type" := RecSCL2."Document Type"::Order;
                RecSCL2."No." := DocNo;
                RecSCL2."Document Line No." := 0;
                RecSCL2."Line No." := CmtLastLineNo(DocNo);
                RecSCL2.INSERT(TRUE);
                IF CmtText <> '' THEN BEGIN
                RecSCL2.Comment  := COPYSTR(CmtText,Len,80);
                RecSCL2.MODIFY;
                Len += 80;
                END;
        END;
        
        */

    end;

    procedure ImportShopify();
    begin
        Xmlport.Run(50004, TRUE);
        CurrPage.UPDATE;
        COMMIT;
    end;

    procedure ValidateItemsShopify(var TempTextImport: Record "SO IMPORT - CAN");
    var
        RecItm: Record Item;
        ItemCrossReference: Record "Item Cross Reference";
    begin
        TempTextImport.RESET;
        TempTextImport.SETCURRENTKEY("Entry No.");
        TempTextImport.SETFILTER("Entry No.", '%1..', 1);
        IF TempTextImport.FIND('-') THEN
            REPEAT
                //  IF NOT RecItm.GET(COPYSTR(TempTextImport.Value21,1,20)) THEN BEGIN                      //CAN_PS 05152019 COMMENTED
                ItemCrossReference.RESET;                                                                   //CAN_PS 05152019 ADDED
                ItemCrossReference.SETRANGE("Cross-Reference No.", COPYSTR(TempTextImport.Value21, 1, 20));    //CAN_PS 05152019 ADDED
                IF NOT ItemCrossReference.FINDFIRST THEN BEGIN                                              //CAN_PS 05152019 ADDED
                    TempTextImport."Item Not Exists" := TRUE;
                    TempTextImport."Item No" := COPYSTR(TempTextImport.Value21, 1, 20);
                    TempTextImport.MODIFY;
                END;
            UNTIL TempTextImport.NEXT = 0;
    end;

    procedure UpdatePromoCode_ExpFee_ExpShip(): Text[30];
    var
        ExpeditingFeesTxt: Text[50];
        ExpressShippingTxt: Text[50];
        InvDiscountTxt: Text[50];
        InvDiscount: Decimal;
        ExpeditingFees: Decimal;
        ExpressShipping: Decimal;
        SoImp: Record "SO IMPORT - CAN";
    begin
        IF SoImp.FINDSET THEN
            REPEAT
                CASE SoImp.Value15 OF
                    'Promo Code:':
                        BEGIN
                            PromoCode := SoImp.Value16;
                            SH."Your Reference" := PromoCode;
                            SH.MODIFY;
                            InvDiscountTxt := DELCHR(SoImp.Value19, '=', '-$');  //CAN_PS 05022019
                            InvDiscountTxt := DELCHR(InvDiscountTxt, '=', '"');     //CAN_PS 05202019
                            IF InvDiscountTxt <> '' THEN
                                EVALUATE(InvDiscount, InvDiscountTxt);
                            IF InvDiscount <> 0 THEN BEGIN
                                SL.INIT;
                                SL.VALIDATE("Document Type", SL."Document Type"::Order);
                                SL.VALIDATE("Document No.", SH."No.");
                                LineNo += 10000;
                                SL."Line No." := LineNo;
                                SL.INSERT(TRUE);
                                SL.VALIDATE(Type, SL.Type::Item);
                                SL.VALIDATE("No.", 'CSPR');
                                SL.VALIDATE("Location Code", 'CORAL');
                                SL.VALIDATE(Quantity, 1);
                                SL.VALIDATE("Unit Price", (InvDiscount * -1));
                                SL.VALIDATE("Tax Group Code", 'TAXABLE');
                                SL.VALIDATE("Variant Code", 'CUS-008');
                                SL.MODIFY(TRUE);
                            END;
                        END;
                    'Expediting Fees':
                        BEGIN
                            ExpeditingFeesTxt := DELCHR(SoImp.Value19, '=', '$');  //CAN_PS 05022019
                            ExpeditingFeesTxt := DELCHR(ExpeditingFeesTxt, '=', '"');    //CAN_PS 05202019
                            IF ExpeditingFeesTxt <> '' THEN
                                EVALUATE(ExpeditingFees, ExpeditingFeesTxt);
                            IF ExpeditingFees <> 0 THEN BEGIN
                                SL.INIT;
                                SL.VALIDATE("Document Type", SL."Document Type"::Order);
                                SL.VALIDATE("Document No.", SH."No.");
                                LineNo += 10000;
                                SL."Line No." := LineNo;
                                SL.INSERT(TRUE);
                                SL.VALIDATE(Type, SL.Type::Item);
                                SL.VALIDATE("No.", '9RUSHFEE');
                                SL.VALIDATE("Location Code", 'CORAL');
                                SL.VALIDATE(Quantity, 1);
                                SL.VALIDATE("Unit Price", ExpeditingFees);
                                SL.VALIDATE("Tax Group Code", 'TAXABLE');
                                SL.VALIDATE("Variant Code", 'CUS-008');
                                SL.MODIFY(TRUE);
                            END;
                        END;
                    'Express Shipping':
                        BEGIN
                            ExpressShippingTxt := DELCHR(SoImp.Value19, '=', '$');  //CAN_PS 05022019
                            ExpressShippingTxt := DELCHR(ExpressShippingTxt, '=', '"');  //CAN_PS 05202019
                            IF ExpressShippingTxt <> '' THEN
                                EVALUATE(ExpressShipping, ExpressShippingTxt);
                            IF ExpressShipping <> 0 THEN BEGIN
                                SL.INIT;
                                SL.VALIDATE("Document Type", SL."Document Type"::Order);
                                SL.VALIDATE("Document No.", SH."No.");
                                LineNo += 10000;
                                SL."Line No." := LineNo;
                                SL.INSERT(TRUE);
                                SL.VALIDATE(Type, SL.Type::Resource);
                                SL.VALIDATE("No.", 'UPS');
                                SL.VALIDATE("Location Code", 'CORAL');
                                SL.VALIDATE(Quantity, 1);
                                SL.VALIDATE("Unit Price", ExpressShipping);
                                SL.VALIDATE("Tax Group Code", 'TAXABLE');
                                SL.MODIFY(TRUE);
                            END;
                        END;
                    'Shipping and Handling':
                        BEGIN
                            ExpressShippingTxt := DELCHR(SoImp.Value19, '=', '$');  //CAN_PS 05022019
                            ExpressShippingTxt := DELCHR(ExpressShippingTxt, '=', '"');  //CAN_PS 05202019
                            IF ExpressShippingTxt <> '' THEN
                                EVALUATE(ExpressShipping, ExpressShippingTxt);
                            IF ExpressShipping <> 0 THEN BEGIN
                                SL.INIT;
                                SL.VALIDATE("Document Type", SL."Document Type"::Order);
                                SL.VALIDATE("Document No.", SH."No.");
                                LineNo += 10000;
                                SL."Line No." := LineNo;
                                SL.INSERT(TRUE);
                                SL.VALIDATE(Type, SL.Type::Resource);
                                SL.VALIDATE("No.", 'UPS');
                                SL.VALIDATE("Location Code", 'CORAL');
                                SL.VALIDATE(Quantity, 1);
                                SL.VALIDATE("Unit Price", ExpressShipping);
                                SL.VALIDATE("Tax Group Code", 'TAXABLE');
                                SL.MODIFY(TRUE);
                            END;
                        END;

                END;
            UNTIL SoImp.NEXT = 0;
    end;

    procedure CalculateStartShipDate(ShipmentDate: Date): Date;
    var
        RecDate: Record Date;
        I: Integer;
    begin
        I := 0;
        RecDate.RESET;
        RecDate.SETRANGE("Period Type", RecDate."Period Type"::Date);
        RecDate.SETFILTER("Period Start", '..%1', ShipmentDate);
        RecDate.SETFILTER("Period No.", '1..5');
        IF RecDate.FINDLAST THEN
            REPEAT
                IF I = 5 THEN
                    EXIT(RecDate."Period Start")
                ELSE
                    I += 1;
            UNTIL RecDate.NEXT(-1) = 0;
    end;

    procedure CalculateCancelDate(ShipmentDate: Date): Date;
    var
        RecDate: Record Date;
        I: Integer;
    begin
        I := 0;
        RecDate.RESET;
        RecDate.SETRANGE("Period Type", RecDate."Period Type"::Date);
        RecDate.SETFILTER("Period Start", '..%1', ShipmentDate);
        RecDate.SETFILTER("Period No.", '1..5');
        IF RecDate.FINDLAST THEN
            REPEAT
                IF I = 3 THEN
                    EXIT(RecDate."Period Start")
                ELSE
                    I += 1;
            UNTIL RecDate.NEXT(-1) = 0;
    end;

    // procedure SetAssignUCC14();
    // begin
    //     AssignUCC14 := TRUE;
    // end;
}

