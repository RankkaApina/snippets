'This code goes over the title slide and names the textboxes according to boxNames array in the found order
'If slide looks different, the order needs to be changed!
'Help from: 
'- https://stackoverflow.com/a/223880
'- https://stackoverflow.com/a/4229174
'- https://stackoverflow.com/a/24970231

Sub NameShapes()
    Set titleslide = Application.ActivePresentation.Slides(1)

    Dim s As Integer
    Dim boxNames(1 To 4) As String

    boxNames(1) = "meetingTXT": boxNames(2) = "studyTXT": boxNames(3) = "authorTXT": boxNames(4) = "dateTXT"

    With titleslide
        For s = 1 To .Shapes.Count
            NewName = boxNames(s)
            .Shapes(s).Name = NewName
        Next 
    End With 
    
    'Shows the selection pane: CHECK THAT THE NAMES ARE CORRECT!!!
    If Not CommandBars.GetPressedMso("SelectionPane") Then CommandBars.ExecuteMso ("SelectionPane")

End Sub