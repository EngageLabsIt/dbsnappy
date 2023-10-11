function Add-TableScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = $Database.Tables.count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter tables... " -NoNewline

            # progress bar params
            $progress = 0
            $total = $counter
            
            $Database.Tables | ForEach-Object {

                $currentObject = $_
                $currentObjectName = "$($_.schema).$($_.name)"

                $options = New-DbaScriptingOption
                $options.DriAllConstraints = $true
                $options.Permissions = $true
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" -ScriptingOptionObject $options | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Add-ViewScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = ($Database.Views | Where-Object -Property Schema -notin "sys","INFORMATION_SCHEMA","tsqlt").count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter views... " -NoNewline
            
            # progress bar params
            $progress = 0
            $total = $counter

            $Database.Views | Where-Object -Property Schema -notin "sys","INFORMATION_SCHEMA","tsqlt" | ForEach-Object {
                $currentObject = $_
                $currentObjectName = "$($_.schema).$($_.name)"
                
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Add-StoredProcedureScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = ($Database.StoredProcedures | Where-Object -Property Schema -notin "sys","INFORMATION_SCHEMA","tsqlt").count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter stored procedures... " -NoNewline
            
            # progress bar params
            $progress = 0
            $total = $counter

            $Database.StoredProcedures | Where-Object -Property Schema -notin "sys","INFORMATION_SCHEMA","tsqlt" | ForEach-Object {
                $currentObject = $_
                $currentObjectName = "$($_.schema).$($_.name)"
                
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Add-UserDefinedFunctionScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = ($Database.UserDefinedFunctions | Where-Object -Property Schema -notin "sys","INFORMATION_SCHEMA","tsqlt").count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter functions... " -NoNewline
            
            # progress bar params
            $progress = 0
            $total = $counter

            $Database.UserDefinedFunctions | Where-Object -Property Schema -notin "sys","INFORMATION_SCHEMA","tsqlt" | ForEach-Object {
                $currentObject = $_
                $currentObjectName = "$($_.schema).$($_.name)"
                
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Add-SchemaScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = $Database.Schemas.count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter schemas... " -NoNewline
            
            # progress bar params
            $progress = 0
            $total = $counter

            $Database.Schemas | ForEach-Object {
                $currentObject = $_
                $currentObjectName = "$($_.schema).$($_.name)"
                
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Add-UserDefinedTableTypesScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = $Database.UserDefinedTableTypes.count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter table types... " -NoNewline
            
            # progress bar params
            $progress = 0
            $total = $counter

            $Database.UserDefinedTableTypes | ForEach-Object {
                $currentObject = $_
                $currentObjectName = "$($_.schema).$($_.name)"
                
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Add-SynonymScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = $Database.Synonyms.count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter synonyms... " -NoNewline
            
            # progress bar params
            $progress = 0
            $total = $counter

            $Database.Synonyms | ForEach-Object {
                $currentObject = $_
                $currentObjectName = "$($_.schema).$($_.name)"
                
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Add-RoleScripts {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [object] $Database,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        $counter = $Database.Roles.count
        if ($counter -gt 0) {
            Write-Host "Scripting $counter roles... " -NoNewline
            
            # progress bar params
            $progress = 0
            $total = $counter

            $Database.Roles | ForEach-Object {
                $currentObject = $_
                $currentObjectName = "$($_.name)"
                
                if ($OutputFormat -eq "FILES")
                {
                    $fileName = Join-Path -Path $Path -ChildPath "$currentObjectName.sql"
                    $currentObject | Export-DbaScript -FilePath "$fileName" | Out-Null
                }
                if ($OutputFormat -eq "JSON")
                {
                    return $currentObject.Script()
                }
                
                $progress++
                $PercentComplete = [int](($progress / $total) * 100)
                Write-Progress -Activity "Exporting $currentObjectName" -Status "$PercentComplete% Complete:" -PercentComplete $PercentComplete
            }
            Write-Host "Done!" -ForegroundColor White
        }
    }
    end {

    }
}

function Get-TablesWithIdentity {
    param (
        [object] $ServerInstance,
        [object] $Database
    )
    begin {

    }
    process {
        Write-Host "Generating Identity summary... " -NoNewline

        $sqlCommand = "SELECT OBJECT_SCHEMA_NAME(object_id) as SchemaName, OBJECT_NAME(object_id) as TableName, name as ColumnName FROM sys.identity_columns WHERE OBJECT_SCHEMA_NAME(object_id) NOT IN ('dbo', 'sys');"
        $result = Invoke-SqlCmd -ServerInstance "$ServerInstance" -Database "$($Database.Name)" -Query $sqlCommand
        
        Write-Host "Done!" -ForegroundColor White

        return $result
    }
    end {

    }
}

function Get-TablesWithComputedColumn {
    param (
        [object] $ServerInstance,
        [object] $Database
    )
    begin {

    }
    process {
        Write-Host "Generating Computed Columns summary... " -NoNewline

        $sqlCommand = "SELECT OBJECT_SCHEMA_NAME(object_id) as SchemaName, OBJECT_NAME(object_id) as TableName, name as ColumnName FROM sys.computed_columns WHERE OBJECT_SCHEMA_NAME(object_id) NOT IN ('dbo', 'sys');"
        $result = Invoke-SqlCmd -ServerInstance "$ServerInstance" -Database "$($Database.Name)" -Query $sqlCommand
        
        Write-Host "Done!" -ForegroundColor White

        return $result
    }
    end {

    }
}

function Add-InformationToSummary {
    param (
        [object] $InputData,
        [string] $Path,
        [Parameter(Mandatory = $true)]
        [ValidateSet("FILES","JSON")]
        [string] $OutputFormat
    )
    begin {

    }
    process {
        if ($OutputFormat -eq "FILES") {
            Add-Content -Path $Path -Value ($InputData | ConvertTo-Json) | Out-Null
        }
        if ($OutputFormat -eq "JSON") {
            return $InputData | ConvertTo-Json
        }
    }
    end {

    }
}

function Get-DbSnapshotScript
{
    [CmdletBinding(SupportsShouldProcess=$True)]
    param (
        [Parameter(Mandatory = $true)]
        [string] $ConfigurationPath
    )

    begin {
        $configurations = Get-Content -Path $ConfigurationPath -Raw | ConvertFrom-Json
        
        if (!(Get-Module -Name SqlServer)) 
        {
            Import-Module SqlServer -DisableNameChecking -Force
        }
                 
        if (!(Get-Module -Name dbatools)) 
        {
            Import-Module dbatools -DisableNameChecking -Force
        }

        New-Item -ItemType Directory -Path "$($configurations.Snappy.targetFolder)" -Force | Out-Null
        Get-ChildItem -Path "$($configurations.Snappy.targetFolder)" | Remove-Item -Recurse -Force
    }

    process {

        $configurations.Snappy.databases | ForEach-Object {
            $currentDatabase = $_
            $databaseServer = $configurations.Snappy.databaseServer
            $targetFolder = $configurations.Snappy.targetFolder
            $outputFormatForDatabases = $configurations.Snappy.outputFormatForDatabases

            $database = Get-SqlDatabase -Name "$($currentDatabase.name)" -ServerInstance "$databaseServer"
                        
            Write-Host "Connected to Sql Server instance " -NoNewLine -ForegroundColor Yellow
            Write-Host "'$databaseServer' " -NoNewLine -ForegroundColor White
            Write-Host ", database " -NoNewLine -ForegroundColor Yellow
            Write-Host "'$($currentDatabase.name)'" -NoNewLine -ForegroundColor White
            Write-Host "." -ForegroundColor Yellow
            
            $databaseFolder = $($currentDatabase.name)
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder"
            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }

            # TABLES
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\Tables"
            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptTables) {
                Add-TableScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }
            #

            # VIEWS
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\Views"
            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptViews) {
                Add-ViewScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }
            #

            # STORED PROCEDURES
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\StoredProcedures"

            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }            
            if ($currentDatabase.scriptStoredProcedures) {
                Add-StoredProcedureScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }            
            #

            # USER DEFINED FUNCTIONS
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\UserDefinedFunctions"

            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptFunctions) {
                Add-UserDefinedFunctionScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }
            #

            # SCHEMAS
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\Schemas"

            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptSchemas) {
                Add-SchemaScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }
            #

            # USER DEFINED TABLE TYPES
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\Types"

            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptTypes) {
                Add-UserDefinedTableTypesScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }
            #

            # SYNONYMS
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\Synonyms"

            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptSynonyms) {
                Add-SynonymScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }
            #

            # ROLES
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\Roles"

            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptRoles) {
                Add-RoleScripts -Path $subFolder -Database $database -OutputFormat "$outputFormatForDatabases"
            }

            # SUMMARIES
            $subFolder = Join-Path -Path "$targetFolder" -ChildPath "$databaseFolder\_Summaries"
            $file = Join-Path -Path $subFolder -ChildPath "Summary.json"

            if (!(Test-Path -Path $subFolder)) {
                New-Item -ItemType Directory -Path $subFolder | Out-Null
            }
            if ($currentDatabase.scriptSummary) {
                New-Item -ItemType File -Path $file | Out-Null

                $tablesWithIdentity = 0
                $tablesWithComputedColumns = 0
                if ($currentDatabase.addIdentityToSummary) {
                    $tablesWithIdentity = Get-TablesWithIdentity -ServerInstance "$databaseServer" -Database $database
                    $jsonForTablesWithIdentity = $tablesWithIdentity | Select-Object SchemaName, TableName, ColumnName
                }
                if ($currentDatabase.addComputedColumnToSummary) {
                   $tablesWithComputedColumns = Get-TablesWithComputedColumn -ServerInstance "$databaseServer" -Database $database
                   $jsonForTablesWithComputedColumns = $tablesWithComputedColumns | Select-Object SchemaName, TableName, ColumnName
                }

                $jsonResult = @{TablesWithIdentity=@($jsonForTablesWithIdentity);TablesWithComputedColumns=@($jsonForTablesWithComputedColumns)}
                
                Add-InformationToSummary -InputData $jsonResult -Path $file -OutputFormat "$outputFormatForDatabases"
            }            
        }
    }
    end {

    }
}

Get-DbSnapshotScript -ConfigurationPath $PSScriptRoot\configurations.json