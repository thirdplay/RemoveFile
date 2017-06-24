<#
.SYNOPSIS 
    指定ファイルフィルタでファイルを削除します。
.DESCRIPTION 
    指定されたファイルフィルタに一致するファイルを削除します。
    また、除外フィルタに一致するファイルは削除対象外とします。
.EXAMPLE
    Remove-File C:\test *.xlsx
.PARAMETER Path
    削除するディレクトリのパス
.PARAMETER Targets
    削除するファイルの拡張子
.PARAMETER Excludes
    除外するファイルの拡張子
#>
[CmdletBinding()]
param
(
    [parameter(
        mandatory = 1,
        position  = 0,
        ValueFromPipeline = 1,
        ValueFromPipelineByPropertyName = 1)]
    [string]
    $Path,

    [parameter(
        mandatory = 1,
        position  = 1,
        ValueFromPipelineByPropertyName = 1)]
    [string[]]
    $Targets,

    [parameter(
        mandatory = 0,
        position  = 2,
        ValueFromPipelineByPropertyName = 1)]
    [string[]]
    $Excludes
)

process
{
    # Remove filter file.
    Get-ChildItem -Path $Path -Include $Targets -Exclude $Excludes -Recurse -File | Remove-Item
}
