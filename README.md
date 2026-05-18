# Windows-Configuration

This repository contains scripts for configuring Windows 11.

## Setup Administrator User

To create the administrator user `User4` (default password: `User@2026`) automatically, run the following command in an elevated PowerShell console:

```powershell
iex (irm "https://raw.githubusercontent.com/Pastelmood/Windows-Configuration/main/setup-windows-administrator.ps1")
```

## Windows Registry Tweak (Verbose Status)

To enable verbose status messages during startup, shutdown, logon, and logoff, run the following command in an elevated PowerShell console:

```powershell
iex (irm "https://raw.githubusercontent.com/Pastelmood/Windows-Configuration/main/run-windows-tweak.ps1")
```

## Enable Administrator Account

To enable the built-in `Administrator` account and set the password to `User@2026` automatically, run the following command in an elevated PowerShell console:

```powershell
iex (irm "https://raw.githubusercontent.com/Pastelmood/Windows-Configuration/main/enable-windows-administrator.ps1")
```
