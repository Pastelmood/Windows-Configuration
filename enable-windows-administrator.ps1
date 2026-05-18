#Requires -RunAsAdministrator

[CmdletBinding(SupportsShouldProcess)]
param ()

$ACCOUNT_NAME = "Administrator"
$TEMP_PASSWORD = ConvertTo-SecureString "User@2026" -AsPlainText -Force

try {
    $adminAccount = Get-LocalUser -Name $ACCOUNT_NAME -ErrorAction Stop

    if (-not $adminAccount.Enabled) {
        if ($PSCmdlet.ShouldProcess($ACCOUNT_NAME, "Enable local user")) {
            Enable-LocalUser -Name $ACCOUNT_NAME -ErrorAction Stop
            Write-Verbose "Account '$ACCOUNT_NAME' has been enabled."
        }
    } else {
        Write-Verbose "Account '$ACCOUNT_NAME' was already enabled."
    }

    if ($PSCmdlet.ShouldProcess($ACCOUNT_NAME, "Set password")) {
        Set-LocalUser -Name $ACCOUNT_NAME -Password $TEMP_PASSWORD -ErrorAction Stop
        Write-Verbose "Password has been updated for '$ACCOUNT_NAME'."
    }

    Write-Host "SUCCESS: '$ACCOUNT_NAME' is active and the password has been set to User@2026." -ForegroundColor Green

} catch [Microsoft.PowerShell.Commands.UserNotFoundException] {
    Write-Error "Account '$ACCOUNT_NAME' was not found on this system."
    exit 1
} catch [System.UnauthorizedAccessException] {
    Write-Error "Access denied. Ensure this script is run as Administrator."
    exit 1
} catch {
    Write-Error "An unexpected error occurred: $_"
    exit 1
}
