@{
  IncludeRules = @(
    'PSAlignAssignmentStatement'
  )

  Rules        = @{
    PSAlignAssignmentStatement = @{
      Enable         = $true
      CheckHashtable = $true
    }
  }
}