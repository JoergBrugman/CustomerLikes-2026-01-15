pageextension 50201 "BSCL Customer Card" extends "Customer Card"
{
    actions
    {
        addlast(navigation)
        {
            action("BSCL FovoriteBookCard")
            {
                Caption = 'Book Card';
                ApplicationArea = All;
                Image = Card;
                Enabled = Rec."BSB Favorite Book No." <> '';
                ToolTip = 'Executes the Book Card action.';

                trigger OnAction()
                begin
                    Rec.ShowFavoriteBook();
                end;
            }
        }
        addlast(Category_Process)
        {
            actionref(BSCLFovoriteBookCard_Promoted; "BSCL FovoriteBookCard") { }
        }
    }
}