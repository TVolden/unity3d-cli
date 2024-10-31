$unityEditorsPath = "$Env:Programfiles\Unity\Hub\Editor\"
$unityProjectVersion = "ProjectSettings\ProjectVersion.txt"
$unityProjectFile = "Assembly-CSharp.csproj"
$projectPath = $args[0]
$ns = @{dns = 'http://schemas.microsoft.com/developer/msbuild/2003'}

$editorVersion = $null
if (Test-Path -Path $projectPath\$unityProjectFile -PathType Leaf) {
    $editorVersion = (Select-Xml -Path $projectPath\$unityProjectFile  -XPath '//dns:UnityVersion' -Namespace $ns | Select-Object -ExpandProperty Node).InnerText
}
elseif (Test-Path -Path $projectPath\$unityProjectVersion -PathType Leaf) {
    $editorVersion = $(Get-Content $projectPath\$unityProjectVersion | Out-String | ConvertFrom-StringData -Delimiter ":").m_EditorVersion   
}

if ($editorVersion -eq $null) {
    Write-Host "[$projectPath] does not seem to be a unity project"
}
else {
    $editor = $unityEditorsPath + $editorVersion + "\Editor\Unity.exe"
    if (Test-Path -Path $projectPath\$unityProjectFile) {
        Write-Host "Opening [$projectPath] with version [$editorVersion] of unity."
        & $editor -projectPath "$projectPath"
    }
    else {
        Write-Host "[$projectPath] requires version [$editorVersion] of unity. This version was not found."
    }
}
