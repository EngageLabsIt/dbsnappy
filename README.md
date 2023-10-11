# Introduction

This tool loops on a set of configured database of a SQL Server instance, scripting the DDLs for each object (if selected in the configuration file) and returning the summaries at the end (if configured as well).

## The configuration file

Here is an example of the `configurations.json` file:

```json
{
    "databaseServer": "localhost",
    "outputFormatForDatabases": "JSON",
    "targetFolder": "C:\\temp",
    "databases": [
        {
            "name": "ElysBetsPrematch",
            "scriptTables": true,
            "scriptViews": true,
            "scriptStoredProcedures": true,
            "scriptFunctions": true,
            "scriptSchemas": true,
            "scriptTypes": true,
            "scriptSynonyms": true,
            "scriptRoles": true,
            "scriptSummary": true,
            "addIdentityToSummary": true,
            "addComputedColumnToSummary": true
        },
        {
            "name": "ElysReports",
            "scriptTables": true,
            "scriptViews": true,
            "scriptStoredProcedures": true,
            "scriptFunctions": true,
            "scriptSchemas": true,
            "scriptTypes": true,
            "scriptSynonyms": true,
            "scriptRoles": true,
            "scriptSummary": true,
            "addIdentityToSummary": true,
            "addComputedColumnToSummary": true
        }
    ]
}
```

## The Program

Based on the configuration file, the tool scans the onbject in each configured database. Here is the meaning of all the configurable items:

### Global config

| Key | Type | Description |
| - | - | - |
| `databaseServer` | string | Fully qualified name server and instance (if required) + port (if required) |
| `outputFormatForDatabases` | enum | `JSON` for in memory objects, `FILES` for `.sql` and `.md` files |
| `targetFolder` | string | Folder used when the `outputFormatForDatabases` is set to `FILES` |
| `targetFolder` | array | list of `database` objects|

### Database object

| Key | Type | Description |
| - | - | - |
| `name` | string | Database name (where to scan objects) |
| `scriptTables` | bool | `true` for including Tables in the export |
| `scriptViews` | bool | `true` for including Views in the export |
| `scriptStoredProcedures` | bool | `true` for including Stored Procedures in the export |
| `scriptFunctions` | bool | `true` for including Functions in the export |
| `scriptSchemas` | bool | `true` for including Schemas in the export |
| `scriptTypes` | bool | `true` for including User Defined Table Types in the export |
| `scriptSynonyms` | bool | `true` for including Synonyms in the export |
| `scriptRoles` | bool | `true` for including Roles in the export |
| `scriptSummary` | bool | `true` for creating a summary file |
| `addIdentityToSummary` | bool | `true` for including the value to the summary |
| `addComputedColumnToSummary` | bool | `true` for including the value to the summary |