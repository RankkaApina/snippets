'Modified from http://skp.mvps.org/2007/ppt003.htm
'Iterates over custom layouts and prints out placeholder names and types

Sub CheckFooterPlaceholders()
    Set myppt = Application.ActivePresentation
    Set titleslide = myppt.Slides(1)
    Set alpha = myppt.SlideMaster

    Dim oDesign As Design
    Dim oCL As CustomLayout
    Dim lngLayoutCount As Long
    Dim I As Integer
    Dim s As Integer
    
    Debug.Print " "
    Debug.Print "***************************************************"
    
    For Each oDesign In ActivePresentation.Designs
        lngLayoutCount = oDesign.SlideMaster.CustomLayouts.Count
        
        'Enumerate all the available layouts
        For I = 1 To lngLayoutCount
            Set oCL = oDesign.SlideMaster.CustomLayouts(I)
            Debug.Print "Layout: " & oCL.Name
            If oCL.Shapes.Placeholders.Count > 1 Then
                For s = 1 To oCL.Shapes.Placeholders.Count
                    Debug.Print "    Placeholder: " & oCL.Shapes.Placeholders(s).Name
                    Debug.Print "    Type: " & oCL.Shapes.Placeholders(s).PlaceholderFormat.Type
                    'For specific placeholders:
                    'Date placeholder
                    'If oCL.Shapes.Placeholders(s).PlaceholderFormat.Type = 16 Then
                    '    Debug.Print "    Placeholder: " & oCL.Shapes.Placeholders(s).Name
                    '    Debug.Print "    Type: " & oCL.Shapes.Placeholders(s).PlaceholderFormat.Type
                    '    Debug.Print "    Text: " & oCL.Shapes.Placeholders(s).TextFrame.TextRange.Text
                    'End If
                    'Footer placeholder
                    'If oCL.Shapes.Placeholders(s).PlaceholderFormat.Type = 15 Then
                    '    Debug.Print "    Placeholder: " & oCL.Shapes.Placeholders(s).Name
                    '    Debug.Print "    Type: " & oCL.Shapes.Placeholders(s).PlaceholderFormat.Type
                    '    Debug.Print "    Text: " & oCL.Shapes.Placeholders(s).TextFrame.TextRange.Text
                    'End If
                Next
            End If
        Next
    Next
    
    Debug.Print "***************************************************"

End Sub

