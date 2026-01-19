tableextension 50200 "BSCL Book" extends "BSB Book"
{
    fields
    {
        field(50200; "BSCL No. of Customer Likes"; Integer)
        {
            Caption = 'No. of Customer Likes';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count(Customer where("BSB Favorite Book No." = field("No.")));
            ToolTip = 'Specifies the value of the No. of Customer Likes field.', Comment = '%';
        }
        //[x] No. of Customer Likes wird nicht zeitgerecht aktualisiert
    }
}