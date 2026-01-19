pageextension 50200 "BSCL Book Factbox" extends "BSB Book Factbox"
{
    layout
    {
        addlast(Content)
        {
            field("BSCL No. of Customer Likes"; Rec."BSCL No. of Customer Likes") { ApplicationArea = All; }
        }
    }
}