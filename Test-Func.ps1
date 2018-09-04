function Test-Func {
  $param = @{ "ProductSlug"  = "pcf-app-autoscaler"
    "ReleaseId"    = "87955"
    "FileId"       = "125013"
    "DownloadPath" = (Join-Path $TestDrive -ChildPath 'autoscaler-for-pcf-cliplugin-windows64-exe-2.0.40')
  }
}