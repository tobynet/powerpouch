# ref. http://technet.microsoft.com/ja-jp/magazine/hh413265.aspx
Param (
    [Parameter(ValueFromPipeline=$true,Mandatory=$true)]
    [String[]] $filenames
)

begin {
    # Create an invisilbe Excel object
    $excel = New-Object -ComObject Excel.Application -Property @{visible=$false}
    # Force overwrite files!!!!!
    $excel.AlertBeforeOverwriting = $true
}

process {
    foreach($filename in $filenames) {
        $filename = [IO.Path]::GetFullPath($filename)
        
        $workbook = $excel.Workbooks.Open($filename)
        $newFilename = [Io.Path]::ChangeExtension($filename, '.pdf')
        echo ("Converting {0} to {1}" -f $filename, $newFilename)

        # Convert to PDF!!
        $workbook.ExportAsFixedFormat(
            [Microsoft.Office.Interop.Excel.XlFixedFormatType]::xlTypePDF ,
            $newFilename, 
            [Microsoft.Office.Interop.Excel.XlFixedFormatQuality]::xlQualityStandard
        )
        
        $workbook.Close()
        echo ("Converted! {0} to {1}" -f $filename, $newFilename)

    }
}

end {
    $excel.Quit()
    echo "DONE"
}
