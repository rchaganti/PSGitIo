<#
    .Synopsis
        Create a git.io shorturl from a long GitHub Url.
    .DESCRIPTION
        This command creates a new git.io shorturl from a long GitHub.com url
    .EXAMPLE
        New-GitIoShortUrl -Url 'https://GitHub.com/rchaganti'

        This creates a git.io short url with a random shortcode
    .EXAMPLE
        New-GitIoShortUrl -Url 'https://GitHub.com/rchaganti' -Code psdev

        This creates a git.io short url with the shortcode set to psdev if it is available

#>
function New-GitIoShortURL
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Url,

        [Parameter()]
        [string]
        $Code
    )

    $gitIoFormInput = @{
        url = $Url
        code = $Code
    }

    if ($Code)
    {
        if ((Get-GitIoShortUrl -ShortUrl "https://git.io/${Code}" -ErrorAction SilentlyContinue))
        {
            throw "${Code} is already taken! Try another code."
        }        
    }

    try
    {
        $response = Invoke-WebRequest -Uri 'https://git.io/' `
                        -Method Post `
                        -Body $gitIoFormInput `
                        -ContentType "application/x-www-form-urlencoded" `
                        -ErrorAction Stop
        if ($response.StatusCode -eq 201 -or $response.StatusCode -eq 200)
        {
            return $response.Headers.Location
        }
    }
    catch
    {
        Write-Error $_
    }
}
