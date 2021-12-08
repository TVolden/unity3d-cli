# unity3d-cli
A tiny CLI launcher for Unity3D. Made in powershell.

## How to install

Open powershell and navigate to the distination folder, then write:

```powershell
wget https://raw.githubusercontent.com/TVolden/unity3d-cli/main/unt.ps1 -outfile "unt.ps1"
```

You can add the path to your environment variables to use the script anywhere:

```powershell
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";" + (Get-Location), [System.EnvironmentVariableTarget]::User)
```

## How to use

1. Just add the script to the unity project root folder.
2. Run the following command in powershell:

```powershell
unt .
``` 

Alternatively, place the script in a folder and add it to PATH.
Now you can run the `unt [path-to-unity-project-folder]` from anywhere.
