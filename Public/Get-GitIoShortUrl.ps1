<#
    .Synopsis
        Get the real URL from a git.io short url
    .DESCRIPTION
        This command takes a git.io short URL as input and retrieves a long URL
    .EXAMPLE
        Get-GitIoShortUrl https://git.io/psdev
#>
function Get-GitIoShortUrl
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $ShortUrl
    )

    try
    {
        $response = Invoke-WebRequest -Uri $ShortUrl  -MaximumRedirection 0 -ErrorAction Ignore
        if ($response.StatusCode -eq 302)
        {
            return $response.Headers.Location
        }
    }
    catch
    {
        Write-Error $_
    }
}
