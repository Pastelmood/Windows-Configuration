$UserName = "User4"
$Password = ConvertTo-SecureString "User@2026" -AsPlainText -Force

if (-not (Get-LocalUser -Name $UserName -ErrorAction SilentlyContinue)) {
    New-LocalUser -Name $UserName -Password $Password -FullName "User4" -Description "Administrator account created via script"
    Write-Host "User $UserName created successfully."
} else {
    Write-Host "User $UserName already exists."
}

Add-LocalGroupMember -Group "Administrators" -Member $UserName -ErrorAction SilentlyContinue
Write-Host "User $UserName added to Administrators group."
