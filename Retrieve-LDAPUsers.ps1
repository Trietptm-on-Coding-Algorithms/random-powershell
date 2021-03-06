# Retrieve-LDAPComputers.ps1
# Queries LDAP and returns all user names

$strFilter = "(&(objectCategory=User))"

$objDomain = New-Object System.DirectoryServices.DirectoryEntry

$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objDomain
$objSearcher.PageSize = 1000
$objSearcher.Filter = $strFilter
$objSearcher.SearchScope = "Subtree"

$colProplist = "name"
foreach($i in $colPropList) {
    $objSearcher.PropertiesToLoad.Add($i)
}

$colResults = $objSearcher.FindAll()

foreach($objResult in $colResults) {
    $objItem = $objResult.Properties; $objItem.name
}

