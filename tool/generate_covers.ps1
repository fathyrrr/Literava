Add-Type -AssemblyName System.Drawing

function Create-Cover($outPath, $title, $author, $bgColor, $accentColor) {
    [float]$width = 400.0
    [float]$height = 600.0
    $bmp = New-Object System.Drawing.Bitmap([int]$width, [int]$height)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias
    
    # Background
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml($bgColor))
    $g.FillRectangle($brush, 0, 0, [int]$width, [int]$height)
    
    # Decorative border
    $pen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml($accentColor), 3)
    $g.DrawRectangle($pen, 18, 18, [int]($width - 36), [int]($height - 36))
    $pen2 = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml($accentColor), 1)
    $g.DrawRectangle($pen2, 24, 24, [int]($width - 48), [int]($height - 48))
    
    # Title & Author
    $fontTitle = New-Object System.Drawing.Font('Georgia', 20, [System.Drawing.FontStyle]::Bold)
    $fontAuthor = New-Object System.Drawing.Font('Georgia', 13, [System.Drawing.FontStyle]::Italic)
    $textBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml($accentColor))
    
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center
    
    $rectTitle = New-Object System.Drawing.RectangleF(30.0, 160.0, [float]($width - 60.0), 160.0)
    $g.DrawString($title, $fontTitle, $textBrush, $rectTitle, $format)
    
    $rectAuthor = New-Object System.Drawing.RectangleF(30.0, 420.0, [float]($width - 60.0), 60.0)
    $g.DrawString($author, $fontAuthor, $textBrush, $rectAuthor, $format)
    
    $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}

Create-Cover 'D:\Project Pemrograman Mobile\literava\assets\covers\menalar_tuhan.png' 'MENALAR TUHAN' 'Franz Magnis-Suseno' '#2C1D11' '#E8C382'
Create-Cover 'D:\Project Pemrograman Mobile\literava\assets\covers\filsafat_moral.png' "FILSAFAT MORAL`nPergumulan Etis" 'Franz Magnis-Suseno' '#1B262C' '#E5BA73'
Write-Host 'Covers generated successfully!'
