<# The function converts base32 input from the barcode into decimal, shamelessly stolen from the interwebs but modified from base36#>
function convertFrom-base32
{
    [CmdletBinding()]
    param ([parameter(valuefrompipeline=$true, HelpMessage="Alphadecimal string to convert")][string]$base32Num="")
    $alphabet = "0123456789abcdefghijklmnopqrstuv"
    $inputarray = $base32Num.tolower().tochararray()
    [array]::reverse($inputarray)
    [long]$decNum=0
    $pos=0

    foreach ($c in $inputarray)
    {
        $decNum += $alphabet.IndexOf($c) * [long][Math]::Pow(32, $pos)
        $pos++
    }
    $decNum
}

<# Using a for loop to allow scanning of multiple CACs and manualy exiting loop when done #>
$trainingname = Read-host -Prompt 'What is the name of the training' #used later to name the output file
$date = (Get-Date).ToString("yyyyMMdd") #building the roster filename

For ($i=1; $i -gt 0; $i++) {

    $barcode = Read-Host -Prompt "Click Scanner Now. Ctrl-c to exit."
    $edipiB32 = $barcode.Substring(8, 7) #triming out only the EDIPI portion
    $edipiNoPCC = convertFrom-base32 $edipiB32 #converting from base32
    $edipi = "$edipiNoPCC"+ '*' #appending PCC code, we are all guard right??//UPDATED - wildcard to catch any account and return first one
    $results = $null
    $adsi = [adsisearcher]""
    $adsi.Filter = "(&(objectCategory=user)(samaccountname=$edipi))"
    $filename = 'R:\CYO\Training\TrainingRosters' + $date + '_' + $trainingname + '.txt' #building the filename
    $user = $adsi.FindOne().Properties
    $user.displayname | Out-File -Append $filename
    #Write-Host $user.displayname (was used for debug)

}
