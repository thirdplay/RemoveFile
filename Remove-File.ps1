<#
.SYNOPSIS 
    �w��t�@�C���t�B���^�Ńt�@�C�����폜���܂��B
.DESCRIPTION 
    �w�肳�ꂽ�t�@�C���t�B���^�Ɉ�v����t�@�C�����폜���܂��B
    �܂��A���O�t�B���^�Ɉ�v����t�@�C���͍폜�ΏۊO�Ƃ��܂��B
.EXAMPLE
    Remove-File C:\test *.xlsx
.PARAMETER Path
    �폜����f�B���N�g���̃p�X
.PARAMETER Targets
    �폜����t�@�C���̊g���q
.PARAMETER Excludes
    ���O����t�@�C���̊g���q
.PARAMETER Days
    �����O�ɍ쐬���ꂽ�t�@�C�����폜����̂��w�肵�܂�
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
    $Excludes,

    [parameter(
        mandatory = 0,
        position  = 3,
        ValueFromPipelineByPropertyName = 1)]
    [int]
    $Days
)

process
{
    try
    {
        # Remove filter file.
        $result = Get-ChildItem -Path $Path -Include $Targets -Exclude $Excludes -Recurse -File | Where-Object{((Get-Date).Subtract($_.LastWriteTime)).Days -ge $Days} | Remove-Item
    }
    catch
    {
        throw $_
    }
}

