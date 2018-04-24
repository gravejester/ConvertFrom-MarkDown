# ConvertFrom-MarkDown

PowerShell function to convert MarkDown to HTML. This function is a wrapper for **markdig** (https://github.com/lunet-io/markdig).

In the spirit of writing small specific functions that does one job, this function will not generate full HTML documents, but raw HTML of the MarkDown input. This means that you will have to combine the output with additional HTML if you want to use it in a web page.

## Examples

    Get-Help ConvertFrom-MarkDown -Examples

## Installation

If you have PowerShellGet, you can install it with:

    Install-Module ConvertFrom-MarkDown -Scope CurrentUser

Else, you would have to download the zip from this repository and manually unpack it to one of the module paths on your system.
