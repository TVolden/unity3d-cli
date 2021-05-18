$unityEditorsPath = "$Env:Programfiles\Unity\Hub\Editor\"
$unitProjectFile = "Assembly-CSharp.csproj"
$projectPath = $args[0]
$ns = @{dns = 'http://schemas.microsoft.com/developer/msbuild/2003'}

if (Test-Path -Path $projectPath\$unitProjectFile -PathType Leaf) {
    $editorVersion = (Select-Xml -Path $projectPath\$unitProjectFile  -XPath '//dns:UnityVersion' -Namespace $ns | Select-Object -ExpandProperty Node).InnerText
    $editor = $unityEditorsPath + $editorVersion + "\Editor\Unity.exe"
    if (Test-Path -Path $projectPath\$unitProjectFile) {
        Write-Host "Opening [$projectPath] with version [$editorVersion] of unity."
        & $editor -projectPath "$projectPath"
    }
    else {
        Write-Host "[$projectPath] requires version [$editorVersion] of unity. This version was not found."
    }
}
else {
    Write-Host "[$projectPath] does not seem to be a unity project"
}
