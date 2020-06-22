xmlport 50006 "SO IMPORT - CAN  DSG"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;
                XmlName = 'Integer';
                SourceTableView = SORTING(Number);
                textelement("values[1]")
                {
                    XmlName = 'Value1';
                }
                textelement("values[2]")
                {
                    XmlName = 'Value2';
                }
                textelement("values[3]")
                {
                    XmlName = 'Value3';
                }
                textelement("values[4]")
                {
                    XmlName = 'Value4';
                }
                textelement("values[5]")
                {
                    XmlName = 'Value5';
                }
                textelement("values[6]")
                {
                    XmlName = 'Value6';
                }
                textelement("values[7]")
                {
                    XmlName = 'Value7';
                }
                textelement("values[8]")
                {
                    XmlName = 'Value8';
                }
                textelement("values[9]")
                {
                    XmlName = 'Value9';
                }
                textelement("values[10]")
                {
                    XmlName = 'Value10';
                }
                textelement("values[11]")
                {
                    XmlName = 'Value11';
                }
                textelement("values[12]")
                {
                    XmlName = 'Value12';
                }
                textelement("values[13]")
                {
                    XmlName = 'Value13';
                }
                textelement("values[14]")
                {
                    XmlName = 'Value14';
                }
                textelement("values[15]")
                {
                    XmlName = 'Value15';
                }
                textelement("values[16]")
                {
                    XmlName = 'Value16';
                }
                textelement("values[17]")
                {
                    XmlName = 'Value17';
                }
                textelement("values[18]")
                {
                    XmlName = 'Value18';
                }
                textelement("values[19]")
                {
                    XmlName = 'Value19';
                }
                textelement("values[20]")
                {
                    XmlName = 'Value20';
                }
                textelement("values[21]")
                {
                    XmlName = 'Value21';
                }
                textelement("values[22]")
                {
                    XmlName = 'Value22';
                }

                trigger OnPreXmlItem()
                begin
                    OrderImprt.DELETEALL;
                end;

                trigger OnAfterInsertRecord()
                begin

                    WITH OrderImprt DO BEGIN
                        INIT;
                        "Entry No." := LastNo;

                        NewString := "values[1]";
                        NewString := DELCHR(NewString, '=', '"');

                        Value1 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value2 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value3 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value4 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value5 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value6 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value7 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value8 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value9 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value10 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value11 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value12 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value13 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value14 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value15 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value16 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value17 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value18 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value19 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value20 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value21 := COPYSTR(NewString, 1, (STRPOS(NewString, ',') - 1));
                        NewString := DELSTR(NewString, 1, STRPOS(NewString, ','));

                        Value21 := COPYSTR(NewString, 1, (STRLEN(NewString)));
                        //NewString := DELSTR(NewString,1,STRPOS(NewString,','));

                        INSERT;

                    END;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        OrderImprt: Record "SO IMPORT - CAN";
        "Fields": array[40] of Text[1024];
        LineNo: Integer;
        Values: array[100] of Text[1024];
        ReorderText: Text[1024];
        Text001: Label '"Re-orders of the same "';
        NewString: Text;

    procedure LastNo(): Integer;
    begin
        if OrderImprt.FINDLAST then
            LineNo := OrderImprt."Entry No." + 1;
        exit(LineNo);
    end;
}

