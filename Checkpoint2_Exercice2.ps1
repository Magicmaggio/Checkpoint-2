#Q 2.1
Pour cela nous utilisons l'application du Bureau à distance native de Windows pour accèder sur notre réseau interne au serveur et en utilisant les identifiants Administrator de ce dernier.

![](https://github.com/Magicmaggio/Checkpoint-2/blob/main/ressources_images/Exercice%201/Capture%20d%E2%80%99%C3%A9cran%202024-05-17%20124910.jpg)









## Code du script corrigé Main.ps1

#Q2.2 Lors de l'exécution de script, nous en sortons directement. Il faut alors modifier ce qui suit *ArgumentList et écrire "C:\Scripts\AddLocalUsers.ps1" au lieu de "C:\Temp\AddLocalUsers.ps1". Le chemin n'étant pas le bon, il ne trouvait tout simplement pas le fichier du script
#Q2.3 ``-Verb RunAs`` permet d'exécuter le script avec les privilèges d'administrateur.
#Q2.4 ``-WindowsStyle Maximized`` permet d'ouvrir la fenêtre en grand lors de l'exécution du script.

Start-Process -FilePath "powershell.exe" -ArgumentList 'C:\Scripts\AddLocalUsers.ps1' -Verb RunAs -WindowStyle Maximized












## Code du script corrigé AddLocalUsers.ps1

Write-Host "--- Début du script ---"

#On passe à 12 carac.
Function Random-Password ($length = 12)
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

#Q 2.16 La fonction ``ManageAccentsAndCapitalLetters`` permet de remplacer les caractères 'spéciaux' qui pourrait provenir de noms, prénoms, attributs "exotiques" pour des caractères compris par la machine lors de l'exécution du script pour simplifier.
#Ici nous avons l'exemple de Styrbjörn Colin avec le "ö" (remplacé dans la fonction par "o")
Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

#Q2.9 Nous copions le fichier texte pour coller la fonction au début de notre script AddLocalUsers.ps1 (i.e. avant l'appel de variables).
#On appelle ensuite cette fonction dans notre script, en utilisant simplement som 'nom', ici Log.
Function Log
{
    param([string]$FilePath,[string]$Content)

    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath))
    {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}


$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

#Q2.5 Il est ignoré à cause de l'option ``-Skip 2``. Il nous suffit d'enlever cela.
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","description" -Encoding UTF8

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Name = "$Prenom.$Nom"
    #Q2.6 Il n'est pas utilisé car lors de la boucle de création d'utilisateurs nous n'avons pas de varibale $Description qui pourrait inclure la description de l'individu. Nous le corrigeons en la créant.
    $Description = ManageAccentsAndCapitalLetters -String $User.description
    If (-not(Get-LocalUser -Name "$Name" -ErrorAction SilentlyContinue))
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($user.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Name"
            FullName             = "$Name"
            Password             = $Password
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true #On passe en true pour qu'il n'expire pas
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateur" -Member "$Name" -Verb RunAs
        Log
        Write-Host "Le compte $Name a été crée avec le mot de passe $Password" -ForegroundColor Green #Vert
        
    }
    Else
    {
        Write-Host "Le compte $Name existe déjà." -ForegroundColor Red #Rouge
    }
}

pause
Write-Host "--- Fin du script ---"
Start-Sleep -Seconds 2 #10 sec beaucoup trop long
