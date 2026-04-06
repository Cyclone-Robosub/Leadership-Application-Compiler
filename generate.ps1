# Import the CSV (ensure headers match: first, last, preferred, discord, pronouns, year, major, roles, essay1, essay2, essay3, closing)
$data = Import-Csv -Path "data.csv"

# Check if the export directory exists; if not, create it
$exportPath = ".\export"
if (-not (Test-Path -Path $exportPath)) {
    New-Item -ItemType Directory -Path $exportPath
    Write-Host "Created missing export directory." -ForegroundColor Cyan
}

foreach ($row in $data) {
    # Sanitize the name for the FILENAME (Last, First)
    $safeName = "$($row.last), $($row.first)" -replace '[:;\\/|?*<>]', '-'
    
    Write-Host "Generating Application PDF for: $($row.first) $($row.last)" -ForegroundColor Yellow
    
    # Use triple-quotes for all inputs to handle special characters or commas within the CSV fields
    typst compile `
        --input first="""$($row.first)""" `
        --input last="""$($row.last)""" `
        --input preferred="""$($row.preferred)""" `
        --input discord="""$($row.discord)""" `
        --input pronouns="""$($row.pronouns)""" `
        --input year="""$($row.year)""" `
        --input major="""$($row.major)""" `
        --input roles="""$($row.roles)""" `
        --input essay-1="""$($row.essay1)""" `
        --input essay-2="""$($row.essay2)""" `
        --input essay-3="""$($row.essay3)""" `
        --input closing="""$($row.closing)""" `
        main.typ `
        "$exportPath\$safeName - Leadership Application.pdf"
}

Write-Host "Batch processing complete!" -ForegroundColor Green