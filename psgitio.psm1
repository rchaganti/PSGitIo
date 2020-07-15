# Load all public functions
$public  = @( Get-ChildItem -Path $PSScriptRoot\Public\ -Filter *.ps1 -Recurse -ErrorAction Stop)

foreach($import in @($public))
{
    try
    {
        . $import.fullname
    }
    catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Export only the public members
Export-ModuleMember -Function $public.BaseName -ErrorAction Stop