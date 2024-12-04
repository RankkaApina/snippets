'This script takes the information that has been filled to a title slide (the textboxes were named with NameShapes)
'Help from:
'- http://skp.mvps.org/designs.htm
'- http://skp.mvps.org/2007/ppt003.htm

Sub UpdateFooters()
    Set myppt = Application.ActivePresentation
    Set titleslide = myppt.Slides(1)
    Set alpha = myppt.SlideMaster

    Dim txtauthor As String
    Dim txtdate As String
    Dim txtstudy As String
    Dim txtmeet As String
    Dim foottxt As String
    
    Dim adesign As Design
    Dim acl As CustomLayout
    Dim clcount As Long
    Dim i As Integer
    Dim s As Integer
    
    'Read information that has been filled out to the title slide
    With titleslide
        txtauthor = .Shapes("authorTXT").TextFrame.TextRange.Text
        .Shapes("dateTXT").TextFrame.TextRange.Text = Format(.Shapes("dateTXT").TextFrame.TextRange.Text, "mmmm d, yyyy") 
        txtdate = .Shapes("dateTXT").TextFrame.TextRange.Text
        txtstudy = .Shapes("studyTXT").TextFrame.TextRange.Text
        txtmeet = .Shapes("meetingTXT").TextFrame.TextRange.Text
    End With
    
    'Define footer text
    foottxt = txtstudy + " - " + txtmeet
    
    'Update the master slide footer
    With alpha.HeadersFooters
        .Footer.Text = foottxt
        .DateAndTime.Text = txtdate
    End With
    
    'Update the custom layout footers
    For Each adesign In myppt.Designs
        clcount = adesign.SlideMaster.CustomLayouts.Count
        
        'Enumerate all the available layouts
        For i = 1 To clcount
            Set acl = adesign.SlideMaster.CustomLayouts(i)
            'Check if layout has placeholders
            If acl.Shapes.Placeholders.Count > 1 Then
                'Iterate over the placeholders
                For s = 1 To acl.Shapes.Placeholders.Count
                    'If type is date, input date -> note: the date needs to be fixed format for this to work
                    If acl.Shapes.Placeholders(s).PlaceholderFormat.Type = 16 Then
                        acl.Shapes.Placeholders(s).TextFrame.TextRange.Text = txtdate
                    End If
                    'If type is footer, input footer text
                    If acl.Shapes.Placeholders(s).PlaceholderFormat.Type = 15 Then
                        acl.Shapes.Placeholders(s).TextFrame.TextRange.Text = foottxt
                    End If
                Next
            End If
        Next
    Next

End Sub