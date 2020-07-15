# PSGitIo
[Git.io](https://git.io) -- service by GitHub -- can be used generate the short URLs for any GitHub.com based URL. You can navigate to Git.io and paste a GitHub URL into the input box and generate a short URL. Note that this works only with GitHub.com URLs. 

I have been using [gists](http://gist.github.com/) a lot lately and the URL to gists is usually very long and includes guids. For these gist URLs, I have been using the git.io service and wrapped that in a quick PowerShell module to help me generate these URLs. Today, I published it on [GitHub](https://github.com/rchaganti/psgitio) and [PowerShell Gallery](https://www.powershellgallery.com/packages/psgitio/1.0.0.0) for you to use it as well.

## Usage

It is straightforward to use this module. There are only two commands.

### Get-GitIoShortUrl

This command is used to get the expanded URL from the short URL.

`Get-GitIoShortUrl -ShortUrl 'https://git.io/psdev'`

### New-GitIoShortUrl

This command can create a new short URL for any GitHub URL. 

`New-GitIoShortUrl -Url 'https://github.com/rchaganti/DSCResources' -Code 'psdsc'`

In the above example, `-Code` specifies an optional shortcode to be used for create the short URL. So, if the shortcode is not already taken the generated short URL will be https://git.io/psdsc.

In the absence of `-Code` parameter, a random shortcode gets generated. 

If you generated a short URL for a given GitHub URL without `-Code`, trying this command again with the same URL and with `-Code` will not have any impact. Once a short URL gets generated, the git.io service will always return the same short URL.