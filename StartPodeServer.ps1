<#
.Synopsis
    Use this cmdLet to fetch public gists.

.Description
    This cmdLet connects to Git through API and gets all gists which are public.
	
.Example
    Start-PodeServer

#>

Start-PodeServer {

    Add-PodeEndpoint -Address * -Port 8080 -Protocol Http

    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {             
        Write-PodeTextResponse -Value 'Response from Sivaram Test1.'
    }

    # print it
    Add-PodeRoute -Method Get -Path '/echo/:stuff' -ScriptBlock {
        param($e)
    
        Write-PodeTextResponse -Value "[$(Get-Date)] echo: $($e.Parameters['stuff'])"
    }
}